extends ScrollContainer

# 新增导出开关
@export var use_default_node_paths: bool = true

# ========== 原有数据资源导出 ==========
@export var a: test        # 考验数据资源
@export var gif: gif_array # GIF 数组

# ========== 导出节点引用，按分类分组 ==========

@export_category("基础信息")
@export var basic_name_label: RichTextLabel          # RichTextLabel3
@export var basic_risk_icon: TextureRect             # TextureRect
@export var basic_icon: TextureRect                  # icon
@export var basic_info_label: RichTextLabel          # RichTextLabel_
@export var basic_ob_name_label: RichTextLabel       # RichTextLabel4
@export var basic_subject_label: Label               # Label (显示颜色+时间+名字)
@export var basic_time_icon: TextureRect             # icon2 (显示黎明/正午/黄昏等)

@export_category("考验介绍与解析")
@export var lobotomy2_container: Control             # 整体容器控制可见性
@export var ordeal_info_label: RichTextLabel         # TabContainer/考验介绍/RichTextLabel
@export var ordeal_analysis_label: RichTextLabel     # TabContainer/考验解析/RichTextLabel

@export_category("图册与录像")
@export var gallery_button: Button                   # Button2 (考验图册)
@export var gallery_label: Label
@export var gallery_container: HBoxContainer
@export var video_button: Button                     # Button (考验录像)
@export var video_label: Label
@export var video_container: HBoxContainer

@export_category("考验属性")
@export var lobotomy3_container: Control             # 整体容器控制可见性
@export var red_def_label: RichTextLabel
@export var white_def_label: RichTextLabel
@export var black_def_label: RichTextLabel
@export var pale_def_label: RichTextLabel
@export var speed_label: Label                       # SPEED
@export var count_label: Label                       # COUNT
@export var place_label: Label                       # PLACE
@export var hp_label: Label                          # HP

@export_category("跳转")
@export var jump_container: Control
@export var jump_related_container: HBoxContainer
@export var jump_type_container: HBoxContainer

# ========== _ready：根据开关赋予默认路径 ==========
func _ready() -> void:
	if use_default_node_paths:
		# 基础信息
		basic_name_label = $VBoxContainer/basic/RichTextLabel3
		basic_risk_icon = $VBoxContainer/basic/TextureRect
		basic_icon = $VBoxContainer/basic/icon
		basic_info_label = $VBoxContainer/basic/RichTextLabel_
		basic_ob_name_label = $VBoxContainer/basic/RichTextLabel4
		basic_subject_label = $VBoxContainer/basic/Label
		basic_time_icon = $VBoxContainer/basic/icon2

		# 考验介绍与解析
		lobotomy2_container = $VBoxContainer/lobotomy2
		ordeal_info_label = $VBoxContainer/lobotomy2/TabContainer/考验介绍/RichTextLabel
		ordeal_analysis_label = $VBoxContainer/lobotomy2/TabContainer/考验解析/RichTextLabel

		# 图册与录像
		gallery_button = $VBoxContainer/lobotomy2/TabContainer/考验图册/Button2
		gallery_label = $VBoxContainer/lobotomy2/TabContainer/考验图册/Label
		gallery_container = $VBoxContainer/lobotomy2/TabContainer/考验图册/ScrollContainer/HBoxContainer
		video_button = $VBoxContainer/lobotomy2/TabContainer/考验录像/Button
		video_label = $VBoxContainer/lobotomy2/TabContainer/考验录像/Label
		video_container = $VBoxContainer/lobotomy2/TabContainer/考验录像/ScrollContainer/HBoxContainer

		# 考验属性
		lobotomy3_container = $VBoxContainer/lobotomy3
		red_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel
		white_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel2
		black_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel3
		pale_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel4
		speed_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect8/SPEED
		count_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect7/COUNT
		place_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/PLACE
		hp_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect9/HP

		# 跳转
		jump_container = $VBoxContainer/JUMP
		jump_related_container = $VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer
		jump_type_container = $VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer

