extends CanvasLayer

@export var text_node:NewRichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vernum=Get.v
	var ver 
	if Get.is_lg_version:
		ver= "LITTLE_GAME_VERSION"
	elif Get.is_fast_version:
		ver="FAST_VERSION"
	else:
		ver="NORMAL"
	var ver2
	match Get.v.left(1):
		"A":
			ver2="AlphaTest"
		"B":
			ver2="BetaTest"
		"P":
			ver2="Preview"
		"R":
			ver2="Release"
		_:
			ver2="欸？是我没听过的版本...是不是有人魔改了？"
	var os =OS.get_name()
	text_node.text="IFA Shell - {vernum} - {ver},{ver2} - {os} \n输入help查看帮助\n不要乱动哦，小心软件报错！\n".format({"vernum":vernum,"ver":ver,"ver2":ver2,"os":os})
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible=Get.debug
	pass
func _on_button_button_down() -> void:
	if $Control.visible:
		$Control.hide()
	else:
		$Control.show()


func _input(event: InputEvent) -> void:
	if Get.debug:
		if Input.is_action_just_pressed("open_shell"):
			if $Control.visible:
				$Control.hide()
			else:
				$Control.show()
func _on_line_edit_text_submitted(new_text: String) -> void:
	exec_comd(new_text)


func exec_comd(comd:String):
	
	var arr=comd.split(" ")
	match arr[0]:
		"help":
			if arr.size() == 1:
				show_help_list()
			elif arr.size() == 2:
				show_help_detail(arr[1])
			elif arr.size() == 3 and arr[1] in ["mesugaki", "world.search(you);", "world.execute(me);", "echo"]:
				if arr[2] == "xz20120101":
					show_help_detail(arr[1])
				else:
					text_node.append_text("[color=red]ERR:InvalidPassword[/color]\n")
			else:
				text_node.append_text("[color=red]ERR:InvalidArgument[/color]\n")
		"print":
			if arr.size()==2:
				shell_print(arr[1])
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		"clear":
			text_node.text=""
		"color":
			if arr.size()==2:
				var win_color_dict = {
"0": Color("000000"),  # 黑色
	"1": Color("000080"),  # 蓝色
	"2": Color("008000"),  # 绿色
	"3": Color("008080"),  # 青色
	"4": Color("800000"),  # 红色
	"5": Color("800080"),  # 紫色
	"6": Color("808000"),  # 黄色
	"7": Color("C0C0C0"),  # 白色
	
	# 亮色
	"8": Color("808080"),  # 灰色
	"9": Color("0000FF"),  # 亮蓝
	"A": Color("00FF00"),  # 亮绿
	"B": Color("00FFFF"),  # 亮青
	"C": Color("FF0000"),  # 亮红
	"D": Color("FF00FF"),  # 亮紫
	"E": Color("FFFF00"),  # 亮黄
	"F": Color("FFFFFF"),  # 亮白
}
				if arr[1].is_valid_html_color():
					text_node.add_theme_color_override("default_color",Color(arr[1]))
				elif win_color_dict.has(arr[1]):
					text_node.add_theme_color_override("default_color",win_color_dict.get(arr[1]))
					
				else:
					text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
			else:
				text_node.append_text("[color=red]ERR:InvalidArgument[/color]\n")
		"jump":
			if arr.size()==2:
				jump_to(arr[1])
				text_node.append_text("[color=cyan]W列车就是快，对吧（[/color]\n")
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		"fuck","shit","FUCK","SHIT","bitch","BITCH","sb","SB","cnm","CNM","rnm","RNM":
			text_node.append_text("[color=red]ERR:NoRude[/color]\n")
		"mesugaki":
			text_node.append_text("[color=red]ERR:HontouNiZako[/color]\n")
		"world.search(you);":
			text_node.append_text("[color=green]I'll find you:)[/color]\n")
		"world.execute(me);":
			text_node.append_text("[color=red]ERR:CannotRunExecuteWithNullObject[/color]\n")
		"echo":
			text_node.append_text("in the mirror?\n")
			text_node.append_text("[color=red]ERR:AndPlzUsePrint[/color]\n")
		"show":
			if arr.size()==2:
				$CanvasLayer.show_text(arr[1])
				
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
			
		"alert":
			if arr.size()==3:
				OS.alert(arr[1],arr[2])
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		"play_music":
			if arr.size()==2:
				play_music(arr[1])
				text_node.append_text("[color=cyan]enjoy :D[/color]\n")
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		"stop_music":
			stop_music()
		"read":
			if arr.size()==2:
				
				var c=FileAccess.get_file_as_string(arr[1])
				print(c)
				var code = c.split('\n')
				exec(code)
				
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		
		"LittleGameFight","lgf":
			if arr.size()>=3:
				lgf(arr[1],arr[2],arr.slice(3,arr.size()))
			
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		"LittleGameCtrl","lgc":
			if arr.size()>=3:
				lgc(arr[1],arr[2],arr.slice(3,arr.size()))
			
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
		"Get","get":
			if arr.size()>=3:
				pget(arr[1],arr[2],arr.slice(3,arr.size()))
			
			else:
				text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
			
		_:
			text_node.append_text("[color=red]ERR:UnknownCommand[/color]\n")
	pass
