extends Button

func  _ready() -> void:
	
	if  not Get.asked_Permission:
		if OS.get_name()=="Android":
			if OS.request_permissions():
				
				Get.asked_Permission=true
			else :
				OS.alert("无权限，部分功能不可用")
	if FileAccess.file_exists("user://scj.tres"):
		Get.收藏夹=load("user://scj.tres").array
		
	if Get.mouse_index==0:
		Input.set_custom_mouse_cursor(load("res://img/3F3F-3F.webp"),Input.CURSOR_POINTING_HAND)
		Input.set_custom_mouse_cursor(load("res://img/3F3F.webp"),Input.CURSOR_ARROW)
	pass
func _on_button_down() -> void:
	
	var a = load("res://screen/page_test.tscn")
	Get.jumped_list.append(a)
	Get.jump_saver_list.append(jump_saver.new())
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.
