extends ScrollContainer
@export var a:bacis_info
@export var s:lobotomy_ego_Suit
@export var w:lobotomy_ego_Weapon
@export var g:bacis_ego
@export var gif:gif_array
@export var mode_:int


@export_group("node")
# 新增导出开关：是否启用默认节点路径（即原硬编码路径）
@export var use_default_node_paths: bool = true

# ==================== 导出所有节点引用（静态路径） ====================

@export var basic_icon: TextureRect
@export var basic_risk_icon: TextureRect
@export var basic_risk_label: RichTextLabel
@export var basic_name_label: RichTextLabel
@export var basic_info_label: RichTextLabel
@export var basic_subject_label: Label

# 异想体信息区域 (lobotomy)
@export var lobotomy_type_label: Label
@export var lobotomy_type_icon: TextureRect
@export var lobotomy_type_icon2: TextureRect
@export var lobotomy_type_number: Label
@export var lobotomy_pebox_label: RichTextLabel   # 修正：场景中为 RichTextLabel
@export var lobotomy_bad_mood: Label
@export var lobotomy_norm_mood: Label
@export var lobotomy_good_mood: Label

# lobotomy2 工作偏好
@export var lobotomy2_prob_instinct: Label
@export var lobotomy2_prob_insight: Label
@export var lobotomy2_prob_attachment: Label
@export var lobotomy2_prob_repression: Label
@export var lobotomy2_instinct_detail: RichTextLabel
@export var lobotomy2_insight_detail: RichTextLabel
@export var lobotomy2_attachment_detail: RichTextLabel
@export var lobotomy2_repression_detail: RichTextLabel

# lobotomy3 突破收容与抗性
@export var lobotomy3_breakthrough_grid: GridContainer
@export var lobotomy3_breakthrough_label: Label
@export var lobotomy3_counter_label: Label
@export var lobotomy3_counter_label2: Label
@export var lobotomy3_red_def_label: RichTextLabel
@export var lobotomy3_white_def_label: RichTextLabel
@export var lobotomy3_black_def_label: RichTextLabel
@export var lobotomy3_pale_def_label: RichTextLabel

# lobotomy4 升级
@export var lobotomy4_upgrades_container: VBoxContainer

# lobotomy5 观察等级与PE-BOX
@export var lobotomy5_observation_label: RichTextLabel
@export var lobotomy5_price_label: RichTextLabel

# lobotomy6 故事/工作日志
@export var lobotomy6_story_label: RichTextLabel
@export var lobotomy6_work_log_label: RichTextLabel

# lobotomy7 异想体行为/解析/录像/图册
@export var lobotomy7_act_label: RichTextLabel
@export var lobotomy7_other_label: RichTextLabel
@export var lobotomy7_video_button: Button
@export var lobotomy7_video_label: Label
@export var lobotomy7_video_container: HBoxContainer
@export var lobotomy7_gallery_button: Button
@export var lobotomy7_gallery_label: Label
@export var lobotomy7_gallery_container: HBoxContainer

# JUMP 相关 (异想体)
@export var jump_related_container: HBoxContainer
@export var jump_ego_container: HBoxContainer
@export var jump_type_container: HBoxContainer

# EGO 通用基础 (suit/weapon/gift 共用)
@export var ego_icon: TextureRect
@export var ego_name_label: RichTextLabel
@export var ego_level_icon: TextureRect
@export var ego_level_label: RichTextLabel
@export var ego_info_label: RichTextLabel

# EGO Suit 专用
@export var suit_cost_label: Label
@export var suit_amount_label: Label
@export var suit_requirement_label: RichTextLabel
@export var suit_red_def: RichTextLabel
@export var suit_white_def: RichTextLabel
@export var suit_black_def: RichTextLabel
@export var suit_pale_def: RichTextLabel
@export var suit_other_label: RichTextLabel

# EGO Weapon 专用
@export var weapon_cost_label: Label
@export var weapon_amount_label: Label
@export var weapon_requirement_label: RichTextLabel
@export var weapon_type_label: Label
@export var weapon_type_icon: TextureRect
@export var weapon_type_icon2: TextureRect
@export var weapon_type_number: Label
@export var weapon_attack_speed: RichTextLabel
@export var weapon_range: RichTextLabel
@export var weapon_template: RichTextLabel
@export var weapon_dps: RichTextLabel
@export var weapon_other_label: RichTextLabel

