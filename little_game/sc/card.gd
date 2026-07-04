extends Resource
class_name deck_box
@export var name_:String
@export var type:Array[String]
@export var card:Array[question]
@export var is_trun:bool=false
@export var img:Texture2D
@export var img_off:Vector2=Vector2(-1.625,-0.355)
@export var img_sx:float=3.0
@export var img_sy:float=3.0
@export var max_point:int=5
@export var fate_cards:Array[question]
@export var fate_points:Array[String]
