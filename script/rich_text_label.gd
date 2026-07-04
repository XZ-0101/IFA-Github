extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#一般用[hint]代替，非一般情况用这个
func _on_meta_clicked(meta: Variant) -> void:
	var meta_=str(meta)
	
	if meta_.begins_with("j"):
		var p=meta_.erase(0)
		Get.jumped_list.append(load(p))
		Get.jump_to(load(p))
		pass
	elif meta_.begins_with("a"):
		var p=meta_.erase(0).split("&s")[1]
		Get.jumped_list.append(load(p))
		Get.jump_to(load(p))
		TextLayer.hide_panel()
		pass
	elif meta_.begins_with("t") :
		if OS.get_name()=="Android":
			if not TextLayer.is_open:
				TextLayer.is_up=true
				TextLayer.is_start_timer=true
				TextLayer.show_panel(meta_.erase(0))
			else :
				TextLayer.hide_panel()
	elif meta_.begins_with("n") :
		if OS.get_name()=="Android":
			if not TextLayer.is_open:
				TextLayer.is_start_timer=true
				TextLayer.is_up=true
				var t =Get.text_dic.get(meta_.erase(0))
				TextLayer.show_panel(t)
			else :
				TextLayer.hide_panel()
	else :
		OS.shell_open(meta_)
	pass # Replace with function body.





func _on_meta_hover_started(meta: Variant) -> void:
	var meta_=str(meta)
	if meta_.begins_with("t") :
		if not TextLayer.is_open:
			TextLayer.is_up=false
			TextLayer.show_panel(meta_.erase(0))
	if meta_.begins_with("a"):
		if not TextLayer.is_open:
			TextLayer.is_up=true
			TextLayer.show_panel(meta_.erase(0).split("&s")[0],self.global_position)
	if meta_.begins_with("n") :
		if not TextLayer.is_open:
			TextLayer.is_up=false
			var t =Get.text_dic.get(meta_.erase(0))
			TextLayer.show_panel(t)
		pass
	pass # Replace with function body.


func _on_meta_hover_ended(meta: Variant) -> void:
	TextLayer.hide_panel()
	pass # Replace with function body.
