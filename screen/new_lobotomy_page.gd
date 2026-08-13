extends Control
@export var a:bacis_info
@export var s:lobotomy_ego_Suit
@export var w:lobotomy_ego_Weapon
@export var g:bacis_ego
@export var gif:gif_array
@export var mode_:int
@export var old:Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func load_lobotomy(mode:int):
	old.a=a
	old.s=s
	old.w=w
	old.g=g
	old.gif=gif
	old.mode_=mode_
	old.load_lobotomy(mode)
