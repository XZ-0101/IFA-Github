extends OptionButton

# 翻译文件夹名称（位于可执行文件同目录下）
const TRANSLATIONS_DIR_NAME = "translations"
# 配置文件路径（保存用户选择的语言）
const CONFIG_PATH = "user://language.cfg"

# 存储语言名称 -> CSV文件路径的映射
var lang_files = {}
# 当前加载的翻译资源（用于卸载）
var current_translation = null
# 配置文件对象
var config = ConfigFile.new()

# 缓存安装目录路径
var install_dir = ""


func _ready():
	print("=== Translation OptionButton _ready() started ===")
	install_dir = get_install_dir()
	print("安装目录: ", install_dir)
	ensure_translation_dir()
	scan_translations()
	print("扫描到的语言文件: ", lang_files)

	add_item("原翻译 (不翻译)", 0)
	for lang_name in lang_files:
		add_item(lang_name)
		print("添加选项: ", lang_name)
	print("下拉菜单共有 ", item_count, " 项")

	restore_saved_language()

	item_selected.connect(_on_language_selected)
	print("=== _ready() finished ===")


func get_install_dir() -> String:
	var exe_path = OS.get_executable_path()
	print("OS.get_executable_path() = ", exe_path)

	if OS.is_debug_build():
		return "D://pm/"

	elif OS.get_name() == "Android":
		# Android 上，user:// 指向 /data/data/包名/files/
		# 用户可通过文件管理器访问 Android/data/包名/files/
		return "user://"

	# Windows：可执行文件所在目录

	else:
		var dir = exe_path.get_base_dir() + "/"
		return dir


func get_translations_dir() -> String:
	return install_dir + TRANSLATIONS_DIR_NAME


func ensure_translation_dir():
	var dir_path = get_translations_dir()
	print("检查翻译目录: ", dir_path)

	var dir = DirAccess.open(dir_path)
	if dir == null:
		print("目录不存在，尝试创建: ", dir_path)
		var err = DirAccess.make_dir_recursive_absolute(dir_path)
		if err == OK:
			print("创建目录成功")
		else:
			print("创建目录失败，错误码: ", err)
	else:
		print("目录已存在")


func scan_translations():
	var dir_path = get_translations_dir()
	print("开始扫描目录: ", dir_path)

	var dir = DirAccess.open(dir_path)
	if dir == null:
		print("无法打开目录，可能不存在或无权限")
		return

	dir.list_dir_begin()
	var file = dir.get_next()
	var found_count = 0
	while file != "":
		print("发现文件/文件夹: ", file)
		if not dir.current_is_dir() and file.get_extension().to_lower() == "csv":
			var lang_name = file.get_basename()
			lang_files[lang_name] = dir_path + "/" + file
			found_count += 1
			print("  添加/更新语言: ", lang_name, " -> ", lang_files[lang_name])
		file = dir.get_next()
	dir.list_dir_end()
	print("扫描结束，共找到 ", found_count, " 个 CSV 文件")


func find_item_index_by_text(text: String) -> int:
	for i in range(item_count):
		if get_item_text(i) == text:
			return i
	return -1


func restore_saved_language():
	print("恢复保存的语言设置...")
	var saved_lang = ""
	if config.load(CONFIG_PATH) == OK:
		saved_lang = config.get_value("language", "name", "")
		print("从配置文件读取到保存的语言: ", saved_lang)
	else:
		print("无法加载配置文件 ", CONFIG_PATH)

	if saved_lang != "" and saved_lang in lang_files:
		print("保存的语言 '", saved_lang, "' 存在于扫描结果中，尝试应用")
		var index = find_item_index_by_text(saved_lang)
		if index != -1:
			select(index)
			apply_translation(saved_lang)
			print("已选中并应用语言: ", saved_lang)
			return
		else:
			print("在选项列表中没有找到该文本")
	else:
		print("没有有效的保存语言，将选中第一项（原翻译）")

	select(0)
	apply_default()
	print("已设置为默认（不翻译）")


func apply_translation(lang_name: String):
	print("尝试应用语言: ", lang_name)

	# 清除所有已有翻译
	TranslationServer.clear()
	current_translation = null

	var file_path = lang_files.get(lang_name)
	if file_path == null or not FileAccess.file_exists(file_path):
		print("文件不存在或路径无效: ", file_path, "，回退默认")
		apply_default()
		return

	print("加载 CSV 文件: ", file_path)
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		print("无法打开文件: ", file_path)
		apply_default()
		return

	# 读取表头
	if file.eof_reached():
		print("CSV 文件为空")
		file.close()
		apply_default()
		return

	var headers = file.get_csv_line()
	if headers.is_empty():
		print("CSV 表头为空")
		file.close()
		apply_default()
		return

	# 检查是否包含该语言列
	var lang_col_index = -1
	for i in range(headers.size()):
		if headers[i].strip_edges() == lang_name:
			lang_col_index = i
			break

	if lang_col_index == -1:
		print("CSV 中没有 '", lang_name, "' 列")
		file.close()
		apply_default()
		return

	# 创建翻译对象
	var trans = Translation.new()
	trans.set_locale(lang_name)

	var line_count = 0
	var first_col_is_key = true  # 假设第一列是 key

	while not file.eof_reached():
		var row = file.get_csv_line()
		if row.is_empty() or (row.size() == 1 and row[0].strip_edges() == ""):
			continue

		# 确保行有足够的列
		if row.size() <= lang_col_index:
			continue

		# 第一列是 key（假设 CSV 格式为：key,zh_CN,en_US,...）
		var key = row[0].strip_edges()
		if key == "":
			continue

		var value = row[lang_col_index].strip_edges()
		if value != "":
			trans.add_message(key, value)
			line_count += 1

	file.close()
	print("CSV 读取完成，共加载 ", line_count, " 条翻译")

	if line_count == 0:
		print("警告：没有加载到任何翻译")
		apply_default()
		return

	TranslationServer.add_translation(trans)
	current_translation = trans
	print("已添加翻译到 TranslationServer")

	config.set_value("language", "name", lang_name)
	var err = config.save(CONFIG_PATH)
	if err == OK:
		print("保存配置到 ", CONFIG_PATH, " 成功")
	else:
		print("保存配置失败，错误码: ", err)


func apply_default():
	print("切换到默认（不翻译）")
	TranslationServer.clear()
	current_translation = null

	config.set_value("language", "name", "")
	var err = config.save(CONFIG_PATH)
	if err == OK:
		print("已清除保存的语言配置")
	else:
		print("清除配置失败，错误码: ", err)

	if selected != 0:
		select(0)
		print("已选中第一项")


func clear_current_translation():
	if current_translation:
		TranslationServer.remove_translation(current_translation)
		print("已移除翻译: ", current_translation.get_locale())
		current_translation = null
	else:
		print("没有当前翻译需要清除")


func _on_language_selected(index: int):
	print("用户选择了索引: ", index, " (", get_item_text(index), ")")
	if index == 0:
		apply_default()
	else:
		var lang_name = get_item_text(index)
		if lang_name in lang_files and FileAccess.file_exists(lang_files[lang_name]):
			print("语言文件存在，应用翻译")
			apply_translation(lang_name)
		else:
			print("语言文件已失效（可能被删除），重新扫描并回退默认")
			scan_translations()
			if lang_name not in lang_files:
				apply_default()
			else:
				apply_translation(lang_name)
