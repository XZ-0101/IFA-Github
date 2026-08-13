extends Control

@export var text :String
@export var text2:String
@export var index:int
@export var mode :int=1
func _ready() -> void:
	if mode==1:
		%RichTextLabel.show()
		%NinePatchRect.show()
		%Label.show()
		%TextureRect.hide()
		%RichTextLabel3.hide()
		%RichTextLabel2.hide()
		%TextureRect2.hide
		%RichTextLabel.text=tr("[url=show]全屏[/url]\n")+tr(text)
		%Label.text="管理须知"+str(index)
	elif mode==2 :
		%TextureRect.show()
		%RichTextLabel3.hide()
		%RichTextLabel2.show()
		%RichTextLabel.hide()
		%NinePatchRect.hide()
		%TextureRect2.hide()
		%Label.hide()
		%RichTextLabel2.text=tr("[url=show]全屏[/url]\n")+tr(text)
		%RichTextLabel3.text=tr("[url=show]全屏[/url]\n")+tr(text2)
	else :
		%TextureRect.hide()
		%RichTextLabel3.show()
		%RichTextLabel2.hide()
		%RichTextLabel.hide()
		%NinePatchRect.hide()
		%TextureRect2.show()
		%Label.hide()
		%RichTextLabel3.text=tr("[url=show]全屏[/url]\n")+tr(text2)
		pass


func _on_rich_text_label_2_meta_clicked(meta: Variant) -> void:
	pass # Replace with function body.
