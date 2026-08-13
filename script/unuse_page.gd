extends ScrollContainer

# 导出开关：是否启用默认节点路径
@export var use_default_node_paths: bool = true

# ========== 原有数据资源导出 ==========
@export var a: Unreleased
@export var gif: gif_array

# ========== 导出所有节点引用（带分类） ==========

@export_category("基础信息")
@export var basic_name_label: RichTextLabel
@export var basic_risk_icon: TextureRect
@export var basic_icon: TextureRect
@export var basic_info_label: RichTextLabel      # 对应 RichTextLabel_
@export var basic_status_label: RichTextLabel    # 对应 RichTextLabel4
@export var basic_subject_label: Label

@export_category("介绍与解析")
@export var lobotomy2_container: Control         # 整体容器，控制可见性
@export var analysis_label: RichTextLabel        # 解析/RichTextLabel

@export_category("图册与录像")
@export var gallery_button: Button
@export var gallery_label: Label
@export var gallery_container: HBoxContainer
@export var video_button: Button
@export var video_label: Label
@export var video_container: HBoxContainer

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
		basic_status_label = $VBoxContainer/basic/RichTextLabel4
		basic_subject_label = $VBoxContainer/basic/Label

		# 介绍与解析
		lobotomy2_container = $VBoxContainer/lobotomy2
		analysis_label = $VBoxContainer/lobotomy2/TabContainer/解析/RichTextLabel

		# 图册
		gallery_button = $VBoxContainer/lobotomy2/TabContainer/图册/Button2
		gallery_label = $VBoxContainer/lobotomy2/TabContainer/图册/Label
		gallery_container = $VBoxContainer/lobotomy2/TabContainer/图册/ScrollContainer/HBoxContainer

		# 录像
		video_button = $VBoxContainer/lobotomy2/TabContainer/录像/Button
		video_label = $VBoxContainer/lobotomy2/TabContainer/录像/Label
		video_container = $VBoxContainer/lobotomy2/TabContainer/录像/ScrollContainer/HBoxContainer

		# 跳转
		jump_container = $VBoxContainer/JUMP
		jump_related_container = $VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer
		jump_type_container = $VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer

# ========== 主加载函数 ==========
func load_Unreleased():
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
	basic_status_label.text = a.现状
	analysis_label.text = "[url=show]全屏[/url]\n" + a.介绍
	basic_subject_label.text = a.subject

	# 跳转相关
	clear_children(jump_related_container)
	for i in a.jump:
		var j
		if not i.begins_with("p"):
			j = load(Get.jumper_list.get(i))
		else:
			j = load(i.erase(0, 1))
		var btn = preload("res://screen/jumper_button.tscn").instantiate()
		btn.jumper = j
		jump_related_container.add_child(btn)
	jump_related_container.add_child(Control.new())

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

# ========== 信号回调函数 ==========
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
	# 注意：此脚本中没有 lobotomy3 节点，但保留函数以防外部调用
	pass

# ========== 辅助函数（原样保留） ==========
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
	if x == 11.4514:
		return "未知"

func f_to_string(x: float):
	if x != 11.4514:
		return str(x)
	else:
		return "?"
