extends Control
@export var Documentation:Documentation_class

func _ready() -> void:
	load_Documentation()
	$Window/Panel/nr.text ="[center][font_size=40]"+Documentation.name_+"[/font_size][/center]\n[font_size=35][center]"+Documentation.by+"[/center][/font_size]\n"+$NinePatchRect3/nr.text
	pass


func load_Documentation():
	$NinePatchRect/VBoxContainer/by.text=Documentation.by
	$NinePatchRect/icon.texture=Documentation.icon
	$NinePatchRect3/nr.text=Documentation.str_
	$NinePatchRect/VBoxContainer/name.text=Documentation.name_
	pass


func _on_nr_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
	pass # Replace with function body.


func _on_button_button_down() -> void:
	$Window.hide()
	pass # Replace with function body.


func _on_butto_button_down() -> void:
	$Window.popup()
	pass # Replace with function body.
