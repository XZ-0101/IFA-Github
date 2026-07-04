extends Control
@export var music_array:Array[music_class]

func _ready() -> void:
	MusicAll.get_child(1).get_child(0).button_pressed=true
	for i in music_array:
		var bu=preload("res://screen/a_music_button.tscn").instantiate()
		bu.music=i
		$ScrollContainer/VBoxContainer.add_child(bu)


func _on_button_button_down() -> void:
	$CanvasLayer.a=music_array
	$CanvasLayer.mode_="music"
	$CanvasLayer.show()
	
	pass # Replace with function body.
