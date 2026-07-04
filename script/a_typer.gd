extends Control
var tween: Tween
var time:String
@export var wait:float=3.5
@export var font:String="n"
func type_to(text: String):
	
	# 先清除之前的tween（防止重复）
	if tween:
		tween.kill()
	
	# 设置文本并重置可见字符
	if font=="n":
		
		$RichTextLabel.add_theme_font_override("normal_font",load(Get.f_path))
	else :
		$RichTextLabel.add_theme_font_override("normal_font",load(font))
		
	$RichTextLabel.text = text
	$RichTextLabel.visible_characters = 0
	
	# 创建新tween
	tween = create_tween()
	
	# 为每个字符添加延迟回调
	for i in text.length():
		tween.tween_callback(append).set_delay(0.05)
	#await create_timer(2).timeout
	if not is_inside_tree():
		await self.ready  
	$Timer.wait_time=text.length()*0.05+wait
	$Timer.start()
	await  $Timer.timeout
	hide_()
func append():
	$RichTextLabel.visible_characters += 1

func _ready() -> void:
	pass
	#type_to("[wave]abc啊啊啊啊啊啊啊")

func hide_():
	$AnimationPlayer.play("hide")
	await  $AnimationPlayer.animation_finished
	$RichTextLabel.visible_characters = 0
	$RichTextLabel.self_modulate=Color(1,1,1,1)
	queue_free()
	