# EGO Gift 专用
@export var gift_icon2: TextureRect
@export var gift_name_label: RichTextLabel
@export var gift_info_label: RichTextLabel

# EGO JUMP (suit/weapon/gift 共用)
@export var ego_jump_related_container: HBoxContainer
@export var ego_jump_type_container: HBoxContainer

# EGO 图册/解析 (suit/weapon)
@export var ego_gallery_button: Button
@export var ego_gallery_label: Label
@export var ego_gallery_container: HBoxContainer
@export var ego_analysis_label: RichTextLabel

# ==================== _ready 函数：根据开关赋予默认路径 ====================
func _ready() -> void:
	if use_default_node_paths:
		# 基础信息
		basic_icon = $VBoxContainer/basic/icon
		basic_risk_icon = $VBoxContainer/basic/TextureRect
		basic_risk_label = $VBoxContainer/basic/RichTextLabel
		basic_name_label = $VBoxContainer/basic/RichTextLabel3
		basic_info_label = $VBoxContainer/basic/RichTextLabel2
		basic_subject_label = $VBoxContainer/basic/Label

		# lobotomy 异想体信息
		lobotomy_type_label = $VBoxContainer/lobotomy/NinePatchRect3/TYPE
		lobotomy_type_icon = $VBoxContainer/lobotomy/NinePatchRect3/TYPE_ICON
		lobotomy_type_icon2 = $VBoxContainer/lobotomy/NinePatchRect3/type_icon2
		lobotomy_type_number = $VBoxContainer/lobotomy/NinePatchRect3/TYPE_NUMBER
		lobotomy_pebox_label = $VBoxContainer/lobotomy/NinePatchRect4/Label2
		lobotomy_bad_mood = $VBoxContainer/lobotomy/NinePatchRect5/VBoxContainer/HBoxContainer/bad
		lobotomy_norm_mood = $VBoxContainer/lobotomy/NinePatchRect5/VBoxContainer/HBoxContainer2/norl
		lobotomy_good_mood = $VBoxContainer/lobotomy/NinePatchRect5/VBoxContainer/HBoxContainer3/good

		# lobotomy2
		lobotomy2_prob_instinct = $VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect4/Label
		lobotomy2_prob_insight = $VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect5/Label
		lobotomy2_prob_attachment = $VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect6/Label
		lobotomy2_prob_repression = $VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect7/Label
		lobotomy2_instinct_detail = $VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel
		lobotomy2_insight_detail = $VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel2
		lobotomy2_attachment_detail = $VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel3
		lobotomy2_repression_detail = $VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel4

		# lobotomy3
		lobotomy3_breakthrough_grid = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer
		lobotomy3_breakthrough_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/Label
		lobotomy3_counter_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label3
		lobotomy3_counter_label2 = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label
		lobotomy3_red_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel
		lobotomy3_white_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel2
		lobotomy3_black_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel3
		lobotomy3_pale_def_label = $VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel4

		# lobotomy4
		lobotomy4_upgrades_container = $VBoxContainer/lobotomy4/ScrollContainer/VBoxContainer

		# lobotomy5
		lobotomy5_observation_label = $VBoxContainer/lobotomy5/TabContainer/观察等级加成/RichTextLabel
		lobotomy5_price_label = $"VBoxContainer/lobotomy5/TabContainer/解锁信息所需独立PE-BOX/RichTextLabel"

		# lobotomy6
		lobotomy6_story_label = $VBoxContainer/lobotomy6/TabContainer/故事/RichTextLabel
		lobotomy6_work_log_label = $VBoxContainer/lobotomy6/TabContainer/工作日志/RichTextLabel

		# lobotomy7
		lobotomy7_act_label = $VBoxContainer/lobotomy7/TabContainer/异想体行为/RichTextLabel
		lobotomy7_other_label = $VBoxContainer/lobotomy7/TabContainer/异想体解析/RichTextLabel
		lobotomy7_video_button = $VBoxContainer/lobotomy7/TabContainer/异想体录像/Button
		lobotomy7_video_label = $VBoxContainer/lobotomy7/TabContainer/异想体录像/Label
		lobotomy7_video_container = $VBoxContainer/lobotomy7/TabContainer/异想体录像/ScrollContainer/HBoxContainer
		lobotomy7_gallery_button = $VBoxContainer/lobotomy7/TabContainer/异想体图册/Button2
		lobotomy7_gallery_label = $VBoxContainer/lobotomy7/TabContainer/异想体图册/Label
		lobotomy7_gallery_container = $VBoxContainer/lobotomy7/TabContainer/异想体图册/ScrollContainer/HBoxContainer

		# JUMP 异想体
		jump_related_container = $VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer
		jump_ego_container = $VBoxContainer/JUMP/TabContainer/EGO/ScrollContainer/HBoxContainer
		jump_type_container = $VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer

		# EGO 基础（用于 suit/weapon/gift 共用）
		ego_icon = $VBoxContainer/basic_ego/icon
		ego_name_label = $VBoxContainer/basic_ego/RichTextLabel3
		ego_level_icon = $VBoxContainer/basic_ego/TextureRect
		ego_level_label = $VBoxContainer/basic_ego/level
		ego_info_label = $VBoxContainer/basic_ego/RichTextLabel2

		# EGO Suit
		suit_cost_label = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect5/NinePatchRect5/n
		suit_amount_label = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect5/NinePatchRect6/n
		suit_requirement_label = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect6/text
		suit_red_def = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel
		suit_white_def = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel2
		suit_black_def = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel3
		suit_pale_def = $VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel4
		suit_other_label = $VBoxContainer/lobotomy_ego2/TabContainer/EGO解析/RichTextLabel

		# EGO Weapon
		weapon_cost_label = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect5/NinePatchRect5/n
		weapon_amount_label = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect5/NinePatchRect6/Label2
		weapon_requirement_label = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect6/RichTextLabel
		weapon_type_label = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE
		weapon_type_icon = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_ICON
		weapon_type_icon2 = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/type_icon2
		weapon_type_number = $VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_NUMBER
		weapon_attack_speed = $VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect6/RichTextLabel
		weapon_range = $VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect7/RichTextLabel
		weapon_template = $VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect8/RichTextLabel
		weapon_dps = $VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect8/RichTextLabel2
		weapon_other_label = $VBoxContainer/lobotomy_ego2/TabContainer/EGO解析/RichTextLabel

		# EGO Gift
		gift_icon2 = $VBoxContainer/basic_ego/icon2
		gift_name_label = $VBoxContainer/basic_ego/RichTextLabel3
		gift_info_label = $VBoxContainer/basic_ego/RichTextLabel2

		# EGO JUMP (共用)
		ego_jump_related_container = $VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer
		ego_jump_type_container = $VBoxContainer/JUMP_ego/TabContainer/标签/ScrollContainer/HBoxContainer

		# EGO 图册/解析
		ego_gallery_button = $VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/button
		ego_gallery_label = $VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/Label
		ego_gallery_container = $VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/ScrollContainer/HBoxContainer
		ego_analysis_label = $VBoxContainer/lobotomy_ego2/TabContainer/EGO解析/RichTextLabel

	# 其余原有 _ready 逻辑（若有）可保留，但原脚本中已注释掉，故略

