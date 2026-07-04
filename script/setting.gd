extends Control


func _on_option_button_item_selected(index: int) -> void:
	Get.mouse_index=index
	if index==0:
		
		Input.set_custom_mouse_cursor(load("res://img/3F3F-3F.webp"),Input.CURSOR_POINTING_HAND)
		Input.set_custom_mouse_cursor(load("res://img/3F3F.webp"),Input.CURSOR_ARROW)
	if index==1:
		Input.set_custom_mouse_cursor(load("res://img/MouseA.webp"),Input.CURSOR_POINTING_HAND)
		Input.set_custom_mouse_cursor(load("res://img/Mouse.webp"),Input.CURSOR_ARROW)
	if index==2:
		Input.set_custom_mouse_cursor(load("res://img/鼠标指针ON.png"),Input.CURSOR_POINTING_HAND)
		Input.set_custom_mouse_cursor(load("res://img/鼠标指针.png"),Input.CURSOR_ARROW)
	pass # Replace with function body.


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(0,true)
		
	else :
		
		AudioServer.set_bus_mute(0,false)
	pass # Replace with function body.

func _process(delta: float) -> void:
	if AudioServer.is_bus_mute(0):
		$system/CheckBox.button_pressed=true
		AudioServer.set_bus_mute(0,true)
	else :
		$system/CheckBox.button_pressed=false
		AudioServer.set_bus_mute(0,false)
	
	$diy/OptionButton.select(Get.mouse_index)
	$system/OptionButton2.disabled=Get.is_changed_theme


func _on_check_box_2_toggled(toggled_on: bool) -> void:
	Get.h2d=toggled_on
	pass # Replace with function body.


func _on_option_button_2_item_selected(index: int) -> void:
	var t=theme
	if index==0:
		Get.f_index=0
		t.default_font=load("res://res/Font/n.tres")
		Get.f_path="res://res/Font/n.tres"
	if index==1:
		Get.f_index=1
		t.default_font=load("res://res/Font/lor.tres")
		Get.f_path="res://res/Font/lor.tres"
	if index==2:
		Get.f_index=2
		t.default_font=load("res://res/Font/lc.tres")
		Get.f_path="res://res/Font/lc.tres"
	pass # Replace with function body.
func _ready() -> void:
	$system/OptionButton2.selected=Get.f_index
	$system/CheckBox2.button_pressed=Get.h2d
	$diy/CheckBox3.button_pressed=Get.fun_mode
	if DirAccess.dir_exists_absolute(Get.our_dir.path_join("Theme_pack")):
		$diy/load_button/FileDialog.root_subfolder=Get.our_dir.path_join("Theme_pack")


func _on_check_box_3_toggled(toggled_on: bool) -> void:
	Get.fun_mode=toggled_on
	pass # Replace with function body.


func _on_button_button_down() -> void:
	if not FileAccess.file_exists("user://loading.txt"):
		FileAccess.open("user://loading.txt",FileAccess.WRITE)
	
	OS.shell_open(ProjectSettings.globalize_path("user://loading.txt"))
	
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	if not FileAccess.file_exists("user://zl.txt"):
		FileAccess.open("user://zl.txt",FileAccess.WRITE)
	
	OS.shell_open(ProjectSettings.globalize_path("user://zl.txt"))
	pass # Replace with function body.


func _on_back_button_down() -> void:
	Get.now_theme.merge_with(load("res://res/theme_base.tres"))
	Get.is_changed_theme=false
	pass # Replace with function body.


func _on_load_button_button_down() -> void:
	$diy/load_button/FileDialog.popup()
	pass # Replace with function body.


func _on_file_dialog_file_selected(path: String) -> void:
	Get.now_theme.merge_with(load(path))
	Get.is_changed_theme=true
	pass # Replace with function body.
