extends CanvasLayer
var time:String
var start:bool=false
var dic :Dictionary
var font:String="n"
var r:=RandomNumberGenerator.new()
var wait:float=3.5
var loaded_list=[]
func _process(delta: float) -> void:
	if start:
		var str:String=""
		if not time in loaded_list:
			loaded_list.append(time)
			str= dic.get(time,"")
			#print(dic)
			
		if str !="":
			
			var a_typer=preload("res://screen/a_typer.tscn").instantiate() as Control
			var pos=Vector2(r.randf_range(30,300),r.randf_range(200,800))
			var ro=r.randi_range(-30,30)
			a_typer.position=pos
			a_typer.rotation_degrees=ro
			a_typer.font=font
			a_typer.wait=wait
			a_typer.type_to(str)
			add_child(a_typer)
	await Get.music_over
	loaded_list=[]
	
