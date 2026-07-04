extends ScrollContainer

@export var a:Unreleased
@export var gif:gif_array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.
func load_Unreleased():
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
	$VBoxContainer/basic/RichTextLabel4.text=a.现状
	$VBoxContainer/lobotomy2/TabContainer/解析/RichTextLabel.text=a.介绍
	$VBoxContainer/basic/Label.text=a.subject
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
func _on_jump_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/JUMP.visible= not toggled_on
	pass # Replace with function body.


func _on_l_2_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/lobotomy2.visible= not toggled_on
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	$"VBoxContainer/lobotomy2/TabContainer/图册/Button2".hide()
	if a.texture_array!=[]:
		for i in a.texture_array:
			var t =TextureRect.new()
			t.custom_minimum_size=Vector2(300,300)
			t.expand_mode=1
			t.stretch_mode=5
			t.texture=i
			$"VBoxContainer/lobotomy2/TabContainer/图册/ScrollContainer/HBoxContainer".add_child(t)
		pass
	else :
		$"VBoxContainer/lobotomy2/TabContainer/图册/Label".show()
	pass # Replace with function body.


func _on_button_button_down() -> void:
	$"VBoxContainer/lobotomy2/TabContainer/录像/Button".hide()
	if Get.is_load_gif and a.gif!="null":
				Loading.load_to(Get.gif_list.get(a.gif))
				await Loading.load_over
				gif=Get.going_to_gif
				print(gif.array.size())
				if gif.array.size()!=0 :
					
					for i in gif.array.size():
						var g = preload("res://screen/gif.tscn").instantiate()
						g.gif=gif.array[i]
						$"VBoxContainer/lobotomy2/TabContainer/录像/ScrollContainer/HBoxContainer".add_child(g)
					$"VBoxContainer/lobotomy2/TabContainer/录像/ScrollContainer/HBoxContainer".add_child(Control.new())
				else :
					$"VBoxContainer/lobotomy2/TabContainer/录像/Button2".show()
					$"VBoxContainer/lobotomy2/TabContainer/录像/Label".show()
	else :
		$"VBoxContainer/lobotomy2/TabContainer/录像/Label".show()
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
	if x == 11.4514:
		
		return "未知"
func f_to_string(x:float):
	if x != 11.4514:
		
		return str(x)
	else :
		return "?"