func shell_print(what):
	if what:
		text_node.append_text(what+"\n")
	else:
		text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
	pass
func lgf(what:String,who:String,args:Array):
	if what:
		match what:
			"set":
				set_v(LittleGameFight,who,args)
			"get":
				get_v(LittleGameFight,who)
			"func":
				call_v(LittleGameFight,who,args)
			
			"do":
				match who:
					"heal":
						LittleGameFight.fight_hp=LittleGameFight.fight_hp_max
					"kill":
						
						LittleGameFight.enemy_hp=0
					"reset_sp":
						LittleGameFight.fight_sp=LittleGameFight.fight_hp_max/2
					"get_skill":
						LittleGameFight.add_skill_inpool(load(args[0]),args[1].to_int())
					"add_buff":
						LittleGameFight.add_buff_path(args[0],args[1].to_int(),args[2].to_int())
					_:
						text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
			
			
	else :
		text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
func lgc(what:String,who:String,args:Array):
	if what:
		match what:
			"set":
				set_v(LittleGameCtrl,who,args)
			"get":
				get_v(LittleGameCtrl,who)
			"func":
				call_v(LittleGameCtrl,who,args)
			"do":
				match who:
					"add_skill":
						LittleGameCtrl.skill_arr_a.append(load(args[0]))
					"add_gift":
						LittleGameCtrl.gift_array.append(load(args[0]))
					"get_gift":
						LittleGameCtrl.got_gift_array.append(load(args[0]))
					"to":
						var a=preload("res://little_game/control.tscn")
						LittleGameCtrl.now_q=load(args[0])
						jumper.show_()
						jumper.jump_to(a)
	
				
				
	else :
		text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
func pget(what:String,who:String,args:Array):
	if what:
		match what:
			"set":
				set_v(Get,who,args)
			"get":
				get_v(Get,who)
			"func":
				call_v(Get,who,args)
	else :
		text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
func jump_to(where:String):
	
	var a = load(where)
	Get.jumped_list.append(a)
	Get.jump_saver_list.append(jump_saver.new())
	get_tree().change_scene_to_packed(a)
func play_music(path):
	var a=load(path)
	$AudioStreamPlayer.stream=a
	$AudioStreamPlayer.play()
func stop_music():
	$AudioStreamPlayer.stop()
func exec(code:PackedStringArray):
	var timer=$Timer
	for i in code:
		if i.begins_with("sleep"):
			var com=i.split(' ')
			
			timer.wait_time=com[1].to_int()
			timer.start()
			await timer.timeout
		else:
			exec_comd(i)
	pass
#region 功能
func set_v(obj:Object,who:String,args:Array):
	if args[0]:
		if not obj.has_method("get") and not obj.has_property(who):
			text_node.append_text("[color=red]ERR:PropertyNotFound: " + who + "[/color]\n")
		
		var value=obj.get(who)
		match  typeof(value):
			TYPE_BOOL:
				if args[0]=="T":
					obj.set(who,true)
				else :
					obj.set(who,false)
				
			TYPE_INT:
				var v=args[0] as String
				if v.is_valid_int():
					obj.set(who,v.to_int())
				else:
					text_node.append_text("[color=red]ERR:InvalidArgument[/color]\n")
			TYPE_STRING:
				obj.set(who,args[0])
			TYPE_FLOAT:
				var v=args[0] as String
				if v.is_valid_float():
					obj.set(who,v.to_float())
				else:
					text_node.append_text("[color=red]ERR:InvalidArgument[/color]\n")
			TYPE_OBJECT:
				var v =load(args[0])
				if v:
					obj.set(who,v)
				else:
					text_node.append_text("[color=red]ERR:InvalidPath[/color]\n")
			TYPE_ARRAY:
				var element_type = obj.get(who).get_typed_builtin()
				var arr = parse_array_string(args[0], element_type)
				
				if arr != null:
					obj.set(who, arr)
					
				else:
					text_node.append_text("[color=red]ERR:InvalidArrayFormat[/color]\n")
			_:
				text_node.append_text("[color=red]ERR:CannotSetThisProperty:"+who+"[/color]\n")
	else:
		text_node.append_text("[color=red]ERR:LostArgument(s)[/color]\n")
