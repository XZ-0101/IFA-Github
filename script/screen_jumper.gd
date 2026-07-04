extends CanvasLayer
var list=[]
var now=""
@export var index__:int
func _process(delta: float) -> void:
	now=""
	list=Get.jumped_list
	
	for i in range(1,list.size()+1):
		
		if list[i-1] is PackedScene:
			now += "[url="+str(i)+"]"+list[i-1].get_state().get_node_name(0)+"[/url]"+">"
		if list[i-1] is jumper_class:
			now += "[url="+str(i)+"]"+list[i-1].name_+"[/url]"+">"
		if list[i-1] is music_class:
			now += "[url="+str(i)+"]"+list[i-1].name_+"[/url]"+">"
		$ScrollContainer/RichTextLabel.text=now
	
func  jump(index_:String):
	var index=index_.to_int()
	index__=index
	var jumper=list[index-1]
	if jumper is PackedScene:
		get_tree().change_scene_to_packed(jumper)
	if jumper is jumper_class:
		print("jumper_class")
		
		
		
		Get.jump_to(jumper)
	if jumper is music_class:
	
		Get.going_to_music=jumper
		get_tree().change_scene_to_file("res://screen/show_spectrum.tscn")
		pass
	
	list.resize(index)
	Get.jump_saver_list.resize(index)

func _on_rich_text_label_meta_clicked(meta: Variant) -> void:
	var a :String=meta
	jump(a)
	pass # Replace with function body.


func _on_button_button_down() -> void:
	if list.size()-1!=0:
		jump(str(list.size()-1))
	pass # Replace with function body.
