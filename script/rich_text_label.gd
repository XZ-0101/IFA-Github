extends RichTextLabel
class_name NewRichTextLabel
@export var auto_add_full := true
@export var auto_add_copy := true

const WITHOUT_FULL := "§without_full"
const WITHOUT_COPY := "§without_copy"
const FULL_LINK := "[url=show]全屏[/url]"
const COPY_LINK := "[url=copy]复制[/url]"

func _set(property: StringName, value: Variant) -> bool:
	if property == &"text":
		var raw := str(value)
		var skip_full := WITHOUT_FULL in raw
		var skip_copy := WITHOUT_COPY in raw
		var clean := raw.replace(WITHOUT_FULL, "").replace(WITHOUT_COPY, "")
		
		# 检测原始文本中是否已经包含链接（避免重复添加）
		var has_full_link := FULL_LINK in clean
		var has_copy_link := COPY_LINK in clean
		
		var final_text := ""
		if auto_add_full and not skip_full and not has_full_link:
			final_text += FULL_LINK + "\n"
		if auto_add_copy and not skip_copy and not has_copy_link:
			final_text += COPY_LINK + "\n"
		final_text += clean
		
		set_text(final_text)
		return true
	return false
# Called when the node enters the scene tree for the first time.
func _ready():
	# 只连一次，安全第一
	if not meta_clicked.is_connected(_on_meta_clicked):
		meta_clicked.connect(_on_meta_clicked)
	
	if not meta_hover_started.is_connected(_on_meta_hover_started):
		meta_hover_started.connect(_on_meta_hover_started)
	
	if not meta_hover_ended.is_connected(_on_meta_hover_ended):
		meta_hover_ended.connect(_on_meta_hover_ended)
	
	selection_enabled=Get.is_select_text
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	
	pass

#一般用[hint]代替，非一般情况用这个
func _on_meta_clicked(meta: Variant) -> void:
	var meta_=str(meta)
	
	if meta_.begins_with("j"):
		var p=meta_.erase(0)
		Get.jumped_list.append(load(p))
		Get.jump_to(load(p))
		pass
	elif meta_.begins_with("a"):
		var p=meta_.erase(0).split("&s")[1]
		Get.jumped_list.append(load(p))
		Get.jump_to(load(p))
		TextLayer.hide_panel()
		pass
	elif meta_.begins_with("t") :
		if OS.get_name()=="Android":
			if not TextLayer.is_open:
				TextLayer.is_up=true
				TextLayer.is_start_timer=true
				TextLayer.show_panel(meta_.erase(0))
			else :
				TextLayer.hide_panel()
	elif meta_.begins_with("n") :
		if OS.get_name()=="Android":
			if not TextLayer.is_open:
				TextLayer.is_start_timer=true
				TextLayer.is_up=true
				var t =Get.text_dic.get(meta_.erase(0))
				TextLayer.show_panel(t)
			else :
				TextLayer.hide_panel()
	elif meta_.begins_with("show"):
		FullShowText.show_text(text)
		pass
	elif meta_.begins_with("copy"):
		DisplayServer.clipboard_set(get_parsed_text())
	else :
		OS.shell_open(meta_)
	pass # Replace with function body.





func _on_meta_hover_started(meta: Variant) -> void:
	var meta_=str(meta)
	if meta_.begins_with("t") :
		if not TextLayer.is_open:
			TextLayer.is_up=false
			TextLayer.show_panel(meta_.erase(0))
	if meta_.begins_with("a"):
		if not TextLayer.is_open:
			TextLayer.is_up=true
			TextLayer.show_panel(meta_.erase(0).split("&s")[0],self.global_position)
	if meta_.begins_with("n") :
		if not TextLayer.is_open:
			TextLayer.is_up=false
			var t =Get.text_dic.get(meta_.erase(0))
			TextLayer.show_panel(t)
		pass
	pass # Replace with function body.


func _on_meta_hover_ended(meta: Variant) -> void:
	TextLayer.hide_panel()
	pass # Replace with function body.