func get_v(obj:Object, who: String) :
	# 检查对象是否有效
	
	
	# 检查属性是否存在
	if not obj.has_method("get") and not obj.has_property(who):
		text_node.append_text("[color=red]ERR:PropertyNotFound: " + who + "[/color]\n")
		
	
	# 获取值
	var value = obj.get(who)
	
	# 根据类型格式化输出
	match typeof(value):
		TYPE_BOOL:
			text_node.append_text("[color=green]" + str(value) + "[/color]\n")
			return value
		TYPE_INT:
			text_node.append_text("[color=green]" + str(value) + "[/color]\n")
			return value
		TYPE_FLOAT:
			text_node.append_text("[color=green]" + str(value) + "[/color]\n")
			return value
		TYPE_STRING:
			# 字符串加引号输出，方便识别
			text_node.append_text("[color=green]\"" + value + "\"[/color]\n")
			return value
		TYPE_OBJECT:
			# 如果是资源或对象，显示其路径或类名
			if value.has_method("get_path"):
				text_node.append_text("[color=green]" + value.get_path() + "[/color]\n")
			else:
				text_node.append_text("[color=green]Object(" + value.get_class() + ")[/color]\n")
			return value
		TYPE_ARRAY:
			var output = "["
			for i in value.size():
				if i > 0:
					output += ", "
				var elem = value[i]
				match typeof(elem):
					TYPE_STRING:
						output += "\"" + elem + "\""
					TYPE_OBJECT:
						if elem.has_method("get_path"):
							output += elem.get_path()
						else:
							output += "Object(" + elem.get_class() + ")"
					_:
						output += str(elem)
			output += "]"
			text_node.append_text("[color=green]" + output + "[/color]\n")
			return value
		_:
				text_node.append_text("[color=red]ERR:CannotGetThisProperty:"+who+"[/color]\n")
func call_v(obj:Object,who:String,args:Array):
	if obj.has_method(who):
		var function=Callable(obj,who)
		var r = function.callv(args)
		if r:
			text_node.append_text("return: "+str(r)+"\n")
	else:
		text_node.append_text("[color=red]ERR:PropertyNotFound: " + who + "[/color]\n")
		
		
func parse_array_string(str_: String, target_element_type: int = TYPE_NIL):
	# 去掉首尾的 [] 和空白
	var content = str_.strip_edges()
	if not content.begins_with("[") or not content.ends_with("]"):
		return null
	content = content.substr(1, content.length() - 2).strip_edges()
	if content == "":
		return []
	
	var result = []
	# 简单逗号分割（不支持嵌套数组）
	var parts = split_with_quotes(content, ",")
	for part in parts:
		var item_str = part.strip_edges()
		if item_str == "":
			continue
		
		# 尝试按类型解析
		var parsed = parse_single_value(item_str)
		if parsed == null:
			return null
		
		# 检查类型是否允许
		if typeof(parsed) not in [TYPE_BOOL, TYPE_INT, TYPE_FLOAT, TYPE_STRING, TYPE_OBJECT]:
			return null
		
		result.append(parsed)
	
	match target_element_type:
		TYPE_INT:
			var typed_arr: Array[int] = []
			for item in result:
				typed_arr.append(int(item))
			return typed_arr
		TYPE_FLOAT:
			var typed_arr: Array[float] = []
			for item in result:
				typed_arr.append(float(item))
			return typed_arr
		TYPE_STRING:
			var typed_arr: Array[String] = []
			for item in result:
				typed_arr.append(str(item))
			return typed_arr
		TYPE_BOOL:
			var typed_arr: Array[bool] = []
			for item in result:
				typed_arr.append(bool(item))
			return typed_arr
		_:
			return result


