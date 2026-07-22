##管理整个项目的全局变量
extends Node

var is_load_gif:bool=true 
var mouse_index:int=0
var going_to_load_screen:PackedScene ##正要加载的场景
var going_to_load:Resource ##正要加载的资源
var going_to_gif:gif_array ##正要加载的动图
var going_to_music:music_class
var going_to_Documentation:Documentation_class
var going_to_Load_type:String
var going_to_load_jump_saver:jump_saver
var going_to_load_res:Resource
var is_going_to_load_jump_saver:bool=false
var jumped_list=[load("res://screen/main.tscn")]
var jump_saver_list:Array[jump_saver]=[jump_saver.new()] ##@deprecated: 已弃用
var h2d:bool=true
var f_index:int=0
var f_path:String="res://res/Font/n.tres"
var asked_Permission:bool=false ##是否获得了权限
var fun_mode:bool=false
var going_to_web:String 
var v="B.01.22.1" ##项目版本号
var is_lg_version:bool=false
var is_changed_theme:bool
var now_theme:Theme =load("res://res/theme.tres")
var our_dir:String=OS.get_executable_path().get_base_dir()
signal music_over
var 收藏夹:Array[jumper_class]=[]
var a_fun_list=[load("res://res_pack/O-05-47/img/DontTouchMe.webp"),
load("res://img/I-1513167768.webp"),
load("res://img/Magic3.webp"),
load("res://img/lc-a/o-00-00/3F-0.webp"),
load("res://img/lc-a/o-03-03/I.webp"),
load("res://img2/LCA/O-01-12/I-0.webp"),
load("res://img2/LCA/O-04-08/I-1513156783.webp"),
load("res://img2/LCA/T-04-06/I-1513169944.webp"),
load("res://res_pack/o-01-15/img/I-1513176183.webp"),
load("res://res_pack/f-05-32/img/I-1513171428.webp"),
load("res://res_pack/O-05-47/img/DontTouchMe.webp")

]
var gif_list={
	"n1":"res://res/lobotomy/n1.tres",
	"n2":"res://res/lobotomy/n2.tres",
	"g1":"res://res/lobotomy/g1.tres",
	"g2":"res://res/lobotomy/g2.tres",
	"g4":"res://res/gif/g4.tres",
	"g5":"res://res/gif/g5.tres",
	"g6":"res://res/gif/g6.tres",
	"g7":"res://res/gif/g7.tres",
	"g8":"res://res/gif/g8.tres",
	"g9":"res://res/gif/g9.tres",
	"g10":"res://res/gif/g10.tres",
	"g11":"res://res/gif/g11.tres",
	"g12":"res://res/gif/g12.tres",
	"g13":"res://res/gif/g13.tres",
	"g14":"res://res/gif/g14.tres",
	"g15":"res://res/gif/g15.tres",
	"g16":"res://res/gif/g16.tres",
	"g17":"res://res/gif/g17.tres",
	"g18":"res://res/gif/g18.tres",
	"g19":"res://res/gif/g19.tres",
	"g20":"res://res/gif/g20.tres",
	"g21":"res://res/gif/g21.tres",
	"g22":"res://res/gif/g22.tres",
	"g23":"res://res/gif/g23.tres",
	"g24":"res://res/gif/g24.tres",
	"g25":"res://res/gif/g25.tres",
	"g26":"res://res/gif/g26.tres",
	"g27":"res://res/gif/g27.tres",
	"g28":"res://res/gif/g28.tres",
	"g29":"res://res/gif/g29.tres",
	"g30":"res://res/gif/g30.tres",

}
var jumper_list={
	"documentation0":"res://res/jumper/documentation0.tres",
	"d-0303":"res://res/jumper/documentation-o0303.tres",
	
	"LbEgo0":"res://res/jumper/LbEgo0.tres",
	"LbEgo1":"res://res/jumper/LbEgo1.tres",
	"LbEgo2":"res://res/jumper/LbEgo2.tres",
	
	"music_test":"res://res/jumper/music_test.tres",
	
	"O-00-00":"res://res/jumper/O-00-00.tres",
	
	"F-01-02":"res://res/jumper/F-01-02-jumper.tres",
	"f-01-02-s":"res://res/jumper/lbego-f-01-02-s.tres",
	"f-01-02-w":"res://res/jumper/lbego-f-01-02-w.tres",
	"f-01-02-g":"res://res/jumper/f-01-02-g-jumper.tres",
	
	"o-03-03":"res://res/jumper/o-03-03-jumper.tres",
	"o-03-03-s":"res://res/jumper/lbego-o-03-03-s.tres",
	"o-03-03-w":"res://res/jumper/lbego-o-03-03-w.tres",
	"o-03-03-g":"res://res/jumper/o-03-03-g-jumper.tres",
	
	"o-01-04-g":"res://res/jumper/o-01-04-g-jumper.tres",
	"O-01-04":"res://res/jumper/o-01-04-jumper.tres",
	"o-01-04-w":"res://res/jumper/o-01-04-w-j.tres",
	"o-01-04-s":"res://res/jumper/o-01-04-s-j.tres",
	
	"t-04-06":"res://res/jumper/t-04-06.tres",
	"t-04-06-g":"res://res/jumper/t-04-06-g.tres",
	"t-04-06-w":"res://res/jumper/t-04-06-w.tres",
	"t-04-06-s":"res://res/jumper/t-04-06-s.tres",
	
	"o-04-08":"res://res/jumper/o-04-08-j.tres",
	"o-04-08-g":"res://res/jumper/o-04-08-g.tres",
	"o-04-08-s":"res://res/jumper/o-04-08-s.tres",
	"o-04-08-w":"res://res/jumper/o-04-08-w.tres",
	
	"d-01-110":"res://res_pack/D-01-110/d-01-110-j.tres",
	"d-01-110-w":"res://res_pack/D-01-110/EGO/D-01-110-w-j.tres",
	"d-01-110-s":"res://res_pack/D-01-110/EGO/D-01-110-s-j.tres",
	"d-01-110-g":"res://res_pack/D-01-110/EGO/D-01-110-g-j.tres",
	
	"t-06-27":"res://res_pack/T_06_27/t-06-27-j.tres",
	"t-06-27-s":"res://res_pack/T_06_27/ego/t-06-27-s-j.tres",
	"t-06-27-g":"res://res_pack/T_06_27/ego/t-06-27-g-j.tres",
	
	"t-01-75":"res://res_pack/t-01-75/t-01-75-j.tres",
	"t-01-75-g":"res://res_pack/t-01-75/ego/t-01-75-g-j.tres",
	"t-01-75-s":"res://res_pack/t-01-75/ego/t-01-75-s-j.tres",
	"t-01-75-w":"res://res_pack/t-01-75/ego/t-01-75-w-j.tres",
	
	"o-05-61":"res://res_pack/o-05-61/o-05-61-j.tres",
	"o-05-61-g1":"res://res_pack/o-05-61/ego/o-05-61-g1-j.tres",
	"o-05-61-g2":"res://res_pack/o-05-61/ego/o-05-61-g2-j.tres",
	"o-05-61-g3":"res://res_pack/o-05-61/ego/o-05-61-g3-j.tres",
	"o-05-61-g4":"res://res_pack/o-05-61/ego/o-05-61-g4-j.tres",
	"o-05-61-s":"res://res_pack/o-05-61/ego/o-05-61-s-j.tres",
	"o-05-61-w":"res://res_pack/o-05-61/ego/o-05-61-w-j.tres",
	
	"o-01-15":"res://res_pack/o-01-15/o-01-15-j.tres",
	"o-01-15-g":"res://res_pack/o-01-15/ego/o-01-15-g-j.tres",
	"o-01-15-s":"res://res_pack/o-01-15/ego/o-01-15-s-j.tres",
	"o-01-15-w":"res://res_pack/o-01-15/ego/o-01-15-w-j.tres",
	
	"f-05-32":"res://res_pack/f-05-32/f-05-32-j.tres",
	"f-05-32-g":"res://res_pack/f-05-32/ego/f-05-32-g-j.tres",
	"f-05-32-s":"res://res_pack/f-05-32/ego/f-05-32-s-j.tres",
	"f-05-32-w":"res://res_pack/f-05-32/ego/f-05-32-w-j.tres",
	
	"f-01-37":"res://res_pack/f-01-37/f-01-37-j.tres",
	"f-01-37-w":"res://res_pack/f-01-37/ego/f-01-37-w-j.tres",
	"f-01-37-s":"res://res_pack/f-01-37/ego/f-01-37-s-j.tres",
	"f-01-37-g":"res://res_pack/f-01-37/ego/f-01-37-g-j.tres",
	
	"o-05-30":"res://res_pack/o-05-30/o-05-30-j.tres",
	"o-05-30-w":"res://res_pack/o-05-30/ego/o-05-30-w-j.tres",
	"o-05-30-g":"res://res_pack/o-05-30/ego/o-05-30-g-j.tres",
	
	"t-05-41":"res://res_pack/t-05-41/t-05-41-j.tres",
	"t-05-41-w":"res://res_pack/t-05-41/ego/t-05-41-w-j.tres",
	"t-05-41-s":"res://res_pack/t-05-41/ego/t-05-41-s-j.tres",
	"t-05-41-g":"res://res_pack/t-05-41/ego/t-05-41-g-j.tres",
	
	"f-02-49":"res://res_pack/f-02-49/f-02-49-j.tres",
	"f-02-49-w":"res://res_pack/f-02-49/ego/f-02-49-w-j.tres",
	"f-02-49-s":"res://res_pack/f-02-49/ego/f-02-49-s-j.tres",
	"f-02-49-g":"res://res_pack/f-02-49/ego/f-02-49-g-j.tres",
	
	"o-01-55":"res://res_pack/o-01-55/o-01-55-j.tres",
	"o-01-55-w":"res://res_pack/o-01-55/ego/o-01-55-w-j.tres",
	"o-01-55-s":"res://res_pack/o-01-55/ego/o-01-55-s-j.tres",
	"o-01-55-g":"res://res_pack/o-01-55/ego/o-01-55-g-j.tres",
	
	"o-01-67":"res://res_pack/o-01-67/o-01-67-j.tres",
	"o-01-67-w":"res://res_pack/o-01-67/ego/o-01-67-w-j.tres",
	"o-01-67-s":"res://res_pack/o-01-67/ego/o-01-67-s-j.tres",
	"o-01-67-g":"res://res_pack/o-01-67/ego/o-01-67-g-j.tres",
	
	"t-01-68":"res://res_pack/t-01-68/t-01-68-j.tres",
	"t-01-68-w":"res://res_pack/t-01-68/ego/t-01-68-w-j.tres",
	"t-01-68-s":"res://res_pack/t-01-68/ego/t-01-68-s-j.tres",
	"t-01-68-g":"res://res_pack/t-01-68/ego/t-01-68-g-j.tres",
	
	"o-01-12":"res://res/jumper/o-01-12.tres",
	"o-01-12-w":"res://res/jumper/o-01-12-w-j.tres",
	"o-01-12-s":"res://res/jumper/o-01-12-s-j.tres",
	"o-01-12-g":"res://res/jumper/o-01-12-g-j.tres",
	
	"t-09-08":"res://res_pack/t-09-80/t-09-80-j.tres",
}
var mod_list=[]
var get_res_folder_:String

