extends ScrollContainer
@export var a:bacis_info
@export var s:lobotomy_ego_Suit
@export var w:lobotomy_ego_Weapon
@export var g:bacis_ego
@export var gif:gif_array
@export var mode_:int
func load_lobotomy(mode:int):
	mode_=mode
	if mode == 0:
			lobotomyA_show()
			lobotomyS_hide()
			lobotomyW_hide()
			lobotomyG_hide()
			#var a = Get.going_to_load
			$VBoxContainer/basic/icon.texture=a.icon
			if a.level=="z":
				print("z")
				$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Zayin.webp")
				$VBoxContainer/basic/RichTextLabel.text="[b][color=green]ZAYIN[/color][/b]"
			if a.level=="t":
				$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Teth.webp")
				$VBoxContainer/basic/RichTextLabel.text="[b][color=#229ff6]TETH[/color][/b]"
			if a.level=="h":
				$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_He.webp")
				$VBoxContainer/basic/RichTextLabel.text="[b][color=yellow]HE[/color][/b]"
			if a.level=="w":
				$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Waw.webp")
				$VBoxContainer/basic/RichTextLabel.text="[b][color=purple]WAW[/color][/b]"
			if a.level=="a":
				$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Aleph.webp")
				$VBoxContainer/basic/RichTextLabel.text="[b][color=red]ALEPH[/color][/b]"
			if a.level=="?":
				$VBoxContainer/basic/TextureRect.texture=load("res://img2/UI/undef_risk.tres")
				$VBoxContainer/basic/RichTextLabel.text="[b][color=white]UNDEF.[/color][/b]"
			$VBoxContainer/basic/RichTextLabel3.text=a.name_
			$VBoxContainer/basic/RichTextLabel2.text="[url=show]全屏[/url]\n"+a.info_
			$VBoxContainer/basic/Label.text=a.subject
			var lobotomy_=a as lobotomy
			
			if lobotomy_.Attack_Type == 1:
				#red
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE.text="RED"
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE_ICON.texture=load("res://img/RedDamageTypeIcon.webp")
				$VBoxContainer/lobotomy/NinePatchRect3/type_icon2.texture=load("res://img/DamageTypeRedContainment.webp")
			if lobotomy_.Attack_Type == 2:
				#white
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE.text="WHITE"
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE_ICON.texture=load("res://img/WhiteDamageTypeIcon.webp")
				$VBoxContainer/lobotomy/NinePatchRect3/type_icon2.texture=load("res://img/DamageTypeWhiteContainment.webp")
			if lobotomy_.Attack_Type == 3:
				#black
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE.text="BLACK"
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE_ICON.texture=load("res://img/BlackDamageTypeIcon.webp")
				$VBoxContainer/lobotomy/NinePatchRect3/type_icon2.texture=load("res://img/DamageTypeBlackContainment.webp")
			if lobotomy_.Attack_Type == 4:
				#pale
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE.text="PALE"
				$VBoxContainer/lobotomy/NinePatchRect3/TYPE_ICON.texture=load("res://img/PaleDamageTypeIcon.webp")
				$VBoxContainer/lobotomy/NinePatchRect3/type_icon2.texture=load("res://img/DamageTypePaleContainment.webp")
			$VBoxContainer/lobotomy/NinePatchRect3/TYPE_NUMBER.text=lobotomy_.acctak_Damage
			$VBoxContainer/lobotomy/NinePatchRect4/Label2.text="----[img]res://img/EBoxIcon.webp[/img]"+lobotomy_.most_pe_box+"-----"
			$VBoxContainer/lobotomy/NinePatchRect5/VBoxContainer/HBoxContainer/bad.text=lobotomy_.bad_Mood_Range
			$VBoxContainer/lobotomy/NinePatchRect5/VBoxContainer/HBoxContainer2/norl.text=lobotomy_.Norm_Mood_Range
			$VBoxContainer/lobotomy/NinePatchRect5/VBoxContainer/HBoxContainer3/good.text=lobotomy_.good_Mood_Range
			
			$VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect4/Label.text=c_Probabilities(0)
			$VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect5/Label.text=c_Probabilities(1)
			$VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect6/Label.text=c_Probabilities(3)
			$VBoxContainer/lobotomy2/NinePatchRect4/NinePatchRect7/Label.text=c_Probabilities(2)
			
			$VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel.text="[color=#cd2744]本能偏好[/color]\n"+c_Probabilities(0,114514)
			$VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel2.text="[color=#f0ebbf]洞察偏好[/color]\n"+c_Probabilities(1,114514)
			$VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel3.text="[color=#824b84]沟通偏好[/color]\n"+c_Probabilities(2,114514)
			$VBoxContainer/lobotomy2/NinePatchRect5/GridContainer/RichTextLabel4.text="[color=3fcdbd]压迫偏好[/color]\n"+c_Probabilities(3,114514)
			if lobotomy_.will_Breakthrough_containment:
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer.show()
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/Label.hide()
				
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label3.text=""
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label.text=lobotomy_.Qliphoth_Counter
				pass
			else :
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer.hide()
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/Label.show()
				
				$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label3.text="此异想体不可\n突破收容"
				if lobotomy_.Qliphoth_Counter=="X":
					$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label.text="X"
				else :
					$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/Label.text=lobotomy_.Qliphoth_Counter
			$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel.text="[img,size=30]res://img/RedDamageTypeIcon.webp[color=#cd2744]("+f_to_string(lobotomy_.red_def)+")"+d_to_string(lobotomy_.red_def)
			$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel2.text="[img,size=30]res://img/WhiteDamageTypeIcon.webp[color=#f0ebbf]("+f_to_string(lobotomy_.white_def)+")"+d_to_string(lobotomy_.white_def)
			$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel3.text="[img,size=30]res://img/BlackDamageTypeIcon.webp[color=#824b84]("+f_to_string(lobotomy_.black_def)+")"+d_to_string(lobotomy_.black_def)
			$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/GridContainer/RichTextLabel4.text="[img,size=30]res://img/PaleDamageTypeIcon.webp[color=3fcdbd]("+f_to_string(lobotomy_.pale_def)+")"+d_to_string(lobotomy_.pale_def)
			
			var glxz= $VBoxContainer/lobotomy4/ScrollContainer/VBoxContainer
			
			for i in lobotomy_.Upgrades.size():
				print(i)
				var glxz_item = preload("res://screen/glxz.tscn").instantiate()
				
				glxz_item.index=i+1
				glxz_item.text=lobotomy_.Upgrades[i]
				glxz.add_child(glxz_item)
			
			glxz.add_child(Control.new())
			
			$"VBoxContainer/lobotomy5/TabContainer/观察等级加成/RichTextLabel".text="[url=show]全屏[/url]\n"+lobotomy_.Observation_level
			$"VBoxContainer/lobotomy5/TabContainer/解锁信息所需独立PE-BOX/RichTextLabel".text="[url=show]全屏[/url]\n"+lobotomy_.price
			$"VBoxContainer/lobotomy6/TabContainer/故事/RichTextLabel".text="[url=show]全屏[/url]\n"+lobotomy_.story
			$"VBoxContainer/lobotomy7/TabContainer/异想体行为/RichTextLabel".text="[url=show]全屏[/url]\n"+lobotomy_.other_info_act
			$"VBoxContainer/lobotomy7/TabContainer/异想体解析/RichTextLabel".text="[url=show]全屏[/url]\n"+lobotomy_.other_info
			$"VBoxContainer/lobotomy6/TabContainer/工作日志/RichTextLabel".text+="[url=show]全屏[/url]\n"
			for i in lobotomy_.flavour_text.size():
				$"VBoxContainer/lobotomy6/TabContainer/工作日志/RichTextLabel".text+="○"+lobotomy_.flavour_text[i]+"\n"
			for i in a.jump:
				
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				$VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(b)
			var c = Control.new()
			$VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c)
			for i in lobotomy_.jump_ego:
				print(i)
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				$VBoxContainer/JUMP/TabContainer/EGO/ScrollContainer/HBoxContainer.add_child(b)
			var c1 = Control.new()
			$VBoxContainer/JUMP/TabContainer/EGO/ScrollContainer/HBoxContainer.add_child(c1)
			for i in lobotomy_.jumper.type:
				
				
				var b=preload("res://screen/type_jump_button.tscn").instantiate()
				b.text=i
				$VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
			var c2 = Control.new()
			$VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(c2)
	elif mode==1:
		lobotomyA_hide()
		lobotomyW_hide()
		lobotomyG_hide()
		lobotomyS_show()
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect5/NinePatchRect5/n.text=s.Cost
		$VBoxContainer/basic_ego/icon.texture=s.texture
		$VBoxContainer/basic_ego/RichTextLabel3.text=s.name_
		if s.level=="z":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Zayin.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=green]ZAYIN[/color][/b]"
		if s.level=="t":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Teth.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=#229ff6]TETH[/color][/b]"
		if s.level=="h":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_He.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=yellow]HE[/color][/b]"
		if s.level=="w":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Waw.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=purple]WAW[/color][/b]"
		if s.level=="a":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Aleph.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=red]ALEPH[/color][/b]"
		if s.level=="?":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img2/UI/undef_risk.tres")
				$VBoxContainer/basic_ego/level.text="[b][color=white]UNDEF.[/color][/b]"
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect5/NinePatchRect6/n.text=s.Max_Amount+"件"
		$VBoxContainer/basic_ego/RichTextLabel2.text="[url=show]全屏[/url]\n"+s.info
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect6/text.text="[url=show]全屏[/url]\n"+s.Requirements
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel.text="[img,size=30]res://img/RedDamageTypeIcon.webp[color=#cd2744]("+f_to_string(s.red_def)+")"+d_to_string(s.red_def)
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel2.text="[img,size=30]res://img/WhiteDamageTypeIcon.webp[color=#f0ebbf]("+f_to_string(s.white_def)+")"+d_to_string(s.white_def)
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel3.text="[img,size=30]res://img/BlackDamageTypeIcon.webp[color=#824b84]("+f_to_string(s.black_def)+")"+d_to_string(s.black_def)
		$VBoxContainer/lobotomy_ego/NinePatchRect5/NinePatchRect7/GridContainer/RichTextLabel4.text="[img,size=30]res://img/PaleDamageTypeIcon.webp[color=3fcdbd]("+f_to_string(s.pale_def)+")"+d_to_string(s.pale_def)
		$"VBoxContainer/lobotomy_ego2/TabContainer/EGO解析/RichTextLabel".text="*需要观察等级"+s.Observation_Level+"才可研发"+"\n"+"\n*特殊资料：\n"+s.other
		for i in s.jump:
				
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				$VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(b)
		var c = Control.new()
		$VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c)
		for i in s.jumper.type:
				
				
				var b=preload("res://screen/type_jump_button.tscn").instantiate()
				b.text=i
				$VBoxContainer/JUMP_ego/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
		
	elif mode==2:
		lobotomyA_hide()
		lobotomyG_hide()
		lobotomyS_hide()
		lobotomyW_show()
		$VBoxContainer/basic_ego/icon.texture=w.texture
		$VBoxContainer/basic_ego/RichTextLabel3.text=w.name_
		if w.level=="z":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Zayin.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=green]ZAYIN[/color][/b]"
		if w.level=="t":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Teth.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=#229ff6]TETH[/color][/b]"
		if w.level=="h":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_He.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=yellow]HE[/color][/b]"
		if w.level=="w":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Waw.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=purple]WAW[/color][/b]"
		if w.level=="a":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img/Risk_Aleph.webp")
				$VBoxContainer/basic_ego/level.text="[b][color=red]ALEPH[/color][/b]"
		if w.level=="?":
				$VBoxContainer/basic_ego/TextureRect.texture=load("res://img2/UI/undef_risk.tres")
				$VBoxContainer/basic_ego/level.text="[b][color=white]UNDEF.[/color][/b]"
		$VBoxContainer/basic_ego/RichTextLabel2.text="[url=show]全屏[/url]\n"+w.info
		$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect5/NinePatchRect5/n.text=w.Cost
		$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect5/NinePatchRect6/Label2.text=w.Max_Amount+"件"
		$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect6/RichTextLabel.text="[url=show]全屏[/url]\n"+w.Requirements
		if w.Damage_type == 1:
				#red
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE.text="RED"
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_ICON.texture=load("res://img/RedDamageTypeIcon.webp")
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/type_icon2.texture=load("res://img/DamageTypeRedContainment.webp")
		if w.Damage_type == 2:
				#white
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE.text="WHITE"
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_ICON.texture=load("res://img/WhiteDamageTypeIcon.webp")
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/type_icon2.texture=load("res://img/DamageTypeWhiteContainment.webp")
		if w.Damage_type == 3:
				#black
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE.text="BLACK"
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_ICON.texture=load("res://img/BlackDamageTypeIcon.webp")
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/type_icon2.texture=load("res://img/DamageTypeBlackContainment.webp")
		if w.Damage_type == 4:
				#pale
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE.text="PALE"
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_ICON.texture=load("res://img/PaleDamageTypeIcon.webp")
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/type_icon2.texture=load("res://img/DamageTypePaleContainment.webp")
		if w.Damage_type == 5:
				#
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE.text="???"
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_ICON.texture=load("res://img/NoData.webp")
				$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/type_icon2.hide()
		
		$VBoxContainer/lobotomy_ego_weapon/NinePatchRect5/NinePatchRect7/TYPE_NUMBER.text=w.Damage
		$VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect6/RichTextLabel.text=w.Attack_Speed
		$VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect7/RichTextLabel.text=w.Range_
		$VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect8/RichTextLabel.text="*武器模板：\n"+w.m_ban
		$VBoxContainer/lobotomy_ego_weapon2/NinePatchRect6/NinePatchRect8/RichTextLabel2.text="*武器基础期望DPS："+w.dps
		$"VBoxContainer/lobotomy_ego2/TabContainer/EGO解析/RichTextLabel".text="[url=show]全屏[/url]\n"+"*需要观察等级"+w.Observation_Level+"才可研发"+"\n"+"\n*特殊资料：\n"+w.other
		for i in w.jump:
				
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				$VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(b)
		var c = Control.new()
		$VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c)
		for i in w.jumper.type:
				
				
				var b=preload("res://screen/type_jump_button.tscn").instantiate()
				b.text=i
				$VBoxContainer/JUMP_ego/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
		
	elif mode==3:
		lobotomyA_hide()
		lobotomyS_hide()
		lobotomyW_hide()
		lobotomyG_show()
		$VBoxContainer/basic_ego/TextureRect.hide()
		$VBoxContainer/basic_ego/level.hide()
		$VBoxContainer/basic_ego/icon.hide()
		$VBoxContainer/basic_ego/icon2.show()
		$VBoxContainer/basic_ego/RichTextLabel3.text=g.name_
		$VBoxContainer/basic_ego/icon2/icon2.texture=g.texture
		$VBoxContainer/basic_ego/RichTextLabel2.text="[url=show]全屏[/url]\n"+g.info
		
		for i in g.jump:
				
				var j
				if not i.begins_with("p"):
					j=load(Get.jumper_list.get(i))
				else :
					j=load(i.erase(0,1))
				var b=preload("res://screen/jumper_button.tscn").instantiate()
				b.jumper=j
				$VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(b)
				
		var c = Control.new()
		$VBoxContainer/JUMP_ego/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c)
		for i in g.jumper.type:
				
				
				var b=preload("res://screen/type_jump_button.tscn").instantiate()
				b.text=i
				$VBoxContainer/JUMP_ego/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
		


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
#func _ready() -> void:
	##a = Get.going_to_load
	#
	##load_lobotomy(3)
	##pass
		#
