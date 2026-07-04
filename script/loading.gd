extends CanvasLayer

@export var bar :ProgressBar
var path_:String
var progress:Array
var update:float=0.0
signal load_over
var loading_text_addon:Array[String]
var loading_text_:Array[String]
var text_mode:int=0
var can_show_loading_text:bool=false
@export var loading_text:Array[String]
@export var test_mode:bool
var mode:int=0
func load_to(path__:String,mode_:int=0):
	$ProgressBar.indeterminate=true
	$ProgressBar.self_modulate.a=1
	mode=mode_
	show()
	$Control/ColorRect3/Label.text="loading..."
	var next_text=loading_text_.pick_random()
	$ProgressBar/Label.text=next_text
	can_show_loading_text=true
	path_=path__
	ResourceLoader.load_threaded_request(path_)
	print(path_)


func _ready() -> void:
	hide()
	var text
	if FileAccess.file_exists("user://loading.txt"):
		var file=FileAccess.open("user://loading.txt",FileAccess.READ)
		text =file.get_as_text()
		file.close()
		
		var ar=text.split("\n")
		text_mode=ar[0].to_int()
		ar.erase(ar[0])
		for i in ar:
			loading_text_addon.append(i)
	if text_mode==0:
		#自添加和内置
		loading_text_.append_array(loading_text)
		loading_text_.append_array(loading_text_addon)
	elif text_mode==1:
		#自添加
		loading_text_.append_array(loading_text_addon)
	else :
		#内置
		loading_text_.append_array(loading_text)
	

	
	#path_="res://res/lobotomy/dummy.tres"
	
	
	#load_to("res://screen/a_page.tscn")
	pass

func _process(delta: float) -> void:
	ResourceLoader.load_threaded_get_status(path_,progress)
	
	bar.value=progress[0]
	
	if progress[0]>update:
		update=progress[0]
		
	#if ResourceLoader.load_threaded_get(path_):
		#get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path_))
		#print(1)
	#
	if bar.value>=1.0 :
		complete()
		if mode==0:
			Get.going_to_gif=ResourceLoader.load_threaded_get(path_)
		elif mode ==3:
			Get.going_to_load_res=ResourceLoader.load_threaded_get(path_)
		else:
			Get.going_to_load_screen=ResourceLoader.load_threaded_get(path_)
		
			
		emit_signal("load_over")
		can_show_loading_text=false
		
		
		hide()
		
		#get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path_))
	if bar.value>=0.7 :
		
		complete()
	
		
	if test_mode:
		can_show_loading_text=true
		show()
func _on_timer_timeout() -> void:
	if can_show_loading_text:
		var next_text=loading_text_.pick_random()
		$ProgressBar/Label.text=next_text
		pass
	pass # Replace with function body.
func complete():
	$ProgressBar.indeterminate=false
	$ProgressBar.self_modulate.a=0
	$Control/ColorRect3/Label.text="Complete!"
	$ProgressBar/Label.text="Complete!"
