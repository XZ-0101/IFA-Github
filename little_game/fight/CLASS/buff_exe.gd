extends Executer
class_name buff_exe


@export var x:int:
	set(value):
		x=value
		basic_code="\nvar x={x}\nvar x_most={x_most}\nfunc run():\n	{code}\n	queue_free()".format({"x":str(x),"x_most":str(most_x)})
	get():
		return x
@export var most_x:int

	
