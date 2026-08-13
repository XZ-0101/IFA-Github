extends ScrollContainer

# 新增导出开关
@export var use_default_node_paths: bool = true

# ========== 原有数据资源导出 ==========
@export var a: legacy
@export var gif: gif_array

# ==================== 导出所有节点引用（按功能分类） ====================

# ---- 基础信息 (basic) ----
@export_category("基础信息")
@export var basic_icon: TextureRect
@export var basic_risk_icon: TextureRect
@export var basic_risk_label: RichTextLabel
@export var basic_name_label: RichTextLabel
@export var basic_info_label: RichTextLabel   # 对应 RichTextLabel2
@export var basic_subject_label: Label

# ---- 异想体信息 (lobotomy) ----
@export_category("异想体信息")
@export var lobotomy_type_label: RichTextLabel   # 对应 TYPE (使用BBCode)
@export var lobotomy_fear_level: Label           # 对应 恐惧等级
@export var lobotomy_type2_label: Label          # 对应 异想体类型
@export var lobotomy_mood_table: RichTextLabel   # 对应 心情 (带表格)

# ---- 工作偏好 (lobotomy2) ----
@export_category("工作偏好")
@export var lobotomy2_preference_label: RichTextLabel   # 对应 偏好

# ---- 管理须知 (lobotomy4) ----
@export_category("管理须知")
@export var lobotomy4_upgrades_container: VBoxContainer

# ---- 观察等级 (lobotomy5) ----
@export_category("观察等级")
@export var lobotomy5_level0: RichTextLabel   # 等级0/l0
@export var lobotomy5_level1: RichTextLabel   # 等级1/l1
@export var lobotomy5_level2: RichTextLabel   # 等级2/l2
@export var lobotomy5_level3: RichTextLabel   # 等级3/l3
@export var lobotomy5_level4: RichTextLabel   # 等级4/l4

# ---- 故事与工作日志 (lobotomy6) ----
@export_category("故事与日志")
@export var lobotomy6_story_label: RichTextLabel
@export var lobotomy6_work_log_label: RichTextLabel

# ---- 行为与解析 (lobotomy7) ----
@export_category("行为与解析")
@export var lobotomy7_act_label: RichTextLabel
@export var lobotomy7_other_label: RichTextLabel
@export var lobotomy7_gallery_button: Button
@export var lobotomy7_gallery_label: Label
@export var lobotomy7_gallery_container: HBoxContainer
@export var lobotomy7_video_button: Button
@export var lobotomy7_video_label: Label
@export var lobotomy7_video_container: HBoxContainer

# ---- 最终观测 (lobotomy8) ----
@export_category("最终观测")
@export var lobotomy8_tree_container: Control   # 树形控件容器

# ---- 特质 (lobotomy9) ----
@export_category("特质")
@export var lobotomy9_trait_label: RichTextLabel

# ---- 跳转 (JUMP) ----
@export_category("跳转")
@export var jump_related_container: HBoxContainer
@export var jump_type_container: HBoxContainer

# ---- 折叠控制（用于切换可见性） ----
@export_category("折叠控制")
@export var lobotomy2_container: Control   # 用于切换 lobotomy2 可见性

@export var lobotomy4_container: Control   # 用于切换 lobotomy4 可见性
@export var lobotomy5_container: Control
@export var lobotomy6_container: Control
@export var lobotomy7_container: Control
@export var lobotomy8_container: Control
@export var lobotomy9_container: Control
@export var jump_container: Control

