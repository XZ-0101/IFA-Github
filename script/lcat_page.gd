extends Control
@export var jumper_array:Array[jumper_class]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in jumper_array:
		var b =preload("res://screen/jumper_button.tscn").instantiate()
		b.jumper=i
		$ScrollContainer3/VBoxContainer.add_child(b)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	$CanvasLayer.a=jumper_array
	$CanvasLayer.mode_="lobotomyA"
	$CanvasLayer.show()
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	$CanvasLayer.a=jumper_array
	$CanvasLayer.mode_="lobotomyAS"
	$CanvasLayer.show()
	pass # Replace with function body.


func _on_button_3_button_down() -> void:
	$CanvasLayer.a=jumper_array
	$CanvasLayer.mode_="type"
	$CanvasLayer.show()
	pass # Replace with function body.
