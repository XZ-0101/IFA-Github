extends CanvasLayer
@export var a:Array
@export var mode_:String
var type_array:Array
var ar=[]
func ss(a_:Array,mode:String,what:String):
	exit()
	if mode=="music":
		for i in a_:
			if i.name_.containsn(what):
				ar.append(i)
		var n=preload("res://screen/a_music_button.tscn")
		for i in ar:
			var n_=n.instantiate()
			n_.music=i
			$ScrollContainer/VBoxContainer.add_child(n_)
	elif mode=="lobotomyA":
		for i in a_:
			if i.name_.containsn(what):
				ar.append(i)
		if what=="小张" and Get.fun_mode:
			ar.append(load("res://res/fun/me-j.tres"))
		var n=preload("res://screen/jumper_button.tscn")
		for i in ar:
			var n_=n.instantiate()
			n_.jumper=i
			$ScrollContainer/VBoxContainer.add_child(n_)
	
	elif mode=="lobotomyAS":
		for i in a_:
			if i.s.containsn(what):
				ar.append(i)
		var n=preload("res://screen/jumper_button.tscn")
		for i in ar:
			var n_=n.instantiate()
			n_.jumper=i
			$ScrollContainer/VBoxContainer.add_child(n_)
	if ar ==[] and mode !="type":
		OS.alert("没有找到啊（；´д｀）ゞ","警告")
	elif mode=="type":
		
		var l = preload("res://screen/type_label.tscn").instantiate()
		l.get_child(0).name_=what
		$type/HBoxContainer.add_child(l)
		
		
		
func _on_line_edit_text_submitted(new_text: String) -> void:
	
	ss(a,mode_,new_text)

	pass # Replace with function body.

func exit():
	var b =$ScrollContainer/VBoxContainer.get_children()
	if b:
		for i in b:
			i.queue_free()
	ar=[]
	
func _on_button_button_down() -> void:
	exit()
	hide()
	pass # Replace with function body.
func _process(delta: float) -> void:
	if mode_=="type":
		$Button2.show()
		$type.show()
	else :
		$type.hide()
		$Button2.hide()
	pass
			
func has_common_elements_any(array_a: Array, array_b: Array) -> bool:
	return array_a.all(func(element): return element in array_b)#ok


func _on_button_2_button_down() -> void:
	exit()
	type_array=[]
	if $type/HBoxContainer.get_children():
		for i in $type/HBoxContainer.get_children():
			type_array.append(i.get_child(0).name_)
		
	for i in a:
		if has_common_elements_any(type_array,i.type):
			ar.append(i)
		
	var n=preload("res://screen/jumper_button.tscn")
	for i in ar:
		var n_=n.instantiate()
		n_.jumper=i
		$ScrollContainer/VBoxContainer.add_child(n_)
	if ar ==[]:
		OS.alert("没有找到啊（；´д｀）ゞ","警告")
