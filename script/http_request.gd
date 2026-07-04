extends HTTPRequest


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	request("https://lobotomycorp.fandom.com/zh/wiki/%E8%84%91%E5%8F%B6%E5%85%AC%E5%8F%B8_Wiki")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	#print(body.get_string_from_utf8())
	pass # Replace with function body.


func _on_rich_text_label_meta_clicked(meta: Variant) -> void:
 
	var meta_=ProjectSettings.globalize_path(meta)

	OS.shell_open(meta_)
	pass # Replace with function body.
