extends Node
var fight_hp_max:int
var fight_hp:int
var fight_sp_max:int
var fight_sp:int

var enemy:enemy_lg
var enemy_hp:int
var enemy_sp:int
var skill_arr:Array[skill_lt]
var buff_pool:Array[buff_lg]
var enemy_buff_pool:Array[buff_lg]
var skill_pool:Array[skill_lt]
var enemy_skill_pool:Array[skill_lt]

var now_skill:skill_lt
var now_enemy_skill:skill_lt
var hit_area:float
var def_area:float
var enemy_hit_area:float
var enemy_def_area:float

var max_point:int
var enemy_max_point:int
#fight_strat,turn_strat,when_point,before_hit,after_hit,before_under_hit,after_under_hit,turn_end
var fight_strat:Array[Executer]
var turn_strat:Array[Executer]
var when_point:Array[Executer]
var before_point:Array[Executer]
var before_hit:Array[Executer]
var after_hit:Array[Executer]
var before_under_hit:Array[Executer]
var after_under_hit:Array[Executer]
var turn_end:Array[Executer]

var gift_eff_arr:Array[gift_value]
var enemy_anima:Node
var self_anima:Node

var who_win:int

var updata_buff_info:Callable 
var hit_num_
var anima_dic={
"text":"res://little_game/fight/scn/text.tscn",
"self_hit":"res://little_game/fight/scn/hit.tscn",
"self_d":"res://little_game/fight/scn/d_an.tscn",
"self_v":"res://little_game/fight/scn/v_an.tscn"
}
var buff_will_e:Array
var do_it_will_e:Array
var turn_num:int=0
var true_turn_num:int=0

@export_multiline var eff_arr:String

func get_gift_in_arr(gift:gift_value):
	return gift.gift_jumper
func get_eff_in_passives(passive:passive_lg):
	passive.eff.team=1
	return passive.eff

func eff_to_team_1(eff:Executer):
	eff.team=1
	return eff
func eff_to_team_0(eff:Executer):
	eff.team=0
	return eff

func Init_value():
	hit_area=1.0
	enemy_hit_area=1.0
	enemy_def_area=0
	def_area=0

func Initialization():
	enemy_hp=enemy.hp
	enemy_sp=roundi(float(enemy.sp)/2)
	fight_hp=LittleGameCtrl.n_hp
	fight_hp_max=LittleGameCtrl.hp
	fight_sp=roundi(float(LittleGameCtrl.n_sp)/2)
	fight_sp_max=LittleGameCtrl.sp
	true_turn_num=0
	turn_num=0
	eff_arr=""
	Init_value()
	
	
	buff_pool.clear()
	
	skill_pool.clear()
	init_arr()
	

func init_arr():
	enemy_buff_pool.clear()
	
	enemy_skill_pool.clear()
	
	
	LittleGameFight.fight_strat.clear()
	LittleGameFight.turn_end.clear()
	LittleGameFight.when_point.clear()
	LittleGameFight.before_hit.clear()
	LittleGameFight.after_hit.clear()
	LittleGameFight.before_under_hit.clear()
	LittleGameFight.after_under_hit.clear()
	LittleGameFight.turn_strat.clear()
	LittleGameFight.before_point.clear()
	
	add_to_time_list(build_gift_eff())
	var el=enemy.passives.map(get_eff_in_passives)
	add_to_time_list(el)
	
func  build_gift_eff():
	var eff:Array[Executer]
	for  i in gift_eff_arr:
		if i.gift_jumper in LittleGameCtrl.gift_array:
			print(i.de)
			i.gift_eff.team=0
			if i.gift_eff:
				eff.append(i.gift_eff)
				print(eff.size())
	return eff

func add_to_time_list(eff_list:Array):
	for i in eff_list:
		if i:
			add_one_to_time_list(i)

func add_one_to_time_list(i:Executer):
	if i:
		get(i.exe_time).append(i)
	#match  i.exe_time:
		#"fight_strat":
			#fight_strat.append(i)
		#"when_point":
			#when_point.append(i)
		#"fight_strat":
			#fight_strat.append(i)
		#"turn_end":
			#turn_end.append(i)
		#"before_hit":
			#before_hit.append(i)
		#"after_hit":
			#after_hit.append(i)
		#"after_under_hit":
			#after_under_hit.append(i)
		#"before_under_hit":
			#before_under_hit.append(i)

