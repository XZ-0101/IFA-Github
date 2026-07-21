extends Resource
class_name Executer
@export_multiline var code:String
@export_enum("fight_strat","turn_strat","when_point","before_point","before_hit","after_hit","before_under_hit","after_under_hit","turn_end") var exe_time:String
@export var who:String
@export var is_who:bool
@export var one_time:bool
@export_multiline var func_code:String="pass"
#export var description:String
var basic_code="\nfunc run():\n	{code}\n	queue_free()"
var team:int
var exe_body:Node

#var fight_hp_max:int
#var fight_hp:int
#var skill_arr:Array[skill_lt]
#var buff_pool:Array[buff_lg]
#var now_skill:skill_lt
#var hit_area:float
#var def_area:float

func create_scr():
	var s =GDScript.new()
	var code_=build_var()+basic_code.format({"code":code.replace("\n","\n	")}) 
	#print("===== 生成的脚本 =====")
	#print(code_)
	#print("=====================")
	s.source_code=code_
	var error = s.reload()
	if error != OK:
		print("Executer 编译失败: ", error)
		print("错误代码:\n", code_)
		return
	exe_body=Node.new()
	exe_body.set_script(s)
	
func exec():
	create_scr()
	exe_body.call("run")
func build_var() -> String:
	
	var res_text = "\nextends Node\nvar Fight = LittleGameFight\nfunc get_enemy(t:int):\n	return abs(t-1)\n"
	match team:
		0:  # 玩家阵营
			# ========== 己方可读写属性（setter/getter 直接修改 Fight 玩家数据） ==========
			res_text += "var max_point:\n\tset(value):\n\t\tFight.max_point = value\n\tget:\n\t\treturn Fight.max_point\n"
			res_text += "var hp:\n\tset(value):\n\t\tFight.fight_hp = value\n\tget:\n\t\treturn Fight.fight_hp\n"
			res_text += "var hp_max:\n\tset(value):\n\t\tFight.fight_hp_max = value\n\tget:\n\t\treturn Fight.fight_hp_max\n"
			res_text += "var sp:\n\tset(value):\n\t\tFight.fight_sp = value\n\tget:\n\t\treturn Fight.fight_sp\n"
			res_text += "var sp_max:\n\tset(value):\n\t\tFight.fight_sp_max = value\n\tget:\n\t\treturn Fight.fight_sp_max\n"
			res_text += "var hit_area:\n\tset(value):\n\t\tFight.hit_area = value\n\tget:\n\t\treturn Fight.hit_area\n"
			res_text += "var def_area:\n\tset(value):\n\t\tFight.def_area = value\n\tget:\n\t\treturn Fight.def_area\n"
			res_text += "var skill_arr:\n\tget:\n\t\treturn Fight.skill_arr\n\tset(value):\n\t\tFight.skill_arr = value\n"
			res_text += "var buff_pool:\n\tget:\n\t\treturn Fight.buff_pool\n\tset(value):\n\t\tFight.buff_pool = value\n"
			res_text += "var skill_pool:\n\tget:\n\t\treturn Fight.skill_pool\n\tset(value):\n\t\tFight.skill_pool = value\n"
			res_text += "var now_skill:\n\tget:\n\t\treturn Fight.now_skill\n\tset(value):\n\t\tFight.now_skill = value\n"
			
			# ========== 敌方可读写属性（修改 Fight 敌方数据） ==========
			res_text += "var emax_point:\n\tset(value):\n\t\tFight.enemy_max_point = value\n\tget:\n\t\treturn Fight.enemy_max_point\n"
			res_text += "var ehp:\n\tset(value):\n\t\tFight.enemy_hp = value\n\tget:\n\t\treturn Fight.enemy_hp\n"
			res_text += "var ehp_max:\n\tset(value):\n\t\tFight.enemy.hp = value\n\tget:\n\t\treturn Fight.enemy.hp\n"
			res_text += "var esp:\n\tset(value):\n\t\tFight.enemy_sp = value\n\tget:\n\t\treturn Fight.enemy_sp\n"
			res_text += "var esp_max:\n\tset(value):\n\t\tFight.enemy.sp = value\n\tget:\n\t\treturn Fight.enemy.sp\n"
			res_text += "var ehit_area:\n\tset(value):\n\t\tFight.enemy_hit_area = value\n\tget:\n\t\treturn Fight.enemy_hit_area\n"
			res_text += "var edef_area:\n\tset(value):\n\t\tFight.enemy_def_area = value\n\tget:\n\t\treturn Fight.enemy_def_area\n"
			res_text += "var ebuff_pool:\n\tget:\n\t\treturn Fight.enemy_buff_pool\n\tset(value):\n\t\tFight.enemy_buff_pool = value\n"
			res_text += "var eskill_pool:\n\tget:\n\t\treturn Fight.enemy_skill_pool\n\tset(value):\n\t\tFight.enemy_skill_pool = value\n"
			res_text += "var enow_skill:\n\tget:\n\t\treturn Fight.now_enemy_skill\n\tset(value):\n\t\tFight.now_enemy_skill = value\n"
			res_text += "var eskill_arr:\n\tget:\n\t\treturn Fight.enemy.skill_array\n\tset(value):\n\t\tFight.enemy.skill_array = value\n"
			res_text += "var team = 0\n"
		1:  # 敌人阵营
			# ========== 己方可读写属性（修改 Fight 敌方数据，因为当前为敌人） ==========
			res_text += "var max_point:\n\tset(value):\n\t\tFight.enemy_max_point = value\n\tget:\n\t\treturn Fight.enemy_max_point\n"
			res_text += "var hp:\n\tset(value):\n\t\tFight.enemy_hp = value\n\tget:\n\t\treturn Fight.enemy_hp\n"
			res_text += "var hp_max:\n\tset(value):\n\t\tFight.enemy.hp = value\n\tget:\n\t\treturn Fight.enemy.hp\n"
			res_text += "var sp:\n\tset(value):\n\t\tFight.enemy_sp = value\n\tget:\n\t\treturn Fight.enemy_sp\n"
			res_text += "var sp_max:\n\tset(value):\n\t\tFight.enemy.sp = value\n\tget:\n\t\treturn Fight.enemy.sp\n"
			res_text += "var hit_area:\n\tset(value):\n\t\tFight.enemy_hit_area = value\n\tget:\n\t\treturn Fight.enemy_hit_area\n"
			res_text += "var def_area:\n\tset(value):\n\t\tFight.enemy_def_area = value\n\tget:\n\t\treturn Fight.enemy_def_area\n"
			res_text += "var skill_arr:\n\tget:\n\t\treturn Fight.enemy.skill_array\n\tset(value):\n\t\tFight.enemy.skill_array = value\n"
			res_text += "var buff_pool:\n\tget:\n\t\treturn Fight.enemy_buff_pool\n\tset(value):\n\t\tFight.enemy_buff_pool = value\n"
			res_text += "var skill_pool:\n\tget:\n\t\treturn Fight.enemy_skill_pool\n\tset(value):\n\t\tFight.enemy_skill_pool = value\n"
			res_text += "var now_skill:\n\tget:\n\t\treturn Fight.now_enemy_skill\n\tset(value):\n\t\tFight.now_enemy_skill = value\n"
			
			# ========== 敌方可读写属性（修改 Fight 玩家数据） ==========
			res_text += "var emax_point:\n\tset(value):\n\t\tFight.max_point = value\n\tget:\n\t\treturn Fight.max_point\n"
			res_text += "var ehp:\n\tset(value):\n\t\tFight.fight_hp = value\n\tget:\n\t\treturn Fight.fight_hp\n"
			res_text += "var ehp_max:\n\tset(value):\n\t\tFight.fight_hp_max = value\n\tget:\n\t\treturn Fight.fight_hp_max\n"
			res_text += "var esp:\n\tset(value):\n\t\tFight.fight_sp = value\n\tget:\n\t\treturn Fight.fight_sp\n"
			res_text += "var esp_max:\n\tset(value):\n\t\tFight.fight_sp_max = value\n\tget:\n\t\treturn Fight.fight_sp_max\n"
			res_text += "var ehit_area:\n\tset(value):\n\t\tFight.hit_area = value\n\tget:\n\t\treturn Fight.hit_area\n"
			res_text += "var edef_area:\n\tset(value):\n\t\tFight.def_area = value\n\tget:\n\t\treturn Fight.def_area\n"
			res_text += "var ebuff_pool:\n\tget:\n\t\treturn Fight.buff_pool\n\tset(value):\n\t\tFight.buff_pool = value\n"
			res_text += "var eskill_pool:\n\tget:\n\t\treturn Fight.skill_pool\n\tset(value):\n\t\tFight.skill_pool = value\n"
			res_text += "var enow_skill:\n\tget:\n\t\treturn Fight.now_skill\n\tset(value):\n\t\tFight.now_skill = value\n"
			res_text += "var eskill_arr:\n\tget:\n\t\treturn Fight.skill_arr\n\tset(value):\n\t\tFight.skill_arr = value\n"
			res_text += "var team = 1\n"
	return res_text+"\n"+func_code.replace("\n","\n	")
