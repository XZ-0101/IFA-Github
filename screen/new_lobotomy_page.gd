extends Control
@export var a:bacis_info
@export var s:lobotomy_ego_Suit
@export var w:lobotomy_ego_Weapon
@export var g:bacis_ego
@export var gif:gif_array
@export var mode_:int
@export var old:Control
@export var lobotomy_new:Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func load_lobotomy(mode:int):
	
	if not Get.use_new:
		var page= load("res://screen/old_page/lobotomy_old.tscn").instantiate()
		add_child(page)
		old=page
		
		old.a=a
		old.s=s
		old.w=w
		old.g=g
		old.gif=gif
		old.mode_=mode_
		old.load_lobotomy(mode)
	else:
		
		if mode==0:
			var page= load("res://screen/new_page/lobotomy_new.tscn").instantiate()
			add_child(page)
			lobotomy_new=page
			lobotomy_new.a=a
			lobotomy_new.gif=gif
			lobotomy_new.mode_=0
			lobotomy_new.load_lobotomy(mode)
