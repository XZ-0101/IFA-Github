extends Node

func load_to(path:String,mode=1):
	var list=[]
	var dic={}
	var file
	if mode == 0:
		file = FileAccess.open(path, FileAccess.READ)
		while not file.eof_reached():
			var line = file.get_line()
			list.append(line)
		
		file.close()
	elif mode==1 :
		file=load(path) as lyrics
		var a =file.lyc.split("
")
		list=a
		
	else :
		var a =path.split("\n")
		list=a
	for i in list:
		var regex = RegEx.new()
	# 匹配 [时间]文本 的模式
		regex.compile("\\[(?<time>[^\\]]+)\\](?<text>.+)")
		var result = regex.search(i)
		if result:
			dic.merge({trim_millisecond_digit(result.get_string("time")): result.get_string("text")})

		

	return dic
	

func _ready() -> void:
	#print(load_to("res://tpov.txt"))
	pass
func trim_millisecond_digit(time_str: String) -> String:
	# 直接截取到小数点后1位（"00:00.00" → "00:00.0"）
	return time_str.substr(0, 7)  # 前7个字符："00:00.0"
