extends ScrollContainer
@export var a:lobotomy_tool
@export var gif:gif_array
@export_group("node")
@export var use_default_node_paths: bool = true
@export var basic_icon: TextureRect
@export var basic_risk_icon: TextureRect
@export var basic_risk_label: RichTextLabel
@export var basic_name_label: RichTextLabel
@export var basic_info_label: RichTextLabel      # 对应 RichTextLabel_
@export var basic_subject_label: Label
@export var basic_tool_type_label: RichTextLabel # 对应 RichTextLabel4

# lobotomy2 区域（研究日志和注意事项）
@export var lobotomy2_container: Control         # 整体容器，控制可见性
@export var research_log_container: VBoxContainer
@export var precautions_container: VBoxContainer

# lobotomy3 区域（工具介绍/解析/图册/录像）
@export var lobotomy3_container: Control
@export var tool_info_label: RichTextLabel
@export var tool_analysis_label: RichTextLabel

# 图册相关
@export var gallery_button: Button
@export var gallery_label: Label
@export var gallery_container: HBoxContainer

# 录像相关
@export var video_button: Button
@export var video_label: Label
@export var video_container: HBoxContainer

# JUMP 相关
@export var jump_container: Control
@export var jump_related_container: HBoxContainer
@export var jump_type_container: HBoxContainer

# ========== _ready：根据开关赋予默认路径 ==========
func _ready() -> void:
	if use_default_node_paths:
		# basic
		basic_icon = $VBoxContainer/basic/icon
		basic_risk_icon = $VBoxContainer/basic/TextureRect
		basic_risk_label = $VBoxContainer/basic/RichTextLabel
		basic_name_label = $VBoxContainer/basic/RichTextLabel3
		basic_info_label = $VBoxContainer/basic/RichTextLabel_
		basic_subject_label = $VBoxContainer/basic/Label
		basic_tool_type_label = $VBoxContainer/basic/RichTextLabel4

		# lobotomy2
		lobotomy2_container = $VBoxContainer/lobotomy2
		research_log_container = $VBoxContainer/lobotomy2/ScrollContainer/VBoxContainer
		precautions_container = $VBoxContainer/lobotomy2/ScrollContainer2/VBoxContainer

		# lobotomy3
		lobotomy3_container = $VBoxContainer/lobotomy3
		tool_info_label = $VBoxContainer/lobotomy3/TabContainer/工具介绍/RichTextLabel
		tool_analysis_label = $VBoxContainer/lobotomy3/TabContainer/工具解析/RichTextLabel

		# 图册
		gallery_button = $VBoxContainer/lobotomy3/TabContainer/异想体图册/Button
		gallery_label = $VBoxContainer/lobotomy3/TabContainer/异想体图册/Label
		gallery_container = $VBoxContainer/lobotomy3/TabContainer/异想体图册/ScrollContainer/HBoxContainer

		# 录像
		video_button = $VBoxContainer/lobotomy3/TabContainer/异想体录像/Button2
		video_label = $VBoxContainer/lobotomy3/TabContainer/异想体录像/Label
		video_container = $VBoxContainer/lobotomy3/TabContainer/异想体录像/ScrollContainer/HBoxContainer

		# JUMP
		jump_container = $VBoxContainer/JUMP
		jump_related_container = $VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer
		jump_type_container = $VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer

