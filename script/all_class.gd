extends ScrollContainer
@export var a:basic_class
@export var gif:gif_array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_basic_class():
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
	$VBoxContainer/basic/RichTextLabel2.text="[url=show]全屏[/url]\n"+a.info_
	
	$VBoxContainer/lobotomy2/TabContainer/介绍/RichTextLabel.text="[url=show]全屏[/url]\n"+a.d_text
	$VBoxContainer/basic/Label.text=a.subject
	load_jump_array(a.lca_jump,$"VBoxContainer/JUMP/TabContainer/脑叶")
	load_jump_array(a.lor_jump,$"VBoxContainer/JUMP/TabContainer/图书馆/ScrollContainer/HBoxContainer")
	load_jump_array(a.lcb_jump,$"VBoxContainer/JUMP/TabContainer/边狱/ScrollContainer/HBoxContainer")
	load_jump_array(a.ego_jump,$VBoxContainer/JUMP3/TabContainer/EGO/ScrollContainer/HBoxContainer)
	load_jump_array(a.child_jump,$"VBoxContainer/JUMP3/TabContainer/次级衍生单位/ScrollContainer/HBoxContainer")
	load_jump_array(a.q_jump,$"VBoxContainer/JUMP3/TabContainer/事件/ScrollContainer/HBoxContainer")
	
	load_jump_array(a.jump,$VBoxContainer/JUMP2/TabContainer/相关/ScrollContainer/HBoxContainer)
	
	for i in a.jumper.type:
		var b=preload("res://screen/type_jump_button.tscn").instantiate()
		b.text=i
		$VBoxContainer/JUMP2/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
	var c__ = Control.new()
	$VBoxContainer/JUMP2/TabContainer/相关/ScrollContainer/HBoxContainer.add_child(c__)
	
func _on_l_2_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/lobotomy2.visible=not toggled_on
	pass # Replace with function body.


func _on_ljb_toggled(toggled_on: bool) -> void:
	$VBoxContainer/JUMP.visible= not toggled_on
	pass # Replace with function body.


func _on_ljb_2_toggled(toggled_on: bool) -> void:
	$VBoxContainer/JUMP2.visible= not toggled_on
	pass # Replace with function body.


func _on_ljb_3_toggled(toggled_on: bool) -> void:
	$VBoxContainer/JUMP3.visible= not toggled_on
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

func load_jump_array(jump,body):
	var c_ = Control.new()
	for i in jump:
		var j
		if not i.begins_with("p"):
			j=load(Get.jumper_list.get(i))
		else :
			j=load(i.erase(0,1))
		var b=preload("res://screen/jumper_button.tscn").instantiate()
		b.jumper=j
		body.add_child(b)
	body.add_child(c_)
	
