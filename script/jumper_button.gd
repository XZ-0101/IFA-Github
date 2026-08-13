extends Control
@export var jumper:jumper_class

var has_me:bool=false
func _ready() -> void:
	$TextureProgressBar.hide()
	$Button.tooltip_text=tr("类型:[")+jumper.mode+"]\n"
	if  not jumper.s=="None":
		$Label.text=jumper.s
	else :
		$Label.text=""
	$TextureRect3/Label.text=jumper.name_
	$TextureRect.texture=jumper.texture
	if jumper.level=="Z"or  jumper.level=="z":
		$Button.tooltip_text+=tr("等级:ZAYIN")
		$TextureRect3.self_modulate=Color("green")
		$TextureRect2.self_modulate=Color("green")
	elif jumper.level=="T"or  jumper.level=="t":
		$Button.tooltip_text+=tr("等级:TETH")
		$TextureRect3.self_modulate=Color("#229ff6")
		$TextureRect2.self_modulate=Color("#229ff6")
	#229ff6
	elif jumper.level=="H"or  jumper.level=="h":
		$Button.tooltip_text+=tr("等级:HE")
		$TextureRect3.self_modulate=Color("yellow")
		$TextureRect2.self_modulate=Color("yellow")
	elif jumper.level=="W"or  jumper.level=="w":
		$Button.tooltip_text+=tr("等级:WAW")
		$TextureRect3.self_modulate=Color("purple")
		$TextureRect2.self_modulate=Color("purple")
	elif jumper.level=="A" or  jumper.level=="a":
		$Button.tooltip_text+=tr("等级:AELPH")
		$TextureRect3.self_modulate=Color("red")
		$TextureRect2.self_modulate=Color("red")
	else :
		$Button.tooltip_text+=tr("等级:UNDEF.")
	for i in Get.收藏夹:
		if i ==jumper:
			has_me=true
			$CheckBox.button_pressed=true

			break
	pass

func _on_button_button_down() -> void:
	$Timer2.start()
	$TextureProgressBar.show()
	pass # Replace with function body.
func build_jumper_saver(mode):
	if mode =="lobotomyA":
		var jumper_saver_:jump_saver=jump_saver.new()
		jumper_saver_.scroll=0
		jumper_saver_.bool_array=[false,false,false,false,false,false,false,true]
		return jumper_saver_
	if mode =="lobotomyA" or mode =="lobotomyS" or mode =="lobotomyW" or mode =="lobotomyG":
		var jumper_saver_:jump_saver=jump_saver.new()
		jumper_saver_.scroll=0
		jumper_saver_.bool_array=[false,false,false,false,true]
		return jumper_saver_
	if mode =="lobotomyT":
		var jumper_saver_:jump_saver=jump_saver.new()
		jumper_saver_.scroll=0
		jumper_saver_.bool_array=[false,false,true]
		return jumper_saver_
	if mode =="TEST":
		var jumper_saver_:jump_saver=jump_saver.new()
		jumper_saver_.scroll=0
		jumper_saver_.bool_array=[false,false,true]
		return jumper_saver_
	if mode=="Unreleased":
		var jumper_saver_:jump_saver=jump_saver.new()
		jumper_saver_.scroll=0
		jumper_saver_.bool_array=[false,false,true]
		return jumper_saver_
	if mode=="Legacy":
		var jumper_saver_:jump_saver=jump_saver.new()
		jumper_saver_.scroll=0
		jumper_saver_.bool_array=[false,false,true]
		return jumper_saver_


func _on_timer_timeout() -> void:
	if jumper.name_==tr("别碰我") and Get.fun_mode:
		$TextureRect.texture=Get.a_fun_list.pick_random()
	pass # Replace with function body.


func _on_button_button_up() -> void:
	$Timer2.stop()
	$TextureProgressBar.hide()
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	$TextureProgressBar.hide()
	if not Get.is_lg_version:
		
		j()
	pass # Replace with function body.
func j():
	if jumper.name_==tr("别碰我") and Get.fun_mode:
		var a=preload("res://screen/dtm.tscn").instantiate()
		add_child(a)
		a.play()
	else:
		Get.jumped_list.append(jumper)
		print("show")
		Get.jump_saver_list.append(build_jumper_saver(jumper.mode))
		Get.jump_to(jumper)
func  _process(delta: float) -> void:
	if $Timer2.time_left>=0.01:
		$TextureProgressBar.value=(1-$Timer2.time_left/$Timer2.wait_time)*100
	else:
		$TextureProgressBar.value=100
	
func ceil_to_2(value: float) -> float:
	return ceil(value * 100) / 100.0


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		if not has_me:
			Get.收藏夹.append(jumper)
	else :
		Get.收藏夹.erase(jumper)
	pass # Replace with function body.


func _on_button_gui_input(event: InputEvent) -> void:
		
	pass # Replace with function body.
