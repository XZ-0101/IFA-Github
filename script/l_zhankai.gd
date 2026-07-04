extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_lb_toggled(toggled_on: bool) -> void:
	$lobotomy.visible=not toggled_on
	pass # Replace with function body.


func _on_l_2b_toggled(toggled_on: bool) -> void:
	$lobotomy2.visible=not toggled_on
	pass # Replace with function body.





func _on_l_4b_toggled(toggled_on: bool) -> void:
	$lobotomy4.visible=not toggled_on
	pass # Replace with function body.


func _on_l_5b_toggled(toggled_on: bool) -> void:
	$lobotomy5.visible=not toggled_on
	pass # Replace with function body.


func _on_l_6b_toggled(toggled_on: bool) -> void:
	$lobotomy6.visible=not toggled_on
	pass # Replace with function body.


func _on_l_7b_toggled(toggled_on: bool) -> void:
	$lobotomy7.visible=not toggled_on
	pass # Replace with function body.


func _on_ljb_toggled(toggled_on: bool) -> void:
	$JUMP.visible=not toggled_on
	pass # Replace with function body.


func _on_l_8b_toggled(toggled_on: bool) -> void:
	$lobotomy8.visible=not toggled_on
	pass # Replace with function body.


func _on_l_9b_toggled(toggled_on: bool) -> void:
	$lobotomy9.visible=not toggled_on
	pass # Replace with function body.