# ==================== _ready：根据开关赋予默认路径 ====================
func _ready() -> void:
	if use_default_node_paths:
		# 基础信息
		basic_icon = $VBoxContainer/basic/icon
		basic_risk_icon = $VBoxContainer/basic/TextureRect
		basic_risk_label = $VBoxContainer/basic/RichTextLabel
		basic_name_label = $VBoxContainer/basic/RichTextLabel3
		basic_info_label = $VBoxContainer/basic/RichTextLabel2
		basic_subject_label = $VBoxContainer/basic/Label

		# 异想体信息
		lobotomy_type_label = $VBoxContainer/lobotomy/NinePatchRect3/TYPE
		lobotomy_fear_level = $VBoxContainer/lobotomy/NinePatchRect7/恐惧等级
		lobotomy_type2_label = $VBoxContainer/lobotomy/NinePatchRect6/异想体类型
		lobotomy_mood_table = $VBoxContainer/lobotomy/NinePatchRect4/心情

		# 工作偏好
		lobotomy2_preference_label = $VBoxContainer/lobotomy2/NinePatchRect4/偏好

		# 管理须知
		lobotomy4_upgrades_container = $VBoxContainer/lobotomy4/ScrollContainer/VBoxContainer

		# 观察等级
		lobotomy5_level0 = $VBoxContainer/lobotomy5/TabContainer/等级0/l0
		lobotomy5_level1 = $VBoxContainer/lobotomy5/TabContainer/等级1/l1
		lobotomy5_level2 = $VBoxContainer/lobotomy5/TabContainer/等级2/l2
		lobotomy5_level3 = $VBoxContainer/lobotomy5/TabContainer/等级3/l3
		lobotomy5_level4 = $VBoxContainer/lobotomy5/TabContainer/等级4/l4

		# 故事与日志
		lobotomy6_story_label = $VBoxContainer/lobotomy6/TabContainer/故事/RichTextLabel
		lobotomy6_work_log_label = $VBoxContainer/lobotomy6/TabContainer/工作日志/RichTextLabel

		# 行为与解析
		lobotomy7_act_label = $VBoxContainer/lobotomy7/TabContainer/异想体行为/RichTextLabel
		lobotomy7_other_label = $VBoxContainer/lobotomy7/TabContainer/异想体解析/RichTextLabel
		lobotomy7_gallery_button = $VBoxContainer/lobotomy7/TabContainer/异想体图册/Button2
		lobotomy7_gallery_label = $VBoxContainer/lobotomy7/TabContainer/异想体图册/Label
		lobotomy7_gallery_container = $VBoxContainer/lobotomy7/TabContainer/异想体图册/ScrollContainer/HBoxContainer
		lobotomy7_video_button = $VBoxContainer/lobotomy7/TabContainer/异想体录像/Button
		lobotomy7_video_label = $VBoxContainer/lobotomy7/TabContainer/异想体录像/Label
		lobotomy7_video_container = $VBoxContainer/lobotomy7/TabContainer/异想体录像/ScrollContainer/HBoxContainer

		# 最终观测
		lobotomy8_tree_container = $VBoxContainer/lobotomy8/ScrollContainer

		# 特质
		lobotomy9_trait_label = $VBoxContainer/lobotomy9/异想体特质/RichTextLabel

		# 跳转
		jump_related_container = $VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer
		jump_type_container = $VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer

		# 折叠控制（用于切换可见性的容器）
		lobotomy2_container = $VBoxContainer/lobotomy2

		lobotomy4_container = $VBoxContainer/lobotomy4
		lobotomy5_container = $VBoxContainer/lobotomy5
		lobotomy6_container = $VBoxContainer/lobotomy6
		lobotomy7_container = $VBoxContainer/lobotomy7
		lobotomy8_container = $VBoxContainer/lobotomy8
		lobotomy9_container = $VBoxContainer/lobotomy9
		jump_container = $VBoxContainer/JUMP