##用于储存描述文本的字典
var text_dic:Dictionary={
	"无来源":"无来源伤害\n没有任何伤害来源的伤害，该伤害计算不受等级压制影响",
	"被控制":"被控制的员工无法执行主管的命令，也无法行动，部分被控制状态可能导致员工在一天结束后死亡"
}
var si_path:String
func jump_to(jumper:jumper_class):
	if jumper.mode=="lobotomyA":
		
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="lobotomy"
		get_tree().change_scene_to_file(jumper.screen_path)
		
		pass
	#
	if jumper.mode=="documentation":
		Get.going_to_Documentation=load(jumper.res_path)
		Get.going_to_Load_type="documentation"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="lobotomyG":
		
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="lobotomy"
		get_tree().change_scene_to_file(jumper.screen_path)
		
		pass
	if jumper.mode=="lobotomyW":
		
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="lobotomy"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	#
	if jumper.mode=="music":
		Get.going_to_music=load(jumper.res_path)
		Get.going_to_Load_type="music"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="lobotomyS":
		
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="lobotomy"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="lobotomyT":
		
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="lobotomyT"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="TEST":
		
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="TEST"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="Unreleased":
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="Unreleased"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="Legacy":
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="Legacy"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="Category":
		Get.going_to_load=load(jumper.res_path)
		Get.going_to_Load_type="Category"
		get_tree().change_scene_to_file(jumper.screen_path)
		pass
	if jumper.mode=="Web":
		Get.going_to_web=jumper.res_path
		Get.going_to_Load_type="Web"
		get_tree().change_scene_to_file(jumper.screen_path)

##@deprecated: 已弃用
func try_(): 
	
	for i in Get.jump_saver_list.size():
			print(i)
			if Get.jump_saver_list[i-1].index==ScreenJumper.index__:
				
				Get.is_going_to_load_jump_saver=true
				Get.going_to_load_jump_saver=Get.jump_saver_list[i-1]
				
				break
			else :
				Get.is_going_to_load_jump_saver=false
