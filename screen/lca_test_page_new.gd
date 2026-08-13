extends TabContainer

@export var a:test
@export var gif:gif_array

@export var old:Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.
func load_test():
	old.a=a
	old.gif=gif
	old.load_test()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
