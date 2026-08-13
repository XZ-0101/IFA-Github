extends Control
@export var gif :a_gif

func  _ready() -> void:
	$Label.text="["+str(gif.index)+"]"+tr(gif.name_)
	$ColorRect.color=gif.back
	$AnimatedSprite2D.sprite_frames=gif.texture
	$AnimatedSprite2D.scale=gif.size
	$AnimatedSprite2D.position-=gif.pos
	

func _on_button_button_down() -> void:
	#$AnimatedSprite2D.play("gif")
	pass # Replace with function body.


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$AnimatedSprite2D.stop()
		$Button.text=tr("播放")
	else :
		$AnimatedSprite2D.play("gif")
		$Button.text=tr("暂停")
	pass # Replace with function body.