func hit(team:int):
	match team:
		0:
			var def_=1-(now_enemy_skill.def + enemy_def_area)/100
			var def=def_ if def_>=0 else 0.0
			var p=roundi(float(max_point)/2)
			var hit_num
			if now_skill.at!=0:
				hit_num =roundi( (now_skill.at + p) * hit_area * def )
			else:
				hit_num=0
			
			print("ourhit:(",now_skill.at,"+",p,")*",hit_area,"*",def,"=",hit_num)
			hit_num_=hit_num if hit_num >=0 else 0
			enemy_hp-=hit_num if hit_num >=0 else 0
			play_anima("text",1,"hit,"+str(hit_num)+",hp")
		
		1:
			var def_=1-(now_skill.def + def_area)/100
			var def=def_ if def_>=0 else 0.0
			var p=roundi(float(enemy_max_point)/2)
			var hit_num
			if now_enemy_skill.at!=0:
				hit_num =roundi( (now_enemy_skill.at + p) * enemy_hit_area * def )
			else:
				hit_num=0
			
			print("enemyhit:(",now_enemy_skill.at,"+",p,")*",enemy_hit_area,"*",def,"=",hit_num)
			hit_num_=hit_num if hit_num >=0 else 0
			fight_hp-=hit_num if hit_num >=0 else 0
			play_anima("text",0,"hit,"+str(hit_num)+",hp")
	

func change_value(team:int,value:String,final):
	var hp= "fight_hp" if team==0 else "enemy_hp"
	var sp= "fight_sp" if team==0 else "enemy_sp"
	var point="max_point" if team==0 else "enemy_max_point"
	var hit_area_="hit_area" if team==0 else "enemy_hit_area"
	var def_area_="def_area" if team==0 else "enemy_def_area"
	match value:
		"hp":
			set(hp,final)
		"sp":
			set(sp,final)
		"point":
			set(point,final)
		"hit_area":
			set(hit_area_,final)
		"def_area":
			set(def_area_,final)
	

func play_anima(anima:String,who:int,x:Variant):
	
	var an_scn=load(anima_dic.get(anima)).instantiate()
	match who:
		0:
			self_anima.add_child(an_scn)
			an_scn.play_a(x)
		1:
			enemy_anima.add_child(an_scn)
			an_scn.play_a(x)
	pass

func add_buff(what:buff_lg,x:int,who:int):
	var array= buff_pool if who==0 else enemy_buff_pool
	var array_id=array.map(get_buff_id)
	var ind=array_id.find(what.id)
	if ind !=-1:
		array[ind].eff.x+=x
	else :
		var new=what.duplicate_deep()
		new.eff.team=who
		new.eff.x=x
		array.append(new)
	var name_=what.name_
	
	play_anima("text",who,"add_buff,"+name_+","+str(x))
	update_buff()
	pass
	
func add_buff_path(what:String,x:int,who:int):
	var w =load(what)
	add_buff(w,x,who)

func get_buff_id(buff:buff_lg):
	return buff.id

func remove_all_buff(who):
	var array= buff_pool if who==0 else enemy_buff_pool
	array.clear()

func remove_buff_path(path:String,who:int):
	remove_buff(load(path),who)

func remove_buff(what:buff_lg,who:int):
	var array= buff_pool if who==0 else enemy_buff_pool
	var array_id=array.map(get_buff_id)
	var ind=array_id.find(what.id)
	if ind !=-1:
		array.remove_at(ind)
	pass
func minus_buff(what:buff_lg,who:int,x_:int):
	var array= buff_pool if who==0 else enemy_buff_pool
	var array_id=array.map(get_buff_id)
	var ind=array_id.find(what.id)
	if ind !=-1:
		array[ind].eff.x-=x_
		update_buff()
	pass
func minus_buff_path(path:String,who:int,x:int):
	var w=load(path)
	minus_buff(w,who,x)

func update_buff():
	update_buff_pool(enemy_buff_pool)
	update_buff_pool(buff_pool)
	updata_buff_info.call()