# ========== 主要加载函数 ==========
func load_tool():
	# 基础信息
	basic_icon.texture = a.icon
	if a.level == "z":
		basic_risk_icon.texture = load("res://img/Risk_Zayin.webp")
		basic_risk_label.text = "[b][color=green]ZAYIN[/color][/b]"
	if a.level == "t":
		basic_risk_icon.texture = load("res://img/Risk_Teth.webp")
		basic_risk_label.text = "[b][color=#229ff6]TETH[/color][/b]"
	if a.level == "h":
		basic_risk_icon.texture = load("res://img/Risk_He.webp")
		basic_risk_label.text = "[b][color=yellow]HE[/color][/b]"
	if a.level == "w":
		basic_risk_icon.texture = load("res://img/Risk_Waw.webp")
		basic_risk_label.text = "[b][color=purple]WAW[/color][/b]"   # 修正颜色拼写
	if a.level == "a":
		basic_risk_icon.texture = load("res://img/Risk_Aleph.webp")
		basic_risk_label.text = "[b][color=red]ALEPH[/color][/b]"
	if a.level == "?":
		basic_risk_icon.texture = load("res://img2/UI/undef_risk.tres")
		basic_risk_label.text = "[b][color=white]UNDEF.[/color][/b]"

	basic_name_label.text = a.name_
	basic_info_label.text = "[url=show]全屏[/url]\n" + a.info_
	basic_subject_label.text = a.subject
	basic_tool_type_label.text = a.tool_type

	# 研究日志
	clear_children(research_log_container)
	var log_scene = preload("res://screen/glxz.tscn")
	for text in a.Research_logs:
		var item = log_scene.instantiate()
		item.mode = 2
		item.text = text
		research_log_container.add_child(item)
	research_log_container.add_child(Control.new())  # 占位

	# 注意事项
	clear_children(precautions_container)
	for text in a.Precautions:
		var item = log_scene.instantiate()
		item.mode = 3
		item.text2 = text
		precautions_container.add_child(item)
	precautions_container.add_child(Control.new())

	# 工具介绍与解析
	tool_info_label.text = "[url=show]全屏[/url]\n" + a.tool_info
	tool_analysis_label.text = "[url=show]全屏[/url]\n" + a.tool_e

	# 跳转相关（相关跳转）
	clear_children(jump_related_container)
	for i in a.jump:
		var j
		if not i.begins_with("p"):
			j = load(Get.jumper_list.get(i))
		else:
			j = load(i.erase(0,1))
		var btn = preload("res://screen/jumper_button.tscn").instantiate()
		btn.jumper = j
		jump_related_container.add_child(btn)
	jump_related_container.add_child(Control.new())

	# 标签跳转
	clear_children(jump_type_container)
	for i in a.jumper.type:
		var btn = preload("res://screen/type_jump_button.tscn").instantiate()
		btn.text = i
		jump_type_container.add_child(btn)
	jump_type_container.add_child(Control.new())

# ========== 辅助函数 ==========
func clear_children(container: Node):
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

# ========== 信号回调函数（将 $ 替换为属性） ==========
func _on_button_button_down() -> void:
	gallery_button.hide()
	if a.texture_array != []:
		clear_children(gallery_container)
		for tex in a.texture_array:
			var t = TextureRect.new()
			t.custom_minimum_size = Vector2(150,150)
			t.expand_mode = 1
			t.stretch_mode = 5
			t.texture = tex
			gallery_container.add_child(t)
	else:
		gallery_label.show()

func _on_rich_text_label_2_meta_clicked(meta: Variant) -> void:
	print(1)
	OS.shell_open(str(meta))

func _on_rich_text_label__meta_clicked(meta: Variant) -> void:
	print(1)
	OS.shell_open(str(meta))

func _on_l_2_b_toggled(toggled_on: bool) -> void:
	lobotomy2_container.visible = not toggled_on

func _on_l_3_b_toggled(toggled_on: bool) -> void:
	lobotomy3_container.visible = not toggled_on

func _on_jump_b_toggled(toggled_on: bool) -> void:
	jump_container.visible = not toggled_on

func _on_button_2_button_down() -> void:
	video_button.hide()
	if Get.is_load_gif and a.gif != "null":
		Loading.load_to(Get.gif_list.get(a.gif))
		await Loading.load_over
		gif = Get.going_to_gif
		print(gif.array.size())
		if gif.array.size() != 0:
			clear_children(video_container)
			for i in gif.array.size():
				var g = preload("res://screen/gif.tscn").instantiate()
				g.gif = gif.array[i]
				video_container.add_child(g)
			video_container.add_child(Control.new())
		else:
			video_button.show()
			video_label.show()
	else:
		video_label.show()
