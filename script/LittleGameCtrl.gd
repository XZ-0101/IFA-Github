extends Node
var value_array:Array[int]=[0,0,0,0]
var n_value_array:Array[int]=[0,0,0,0]
var hp:int=30
var n_hp:int=30
var sp:int=30
var n_sp:int=30

var gift_array:Array[jumper_class]=[]
var gift_text_arr:Array[String]
var panic:bool=false
var over_mode:int
var now_q:question
var now_card:deck_box
var now_f:enemy_lg
var now_level:int
var now_point:int
var max_level:int
var max_point:int
var in_fight:bool=false
var skill_arr:Array[skill_lt]

@export var useful_gift_arr:Array[jumper_class]
var deck_pool:Array[deck_box]
var h_deck_pool:Array[deck_box]
var nm_deck_pool:Array[deck_box]
var gift_text=["教学用E.G.O\n-最大生命值+2\n-最大精神值+2",
"赎罪\n-使生命值上限增加正义等级的1/5（向下取整）",
"牛奶咖啡\n-如果自律等级大于10，则使精神值上限加5",
"卡密拉\n-将勇气等级增加自己最大生命值与生命值之差"
]
func _process(delta: float) -> void:
	hp=30
	sp=30
	
	
	n_value_array[0]=value_array[0]
	n_value_array[1]=value_array[1]
	n_value_array[2]=value_array[2]
	n_value_array[3]=value_array[3]
	gift_text_arr=[]
	if useful_gift_arr:
		if useful_gift_arr[0] in gift_array:
			hp+=2
			sp+=2
			gift_text_arr.append(gift_text[0])
		if useful_gift_arr[1] in gift_array:
			hp+=floor(n_value_array[3]*0.2)

			gift_text_arr.append(gift_text[1])
		if useful_gift_arr[2] in gift_array:
			if n_value_array[2] >10:
				sp+=5

			gift_text_arr.append(gift_text[2])
		if useful_gift_arr[3] in gift_array:
			n_value_array[0]+=hp-n_hp
			gift_text_arr.append(gift_text[3])
	hp=hp+n_value_array[0]
	sp=sp+n_value_array[1]
	if n_hp>hp:
		n_hp=hp
	if n_sp>sp:
		n_sp=sp
	if n_sp<=0:
		panic=true
	else :
		panic=false
