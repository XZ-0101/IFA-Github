
extends Label
class_name NewLbael

@export var min_font_size: int = 10		# 最小字号
@export var max_font_size: int = 200	# 最大字号
@export var padding: int = 10			# 左右安全边距

func _ready():
	# 强制单行模式（不换行）
	autowrap_mode = TextServer.AUTOWRAP_OFF
	# 当控件大小改变时重新适配
	resized.connect(_update_font_size)
	# 初次适配（等待一帧确保父容器尺寸已确定）
	call_deferred("_update_font_size")

# 重写 set_text，方便动态改文字时自动适配
func _set_text(new_text: String) -> void:
	super.set_text(new_text)
	call_deferred("_update_font_size")

# 核心适配逻辑（二分查找法，性能优秀）
func _update_font_size() -> void:
	if text.is_empty():
		return

	# 获取控件的可用宽度
	var max_width = size.x - padding * 2

	# 如果 Label 本身还没尺寸，尝试获取父容器的尺寸
	if max_width <= 0 and get_parent() is Control:
		max_width = (get_parent() as Control).size.x - padding * 2

	if max_width <= 0:
		return  # 尺寸还未就绪，跳过此次计算

	var font = get_theme_font("font")
	var low = min_font_size
	var high = max_font_size
	var best_size = min_font_size

	# 二分查找最合适的字号
	while low <= high:
		var mid = floor((low + high) / 2)
		# 计算当前字号下的文本宽度
		var text_width = font.get_string_size(text, horizontal_alignment, -1, mid).x

		if text_width <= max_width:
			best_size = mid
			low = mid + 1   # 尝试更大一点的字号
		else:
			high = mid - 1  # 字号太大了，缩小

	# 应用最终计算出的字号
	add_theme_font_size_override("font_size", best_size)
