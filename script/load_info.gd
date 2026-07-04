extends VBoxContainer
func _ready() -> void:
	#$lobotomy.visible=not $LB.pressed
	#$lobotomy2.visible=not $L2B.pressed
	#$lobotomy3.visible=not $L3B.pressed
	#$lobotomy4.visible=not $L4B.pressed
	#$lobotomy5.visible=not $L5B.pressed
	#$lobotomy6.visible=not $L6B.pressed
	#$lobotomy7.visible=not $L7B.pressed
	#$JUMP.visible=not $LJB.pressed
	#$lobotomy_ego.visible=not $EB.pressed
	#$lobotomy_ego_weapon.visible=not 
	pass
func _on_lb_toggled(toggled_on: bool) -> void:
	$lobotomy.visible=not toggled_on
	pass # Replace with function body.


func _on_l_2b_toggled(toggled_on: bool) -> void:
	$lobotomy2.visible=not toggled_on
	pass # Replace with function body.


func _on_l_3b_toggled(toggled_on: bool) -> void:
	$lobotomy3.visible=not toggled_on
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


func _on_eb_toggled(toggled_on: bool) -> void:
	$lobotomy_ego.visible=not toggled_on
	pass # Replace with function body.


func _on_ewb_toggled(toggled_on: bool) -> void:
	$lobotomy_ego_weapon.visible=not toggled_on
	pass # Replace with function body.


func _on_ew_2b_toggled(toggled_on: bool) -> void:
	$lobotomy_ego_weapon2.visible=not toggled_on
	pass # Replace with function body.


func _on_e_2b_toggled(toggled_on: bool) -> void:
	$lobotomy_ego2.visible=not toggled_on
	pass # Replace with function body.


func _on_jeb_toggled(toggled_on: bool) -> void:
	$JUMP_ego.visible=not toggled_on
	pass # Replace with function body.
