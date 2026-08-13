extends ScrollContainer

# 新增导出开关
@export var use_default_node_paths: bool = true

# ========== 数据资源导出 ==========
@export var a: basic_class
@export var gif: gif_array

# ==================== 导出所有节点引用（按功能分类） ====================

# ---- 基础信息 (basic) ----
@export_category("基础信息")
@export var basic_icon: TextureRect
@export var basic_risk_icon: TextureRect
@export var basic_name_label: RichTextLabel
@export var basic_info_label: RichTextLabel
@export var basic_subject_label: Label

# ---- 介绍 (lobotomy2) ----
@export_category("介绍")
@export var lobotomy2_intro_label: RichTextLabel   # 对应 介绍/RichTextLabel

# ---- 图册与录像 (lobotomy2) ----
@export_category("图册与录像")
@export var gallery_button: Button
@export var gallery_label: Label
@export var gallery_container: HBoxContainer
@export var video_button: Button
@export var video_label: Label
@export var video_container: HBoxContainer

# ---- 跳转容器（各个页面） ----
@export_category("跳转容器")
@export var jump_lca_container: HBoxContainer        # 脑叶
@export var jump_lor_container: HBoxContainer        # 图书馆
@export var jump_lcb_container: HBoxContainer        # 边狱
@export var jump_ego_container: HBoxContainer        # EGO
@export var jump_child_container: HBoxContainer      # 次级衍生单位
@export var jump_event_container: HBoxContainer      # 事件
@export var jump_related_container: HBoxContainer    # 相关 (JUMP2)
@export var jump_type_container: HBoxContainer       # 标签 (JUMP2)

# ---- 折叠控制 ----
@export_category("折叠控制")
@export var lobotomy2_container: Control
@export var jump_container: Control      # JUMP
@export var jump2_container: Control     # JUMP2
@export var jump3_container: Control     # JUMP3

# ==================== _ready：根据开关赋予默认路径 ====================
func _ready() -> void:
	if use_default_node_paths:
		# 基础信息
		basic_icon = $VBoxContainer/basic/icon
		basic_risk_icon = $VBoxContainer/basic/TextureRect
		basic_name_label = $VBoxContainer/basic/RichTextLabel3
		basic_info_label = $VBoxContainer/basic/RichTextLabel2
		basic_subject_label = $VBoxContainer/basic/Label

		# 介绍
		lobotomy2_intro_label = $VBoxContainer/lobotomy2/TabContainer/介绍/RichTextLabel

		# 图册与录像
		gallery_button = $VBoxContainer/lobotomy2/TabContainer/图册/Button2
		gallery_label = $VBoxContainer/lobotomy2/TabContainer/图册/Label
		gallery_container = $VBoxContainer/lobotomy2/TabContainer/图册/ScrollContainer/HBoxContainer
		video_button = $VBoxContainer/lobotomy2/TabContainer/录像/Button
		video_label = $VBoxContainer/lobotomy2/TabContainer/录像/Label
		video_container = $VBoxContainer/lobotomy2/TabContainer/录像/ScrollContainer/HBoxContainer

		# 跳转容器
		jump_lca_container = $VBoxContainer/JUMP/TabContainer/脑叶/ScrollContainer/HBoxContainer
		jump_lor_container = $VBoxContainer/JUMP/TabContainer/图书馆/ScrollContainer/HBoxContainer
		jump_lcb_container = $VBoxContainer/JUMP/TabContainer/边狱/ScrollContainer/HBoxContainer
		jump_ego_container = $VBoxContainer/JUMP3/TabContainer/EGO/ScrollContainer/HBoxContainer
		jump_child_container = $VBoxContainer/JUMP3/TabContainer/次级衍生单位/ScrollContainer/HBoxContainer
		jump_event_container = $VBoxContainer/JUMP3/TabContainer/事件/ScrollContainer/HBoxContainer
		jump_related_container = $VBoxContainer/JUMP2/TabContainer/相关/ScrollContainer/HBoxContainer
		jump_type_container = $VBoxContainer/JUMP2/TabContainer/标签/ScrollContainer/HBoxContainer

		# 折叠控制
		lobotomy2_container = $VBoxContainer/lobotomy2
		jump_container = $VBoxContainer/JUMP
		jump2_container = $VBoxContainer/JUMP2
		jump3_container = $VBoxContainer/JUMP3

# ==================== 主要加载函数 ====================
func load_basic_class():
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
	basic_subject_label.text = a.subject

	# 介绍
	lobotomy2_intro_label.text = "[url=show]全屏[/url]\n" + a.d_text

	# 加载各个跳转容器
	load_jump_array(a.lca_jump, jump_lca_container)
	load_jump_array(a.lor_jump, jump_lor_container)
	load_jump_array(a.lcb_jump, jump_lcb_container)
	load_jump_array(a.ego_jump, jump_ego_container)
	load_jump_array(a.child_jump, jump_child_container)
	load_jump_array(a.q_jump, jump_event_container)
	load_jump_array(a.jump, jump_related_container)

	# 加载标签跳转
	clear_children(jump_type_container)
	for tag in a.jumper.type:
		var btn = preload("res://screen/type_jump_button.tscn").instantiate()
		btn.text = tag
		jump_type_container.add_child(btn)
	jump_type_container.add_child(Control.new())

# ==================== 辅助函数 ====================
func load_jump_array(jump_list: Array, container: Node) -> void:
	clear_children(container)
	for key in jump_list:
		var j
		if not key.begins_with("p"):
			j = load(Get.jumper_list.get(key))
		else:
			j = load(key.erase(0, 1))
		var btn = preload("res://screen/jumper_button.tscn").instantiate()
		btn.jumper = j
		container.add_child(btn)
	container.add_child(Control.new())   # 占位

func clear_children(container: Node) -> void:
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

# ==================== 信号回调函数（替换 $ 为属性） ====================
func _on_l_2_b_toggled(toggled_on: bool) -> void:
	if lobotomy2_container:
		lobotomy2_container.visible = not toggled_on

func _on_ljb_toggled(toggled_on: bool) -> void:
	if jump_container:
		jump_container.visible = not toggled_on

func _on_ljb_2_toggled(toggled_on: bool) -> void:
	if jump2_container:
		jump2_container.visible = not toggled_on

func _on_ljb_3_toggled(toggled_on: bool) -> void:
	if jump3_container:
		jump3_container.visible = not toggled_on

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
