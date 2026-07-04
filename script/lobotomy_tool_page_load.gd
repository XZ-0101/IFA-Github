extends ScrollContainer
@export var a:lobotomy_tool
@export var gif:gif_array
func load_tool():
	$VBoxContainer/basic/icon.texture=a.icon
	if a.level=="z":
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
		$VBoxContainer/basic/RichTextLabel.text="[b][color=puple]WAW[/color][/b]"
	if a.level=="a":
		$VBoxContainer/basic/TextureRect.texture=load("res://img/Risk_Aleph.webp")
		$VBoxContainer/basic/RichTextLabel.text="[b][color=red]ALEPH[/color][/b]"
	if a.level=="?":
		$VBoxContainer/basic/TextureRect.texture=load("res://img2/UI/undef_risk.tres")
		$VBoxContainer/basic/RichTextLabel.text="[b][color=white]UNDEF.[/color][/b]"
			
	$VBoxContainer/basic/RichTextLabel3.text=a.name_
	$VBoxContainer/basic/RichTextLabel_.text=a.info_
	$VBoxContainer/basic/Label.text=a.subject
	$VBoxContainer/basic/RichTextLabel4.text=a.tool_type
	var p=a.Precautions
	var l=a.Research_logs
	var n =preload("res://screen/glxz.tscn")
	var c = Control
	for i in l:
		var n_=n.instantiate()
		n_.mode=2
		n_.text=i
		$VBoxContainer/lobotomy2/ScrollContainer/VBoxContainer.add_child(n_)
	
	$VBoxContainer/lobotomy2/ScrollContainer/VBoxContainer.add_child(c.new())
	for i in p:
		var n_=n.instantiate()
		n_.mode=3
		n_.text2=i
		$VBoxContainer/lobotomy2/ScrollContainer2/VBoxContainer.add_child(n_)
	
	
	$VBoxContainer/lobotomy2/ScrollContainer2/VBoxContainer.add_child(c.new())
	
	$VBoxContainer/lobotomy3/TabContainer/工具介绍/RichTextLabel.text=a.tool_info
	$VBoxContainer/lobotomy3/TabContainer/工具解析/RichTextLabel.text=a.tool_e
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
	
	
#func _ready() -> void:
	#Get.going_to_load_jump_saver=Get.jump_saver_list.back()
	#Get.is_going_to_load_jump_saver=true
	#if Get.is_going_to_load_jump_saver:
		#print("jump_saver")
		#var saver=Get.going_to_load_jump_saver
		#set_deferred("scroll_vertical",saver.scroll)
		#
		#for i in range(1,4):
			#var node_2=get_child(0).get_child(2*i-1)
			#var node_=get_child(0).get_child(2*i)
			#node_.visible=saver.bool_array[i-1]
			#node_2.button_pressed=not saver.bool_array[i-1]
			#pass
	#
		#
		#
	#pass
#func _exit_tree() -> void:
	#
	#
	#print(10000)
	#var n=jump_saver.new()
	#n.index=ScreenJumper.list.size()-1
	#n.scroll=scroll_vertical
	#for i in range(1,4):
		#
		#var node_=get_child(0).get_child(2*i)
		#n.bool_array.append(node_.visible)
	#
	#Get.jump_saver_list.set(ScreenJumper.index__,n)

func _on_button_button_down() -> void:
	$"VBoxContainer/lobotomy3/TabContainer/异想体图册/Button".hide()
	if a.texture_array!=[]:
		for i in a.texture_array:
			var t =TextureRect.new()
			t.custom_minimum_size=Vector2(150,150)
			t.expand_mode=1
			t.stretch_mode=5
			t.texture=i
			$"VBoxContainer/lobotomy3/TabContainer/异想体图册/ScrollContainer/HBoxContainer".add_child(t)
		pass
	else :
		$"VBoxContainer/lobotomy3/TabContainer/异想体图册/Label".show()


func _on_rich_text_label_2_meta_clicked(meta: Variant) -> void:
	print(1)
	OS.shell_open(str(meta))
	
	pass # Replace with function body.


func _on_rich_text_label__meta_clicked(meta: Variant) -> void:
	print(1)
	OS.shell_open(str(meta))
	pass # Replace with function body.




func _on_l_2_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/lobotomy2.visible= not toggled_on
	pass # Replace with function body.


func _on_l_3_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/lobotomy3.visible= not toggled_on
	pass # Replace with function body.


func _on_jump_b_toggled(toggled_on: bool) -> void:
	$VBoxContainer/JUMP.visible= not toggled_on
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	$"VBoxContainer/lobotomy3/TabContainer/异想体录像/Button2".hide()
	if Get.is_load_gif and a.gif!="null":
				Loading.load_to(Get.gif_list.get(a.gif))
				await Loading.load_over
				gif=Get.going_to_gif
				print(gif.array.size())
				if gif.array.size()!=0 :
					
					for i in gif.array.size():
						var g = preload("res://screen/gif.tscn").instantiate()
						g.gif=gif.array[i]
						$"VBoxContainer/lobotomy3/TabContainer/异想体录像/ScrollContainer/HBoxContainer".add_child(g)
					$"VBoxContainer/lobotomy3/TabContainer/异想体录像/ScrollContainer/HBoxContainer".add_child(Control.new())
				else :
					$"VBoxContainer/lobotomy3/TabContainer/异想体录像/Button2".show()
					$"VBoxContainer/lobotomy3/TabContainer/异想体录像/Label".show()
	else :
		$"VBoxContainer/lobotomy3/TabContainer/异想体录像/Label".show()
	pass # Replace with function body.