# ========== 加载考验数据 ==========
func load_test():
	# 基础信息
	basic_name_label.text = a.name_
	if a.level == "z":
		basic_risk_icon.texture = load("res://img/Risk_Zayin.webp")
	if a.level == "t":
		basic_risk_icon.texture = load("res://img/Risk_Teth.webp")
	if a.level == "h":
		basic_risk_icon.texture = load("res://img/Risk_He.webp")
	if a.level == "w":
		basic_risk_icon.texture = load("res://img/Risk_Waw.webp")
	if a.level == "a":
		basic_risk_icon.texture = load("res://img/Risk_Aleph.webp")
	if a.level == "?":
		basic_risk_icon.texture = load("res://img2/UI/undef_risk.tres")

	basic_icon.texture = a.icon
	basic_info_label.text = "[url=show]全屏[/url]\n" + a.info_
	basic_ob_name_label.text = a.ob_name
	basic_subject_label.text = a.color + "的" + a.time + "  " + a.name_

	# 时间图标
	if a.time == "黎明" or a.time == "午夜":
		basic_time_icon.texture = load("res://img2/UI/time1.tres")
	if a.time == "正午":
		basic_time_icon.texture = load("res://img2/UI/time2.tres")
	if a.time == "黄昏":
		basic_time_icon.texture = load("res://img2/UI/time3.tres")

	# 颜色调制
	if a.color == "绿色":
		basic_subject_label.modulate = Color(0.235, 0.702, 0.443, 1.0)
		basic_time_icon.modulate = Color(0.235, 0.702, 0.443, 1.0)
	if a.color == "琥珀色":
		basic_subject_label.modulate = Color(0.859, 0.561, 0.008, 1.0)
		basic_time_icon.modulate = Color(0.859, 0.561, 0.008, 1.0)
	if a.color == "紫罗兰":
		basic_subject_label.modulate = Color(0.604, 0.196, 0.804, 1.0)
		basic_time_icon.modulate = Color(0.604, 0.196, 0.804, 1.0)
	if a.color == "靛蓝色":
		basic_subject_label.modulate = Color(0.227, 0.373, 0.804, 1.0)
		basic_time_icon.modulate = Color(0.227, 0.373, 0.804, 1.0)
	# 原代码有两次靛蓝色，第二次是白色，可能是错误？保留原逻辑，但第二次覆盖了第一次，我们保留后一个
	# 但根据原代码，靛蓝色之后又出现一个判断靛蓝色（重复），第二次设为白色，可能是 bug，但保持原样
	if a.color == "靛蓝色":   # 第二次，设为白色
		basic_subject_label.modulate = Color(1.0, 1.0, 1.0, 1.0)
		basic_time_icon.modulate = Color(1.0, 1.0, 1.0, 1.0)
	if a.color == "惨白":
		basic_subject_label.modulate = Color(0.863, 0.078, 0.235, 1.0)
		basic_time_icon.modulate = Color(0.863, 0.078, 0.235, 1.0)

	# 考验介绍与解析
	ordeal_info_label.text = "[url=show]全屏[/url]\n" + a.other_info
	ordeal_analysis_label.text = "[url=show]全屏[/url]\n" + a.other_info_act

	# 属性
	red_def_label.text = "[img,size=30]res://img/RedDamageTypeIcon.webp[color=#cd2744](" + f_to_string(a.red_def) + ")" + d_to_string(a.red_def)
	white_def_label.text = "[img,size=30]res://img/WhiteDamageTypeIcon.webp[color=#f0ebbf](" + f_to_string(a.white_def) + ")" + d_to_string(a.white_def)
	black_def_label.text = "[img,size=30]res://img/BlackDamageTypeIcon.webp[color=#824b84](" + f_to_string(a.black_def) + ")" + d_to_string(a.black_def)
	pale_def_label.text = "[img,size=30]res://img/PaleDamageTypeIcon.webp[color=3fcdbd](" + f_to_string(a.pale_def) + ")" + d_to_string(a.pale_def)
	speed_label.text = a.speed
	count_label.text = a.count
	place_label.text = a.place
	hp_label.text = str(a.health)

	# 跳转（相关）
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

	# 跳转（标签）
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

# ========== 原有辅助函数（未改动） ==========
func d_to_string(x: float):
	if 1.5 < x and x <= 2.0:
		return "抗性极低"
	if 1.0 < x and x <= 1.5:
		return "抗性较低"
	if x == 1.0:
		return "抗性一般"
	if 1.0 > x and x >= 0.5:
		return "抗性较高"
	if 0.5 > x and x > 0.0:
		return "抗性极高"
	if x == 0.0:
		return "免疫"
	if x < 0.0:
		return "伤害吸收"
	if x == 11.4514:
		return "未知"
	return ""  # fallback

func f_to_string(x: float):
	if x != 11.4514:
		return str(x)
	else:
		return "?"

# ========== 信号回调函数（替换 $） ==========
func _on_rich_text_label__meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))

func _on_jump_b_toggled(toggled_on: bool) -> void:
	jump_container.visible = not toggled_on

func _on_l_2_b_toggled(toggled_on: bool) -> void:
	lobotomy2_container.visible = not toggled_on

func _on_button_2_button_down() -> void:
	gallery_button.hide()
	if a.texture_array != []:
		clear_children(gallery_container)
		for tex in a.texture_array:
			var t = TextureRect.new()
			t.custom_minimum_size = Vector2(300, 300)
			t.expand_mode = 1
			t.stretch_mode = 5
			t.texture = tex
			gallery_container.add_child(t)
	else:
		gallery_label.show()

func _on_button_button_down() -> void:
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

func _on_l_3b_toggled(toggled_on: bool) -> void:
	lobotomy3_container.visible = not toggled_on
