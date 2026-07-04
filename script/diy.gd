extends Control

var res_pack_Folder:String=''''''
var res_pack:String
var data:String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Get.mod_list!=[]:
		load_res()
	if DirAccess.dir_exists_absolute(Get.our_dir.path_join("res_pack")):
		$get_file.root_subfolder=Get.our_dir.path_join("res_pack")
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	res_pack_Folder= Get.get_res_folder_
	$RichTextLabel2.text="已加载的资源包数量：%d" % [Get.mod_list.size()]
pass


func _on_file_dialog_dir_selected(dir: String) -> void:
	#folder
	Get.get_res_folder_=dir
	print(Get.get_res_folder_)
	$get_file.root_subfolder=Get.get_res_folder_
	$RichTextLabel3.text="已选择资源文件夹"
	pass # Replace with function body.


func _on_get_file_file_selected(path: String) -> void:
	#file
	if OS.get_name()=="Android":
		if OS.request_permissions():
			read_res(path)
			$RichTextLabel3.text="资源文件创建成功"
		else :
			$RichTextLabel3.text="无权限"
	else :
		read_res(path)
		$RichTextLabel3.text="资源文件创建成功"


	
	
	


func _on_button_2_button_down() -> void:
	#if res_pack_Folder=="":
		#OS.alert("请先打开资源文件夹","警告")
	#else:
	$get_file.popup()
	pass # Replace with function body.


func _on_button_button_down() -> void:
	$get_folder.popup()
	pass # Replace with function body.
	
func Translate_to_res(a:Array):
	var type=a.back()
	print(type)
	if type=="1":
		var l=lobotomy.new()
		l.name_=a[0]
		l.icon=load_img_file(a[1])
		l.info_=a[2].format({"n":"\n","e1":",",'e2':'"'})
		l.subject=a[3]
		l.level=a[4]
		l.Attack_Type=a[5].to_int()
		l.acctak_Damage=a[6]
		var pr:Probabilities=Probabilities.new()
		for i in p(a):
			pr.Probabilities.append(i)
		
		l.Probabilities_=pr
		l.most_pe_box=a[11]
		l.good_Mood_Range=a[12]
		l.bad_Mood_Range=a[13]
		l.Norm_Mood_Range=a[14]
		if a[15]=="F":
			l.will_Breakthrough_containment=false
		else :
			l.will_Breakthrough_containment=true
		l.Qliphoth_Counter=a[16]
		l.red_def=a[17].to_float()
		l.white_def=a[18].to_float()
		l.black_def=a[19].to_float()
		l.pale_def=a[20].to_float()
		for i in a[21].split("&"):
			l.Upgrades.append(i)
		l.story=a[22].format({"n":"\n","e1":",",'e2':'"'})
		l.Observation_level=a[23].format({"n":"\n","e1":",",'e2':'"'})
		for i in a[24].split("&"):
			l.flavour_text.append(i)
		l.other_info=a[25].format({"n":"\n","e1":",",'e2':'"'})
		l.other_info_act=a[26].format({"n":"\n","e1":",",'e2':'"'})
		l.price=a[27].format({"n":"\n","e1":",",'e2':'"'})
		if not a[28]=="":
			for i in a[28].split("&"):
				l.texture_array.append(load_img_file(i))
		l.gif="null"
		
		l.jumper=jumper_class.new()
		
		Get.mod_list.append(l)
	if type =="m":
		var m=music_class.new()
		m.ge_ci_path="p"+a[0]+"&"+a[1]
		m.music_path="p"+a[2]+","+res_pack
		m.name_=a[3]
		m.zuo_zhe=a[4]
		m.texture=load_img_file(a[5])
		m.texture1=load_img_file(a[6])
		
		Get.mod_list.append(m)
	elif type == "doc":   # 新增文档类型
		var doc = Documentation_class.new()
		doc.name_ = a[0]
		# 图标路径在 a[1]，需要加载图片
		if a[1] != "":
			doc.icon = load_img_file(a[1])
		else:
			doc.icon = null
		# 文档内容：还原换行符和逗号引号
		doc.str_ = a[2].format({"n": "\n", "e1": ",", "e2": '"'})
		doc.by = a[3]
		Get.mod_list.append(doc)
	pass
