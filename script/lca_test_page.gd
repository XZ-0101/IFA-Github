extends ScrollContainer

@export var a:test
@export var gif:gif_array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.
func load_test():
	$VBoxContainer/basic/RichTextLabel3.text=a.name_
	if a.level=="z":
		$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Zayin.webp")
		
	if a.level=="t":
		$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Teth.webp")
		
	if a.level=="h":
		$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_He.webp")
		
	if a.level=="w":
		$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Waw.webp")
		
	if a.level=="a":
		$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Aleph.webp")
	if a.level=="?":
		$VBoxContainer/basic/TextureRect.texture=load("res://img2/UI/undef_risk.tres")
	$VBoxContainer/basic/icon.texture=a.icon
	$VBoxContainer/basic/RichTextLabel_.text=a.info_
	$VBoxContainer/basic/RichTextLabel4.text=a.ob_name
	$VBoxContainer/basic/Label.text=a.color+"的"+a.time+"  "+a.name_
	if a.time=="黎明" or a.time=="午夜":
		$VBoxContainer/basic/icon2.texture=load("res://img2/UI/time1.tres")
	if a.time=="正午" :
		$VBoxContainer/basic/icon2.texture=load("res://img2/UI/time2.tres")
	if a.time=="黄昏" :
		$VBoxContainer/basic/icon2.texture=load("res://img2/UI/time3.tres")
	if a.color=="绿色":
		$VBoxContainer/basic/Label.modulate=Color(0.235, 0.702, 0.443, 1.0)
		$VBoxContainer/basic/icon2.modulate=Color(0.235, 0.702, 0.443, 1.0)
	if a.color=="琥珀色":
		$VBoxContainer/basic/Label.modulate=Color(0.859, 0.561, 0.008, 1.0)
		$VBoxContainer/basic/icon2.modulate=Color(0.859, 0.561, 0.008, 1.0)
	if a.color=="紫罗兰":
		$VBoxContainer/basic/Label.modulate=Color(0.604, 0.196, 0.804, 1.0)
		$VBoxContainer/basic/icon2.modulate=Color(0.604, 0.196, 0.804, 1.0)
	if a.color=="靛蓝色":
		$VBoxContainer/basic/Label.modulate=Color(0.227, 0.373, 0.804, 1.0)
		$VBoxContainer/basic/icon2.modulate=Color(0.227, 0.373, 0.804, 1.0)
	if a.color=="靛蓝色":
		$VBoxContainer/basic/Label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		$VBoxContainer/basic/icon2.modulate=Color(1.0, 1.0, 1.0, 1.0)
	if a.color=="惨白":
		$VBoxContainer/basic/Label.modulate=Color(0.863, 0.078, 0.235, 1.0)
		$VBoxContainer/basic/icon2.modulate=Color(0.863, 0.078, 0.235, 1.0)
	$VBoxContainer/basic/RichTextLabel4.text=a.ob_name
	$VBoxContainer/lobotomy2/TabContainer/考验介绍/RichTextLabel.text=a.other_info
	$VBoxContainer/lobotomy2/TabContainer/考验解析/RichTextLabel.text=a.other_info_act
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel.text="[img,size=30]res://img/RedDamageTypeIcon.webp[color=#cd2744]("+f_to_string(a.red_def)+")"+d_to_string(a.red_def)
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel2.text="[img,size=30]res://img/WhiteDamageTypeIcon.webp[color=#f0ebbf]("+f_to_string(a.white_def)+")"+d_to_string(a.white_def)
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel3.text="[img,size=30]res://img/BlackDamageTypeIcon.webp[color=#824b84]("+f_to_string(a.black_def)+")"+d_to_string(a.black_def)
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect6/DEF/RichTextLabel4.text="[img,size=30]res://img/PaleDamageTypeIcon.webp[color=3fcdbd]("+f_to_string(a.pale_def)+")"+d_to_string(a.pale_def)
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect8/SPEED.text=a.speed
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect7/COUNT.text=a.count
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect5/PLACE.text=a.place
	$VBoxContainer/lobotomy3/NinePatchRect5/NinePatchRect9/HP.text=str(a.health)
	for i in a.jump:
		var j
		if not i.begins_with("p"):
			j=load(Get.jumper_list.get(i))
		else :
			j=load(i.erase(0,1))
		var b=preload("res://screen/jumper_button.tscn").instantiate()
		b.jumper=j
		$VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(b)
	var c_ = Control.new()
	$VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c_)
	for i in a.jumper.type:
		var b=preload("res://screen/type_jump_button.tscn").instantiate()
		b.text=i
		$VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
	var c__ = Control.new()
	$VBoxContainer/JUMP/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c__)
	



func _on_rich_text_label__meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
	pass # Replace with function body.


func _on_jump_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/JUMP.visible= not toggled_on
	pass # Replace with function body.


func _on_l_2_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/lobotomy2.visible= not toggled_on
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	$"VBoxContainer/lobotomy2/TabContainer/考验图册/Button2".hide()
	if a.texture_array!=[]:
		for i in a.texture_array:
			var t =TextureRect.new()
			t.custom_minimum_size=Vector2(300,300)
			t.expand_mode=1
			t.stretch_mode=5
			t.texture=i
			$"VBoxContainer/lobotomy2/TabContainer/考验图册/ScrollContainer/HBoxContainer".add_child(t)
		pass
	else :
		$"VBoxContainer/lobotomy2/TabContainer/考验图册/Label".show()
	pass # Replace with function body.


func _on_button_button_down() -> void:
	$"VBoxContainer/lobotomy2/TabContainer/考验录像/Button".hide()
	if Get.is_load_gif and a.gif!="null":
				Loading.load_to(Get.gif_list.get(a.gif))
				await Loading.load_over
				gif=Get.going_to_gif
				print(gif.array.size())
				if gif.array.size()!=0 :
					
					for i in gif.array.size():
						var g = preload("res://screen/gif.tscn").instantiate()
						g.gif=gif.array[i]
						$"VBoxContainer/lobotomy2/TabContainer/考验录像/ScrollContainer/HBoxContainer".add_child(g)
					$"VBoxContainer/lobotomy2/TabContainer/考验录像/ScrollContainer/HBoxContainer".add_child(Control.new())
				else :
					$"VBoxContainer/lobotomy2/TabContainer/考验录像/Button2".show()
					$"VBoxContainer/lobotomy2/TabContainer/考验录像/Label".show()
	else :
		$"VBoxContainer/lobotomy2/TabContainer/考验录像/Label".show()
	pass # Replace with function body.
	pass # Replace with function body.


func _on_l_3b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/lobotomy3.visible= not toggled_on
	pass # Replace with function body.
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
	if x == 11.4514:
		
		return "未知"
func f_to_string(x:float):
	if x != 11.4514:
		
		return str(x)
	else :
		return "?"
