extends "res://script/lobotomy_page_load.gd"

var ind:int=0
@export var tab:TabContainer
@export var is_drag:bool=true


var touch_start_pos: Vector2
# 最小滑动距离阈值（像素），防误触
const SWIPE_THRESHOLD: int = 50

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start_pos = event.position
		else:
			var delta = event.position - touch_start_pos
			if delta.length() < SWIPE_THRESHOLD:
				return   # 太短，忽略（点击或抖动）
			
			# 只处理水平滑动（水平位移大于垂直位移）
			if abs(delta.x) > abs(delta.y):
				if delta.x > 0:
					right()
				else:
					left()
			# 否则是垂直或斜向滑动，不做任何事

func right() -> void:
	ind += 1
	var count := tab.get_tab_count()
	if ind >= count:
		ind = 0   # 循环到第一页
	tab.current_tab = ind
	print("切换到: ", ind)   # 调试

func left() -> void:
	ind -= 1
	var count := tab.get_tab_count()
	if ind < 0:
		ind = count - 1   # 循环到最后一页
	tab.current_tab = ind
	print("切换到: ", ind)   # 调试