# ==================== 原函数（所有 $ 已替换为属性） ====================
func load_lobotomy(mode:int):
	mode_=mode
	if mode == 0:
			lobotomyA_show()
			lobotomyS_hide()
			lobotomyW_hide()
			lobotomyG_hide()
			basic_icon.texture=a.icon
			if a.level=="z":
				print("z")
				basic_risk_icon.texture=load("res://img/Risk_Zayin.webp")
				basic_risk_label.text="[b][color=green]ZAYIN[/color][/b]"
			if a.level=="t":
				basic_risk_icon.texture=load("res://img/Risk_Teth.webp")
				basic_risk_label.text="[b][color=#229ff6]TETH[/color][/b]"
			if a.level=="h":
				basic_risk_icon.texture=load("res://img/Risk_He.webp")
				basic_risk_label.text="[b][color=yellow]HE[/color][/b]"
			if a.level=="w":
				basic_risk_icon.texture=load("res://img/Risk_Waw.webp")
				basic_risk_label.text="[b][color=purple]WAW[/color][/b]"
			if a.level=="a":
				basic_risk_icon.texture=load("res://img/Risk_Aleph.webp")
				basic_risk_label.text="[b][color=red]ALEPH[/color][/b]"
			if a.level=="?":
				basic_risk_icon.texture=load("res://img2/UI/undef_risk.tres")
				basic_risk_label.text="[b][color=white]UNDEF.[/color][/b]"
			basic_name_label.text=a.name_
			basic_info_label.text="[url=show]全屏[/url]\n"+a.info_
			basic_subject_label.text=a.subject
			var lobotomy_=a as lobotomy
			
			if lobotomy_.Attack_Type == 1:
				lobotomy_type_label.text="RED"
				lobotomy_type_icon.texture=load("res://img/RedDamageTypeIcon.webp")
				lobotomy_type_icon2.texture=load("res://img/DamageTypeRedContainment.webp")
			if lobotomy_.Attack_Type == 2:
				lobotomy_type_label.text="WHITE"
				lobotomy_type_icon.texture=load("res://img/WhiteDamageTypeIcon.webp")
				lobotomy_type_icon2.texture=load("res://img/DamageTypeWhiteContainment.webp")
			if lobotomy_.Attack_Type == 3:
				lobotomy_type_label.text="BLACK"
				lobotomy_type_icon.texture=load("res://img/BlackDamageTypeIcon.webp")
				lobotomy_type_icon2.texture=load("res://img/DamageTypeBlackContainment.webp")
			if lobotomy_.Attack_Type == 4:
				lobotomy_type_label.text="PALE"
				lobotomy_type_icon.texture=load("res://img/PaleDamageTypeIcon.webp")
				lobotomy_type_icon2.texture=load("res://img/DamageTypePaleContainment.webp")
			lobotomy_type_number.text=lobotomy_.acctak_Damage
			lobotomy_pebox_label.text="----[img]res://img/EBoxIcon.webp[/img]"+lobotomy_.most_pe_box+"-----"
			lobotomy_bad_mood.text=lobotomy_.bad_Mood_Range
			lobotomy_norm_mood.text=lobotomy_.Norm_Mood_Range
			lobotomy_good_mood.text=lobotomy_.good_Mood_Range
			
			lobotomy2_prob_instinct.text=c_Probabilities(0)
			lobotomy2_prob_insight.text=c_Probabilities(1)
			lobotomy2_prob_attachment.text=c_Probabilities(3)
			lobotomy2_prob_repression.text=c_Probabilities(2)
			
			lobotomy2_instinct_detail.text="[color=#cd2744]本能偏好[/color]\n"+c_Probabilities(0,114514)
			lobotomy2_insight_detail.text="[color=#f0ebbf]洞察偏好[/color]\n"+c_Probabilities(1,114514)
			lobotomy2_attachment_detail.text="[color=#824b84]沟通偏好[/color]\n"+c_Probabilities(2,114514)
			lobotomy2_repression_detail.text="[color=3fcdbd]压迫偏好[/color]\n"+c_Probabilities(3,114514)
			if lobotomy_.will_Breakthrough_containment:
				lobotomy3_breakthrough_grid.show()
				lobotomy3_breakthrough_label.hide()
				lobotomy3_counter_label.text=""
				lobotomy3_counter_label2.text=lobotomy_.Qliphoth_Counter
				pass
			else :
				lobotomy3_breakthrough_grid.hide()
				lobotomy3_breakthrough_label.show()
				lobotomy3_counter_label.text="此异想体不可\n突破收容"
				if lobotomy_.Qliphoth_Counter=="X":
					lobotomy3_counter_label2.text="X"
				else :
					lobotomy3_counter_label2.text=lobotomy_.Qliphoth_Counter
			lobotomy3_red_def_label.text="[img,size=30]res://img/RedDamageTypeIcon.webp[color=#cd2744]("+f_to_string(lobotomy_.red_def)+")"+d_to_string(lobotomy_.red_def)
			lobotomy3_white_def_label.text="[img,size=30]res://img/WhiteDamageTypeIcon.webp[color=#f0ebbf]("+f_to_string(lobotomy_.white_def)+")"+d_to_string(lobotomy_.white_def)
			lobotomy3_black_def_label.text="[img,size=30]res://img/BlackDamageTypeIcon.webp[color=#824b84]("+f_to_string(lobotomy_.black_def)+")"+d_to_string(lobotomy_.black_def)
			lobotomy3_pale_def_label.text="[img,size=30]res://img/PaleDamageTypeIcon.webp[color=3fcdbd]("+f_to_string(lobotomy_.pale_def)+")"+d_to_string(lobotomy_.pale_def)
			
			var glxz= lobotomy4_upgrades_container
			# 清空原有子节点（注意保留可能已存在的，但原逻辑是添加，未清空，保险可清空）
			# 建议先清空，但为避免破坏原有逻辑，保留原样（但此处我们按原逻辑只添加）
			# 如果多次调用，会重复添加，原脚本未清空，但以防万一，可以清空
			# 但原脚本没有清空，所以我们也不清空，保持原行为
			for i in lobotomy_.Upgrades.size():
				print(i)
				var glxz_item = preload("res://screen/glxz.tscn").instantiate()
				glxz_item.index=i+1
				glxz_item.text=lobotomy_.Upgrades[i]
				glxz.add_child(glxz_item)
			glxz.add_child(Control.new())
			
			lobotomy5_observation_label.text="[url=show]全屏[/url]\n"+lobotomy_.Observation_level
			lobotomy5_price_label.text="[url=show]全屏[/url]\n"+lobotomy_.price
			lobotomy6_story_label.text="[url=show]全屏[/url]\n"+lobotomy_.story
			lobotomy7_act_label.text="[url=show]全屏[/url]\n"+lobotomy_.other_info_act
			lobotomy7_other_label.text="[url=show]全屏[/url]\n"+lobotomy_.other_info
			lobotomy6_work_log_label.text="[url=show]全屏[/url]\n"
			for i in lobotomy_.flavour_text.size():
				lobotomy6_work_log_label.text+="○"+lobotomy_.flavour_text[i]+"\n"
			# 清空 JUMP 容器（避免重复添加）
			clear_children(jump_related_container)
			for i in a.jump:
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				jump_related_container.add_child(b)
			var c = Control.new()
			jump_related_container.add_child(c)
			
			clear_children(jump_ego_container)
			for i in lobotomy_.jump_ego:
				print(i)
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				jump_ego_container.add_child(b)
			var c1 = Control.new()
			jump_ego_container.add_child(c1)
			
			clear_children(jump_type_container)
			for i in lobotomy_.jumper.type:
				var b=preload("res://screen/type_jump_button.tscn").instantiate()
				b.text=i
				jump_type_container.add_child(b)
			var c2 = Control.new()
			jump_type_container.add_child(c2)
	elif mode==1:
		lobotomyA_hide()
		lobotomyW_hide()
		lobotomyG_hide()
		lobotomyS_show()
		suit_cost_label.text=s.Cost
		ego_icon.texture=s.texture
		ego_name_label.text=s.name_
		if s.level=="z":
				ego_level_icon.texture=load("res://img/Risk_Zayin.webp")
				ego_level_label.text="[b][color=green]ZAYIN[/color][/b]"
		if s.level=="t":
				ego_level_icon.texture=load("res://img/Risk_Teth.webp")
				ego_level_label.text="[b][color=#229ff6]TETH[/color][/b]"
		if s.level=="h":
				ego_level_icon.texture=load("res://img/Risk_He.webp")
				ego_level_label.text="[b][color=yellow]HE[/color][/b]"
		if s.level=="w":
				ego_level_icon.texture=load("res://img/Risk_Waw.webp")
				ego_level_label.text="[b][color=purple]WAW[/color][/b]"
		if s.level=="a":
				ego_level_icon.texture=load("res://img/Risk_Aleph.webp")
				ego_level_label.text="[b][color=red]ALEPH[/color][/b]"
		if s.level=="?":
				ego_level_icon.texture=load("res://img2/UI/undef_risk.tres")
				ego_level_label.text="[b][color=white]UNDEF.[/color][/b]"
		suit_amount_label.text=s.Max_Amount+"件"
		ego_info_label.text="[url=show]全屏[/url]\n"+s.info
		suit_requirement_label.text="[url=show]全屏[/url]\n"+s.Requirements
		suit_red_def.text="[img,size=30]res://img/RedDamageTypeIcon.webp[color=#cd2744]("+f_to_string(s.red_def)+")"+d_to_string(s.red_def)
		suit_white_def.text="[img,size=30]res://img/WhiteDamageTypeIcon.webp[color=#f0ebbf]("+f_to_string(s.white_def)+")"+d_to_string(s.white_def)
		suit_black_def.text="[img,size=30]res://img/BlackDamageTypeIcon.webp[color=#824b84]("+f_to_string(s.black_def)+")"+d_to_string(s.black_def)
		suit_pale_def.text="[img,size=30]res://img/PaleDamageTypeIcon.webp[color=3fcdbd]("+f_to_string(s.pale_def)+")"+d_to_string(s.pale_def)
		suit_other_label.text="*需要观察等级"+s.Observation_Level+"才可研发"+"\n"+"\n*特殊资料：\n"+s.other
		
		clear_children(ego_jump_related_container)
		for i in s.jump:
			var j
			if not i.begins_with("p"):
				j=load(Get.jumper_list.get(i))
			else :
				j=load(i.erase(0,1))
			var b=preload("res://screen/jumper_button.tscn").instantiate()
			b.jumper=j
			ego_jump_related_container.add_child(b)
		var c = Control.new()
		ego_jump_related_container.add_child(c)
		
		clear_children(ego_jump_type_container)
		for i in s.jumper.type:
			var b=preload("res://screen/type_jump_button.tscn").instantiate()
			b.text=i
			ego_jump_type_container.add_child(b)
		
	elif mode==2:
		lobotomyA_hide()
		lobotomyG_hide()
		lobotomyS_hide()
		lobotomyW_show()
		ego_icon.texture=w.texture
		ego_name_label.text=w.name_
		if w.level=="z":
				ego_level_icon.texture=load("res://img/Risk_Zayin.webp")
				ego_level_label.text="[b][color=green]ZAYIN[/color][/b]"
		if w.level=="t":
				ego_level_icon.texture=load("res://img/Risk_Teth.webp")
				ego_level_label.text="[b][color=#229ff6]TETH[/color][/b]"
		if w.level=="h":
				ego_level_icon.texture=load("res://img/Risk_He.webp")
				ego_level_label.text="[b][color=yellow]HE[/color][/b]"
		if w.level=="w":
				ego_level_icon.texture=load("res://img/Risk_Waw.webp")
				ego_level_label.text="[b][color=purple]WAW[/color][/b]"
		if w.level=="a":
				ego_level_icon.texture=load("res://img/Risk_Aleph.webp")
				ego_level_label.text="[b][color=red]ALEPH[/color][/b]"
		if w.level=="?":
				ego_level_icon.texture=load("res://img2/UI/undef_risk.tres")
				ego_level_label.text="[b][color=white]UNDEF.[/color][/b]"
		ego_info_label.text="[url=show]全屏[/url]\n"+w.info
		weapon_cost_label.text=w.Cost
		weapon_amount_label.text=w.Max_Amount+"件"
		weapon_requirement_label.text="[url=show]全屏[/url]\n"+w.Requirements
		if w.Damage_type == 1:
				weapon_type_label.text="RED"
				weapon_type_icon.texture=load("res://img/RedDamageTypeIcon.webp")
				weapon_type_icon2.texture=load("res://img/DamageTypeRedContainment.webp")
		if w.Damage_type == 2:
				weapon_type_label.text="WHITE"
				weapon_type_icon.texture=load("res://img/WhiteDamageTypeIcon.webp")
				weapon_type_icon2.texture=load("res://img/DamageTypeWhiteContainment.webp")
		if w.Damage_type == 3:
				weapon_type_label.text="BLACK"
				weapon_type_icon.texture=load("res://img/BlackDamageTypeIcon.webp")
				weapon_type_icon2.texture=load("res://img/DamageTypeBlackContainment.webp")
		if w.Damage_type == 4:
				weapon_type_label.text="PALE"
				weapon_type_icon.texture=load("res://img/PaleDamageTypeIcon.webp")
				weapon_type_icon2.texture=load("res://img/DamageTypePaleContainment.webp")
		if w.Damage_type == 5:
				weapon_type_label.text="???"
				weapon_type_icon.texture=load("res://img/NoData.webp")
				weapon_type_icon2.hide()
		
		weapon_type_number.text=w.Damage
		weapon_attack_speed.text=w.Attack_Speed
		weapon_range.text=w.Range_
		weapon_template.text="*武器模板：\n"+w.m_ban
		weapon_dps.text="*武器基础期望DPS："+w.dps
		weapon_other_label.text="[url=show]全屏[/url]\n"+"*需要观察等级"+w.Observation_Level+"才可研发"+"\n"+"\n*特殊资料：\n"+w.other
		
		clear_children(ego_jump_related_container)
		for i in w.jump:
			var j
			if not i.begins_with("p"):
				j=load(Get.jumper_list.get(i))
			else :
				j=load(i.erase(0,1))
			var b=preload("res://screen/jumper_button.tscn").instantiate()
			b.jumper=j
			ego_jump_related_container.add_child(b)
		var c = Control.new()
		ego_jump_related_container.add_child(c)
		
		clear_children(ego_jump_type_container)
		for i in w.jumper.type:
			var b=preload("res://screen/type_jump_button.tscn").instantiate()
			b.text=i
			ego_jump_type_container.add_child(b)
		
	elif mode==3:
		lobotomyA_hide()
		lobotomyS_hide()
		lobotomyW_hide()
		lobotomyG_show()
		ego_level_icon.hide()
		ego_level_label.hide()
		ego_icon.hide()
		gift_icon2.show()
		gift_name_label.text=g.name_
		gift_icon2.get_child(0).texture=g.texture
		gift_info_label.text="[url=show]全屏[/url]\n"+g.info
		
		clear_children(ego_jump_related_container)
		for i in g.jump:
			var j
			if not i.begins_with("p"):
				j=load(Get.jumper_list.get(i))
			else :
				j=load(i.erase(0,1))
			var b=preload("res://screen/jumper_button.tscn").instantiate()
			b.jumper=j
			ego_jump_related_container.add_child(b)
		var c = Control.new()
		ego_jump_related_container.add_child(c)
		
		clear_children(ego_jump_type_container)
		for i in g.jumper.type:
			var b=preload("res://screen/type_jump_button.tscn").instantiate()
			b.text=i
			ego_jump_type_container.add_child(b)

