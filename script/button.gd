extends Button

func  _ready() -> void:
	
	if  not Get.asked_Permission:
		if OS.get_name()=="Android":
			if OS.request_permissions():
				
				Get.asked_Permission=true
			else :
				OS.alert("无权限，部分功能不可用")
	if FileAccess.file_exists("user://scj.tres") and ( Get.is_lg_version==false):
	
		Get.收藏夹=load("user://scj.tres").array
		
	if Get.mouse_index==0:
		Input.set_custom_mouse_cursor(load("res://img/3F3F-3F.webp"),Input.CURSOR_POINTING_HAND)
		Input.set_custom_mouse_cursor(load("res://img/3F3F.webp"),Input.CURSOR_ARROW)
	pass
	if Get.is_lg_version==false:
		Get.a_fun_list=[load("res://res_pack/O-05-47/img/DontTouchMe.webp"),
load("res://img/I-1513167768.webp"),
load("res://img/Magic3.webp"),
load("res://img/lc-a/o-00-00/3F-0.webp"),
load("res://img/lc-a/o-03-03/I.webp"),
load("res://img2/LCA/O-01-12/I-0.webp"),
load("res://img2/LCA/O-04-08/I-1513156783.webp"),
load("res://img2/LCA/T-04-06/I-1513169944.webp"),
load("res://res_pack/o-01-15/img/I-1513176183.webp"),
load("res://res_pack/f-05-32/img/I-1513171428.webp"),
load("res://res_pack/O-05-47/img/DontTouchMe.webp")

]
func _on_button_down() -> void:
	
	var a = load("res://screen/page_test.tscn")
	Get.jumped_list.append(a)
	Get.jump_saver_list.append(jump_saver.new())
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.