func load_img_file(path:String):
	
	var data_ = Zip.reader.read_file(path)
	var image = Image.new()
	var extension = path.get_extension().to_lower()
	var image_format
	match extension:
		"png":
			image_format = "png"
			image.load_png_from_buffer(data_)
		"jpg", "jpeg":
			image_format = "jpg"
			image.load_jpg_from_buffer(data_)
		"webp":
			image_format = "webp"
			image.load_webp_from_buffer(data_)
	
	var texture = ImageTexture.create_from_image(image)
	return texture
func p(a):
		var P1:Probabilities_item=Probabilities_item.new()
		var ap1=a[7].split("&")
		P1.level.set("L1",ap1[0].to_int())
		P1.level.set("L2",ap1[1].to_int())
		P1.level.set("L3",ap1[2].to_int())
		P1.level.set("L4",ap1[3].to_int())
		P1.level.set("L5",ap1[4].to_int())
		
		var P2:Probabilities_item=Probabilities_item.new()
		var ap2=a[8].split("&")
		P2.level.set("L1",ap2[0].to_int())
		P2.level.set("L2",ap2[1].to_int())
		P2.level.set("L3",ap2[2].to_int())
		P2.level.set("L4",ap2[3].to_int())
		P2.level.set("L5",ap2[4].to_int())
		
		var P3:Probabilities_item=Probabilities_item.new()
		var ap3=a[9].split("&")
		P3.level.set("L1",ap3[0].to_int())
		P3.level.set("L2",ap3[1].to_int())
		P3.level.set("L3",ap3[2].to_int())
		P3.level.set("L4",ap3[3].to_int())
		P3.level.set("L5",ap3[4].to_int())
		
		var P4:Probabilities_item=Probabilities_item.new()
		var ap4=a[10].split("&")
		P4.level.set("L1",ap4[0].to_int())
		P4.level.set("L2",ap4[1].to_int())
		P4.level.set("L3",ap4[2].to_int())
		P4.level.set("L4",ap4[3].to_int())
		P4.level.set("L5",ap4[4].to_int())
		return [P1,P2,P3,P4]


func _on_button_3_button_down() -> void:
	load_res()
	pass # Replace with function body.
func read_res(path:String):
	#if OS.get_name()=="Android":
		#res_pack_Folder=OS.get_user_data_dir()+"/res"
	#else :
		#var path_a=path.split("/")
		#path_a.remove_at(path_a.size()-1)
		#path_a.remove_at(path_a.size()-1)
#
		#print(path_a)
		#var f_path:String
		#for i in path_a:
			#f_path+=i+"/"
		#f_path.erase(f_path.length()-1)
		#res_pack_Folder=f_path
	Zip.reader.open(path)
	res_pack=path
	var dir=Zip.reader.get_files()[0]
	var b
	if dir.ends_with("csv"):
		b=Zip.reader.read_file(dir)
	else :
		print(dir+"模板.csv")
		b=Zip.reader.read_file(dir+"模板.csv")
	
	var data_=b.get_string_from_utf8().split("\n")[2]
	var data_array=data_.split(",")
	print(data_array)
	Translate_to_res(data_array)
	


func _on_button_4_button_down() -> void:
	for i in $ScrollContainer/VBoxContainer.get_children():
		i.queue_free()
	Get.mod_list=[]
	$RichTextLabel3.text="资源包已清除"
	pass # Replace with function body.
func  load_res():
	for i in $ScrollContainer/VBoxContainer.get_children():
		i.queue_free()
	for i in Get.mod_list:
		var b=preload("res://screen/jump_button.tscn").instantiate()
		b.res=i
		$ScrollContainer/VBoxContainer.add_child(b)
