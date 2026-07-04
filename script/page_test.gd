extends Control


func _on_button_2_button_down() -> void:
	var a= load("res://screen/setting.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.


func _on_button_button_down() -> void:
	
	Loading.load_to("res://screen/music_page_test.tscn",1)
	await Loading.load_over
	Get.jumped_list.append(Get.going_to_load_screen)
	get_tree().change_scene_to_packed(Get.going_to_load_screen)
	pass # Replace with function body.
	
func _ready() -> void:
	pass
	#Get.jump_saver_list.clear()


func _on_button_3_button_down() -> void:
	var a= load("res://screen/about.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.


func _on_button_4_button_down() -> void:
	
	Loading.load_to("res://screen/lcaa_page.tscn",1)
	await Loading.load_over
	Get.jumped_list.append(Get.going_to_load_screen)
	get_tree().change_scene_to_packed(Get.going_to_load_screen)
	pass # Replace with function body.


func _on_button_5_button_down() -> void:
	var a= load("res://screen/DIY.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.


func _on_button_6_button_down() -> void:
	var a= load("res://screen/指令.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	
	pass # Replace with function body.


func _on_button_7_button_down() -> void:
	var a= load("res://screen/考验.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on :
		$Control2/CheckBox/AnimationPlayer.play("new_animation")
		$Control2/CheckBox/AnimationPlayer2.play("new_animation")
	else:
		$Control2/CheckBox/AnimationPlayer.play_backwards("new_animation")
		$Control2/CheckBox/AnimationPlayer2.play_backwards("new_animation")
		
	pass # Replace with function body.


func _on_button_8_button_down() -> void:
	Loading.load_to("res://screen/收藏夹.tscn",1)
	await Loading.load_over
	Get.jumped_list.append(Get.going_to_load_screen)
	get_tree().change_scene_to_packed(Get.going_to_load_screen)
	pass # Replace with function body.


func _on_button_9_button_down() -> void:
	var a= load("res://screen/mod.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.


func _on_button_10_button_down() -> void:
	var a= load("res://screen/gacha.tscn")
	Get.jumped_list.append(a)
	get_tree().change_scene_to_packed(a)
	pass # Replace with function body.


func _on_button_11_button_down() -> void:
	Loading.load_to("res://little_game/enter.tscn",1)
	await Loading.load_over
	Get.jumped_list.append(Get.going_to_load_screen)
	get_tree().change_scene_to_packed(Get.going_to_load_screen)
	pass # Replace with function body.


func _on_exit_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.




func _on_button_thanks_button_down() -> void:
	Loading.load_to("res://screen/thanks.tscn",1)
	await Loading.load_over
	Get.jumped_list.append(Get.going_to_load_screen)
	get_tree().change_scene_to_packed(Get.going_to_load_screen)
	pass # Replace with function body.