# ==================== 主要加载函数 ====================
func load_legacy():
	# 基础信息
	basic_icon.texture = a.icon
	if a.level == "z":
		print("z")
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
		basic_risk_label.text = "[b][color=purple]WAW[/color][/b]"
	if a.level == "a":
		basic_risk_icon.texture = load("res://img/Risk_Aleph.webp")
		basic_risk_label.text = "[b][color=red]ALEPH[/color][/b]"
	if a.level == "?":
		basic_risk_icon.texture = load("res://img2/UI/undef_risk.tres")
		basic_risk_label.text = "[b][color=white]UNDEF.[/color][/b]"
	basic_name_label.text = a.name_
	basic_info_label.text = tr("[url=show]全屏[/url]\n") + tr(a.info_)
	basic_subject_label.text = a.subject

	# 异想体信息
	lobotomy_type_label.text = a.Attack_Type.format({
		"0": tr("[color=red]物理[/color]"),
		"1": tr("[color=white]精神[/color]"),
		"2": tr("[color=purple]复合[/color]"),
		"3": tr("[color=cyan]灵魂[/color]")
	})
	lobotomy_fear_level.text = "Lv." + str(a.a_lv)
	lobotomy_type2_label.text = a.type

	# 心情表
	var inf = a.心情.split('\n')
	var line1 = inf[0].split(',')
	var line2 = inf[1].split(',')
	var line3 = inf[2].split(',')
	lobotomy_mood_table.text =tr( '''
[center]
[table=5]
[cell border=#ffffa1]心情[/cell][cell border=#ffffa1]最大[/cell][cell border=#ffffa1]优[/cell][cell border=#ffffa1]良[/cell][cell border=#ffffa1]差[/cell]
[cell border=#ffffa1]心情值对应区间[/cell][cell border=#ffffa1]{x0}[/cell][cell border=#ffffa1]{x1}[/cell][cell border=#ffffa1]{x2}[/cell][cell border=#ffffa1]{x3}[/cell]
[cell border=#ffffa1]产能效率[/cell][cell border=#ffffa1]{x4}[/cell][cell border=#ffffa1]{x5}[/cell][cell border=#ffffa1]{x6}[/cell][cell border=#ffffa1]{x7}[/cell]
[cell border=#ffffa1]伤害类型[/cell][cell border=#ffffa1]{x8}[/cell][cell border=#ffffa1]{x9}[/cell][cell border=#ffffa1]{x10}[/cell][cell border=#ffffa1]{x11}[/cell]
[/table]
[/center]
''').format({
		"x0": line1[0], "x1": line1[1], "x2": line1[2], "x3": line1[3],
		"x4": line2[0], "x5": line2[1], "x6": line2[2], "x7": line2[3],
		"x8": line3[0], "x9": line3[1], "x10": line3[2], "x11": line3[3]
	})

	# 工作偏好
	lobotomy2_preference_label.text = a.喜好.format({
		"暴力": tr("[img,size=50]res://img2/LEGACY/3F.webp[color=red]暴力[/color]"),
		"喂食": tr("[img,size=50]res://img2/LEGACY/3F1.webp[color=orange]喂食[/color]"),
		"清洁": tr("[img,size=50]res://img2/LEGACY/3F2.webp[color=green]清洁[/color]"),
		"沟通": tr("[img,size=50]res://img2/LEGACY/3F3.webp[color=cyan]沟通[/color]"),
		"娱乐": tr("[img,size=40]res://img2/LEGACY/3F4.webp[color=pink]娱乐[/color]")
	})

	# 观察等级
	var o_text = tr('''[center]
[table=8]
[cell border=#ffffa1]工作成功率加成[/cell][cell border=#ffffa1]心情减少速度减缓[/cell][cell border=#ffffa1]一天开始时异想体的初始心情[/cell][cell border=#ffffa1]图鉴解锁[/cell][cell border=#ffffa1]背景故事解锁[/cell][cell border=#ffffa1]工作偏好解锁[/cell][cell border=#ffffa1]能源产量信息[/cell][cell border=#ffffa1]杂项[/cell]
[cell border=#ffffa1]{x0}[/cell][cell border=#ffffa1]{x1}[/cell][cell border=#ffffa1]{x2}[/cell][cell border=#ffffa1]{x3}[/cell][cell border=#ffffa1]{x4}[/cell][cell border=#ffffa1]{x5}[/cell][cell border=#ffffa1]{x6}[/cell][cell border=#ffffa1]{x7}[/cell]
[/table]
[/center]''')
	var o1 = a.o[0].split(",")
	var o2 = a.o[1].split(",")
	var o3 = a.o[2].split(",")
	var o4 = a.o[3].split(",")
	var o5 = a.o[4].split(",")
	lobotomy5_level0.text = o_text.format({"x0": o1[0], "x1": o1[1], "x2": o1[2], "x3": o1[3], "x4": o1[4], "x5": o1[5], "x6": o1[6], "x7": o1[7]})
	lobotomy5_level1.text = o_text.format({"x0": o2[0], "x1": o2[1], "x2": o2[2], "x3": o2[3], "x4": o2[4], "x5": o2[5], "x6": o2[6], "x7": o2[7]})
	lobotomy5_level2.text = o_text.format({"x0": o3[0], "x1": o3[1], "x2": o3[2], "x3": o3[3], "x4": o3[4], "x5": o3[5], "x6": o3[6], "x7": o3[7]})
	lobotomy5_level3.text = o_text.format({"x0": o4[0], "x1": o4[1], "x2": o4[2], "x3": o4[3], "x4": o4[4], "x5": o4[5], "x6": o4[6], "x7": o4[7]})
	lobotomy5_level4.text = o_text.format({"x0": o5[0], "x1": o5[1], "x2": o5[2], "x3": o5[3], "x4": o5[4], "x5": o5[5], "x6": o5[6], "x7": o5[7]})

	# 管理须知
	clear_children(lobotomy4_upgrades_container)
	for i in a.Upgrades.size():
		print(i)
		var item = preload("res://screen/glxz.tscn").instantiate()
		item.index = i + 1
		item.text = a.Upgrades[i]
		lobotomy4_upgrades_container.add_child(item)
	lobotomy4_upgrades_container.add_child(Control.new())

	# 特质
	if not a.特质:
		lobotomy9_trait_label.text = tr("无")
	else:
		lobotomy9_trait_label.text = tr("[url=show]全屏[/url]\n") + tr("名字:") + tr(a.特质.name_) + "\n" + tr(a.特质.详细)

	# 故事与日志
	lobotomy6_story_label.text = tr("[url=show]全屏[/url]\n") + tr(a.story)
	lobotomy6_work_log_label.text = tr("[url=show]全屏[/url]\n")
	for line in a.flavour_text:
		lobotomy6_work_log_label.text += "○" + tr(line) + "\n"

	# 行为与解析
	lobotomy7_act_label.text = tr("[url=show]全屏[/url]\n") + tr(a.other_info_act)
	lobotomy7_other_label.text = tr("[url=show]全屏[/url]\n") + tr(a.other_info)

	# 最终观测
	var tree = lobotomy8_tree_container
	tree.qt = a.最终观测
	tree.load_tree(tree.create_item(), tree.qt)

	# 跳转相关
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

	clear_children(jump_type_container)
	for i in a.jumper.type:
		var btn = preload("res://screen/type_jump_button.tscn").instantiate()
		btn.text = i
		jump_type_container.add_child(btn)
	jump_type_container.add_child(Control.new())

