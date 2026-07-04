extends Button
@export var music:music_class

func  _ready() -> void:
	text= music.name_
	icon=music.texture


func _on_button_down() -> void:
	Get.jumped_list.append(music)
	Get.going_to_music=music
	get_tree().change_scene_to_file("res://screen/show_spectrum.tscn")
	pass # Replace with function body.
