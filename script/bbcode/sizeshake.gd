@tool
class_name ShakeScaleEffect
extends RichTextEffect

var bbcode = "shakescale"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var amp = float(char_fx.env.get("amp", 0.05))
	var step_freq = float(char_fx.env.get("step", 5.0))  # 每秒跳变次数
	var sync = bool(char_fx.env.get("sync", false))      # true 表示所有字符同步抖动
	
	# 计算当前时间步（整数），用于产生跳变
	var time_step = int(floor(char_fx.elapsed_time * step_freq))
	
	# 生成随机种子：如果同步，用固定种子；否则用 relative_index 区分
	var seed_val = time_step if sync else (time_step + char_fx.relative_index * 1000)
	
	# 用 hash 生成伪随机数（0~1 之间）
	var rand_val = float(hash(seed_val) % 10000) / 10000.0  # 0~1
	# 转为 -1~1，取绝对值后放大，得到 1.0~1.0+amp
	var scale_val = 1.0 + abs(rand_val * 2.0 - 1.0) * amp
	
	# 应用缩放
	var t = char_fx.transform
	t = t.scaled(Vector2(scale_val, scale_val))
	char_fx.transform = t
	
	return true
