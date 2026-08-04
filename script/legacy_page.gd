extends ScrollContainer
@export var a:legacy
@export var gif:gif_array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func load_legacy():
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
	$VBoxContainer/lobotomy/NinePatchRect3/TYPE.text=a.Attack_Type.format({"0":"[color=red]物理[/color]","1":"[color=white]精神[/color]","2":"[color=purple]侵蚀[/color]","3":"[color=cyan]灵魂[/color]"})
	$"VBoxContainer/lobotomy/NinePatchRect7/恐惧等级".text="Lv."+str(a.a_lv)
	$"VBoxContainer/lobotomy/NinePatchRect6/异想体类型".text=a.type
	var inf=a.心情.split('\n')
	var line1=inf[0].split(',')
	var line2=inf[1].split(',')
	var line3=inf[2].split(',')
	$"VBoxContainer/lobotomy/NinePatchRect4/心情".text='''
[center]
[table=5]
[cell border=#ffffa1]心情[/cell][cell border=#ffffa1]最大[/cell][cell border=#ffffa1]优[/cell][cell border=#ffffa1]良[/cell][cell border=#ffffa1]差[/cell]
[cell border=#ffffa1]心情值对应区间[/cell][cell border=#ffffa1]{x0}[/cell][cell border=#ffffa1]{x1}[/cell][cell border=#ffffa1]{x2}[/cell][cell border=#ffffa1]{x3}[/cell]
[cell border=#ffffa1]产能效率[/cell][cell border=#ffffa1]{x4}[/cell][cell border=#ffffa1]{x5}[/cell][cell border=#ffffa1]{x6}[/cell][cell border=#ffffa1]{x7}[/cell]
[cell border=#ffffa1]伤害类型[/cell][cell border=#ffffa1]{x8}[/cell][cell border=#ffffa1]{x9}[/cell][cell border=#ffffa1]{x10}[/cell][cell border=#ffffa1]{x11}[/cell]
[/table]
[/center]
'''.format({"x0":line1[0],"x1":line1[1],"x2":line1[2],"x3":line1[3],"x4":line2[0],"x5":line2[1],"x6":line2[2],"x7":line2[3],"x8":line3[0],"x9":line3[1],"x10":line3[2],"x11":line3[3]})

	$"VBoxContainer/lobotomy2/NinePatchRect4/偏好".text=a.喜好.format({"暴力":"[img,size=50]res://img2/LEGACY/3F.webp[color=red]暴力[/color]","喂食":"[img,size=50]res://img2/LEGACY/3F1.webp[color=orange]喂食[/color]","清洁":"[img,size=50]res://img2/LEGACY/3F2.webp[color=green]清洁[/color]","沟通":"[img,size=50]res://img2/LEGACY/3F3.webp[color=cyan]沟通[/color]","娱乐":"[img,size=40]res://img2/LEGACY/3F4.webp[color=pink]娱乐[/color]"})
	var o_text='''[center]
[table=8]
[cell border=#ffffa1]工作成功率加成[/cell][cell border=#ffffa1]心情减少速度减缓[/cell][cell border=#ffffa1]一天开始时异想体的初始心情[/cell][cell border=#ffffa1]图鉴解锁[/cell][cell border=#ffffa1]背景故事解锁[/cell][cell border=#ffffa1]工作偏好解锁[/cell][cell border=#ffffa1]能源产量信息[/cell][cell border=#ffffa1]杂项[/cell]
[cell border=#ffffa1]{x0}[/cell][cell border=#ffffa1]{x1}[/cell][cell border=#ffffa1]{x2}[/cell][cell border=#ffffa1]{x3}[/cell][cell border=#ffffa1]{x4}[/cell][cell border=#ffffa1]{x5}[/cell][cell border=#ffffa1]{x6}[/cell][cell border=#ffffa1]{x7}[/cell]
[/table]
[/center]'''
	var o1=a.o[0].split(",")
	var o2=a.o[1].split(",")
	var o3=a.o[2].split(",")
	var o4=a.o[3].split(",")
	var o5=a.o[4].split(",")
	$"VBoxContainer/lobotomy5/TabContainer/等级0/l0".text=o_text.format({"x0":o1[0],"x1":o1[1],"x2":o1[2],"x3":o1[3],"x4":o1[4],"x5":o1[5],"x6":o1[6],"x7":o1[7]})
	$"VBoxContainer/lobotomy5/TabContainer/等级1/l1".text=o_text.format({"x0":o2[0],"x1":o2[1],"x2":o2[2],"x3":o2[3],"x4":o2[4],"x5":o2[5],"x6":o2[6],"x7":o2[7]})
	$"VBoxContainer/lobotomy5/TabContainer/等级2/l2".text=o_text.format({"x0":o3[0],"x1":o3[1],"x2":o3[2],"x3":o3[3],"x4":o3[4],"x5":o3[5],"x6":o3[6],"x7":o3[7]})
	$"VBoxContainer/lobotomy5/TabContainer/等级3/l3".text=o_text.format({"x0":o4[0],"x1":o4[1],"x2":o4[2],"x3":o4[3],"x4":o4[4],"x5":o4[5],"x6":o4[6],"x7":o4[7]})
	$"VBoxContainer/lobotomy5/TabContainer/等级4/l4".text=o_text.format({"x0":o5[0],"x1":o5[1],"x2":o5[2],"x3":o5[3],"x4":o5[4],"x5":o5[5],"x6":o5[6],"x7":o5[7]})
	var tree=$VBoxContainer/lobotomy8/ScrollContainer
	tree.qt=a.最终观测
	tree.load_tree(tree.create_item(),tree.qt)
	var glxz= $VBoxContainer/lobotomy4/ScrollContainer/VBoxContainer
	
	for i in a.Upgrades.size():
		print(i)
		var glxz_item = preload("res://screen/glxz.tscn").instantiate()
				
		glxz_item.index=i+1
		glxz_item.text=a.Upgrades[i]
		glxz.add_child(glxz_item)
			
		glxz.add_child(Control.new())
			
	if not a.特质:
		$"VBoxContainer/lobotomy9/异想体特质/RichTextLabel".text="无"
	else:
		$"VBoxContainer/lobotomy9/异想体特质/RichTextLabel".text="[url=show]全屏[/url]\n"+"名字:"+a.特质.name_+"\n"+a.特质.详细
	$"VBoxContainer/lobotomy6/TabContainer/故事/RichTextLabel".text="[url=show]全屏[/url]\n"+a.story
	$"VBoxContainer/lobotomy7/TabContainer/异想体行为/RichTextLabel".text="[url=show]全屏[/url]\n"+a.other_info_act
	$"VBoxContainer/lobotomy7/TabContainer/异想体解析/RichTextLabel".text="[url=show]全屏[/url]\n"+a.other_info
	$"VBoxContainer/lobotomy6/TabContainer/工作日志/RichTextLabel".text="[url=show]全屏[/url]\n"
	for i in a.flavour_text.size():
		$"VBoxContainer/lobotomy6/TabContainer/工作日志/RichTextLabel".text+="○"+a.flavour_text[i]+"\n"
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
	for i in a.jumper.type:
				
				
		var b=preload("res://screen/type_jump_button.tscn").instantiate()
		b.text=i
		$VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(b)
		var c2 = Control.new()
		$VBoxContainer/JUMP/TabContainer/标签/ScrollContainer/HBoxContainer.add_child(c2)


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
