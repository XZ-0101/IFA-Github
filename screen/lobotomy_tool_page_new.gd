extends TabContainer

@export var a:lobotomy_tool
@export var gif:gif_array
@export var old:Control
func load_tool():
	old.a=a
	old.gif=gif
	old.load_tool()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
