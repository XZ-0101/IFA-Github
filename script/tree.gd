extends Tree

@export var qt:question
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func load_tree(root:TreeItem,q):
	var c = create_item(root)
	c.set_text(0,q.问题)
	for i in q.item:
		var new = create_item(c)
		new.set_text(0,i.name_+'\n'+i.结果)
		if i.分支问题:
			var new_q= i.分支问题
			load_tree(new,new_q)
		
#	root.add_child(c)
		
	
	pass