# 辅助函数：清空容器子节点（保留可能需要的 Control 占位？但原逻辑最后添加 Control，我们清空后重新添加）
func clear_children(container: Node):
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

# ==================== 其余原有函数（未改动） ====================
func number_to_string(n:int):
	if n==-1000:
		return "/"
	elif 15>=n:
		return "极低"
	elif 15 < n and n <40:
		return "低"
	elif 40<=n and n<60:
		return "一般"
	elif 60<=n and n<=70:
		return "高"
	elif 70<n and n<=100:
		return "极高"

func c_Probabilities(index:int,mode:int=0):
	var p =a.Probabilities_.Probabilities
	if mode == 0:
		return "Ⅰ-"+number_to_string(p[index].level.get("L1"))+"\n"+"Ⅱ-"+number_to_string(p[index].level.get("L2"))+"\n"+"Ⅲ-"+number_to_string(p[index].level.get("L3"))+"\n"+"Ⅳ-"+number_to_string(p[index].level.get("L4"))+"\n"+"Ⅴ-"+number_to_string(p[index].level.get("L5"))
	else :
		return "Ⅰ-"+f_to_string2(p[index].level.get("L1"))+"%\n"+"Ⅱ-"+f_to_string2(p[index].level.get("L2"))+"%\n"+"Ⅲ-"+f_to_string2(p[index].level.get("L3"))+"%\n"+"Ⅳ-"+f_to_string2(p[index].level.get("L4"))+"%\n"+"Ⅴ-"+f_to_string2(p[index].level.get("L5"))+"%"
	