#
	#Get.going_to_load_jump_saver=Get.jump_saver_list.back()
	#Get.is_going_to_load_jump_saver=true
	#if Get.is_going_to_load_jump_saver:
		#print("jump_saver")
		#var saver=Get.going_to_load_jump_saver
		#set_deferred("scroll_vertical",saver.scroll)
		#if mode_==0:
			#for i in range(1,9):
				#var node_2=get_child(0).get_child(2*i-1)
				#var node_=get_child(0).get_child(2*i)
				#node_.visible=saver.bool_array[i-1]
				#node_2.button_pressed=not saver.bool_array[i-1]
				#pass
		#if mode_!=0:
			#for i in range(1,6):
				#var node_2=get_child(0).get_child(2*i-1+17)
				#var node_=get_child(0).get_child(2*i+17)
				#node_.visible=saver.bool_array[i-1]
				#node_2.button_pressed=not saver.bool_array[i-1]
				#pass
	#
		#
		#
	#pass
#func _exit_tree() -> void:
	##Get.going_to_load_jump_saver=jump_saver.new()
	#print(10000)
	#var n=jump_saver.new()
	#n.index=ScreenJumper.list.size()-1
	#n.scroll=scroll_vertical
	#if mode_ == 0:
		#for i in range(1,9):
		#
			#var node_=get_child(0).get_child(i*2)
			#n.bool_array.append(node_.visible)
	#if mode_!=0:
		#for i in range(1,6):
		#
			#var node_=get_child(0).get_child(2*i+17)
			#n.bool_array.append(node_.visible)
	#Get.jump_saver_list.set(ScreenJumper.list.size()-2,n)