func update_buff_pool(pool:Array):
	for i in pool:
		if i.eff.x<=0:
			buff_will_e.append(i)
		elif i.eff.x>i.eff.most_x:
			i.eff.x=i.eff.most_x
	erase_queue(buff_will_e,pool)

func remove_skill_inpool(skill:skill_lt,who:int):
	var pool = skill_pool if who==0 else enemy_skill_pool
	pool.erase(skill)
	pass

func add_skill_inpool(skill:skill_lt,who:int):
	var pool = skill_pool if who==0 else enemy_skill_pool
	pool.append(skill)
	pass
	
func do_it_on_time(the_time:String):
	var array:Array[Executer] = get(the_time)
	for i in array:
		if not i.is_who:
			i.exec()
			if i.one_time:
				do_it_will_e.append(i)
				
		else :
			check_do_it(the_time,i)
			if i.one_time:
				do_it_will_e.append(i)
	erase_queue(do_it_will_e,array)
		
func erase_queue(arr:Array,which:Array):
	for i in arr:
		if i in which:
			which.erase(i)
	arr.clear()
	pass

func check_do_it(the_time:String,i:Executer):
	match the_time:
		"before_under_hit","after_under_hit":
			if i.team!=who_win:
				i.exec()
				return true
			else:
				return false
		"before_hit","after_hit":
			if i.team==who_win:
				i.exec()
				return true
			else:
				return false
		_:
			i.exec()
			return true
	
func do_buff_on_time(the_time:String,team:int):
	var array:Array[buff_lg] =  buff_pool if team==0 else enemy_buff_pool
	for i in array:
		if i.eff.exe_time==the_time:
			if  not i.eff.is_who:
				i.eff.exec()
				
				if i.eff.one_time:
					i.eff.x-=1
			else :
				var a =check_do_it(the_time,i.eff)
				if i.eff.one_time and a:
					i.eff.x-=1
	update_buff()
	pass

func do_it(the_time:String):
	sort_all_lists()
	sort_buff_pools()
	do_it_on_time(the_time)
	do_buff_on_time(the_time,1)
	do_buff_on_time(the_time,0)

func get_buff_x_with_type(who:int,type:String):
	var array= buff_pool if who==0 else enemy_buff_pool
	var x_num:int=0
	for i in array:
		if type in i.type:
			x_num+=i.eff.x
	return x_num
	
	

func get_buff_x_with_res(who:int,res_path:String):
	var what =load(res_path)
	var array= buff_pool if who==0 else enemy_buff_pool
	var array_id=array.map(get_buff_id)
	var ind=array_id.find(what.id)
	if ind >-1:
		return array[ind].eff.x
	else:
		return 0
	

func clear_executer_queue() -> void:
	var lists = [before_under_hit, before_hit, after_under_hit, after_hit]
	for list in lists:
		var to_remove = []
		for i in list:
			if i.is_who and i.one_time:
				to_remove.append(i)
		for i in to_remove:
			list.erase(i)
func sort_by_weight(arr: Array) -> void:
	arr.sort_custom(func(a, b):
		return clamp(a.weight, 1, 3) > clamp(b.weight, 1, 3)
	)
func sort_executers_by_weight(a: Executer, b: Executer) -> bool:
	var wa = a.weight if a.weight != null else 2
	var wb = b.weight if b.weight != null else 2
	return wa < wb

func sort_all_lists():
	var all_lists = [
		fight_strat, turn_strat, when_point, before_point,
		before_hit, after_hit, before_under_hit, after_under_hit, turn_end
	]
	for list in all_lists:
		if list.size() > 1:
			list.sort_custom(sort_executers_by_weight)
func sort_buff_pools():
	if buff_pool.size() > 1:
		buff_pool.sort_custom(sort_buff_by_weight)
	if enemy_buff_pool.size() > 1:
		enemy_buff_pool.sort_custom(sort_buff_by_weight)

func sort_buff_by_weight(a: buff_lg, b: buff_lg) -> bool:
	var wa = a.eff.weight if a.eff and a.eff.weight != null else 2
	var wb = b.eff.weight if b.eff and b.eff.weight != null else 2
	return wa < wb
