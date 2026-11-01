extends Control

@export var a:legacy
@export var gif:gif_array
@export var old:Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func load_legacy():
	if not Get.use_new:
		var page= load("res://screen/old_page/legacy_old.tscn").instantiate()
		add_child(page)
		old=page
		old.a=a
		old.gif=gif
		old.load_legacy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
