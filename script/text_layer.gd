extends CanvasLayer

@export var is_open:bool=false
@export var is_up:bool=false
@export var is_start_timer:bool=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func show_panel(str:String,pos:Vector2=Vector2(0,0)):
	if not is_open:
		is_open=true
		$Panel/RichTextLabel.text=str
		if not  is_up:
			if get_viewport().get_mouse_position().x>=400:
				$Panel.global_position=get_viewport().get_mouse_position()+Vector2(-100,10)
			else :
				$Panel.global_position=get_viewport().get_mouse_position()+Vector2(10,10)
		else :
			$Panel.global_position=pos+Vector2(0,100)
		if is_start_timer:
			$Timer.start()
	$Panel.show()
func hide_panel():
	is_open=false
	$Panel.hide()





func _on_area_2d_mouse_exited() -> void:
	
	pass # Replace with function body.


func _on_panel_mouse_exited() -> void:
	
	
	pass # Replace with function body.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		print(get_viewport().get_mouse_position()+Vector2(10,10))


func _on_timer_timeout() -> void:
	hide_panel()
	pass # Replace with function body.