func split_with_quotes(text: String, delimiter: String):
	var result = []
	var current = ""
	var in_quotes = false
	var quote_char = ""
	
	for i in text.length():
		var c = text[i]
		if not in_quotes and c == "\"":
			in_quotes = true
			quote_char = "\""
			current += c
		elif not in_quotes and c == "'":
			in_quotes = true
			quote_char = "'"
			current += c
		elif in_quotes and c == quote_char:
			in_quotes = false
			current += c
		elif not in_quotes and c == delimiter:
			result.append(current)
			current = ""
		else:
			current += c
	
	if current != "" or not text.ends_with(delimiter):
		result.append(current)
	
	return result


func parse_single_value(str_: String):
	var s = str_.strip_edges()
	
	# 布尔
	if s.to_lower() in ["true", "false"]:
		return s.to_lower() == "true"
	
	# 整数
	if s.is_valid_int():
		return s.to_int()
	
	# 浮点数
	if s.is_valid_float():
		return s.to_float()
	
	# 字符串（带引号）
	if (s.begins_with("\"") and s.ends_with("\"")) or (s.begins_with("'") and s.ends_with("'")):
		return s.substr(1, s.length() - 2)
	
	# 资源路径
	if s.begins_with("res://"):
		var res = load(s)
		if res != null:
			return res
	
	# 其他情况：不是有效的数组元素
	return null
#endregion

#region help
func show_help_list():
	text_node.append_text("[color=cyan]========== 控制台帮助 ==========[/color]\n")
	text_node.append_text("输入 [color=yellow]help <命令名>[/color] 查看详细用法\n\n")
	text_node.append_text("[color=yellow]基础命令[/color]\n")
	text_node.append_text("  [color=green]print[/color]   [color=gray]- 输出文本[/color]\n")
	text_node.append_text("  [color=green]clear[/color]   [color=gray]- 清空控制台[/color]\n")
	text_node.append_text("  [color=green]color[/color]   [color=gray]- 设置文字颜色[/color]\n")
	text_node.append_text("  [color=green]jump[/color]    [color=gray]- 跳转到指定场景[/color]\n")
	text_node.append_text("  [color=green]show[/color]    [color=gray]- 在屏幕上显示大字[/color]\n")
	text_node.append_text("  [color=green]alert[/color]   [color=gray]- 弹出系统弹窗[/color]\n")
	text_node.append_text("\n")
	text_node.append_text("[color=yellow]音乐控制[/color]\n")
	text_node.append_text("  [color=green]play_music[/color]  [color=gray]- 播放音乐[/color]\n")
	text_node.append_text("  [color=green]stop_music[/color]   [color=gray]- 停止音乐[/color]\n")
	text_node.append_text("\n")
	text_node.append_text("[color=yellow]快捷模块[/color]\n")
	text_node.append_text("  [color=green]lgc[/color]  [color=gray]- 操作 LittleGameCtrl[/color]\n")
	text_node.append_text("  [color=green]lgf[/color]  [color=gray]- 操作 LittleGameFight[/color]\n")
	text_node.append_text("  [color=green]get[/color]  [color=gray]- 操作 Get 单例[/color]\n")
	text_node.append_text("\n")
	text_node.append_text("[color=yellow]lgc 子命令[/color]\n")
	text_node.append_text("  [color=green]set[/color]        [color=gray]- 设置属性值[/color]\n")
	text_node.append_text("  [color=green]get[/color]        [color=gray]- 获取属性值[/color]\n")
	text_node.append_text("  [color=green]func[/color]       [color=gray]- 调用方法[/color]\n")
	text_node.append_text("  [color=green]add_skill[/color]  [color=gray]- 添加技能[/color]\n")
	text_node.append_text("  [color=green]add_gift[/color]   [color=gray]- 添加饰品[/color]\n")
	text_node.append_text("  [color=green]to[/color]         [color=gray]- 跳转到指定事件[/color]\n")
	text_node.append_text("\n")
	text_node.append_text("[color=yellow]lgf 子命令[/color]\n")
	text_node.append_text("  [color=green]set[/color]        [color=gray]- 设置属性值[/color]\n")
	text_node.append_text("  [color=green]get[/color]        [color=gray]- 获取属性值[/color]\n")
	text_node.append_text("  [color=green]func[/color]       [color=gray]- 调用方法[/color]\n")
	text_node.append_text("  [color=green]heal[/color]       [color=gray]- 回满玩家HP[/color]\n")
	text_node.append_text("  [color=green]kill[/color]       [color=gray]- 击杀当前敌人[/color]\n")
	text_node.append_text("  [color=green]reset_sp[/color]    [color=gray]- 重置玩家SP[/color]\n")
	text_node.append_text("  [color=green]get_skill[/color]   [color=gray]- 添加技能到技能池[/color]\n")
	text_node.append_text("  [color=green]add_buff[/color]    [color=gray]- 添加Buff[/color]\n")
	text_node.append_text("\n")
	text_node.append_text("[color=gray]输入 help <命令名> 查看详细用法[/color]\n")
	text_node.append_text("[color=cyan]=================================[/color]\n")