func _on_button_button_down() -> void:
	$"VBoxContainer/lobotomy7/TabContainer/异想体录像/Button".hide()
	if Get.is_load_gif and a.gif!="null":
				Loading.load_to(Get.gif_list.get(a.gif))
				await Loading.load_over
				gif=Get.going_to_gif
				print(gif.array.size())
				if gif.array.size()!=0 :
					
					for i in gif.array.size():
						var g = preload("res://screen/gif.tscn").instantiate()
						g.gif=gif.array[i]
						$"VBoxContainer/lobotomy7/TabContainer/异想体录像/ScrollContainer/HBoxContainer".add_child(g)
					$"VBoxContainer/lobotomy7/TabContainer/异想体录像/ScrollContainer/HBoxContainer".add_child(Control.new())
				else :
					$"VBoxContainer/lobotomy7/TabContainer/异想体录像/Button".show()
					$"VBoxContainer/lobotomy7/TabContainer/异想体录像/Label".show()
	else :
		$"VBoxContainer/lobotomy7/TabContainer/异想体录像/Label".show()

func lobotomyA_show():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomyA"):
			i.show()
		
		pass
func lobotomyA_hide():
	for i in $VBoxContainer.get_children():
		if i.is_in_group("lobotomyA"):
			i.hide()
		pass
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


