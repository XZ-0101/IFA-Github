extends TabContainer

@export var a:legacy
@export var gif:gif_array
@export var old:Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func load_legacy():
	old.a=a
	old.gif=gif
	old.load_legacy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
