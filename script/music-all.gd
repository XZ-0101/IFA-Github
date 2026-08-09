extends CanvasLayer

var d:Dictionary={
	"OpTheme2":"res://mus/lb_ost/04_OpTheme2.wav",
	"Neutral4":"res://mus/lb_ost/08_Neutral4.wav",
	"Story1":"res://mus/lb_ost/12_Story1.wav",
	"Story2":"res://mus/lb_ost/13_Story2.wav",
	"Story3":"res://mus/lb_ost/14_Story3.wav",
	"Story4":"res://mus/lb_ost/15_Story4.wav",
	"Story5":"res://mus/lb_ost/16_Story5.wav",
	"莲&阿尔比娜":"res://mus/Battle_Cp9_Boss_4.ogg.mp3",
	"Sanzunokawa Cut":"res://mus/Sanzunokawa_Cut.ogg.mp3",
	"Thumbs Down Cut":"res://mus/Thumbs_Down_Cut.ogg.mp3",
	"Lobby":"res://mus/Studio EIM - Lobby (Inst_).ogg",
	"玻璃窗":"res://mus/月计人 - Project Moon - (主界面)Limbuscompany.ogg"
	
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Get.is_lg_version:
		hide()
	pass # Replace with function body.




func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$AnimationPlayer.play("new_animation")
	else :
		$AnimationPlayer.play_backwards("new_animation")
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	if index!=12:
		var text = $Panel/OptionButton.get_item_text(index)
		var m =load(d.get(text))
		$AudioStreamPlayer.stream=m
		if not $Panel/CheckButton.button_pressed:
			$AudioStreamPlayer.play()
		pass # Replace with function body.


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$AudioStreamPlayer.stop()
	else :
		$AudioStreamPlayer.play()
	pass # Replace with function body.
func _process(delta: float) -> void:
	if $Panel/CheckButton.button_pressed:
		$AudioStreamPlayer.stop()


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
	pass # Replace with function body.
func play_from_file(path,mode):
	var file = FileAccess.open(path, FileAccess.READ)
	var data = file.get_buffer(file.get_length())
	file.close()
	var stream
	if mode=="ogg":
		stream = AudioStreamOggVorbis.load_from_buffer(data)
	elif mode=="mp3":
		stream = AudioStreamMP3.load_from_buffer(data)
	elif mode=="wav":
		stream = AudioStreamWAV.load_from_buffer(data)
	$Panel/OptionButton.select(12)
	$AudioStreamPlayer.stream=stream
	$AudioStreamPlayer.play()


func _on_button_2_button_down() -> void:
	$FileDialog.popup()
	pass # Replace with function body.


func _on_file_dialog_file_selected(path: String) -> void:
	
	var extension = path.get_extension().to_lower()
	match extension:
		"mp3":
			play_from_file(path,"mp3")
		"wav":
			play_from_file(path,"wav")
		"ogg":
			play_from_file(path,"ogg")
	pass # Replace with function body.


func _on_check_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$AudioStreamPlayer.volume_db=0
	else :
		$AudioStreamPlayer.volume_db=-10
	pass # Replace with function body.
