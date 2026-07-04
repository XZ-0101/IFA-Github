extends choice
class_name rich_choice
@export var 介绍:String
@export var mode:int
#mode:1-判定
@export var is_shop:bool=false
@export var check_object:int
@export var value:int
#mode:2-检查物品
@export var need:Array[jumper_class]
@export_multiline var win_text:String
@export_multiline var lose_text:String
@export var lose_question:question
@export var gift:lg_gift
@export var losegift:lg_gift
