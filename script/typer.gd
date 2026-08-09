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
			if Get.l_mode==0:
				var a_typer=preload("res://screen/a_typer.tscn").instantiate() as Control
				var pos=Vector2(r.randf_range(30,300),r.randf_range(200,800))
				var ro=r.randi_range(-30,30)
				a_typer.position=pos
				a_typer.rotation_degrees=ro
				a_typer.font=font
				a_typer.wait=wait
				a_typer.type_to(str)
				add_child(a_typer)
			else:
				var a_typer=preload("res://screen/a_better_typer.tscn").instantiate() as Control
				var x:float=r.randf_range(20,350)
				var y:float=r.randf_range(200,800)
				var l0=randi_range(0,1)
				if str.length()>=20:
					if l0==1:
						y=r.randf_range(600,800)
					else:
						y=r.randf_range(200,300)
				if str.length()>=30:
					x=r.randf_range(20,100)
					
				var pos=Vector2(x,y)
				a_typer.lower_0=l0
				a_typer.position=pos
				a_typer.font=font
				a_typer.wait=wait
				
				add_child(a_typer)
				a_typer.type_to(str)
	await Get.music_over
	loaded_list=[]
	