func _on_button1_button_down() -> void:
	$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/button".hide()
	if mode_==1:
		if Get.is_load_gif and s.gif!="null":
				load_gif(s)
		else:
			$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/Label".show()
	if mode_==2:
		if Get.is_load_gif and w.gif!="null":
				load_gif(w)
		else:
			$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/Label".show()
	pass # Replace with function body.
func  load_gif(mode):
				Loading.load_to(Get.gif_list.get(mode.gif))
				await Loading.load_over
				
				gif=Get.going_to_gif
				print(gif.array.size())
				if gif.array.size()!=0 :
					
					for i in gif.array.size():
						var g = preload("res://screen/gif.tscn").instantiate()
						g.gif=gif.array[i]
						$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/ScrollContainer/HBoxContainer".add_child(g)
					$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/ScrollContainer/HBoxContainer".add_child(Control.new())
				else :
					$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/button".show()
					$"VBoxContainer/lobotomy_ego2/TabContainer/EGO图册/Label".show()


func _on_rich_text_label_2_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	
	$"VBoxContainer/lobotomy7/TabContainer/异想体图册/Button2".hide()
	if a.texture_array!=[]:
		for i in a.texture_array:
			var t =TextureRect.new()
			t.custom_minimum_size=Vector2(150,150)
			t.expand_mode=1
			t.stretch_mode=5
			t.texture=i
			$"VBoxContainer/lobotomy7/TabContainer/异想体图册/ScrollContainer/HBoxContainer".add_child(t)
		pass
	else :
		$"VBoxContainer/lobotomy7/TabContainer/异想体图册/Label".show()
	pass # Replace with function body.
