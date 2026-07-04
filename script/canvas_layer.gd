extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func play(a:int):
	if a==0:
		
		$ColorRect/AnimationPlayer.play("new_animation")
	else :
		$ColorRect/AnimationPlayer.play_backwards("new_animation")

func jump_to(p:PackedScene):
	await $ColorRect/AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(p)
	await  get_tree().scene_changed
	return
func jump_to_without_await(p:PackedScene):
	
	get_tree().change_scene_to_packed(p)
	await  get_tree().scene_changed
	return
func hide_():
	play(1)
	await $ColorRect/AnimationPlayer.animation_finished
	hide()
func show_():
	$ColorRect/AnimationPlayer.play("RESET")
	show()
	play(0)
	
	return