func show_help_detail(cmd: String):
	var help_text = ""
	match cmd:
		"print":
			help_text = """[color=cyan]========== print ==========[/color]
[color=yellow]用法[/color]：print <文本>
[color=yellow]说明[/color]：在控制台输出一行文本
[color=yellow]示例[/color]：print Hello World
[color=cyan]===========================[/color]"""
		"clear":
			help_text = """[color=cyan]========== clear ==========[/color]
[color=yellow]用法[/color]：clear
[color=yellow]说明[/color]：清空控制台所有输出内容
[color=yellow]示例[/color]：clear
[color=cyan]===========================[/color]"""
		"color":
			help_text = """[color=cyan]========== color ==========[/color]
[color=yellow]用法[/color]：color <颜色>
[color=yellow]说明[/color]：设置控制台默认文字颜色
[color=yellow]支持格式[/color]：
  - HTML颜色：#RRGGBB（如 #FF0000）
  - Windows颜色码：0-F（如 2 = 绿色，C = 亮红）
[color=yellow]示例[/color]：color #00FF00
[color=cyan]===========================[/color]"""
		"jump":
			help_text = """[color=cyan]========== jump ==========[/color]
[color=yellow]用法[/color]：jump <场景路径>
[color=yellow]说明[/color]：跳转到指定场景
[color=yellow]示例[/color]：jump res://little_game/enter.tscn
[color=cyan]===========================[/color]"""
		"show":
			help_text = """[color=cyan]========== show ==========[/color]
[color=yellow]用法[/color]：show <文本>
[color=yellow]说明[/color]：在屏幕中央显示大字提示
[color=yellow]示例[/color]：show 测试
[color=cyan]===========================[/color]"""
		"alert":
			help_text = """[color=cyan]========== alert ==========[/color]
[color=yellow]用法[/color]：alert <文本> <标题>
[color=yellow]说明[/color]：弹出系统级弹窗
[color=yellow]示例[/color]：alert 已完成 提示
[color=cyan]===========================[/color]"""
		"play_music":
			help_text = """[color=cyan]========== play_music ==========[/color]
[color=yellow]用法[/color]：play_music <音乐路径>
[color=yellow]说明[/color]：播放指定路径的音乐文件
[color=yellow]示例[/color]：play_music res://music/bgm.ogg
[color=cyan]===============================[/color]"""
		"stop_music":
			help_text = """[color=cyan]========== stop_music ==========[/color]
[color=yellow]用法[/color]：stop_music
[color=yellow]说明[/color]：停止当前播放的音乐
[color=yellow]示例[/color]：stop_music
[color=cyan]===============================[/color]"""
		"lgc":
			help_text = """[color=cyan]========== lgc ==========[/color]
[color=yellow]用法[/color]：lgc <子命令> <参数...>
[color=yellow]说明[/color]：操作 LittleGameCtrl 单例
[color=yellow]子命令[/color]：
  set   <属性> <值>   - 设置属性值
  get   <属性>        - 获取属性值
  func  <方法> <参数> - 调用方法
  do add_skill <路径>    - 添加技能
  do add_gift <路径>     - 添加饰品
  do to <事件路径>       - 跳转到事件
[color=yellow]示例[/color]：lgc get n_hp
[color=cyan]===========================[/color]"""
		"lgf":
			help_text = """[color=cyan]========== lgf ==========[/color]
[color=yellow]用法[/color]：lgf <子命令> <参数...>
[color=yellow]说明[/color]：操作 LittleGameFight 单例
[color=yellow]子命令[/color]：
  set   <属性> <值>   - 设置属性值
  get   <属性>        - 获取属性值
  func  <方法> <参数> - 调用方法
  do heal                - 回满玩家HP
  do kill                - 击杀当前敌人
  do reset_sp            - 重置玩家SP
  do get_skill <路径> <阵营> - 添加技能到技能池
  do add_buff <路径> <层数> <阵营> - 添加Buff
[color=yellow]示例[/color]：lgf heal
[color=cyan]===========================[/color]"""
		"get":
			help_text = """[color=cyan]========== get ==========[/color]
[color=yellow]用法[/color]：get <子命令> <参数...>
[color=yellow]说明[/color]：操作 Get 单例
[color=yellow]子命令[/color]：
  set   <属性> <值>   - 设置属性值
  get   <属性>        - 获取属性值
  func  <方法> <参数> - 调用方法
[color=yellow]示例[/color]：get get 收藏夹
[color=cyan]===========================[/color]"""
		"set":
			help_text = """[color=cyan]========== set ==========[/color]
[color=yellow]用法[/color]：<模块> set <属性名> <值>
[color=yellow]说明[/color]：设置指定模块的属性值，自动识别类型
[color=yellow]支持类型[/color]：bool, int, float, string, object(路径), array
[color=yellow]示例[/color]：
  lgc set n_hp 999
  lgc set panic true
  lgf set hit_area 2.5
  lgc set value_array [10,10,10,10]
[color=cyan]===========================[/color]"""
		"func":
			help_text = """[color=cyan]========== func ==========[/color]
[color=yellow]用法[/color]：<模块> func <方法名> <参数...>
[color=yellow]说明[/color]：调用指定模块的方法
[color=yellow]示例[/color]：lgc func add_skill res://skill.tres
[color=cyan]===========================[/color]"""
		"add_skill":
			help_text = """[color=cyan]========== add_skill ==========[/color]
[color=yellow]用法[/color]：lgc add_skill <技能路径>
[color=yellow]说明[/color]：将技能添加到玩家的技能收藏中
[color=yellow]示例[/color]：lgc add_skill res://little_game/fight/res/skill/test.tres
[color=cyan]================================[/color]"""
		"add_gift":
			help_text = """[color=cyan]========== add_gift ==========[/color]
[color=yellow]用法[/color]：lgc add_gift <饰品路径>
[color=yellow]说明[/color]：将饰品添加到玩家的饰品列表中
[color=yellow]示例[/color]：lgc add_gift res://little_game/gift/test.tres
[color=cyan]================================[/color]"""
		"to":
			help_text = """[color=cyan]========== to ==========[/color]
[color=yellow]用法[/color]：lgc to <事件路径>
[color=yellow]说明[/color]：跳转到指定事件（进入事件场景）
[color=yellow]示例[/color]：lgc to res://little_game/q/test_event.tres
[color=cyan]===========================[/color]"""
		"heal":
			help_text = """[color=cyan]========== heal ==========[/color]
[color=yellow]用法[/color]：lgf heal
[color=yellow]说明[/color]：将玩家HP恢复到满值（用于战斗测试）
[color=yellow]示例[/color]：lgf heal
[color=cyan]===========================[/color]"""
		"kill":
			help_text = """[color=cyan]========== kill ==========[/color]
[color=yellow]用法[/color]：lgf kill
[color=yellow]说明[/color]：立即击杀当前敌人（用于快速结束战斗测试）
[color=yellow]示例[/color]：lgf kill
[color=cyan]===========================[/color]"""
		"reset_sp":
			help_text = """[color=cyan]========== reset_sp ==========[/color]
[color=yellow]用法[/color]：lgf reset_sp
[color=yellow]说明[/color]：将玩家SP重置为最大值的一半
[color=yellow]示例[/color]：lgf reset_sp
[color=cyan]================================[/color]"""
		"get_skill":
			help_text = """[color=cyan]========== get_skill ==========[/color]
[color=yellow]用法[/color]：lgf get_skill <技能路径> <阵营>
[color=yellow]说明[/color]：将技能添加到战斗技能池
[color=yellow]阵营参数[/color]：0=玩家，1=敌人
[color=yellow]示例[/color]：lgf get_skill res://skill.tres 0
[color=cyan]==================================[/color]"""
		"add_buff":
			help_text = """[color=cyan]========== add_buff ==========[/color]
[color=yellow]用法[/color]：lgf add_buff <Buff路径> <层数> <阵营>
[color=yellow]说明[/color]：给指定阵营添加Buff
[color=yellow]阵营参数[/color]：0=玩家，1=敌人
[color=yellow]示例[/color]：lgf add_buff res://buff/blood.tres 5 0
[color=cyan]==================================[/color]"""
		
		
		_:
			text_node.append_text("[color=red]ERR:UnknownCommand: " + cmd + "[/color]\n")
			text_node.append_text("[color=gray]输入 help 查看所有可用命令[/color]\n")
			return
	text_node.append_text(help_text + "\n")
#endregion