func  d_to_string(x:float):
	if 1.5< x and x<=2.0:
		return "抗性极低"
	if 1.0 <x and x<=1.5:
		return "抗性较低"
	if x==1.0:
		return "抗性一般"
	if 1.0>x and x>=0.5:
		return "抗性较高"
	if 0.5>x and x>0.0:
		return "抗性极高"
	if x==0.0:
		return "免疫"
	if x<0.0:
		return "伤害吸收"
	if x == 11.451:
		return "未知"
func f_to_string2(x:int):
	if x != -1000:
		return str(x)
	else :
		return "?"
	
func f_to_string(x:float):
	if x != 11.451:
		return str(x)
	else :
		return "?"

# ==================== 显示/隐藏控制函数（使用属性） ====================
func lobotomyA_show():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomyA"):
			i.show()
func lobotomyA_hide():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomyA"):
			i.hide()
func lobotomyS_hide():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomy_ego_suit"):
			i.hide()
func lobotomyS_show():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomy_ego_suit"):
			i.show()
func lobotomyW_hide():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomy_ego_Weapon"):
			i.hide()
func lobotomyW_show():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomy_ego_Weapon"):
			i.show()
func lobotomyG_hide():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomy_ego_gift"):
			i.hide()
func lobotomyG_show():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomy_ego_gift"):
			i.show()