# ==================== 辅助函数 ====================
func clear_children(container: Node):
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

# ==================== 信号回调函数（替换 $ 为属性） ====================
func _on_button_2_button_down() -> void:
	lobotomy7_gallery_button.hide()
	if a.texture_array != []:
		clear_children(lobotomy7_gallery_container)
		for tex in a.texture_array:
			var t = TextureRect.new()
			t.custom_minimum_size = Vector2(150, 150)
			t.expand_mode = 1
			t.stretch_mode = 5
			t.texture = tex
			lobotomy7_gallery_container.add_child(t)
	else:
		lobotomy7_gallery_label.show()

func _on_button_button_down() -> void:
	lobotomy7_video_button.hide()
	if Get.is_load_gif and a.gif != "null":
		Loading.load_to(Get.gif_list.get(a.gif))
		await Loading.load_over
		gif = Get.going_to_gif
		print(gif.array.size())
		if gif.array.size() != 0:
			clear_children(lobotomy7_video_container)
			for i in gif.array.size():
				var g = preload("res://screen/gif.tscn").instantiate()
				g.gif = gif.array[i]
				lobotomy7_video_container.add_child(g)
			lobotomy7_video_container.add_child(Control.new())
		else:
			lobotomy7_video_button.show()
			lobotomy7_video_label.show()
	else:
		lobotomy7_video_label.show()

# ==================== 折叠切换信号（如果场景中有对应信号连接） ====================
# 以下函数对应场景中可能的 CheckButton 信号，根据实际名称调整
func _on_l_2_b_toggled(toggled_on: bool) -> void:
	if lobotomy2_container:
		lobotomy2_container.visible = not toggled_on

func _on_l_4_b_toggled(toggled_on: bool) -> void:
	if lobotomy4_container:
		lobotomy4_container.visible = not toggled_on

func _on_l_5_b_toggled(toggled_on: bool) -> void:
	if lobotomy5_container:
		lobotomy5_container.visible = not toggled_on

func _on_l_6_b_toggled(toggled_on: bool) -> void:
	if lobotomy6_container:
		lobotomy6_container.visible = not toggled_on

func _on_l_7_b_toggled(toggled_on: bool) -> void:
	if lobotomy7_container:
		lobotomy7_container.visible = not toggled_on

func _on_l_8_b_toggled(toggled_on: bool) -> void:
	if lobotomy8_container:
		lobotomy8_container.visible = not toggled_on

func _on_l_9_b_toggled(toggled_on: bool) -> void:
	if lobotomy9_container:
		lobotomy9_container.visible = not toggled_on

func _on_jump_b_toggled(toggled_on: bool) -> void:
	if jump_container:
		jump_container.visible = not toggled_on
