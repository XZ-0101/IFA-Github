extends Node2D
@onready var stream_=$ShowSpectrum/Player.stream 
var now:float
var all:float
var h:float
var is_change:bool=false
var song:AudioStream
var lr:String
var mode_:int=0
var wait_:int
@onready var Typer=$CanvasLayer
@export var music:music_class
func  _process(delta: float) -> void:
	
	if $ShowSpectrum/Player.playing:
		now=$ShowSpectrum/Player.get_playback_position()
		
		Typer.time=seconds_to_time_str(snapped(now,0.1))
		#print(seconds_to_time_str(snapped(now,0.01)))
	if song:
		all=song.get_length()
	
		h=now/all
	if not is_change:
		$Control2/HSlider.value=h
		$Control2/HSlider/now.text=seconds_to_time_str(snapped(now,0.01))
	$Control2/HSlider/all.text=seconds_to_time_str((snapped(all,0.01)))
	if now==all:
		Get.emit_signal("music_over")
	if now==0.0:
		Get.emit_signal("music_over")
	
	if $ShowSpectrum/Player.playing:
		if $Control2/singing/Rock.rotation==180:
			$Control2/singing/Rock.rotation=0
		else :
			$Control2/singing/Rock.rotation+=0.01
	pass


func _on_h_slider_drag_ended(value_changed: bool) -> void:

	$ShowSpectrum/Player.play($Control2/HSlider.value*all)
	print($Control2/HSlider.value)
	is_change=false
	$Control2/Button.text="| |"
	$Control2/Button.button_pressed=false
	pass # Replace with function body.


func _on_h_slider_drag_started() -> void:
	
	is_change=true
	
	$ShowSpectrum/Player.stop()
	pass # Replace with function body.

func stop_():
	$ShowSpectrum/Player.stop()
	Typer.start=false
	is_change=true
func start():
	$ShowSpectrum/Player.play($Control2/HSlider.value*all)
	Typer.start=true
	is_change=false
	
func _on_h_slider_value_changed(value: float) -> void:
	$Control2/HSlider/now.text=seconds_to_time_str(snapped($Control2/HSlider.value*all,0.01))
	pass # Replace with function body.


func _ready() -> void:
	MusicAll.get_child(1).get_child(0).button_pressed=true
	Get.back_index=1
	Get.is_back=false
	Back.change()
	music=Get.going_to_music
	if not music.music_path.begins_with("p"):
		song=load(music.music_path)
		mode_=0
	else :
		mode_=1
		var path1=music.music_path.erase(0)
		var path=path1.split(",")
		Zip.reader.open(path[1])
		var extension = path[0].get_extension().to_lower()
		match extension:
			"mp3":
				song =play_from_file(path[0],"mp3")
			"wav":
				song =play_from_file(path[0],"wav")
			"ogg":
				song =play_from_file(path[0],"ogg")
	
	$ShowSpectrum/Player.stream=song
	$Control2/NinePatchRect/VBoxContainer/Label.text=music.name_
	$Control2/NinePatchRect/VBoxContainer/Label2.text=music.zuo_zhe
	$Control2/NinePatchRect/NinePatchRect3/TextureRect.texture=music.texture
	
	$Control2/TextureRect.texture=music.texture1
	if music.name_=="Emergency1":
		$Control5.show()
	if music.name_=="Emergency2":
		$Control6.show()
	if music.name_=="Emergency3":
		$Control7.show()
	if music.name_=="梅厄斯，羡望漂流":
		$Control3.show()
	
	if music.ge_ci_path:
		if not music.ge_ci_path.begins_with("p"):
			Typer.font=load(music.ge_ci_path).font
			Typer.wait=music.wait_time
			var dic =LoadTxt.load_to(music.ge_ci_path)
			Typer.dic=dic
		#Typer.start=true
		else :
			lr=music.ge_ci_path
			var lr_=lr.erase(0)
			var l=lr_.split("&")
			Typer.font="n"
			Typer.wait=l[1].to_int()
			var text=Zip.reader.read_file(l[0]).get_string_from_utf8()
			var dic =LoadTxt.load_to(text,2)
			Typer.dic=dic
	for i in range(0,music.texture_array.size()):
		$Control2/Panel/OptionButton.add_item("背景"+str(i+1))
	Loading.test_mode=false
	if Get.h2d:
		add_child(preload("res://screen/world_environment.tscn").instantiate())
func seconds_to_time_str(seconds: float) -> String:
	# 处理负数和零
	if seconds <= 0:
		return "00:00.0"
	
	# 转换为十分之一秒（保留1位小数）
	var total_deciseconds = int(round(seconds * 10))  # 关键修改：改为 ×10
	var total_seconds = total_deciseconds / 10
	var decisecond = total_deciseconds % 10  # 获取十分之一秒位（0-9）
	
	var minutes = total_seconds / 60
	var remaining_seconds = total_seconds % 60
	
	# 格式化为2位分钟:2位秒.1位十分秒
	return "%02d:%02d.%01d" % [minutes, remaining_seconds, decisecond]

func truncate_to_one_decimal(value: float) -> float:
	return int(value * 10) / 10.0  # 改为保留1位小数


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		
		$Control2/Button.text="▶"
		stop_()
	else :
		$Control2/Button.text="| |"
		start()
	pass # Replace with function body.


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://screen/music_page_test.tscn")
	
	pass # Replace with function body.


func _on_player_finished() -> void:
	Get.emit_signal("music_over")
	pass # Replace with function body.


func _on_check_button_toggled(toggled_on: bool) -> void:
	$Control2/singing.visible=toggled_on
	pass # Replace with function body.


func _on_check_button_2_toggled(toggled_on: bool) -> void:
	
		if toggled_on :
			$Control2/Panel/AnimationPlayer.play("new_animation")
		if not toggled_on :
			$Control2/Panel/AnimationPlayer.play_backwards("new_animation")



func _on_check_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Control2/TextureRect.self_modulate=Color(0.631, 0.631, 0.631)
	else :
		$Control2/TextureRect.self_modulate=Color(1,1,1)
	pass # Replace with function body.


func _on_check_button_4_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$CanvasLayer.hide()
	else:
		$CanvasLayer.show()
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	if index==0:
		$Control2/TextureRect.texture=music.texture1
	else :
		$Control2/TextureRect.texture=music.texture_array[index-1]
	pass # Replace with function body.
func play_from_file(path:String,mode):
	
	var data = Zip.reader.read_file(path)
	
	var stream
	if mode=="ogg":
		stream = AudioStreamOggVorbis.load_from_buffer(data)
	elif mode=="mp3":
		stream = AudioStreamMP3.load_from_buffer(data)
	elif mode=="wav":
		stream = AudioStreamWAV.load_from_buffer(data)
	return stream
