extends Resource
class_name enemy_lg
@export var name_:String
@export var img:Texture2D
@export_multiline var description:String
@export var hp:int
@export var sp:int
@export var passives:Array[passive_lg]
@export var skill_array:Array[skill_lt]
@export var panic_skill:skill_lt
@export var action_play:Array[String]
@export var music:music_class
@export var gift:lg_gift
@export var next_enemy:enemy_lg