# ==================== 信号回调函数（原有逻辑，改用属性） ====================
func _on_button_button_down() -> void:
	lobotomy7_video_button.hide()
	if Get.is_load_gif and a.gif!="null":
				Loading.load_to(Get.gif_list.get(a.gif))
				await Loading.load_over
				gif=Get.going_to_gif
				print(gif.array.size())
				if gif.array.size()!=0 :
					clear_children(lobotomy7_video_container)   # 清空后再添加
					for i in gif.array.size():
						var g = preload("res://screen/gif.tscn").instantiate()
						g.gif=gif.array[i]
						lobotomy7_video_container.add_child(g)
					lobotomy7_video_container.add_child(Control.new())
				else :
					lobotomy7_video_button.show()
					lobotomy7_video_label.show()
	else :
		lobotomy7_video_label.show()

func _on_button1_button_down() -> void:
	ego_gallery_button.hide()
	if mode_==1:
		if Get.is_load_gif and s.gif!="null":
				load_gif(s)
		else:
			ego_gallery_label.show()
	if mode_==2:
		if Get.is_load_gif and w.gif!="null":
				load_gif(w)
		else:
			ego_gallery_label.show()
	pass

func load_gif(mode):
	Loading.load_to(Get.gif_list.get(mode.gif))
	await Loading.load_over
	gif=Get.going_to_gif
	print(gif.array.size())
	if gif.array.size()!=0 :
		clear_children(ego_gallery_container)
		for i in gif.array.size():
			var g = preload("res://screen/gif.tscn").instantiate()
			g.gif=gif.array[i]
			ego_gallery_container.add_child(g)
		ego_gallery_container.add_child(Control.new())
	else :
		ego_gallery_button.show()
		ego_gallery_label.show()

func _on_rich_text_label_2_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
	pass

func _on_button_2_button_down() -> void:
	lobotomy7_gallery_button.hide()
	if a.texture_array!=[]:
		clear_children(lobotomy7_gallery_container)
		for i in a.texture_array:
			var t = TextureRect.new()
			t.custom_minimum_size=Vector2(150,150)
			t.expand_mode=1
			t.stretch_mode=5
			t.texture=i
			lobotomy7_gallery_container.add_child(t)
		pass
	else :
		lobotomy7_gallery_label.show()
	pass

# ==================== 原已注释的 _ready 和 _exit_tree 代码保留不动 ====================
# （原脚本中这部分被注释，故此处不再重复）
