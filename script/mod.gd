extends Control
var select
var project_name:String="new"
var res_type:String
var NowWritingValueInd:int
var NowReadingFilePath:String
var FileReader:FileAccess
var txt_saver:String
var CsvDataArray:Array[String]
var ImportedResArray:Array[file_saver]
var ReadyResArray:Array[file_saver]
var select_res:int
var project_list:Array[DIYProject]
@export var preview_area:RichTextLabel
@export var ready_res_shower:VBoxContainer
@export var StringEdit:TextEdit
@export var value_choice_node:OptionButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DirAccess.dir_exists_absolute(Get.our_dir.path_join("res_pack")):
		$writer/VBoxContainer/output/FileDialog.root_subfolder=Get.our_dir.path_join("res_pack")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_option_button_item_selected(index: int) -> void:
	#属性选择
	NowWritingValueInd=index
	match res_type:
		"m":
			music_text_cover(index)
			pass
		"1":
			lobotomy_text_cover(index)
			########
		"doc":            # 新增
			documentation_text_cover(index)
		
	pass # Replace with function body.
func music_text_cover(ind):
	match ind:
		1:
			StringEdit.text=CsvDataArray[1]
		3:
			StringEdit.text=CsvDataArray[3]
		4:
			StringEdit.text=CsvDataArray[4]
func lobotomy_text_cover(ind):
	if ind !=1 or ind!=28:
		StringEdit.text=CsvDataArray[ind]
	
func documentation_text_cover(ind):
	if ind < CsvDataArray.size():
		if ind == 2:   # 文档内容保留换行
			StringEdit.text = CsvDataArray[ind].replace("{n}", "\n")
		else:
			StringEdit.text = CsvDataArray[ind].replace("\n", "").replace("{n}", "")
	else:
		StringEdit.text = ""

func _on_button_button_down() -> void:
	#确定
	match res_type:
		"1":
			write_lobotomy_value()
			pass
		"m":
			write_music_value()
		"doc":           # 新增
			write_documentation_value()
	Preview()
	pass # Replace with function body.

func write_documentation_value():
	match NowWritingValueInd:
		0:  # 名称
			CsvDataArray[0] = StringEdit.text.replace("\n", "").replace(",", "{e1}").replace('"', '{e2}')
		1:  # 图标
			if select_res <= ReadyResArray.size() - 1:
				var v = ReadyResArray[select_res]
				ImportedResArray.append(v)
				CsvDataArray[1] = project_name + "/" + v.name_ + "." + v.type
			else:
				OS.alert("请导入图标资源!")
		2:  # 文档内容（保留换行）
			CsvDataArray[2] = StringEdit.text.replace("\n", "{n}").replace(",", "{e1}").replace('"', '{e2}')
		3:  # 作者
			CsvDataArray[3] = StringEdit.text.replace("\n", "").replace(",", "{e1}").replace('"', '{e2}')

func _on_button_2_button_down() -> void:
	$writer/VBoxContainer/input/FileDialog.popup()
	pass # Replace with function body.


func _on_file_dialog_file_selected(path: String) -> void:
	var file_type=path.get_extension().to_lower()
	if file_type=="txt":
		NowReadingFilePath=path
	else :
		var fs =file_saver.new()
		fs.type=file_type
		fs.b=read_file(path)
		fs.name_=path.get_file().get_basename()
		ReadyResArray.append(fs)
		
	
			
	pass # Replace with function body.f_path


func _on_line_edit_text_submitted(new_text: String) -> void:
	#项目名称
	project_name=new_text
	OS.alert("命名成功!")
	
	
	pass # Replace with function body.


func _on_sc_button_down() -> void:
	for i in ready_res_shower.get_children():
		i.queue_free()
	for i in range(0,ReadyResArray.size()) :
		var b =preload("res://screen/a_file_res.tscn").instantiate()
		b.file=ReadyResArray[i]
		b.ind=i
		ready_res_shower.add_child(b)
		var s =b.down as Signal
		s.connect(a_res_file_sc.bind(b.ind))
		b.build()
	$sc_panel.show()
	pass # Replace with function body.

func a_res_file_sc(ind):
	print(ind)
	select_res=ind
	$writer/VBoxContainer/sc_res_text.text="已选择资源:"+ReadyResArray[ind].name_+"."+ReadyResArray[ind].type
func _on_sc_panel_exit_button_down() -> void:
	$sc_panel.hide()
	pass # Replace with function body.


func _on_button_3_button_down() -> void:
	if OS.get_name()=="Windows":
		$writer/VBoxContainer/output/FileDialog.popup()
	else :
		export(OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS))
	
	pass # Replace with function body.


func _on_option_type_selected(index: int) -> void:
	#资料类型选择
	if index==0:
		res_type="m"
	elif  index==1:
		res_type="1"
	elif index == 2:          # 新增
		res_type = "doc"
	pass # Replace with function body.


func _on_bulid_button_down() -> void:
	#创建项目
	if res_type!="" and project_name!="":
		$Panel.hide()
		match res_type:
			"m":
				build_music_res_op()
			"1":
				build_lobotomy_res_op()
			"doc":               # 新增
				build_documentation_res_op()
				
	else :
		OS.alert("请填写项目名称或项目类型")
	pass # Replace with function body.
	
func build_documentation_res_op():
	value_choice_node.clear()
	value_choice_node.add_item("名称")
	value_choice_node.add_item("图标")
	value_choice_node.add_item("文档内容")
	value_choice_node.add_item("作者")
	CsvDataArray = ["", "", "", "","doc"]

func build_music_res_op():
	value_choice_node.add_item("歌词文件")
	value_choice_node.add_item("歌词显示时间")
	value_choice_node.add_item("音乐文件")
	value_choice_node.add_item("歌名")
	value_choice_node.add_item("作者")
	value_choice_node.add_item("图标")
	value_choice_node.add_item("背景")
	CsvDataArray=["","","","","","","","m"]
	pass
func build_lobotomy_res_op():#########!!!!###########
	value_choice_node.add_item("名称")
	value_choice_node.add_item("图标")
	value_choice_node.add_item("提取时文本")
	value_choice_node.add_item("编号")
	value_choice_node.add_item("等级(添小写首字母)")
	value_choice_node.add_item("伤害类型")
	value_choice_node.add_item("伤害区间")
	value_choice_node.add_item("本能偏好")
	value_choice_node.add_item("洞察偏好")
	value_choice_node.add_item("沟通偏好")
	value_choice_node.add_item("压迫偏好")
	value_choice_node.add_item("最大PE-BOX产量")
	value_choice_node.add_item("工作结果为优时对应的PE-BOX产量范围")
	value_choice_node.add_item("工作结果为差时对应的PE-BOX产量范围")
	value_choice_node.add_item("工作结果为良时对应的PE-BOX产量范围")
	value_choice_node.add_item("该异想体是否会突破收容(是为T，否为F)")
	value_choice_node.add_item("逆卡巴拉计数器极值")
	value_choice_node.add_item("物理抗性")
	value_choice_node.add_item("精神抗性")
	value_choice_node.add_item("侵蚀抗性")
	value_choice_node.add_item("灵魂抗性")
	value_choice_node.add_item("管理须知")
	value_choice_node.add_item("故事")
	value_choice_node.add_item("观察等级加成")
	value_choice_node.add_item("工作日志")
	value_choice_node.add_item("异想体解析")
	value_choice_node.add_item("异想体行为")
	value_choice_node.add_item("解锁信息所需PE-BOX")
	value_choice_node.add_item("图册")
	CsvDataArray=["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","1"]

func write_music_value():
	match NowWritingValueInd:
		0:
			if NowReadingFilePath!="":
			
				FileReader=FileAccess.open(NowReadingFilePath,FileAccess.READ)
				txt_saver=FileReader.get_as_text()
				CsvDataArray[0]=project_name+"/"+"l.txt"
				FileReader.close()
			else :
				OS.alert("请选择文件!")
		1:
			CsvDataArray[1]=StringEdit.text.replace("\n","").replace(",","{e1}").replace('"','{e2}')
		2:
			if select_res<=ReadyResArray.size()-1:
				var v=ReadyResArray[select_res]
				ImportedResArray.append(v)
				CsvDataArray[2]=project_name+"/"+v.name_+"."+v.type
			else :
				OS.alert("请导入资源!")
		3:
			print(StringEdit.text.replace("\n","").replace(",","{e1}").replace('"','{e2}'))
			CsvDataArray[3]=StringEdit.text.replace("\n","").replace(",","{e1}").replace('"','{e2}')
		4:
			CsvDataArray[4]=StringEdit.text.replace("\n","").replace(",","{e1}").replace('"','{e2}')
		5:
			if select_res<=ReadyResArray.size()-1:
				var v=ReadyResArray[select_res]
				ImportedResArray.append(v)
				CsvDataArray[5]=project_name+"/"+v.name_+"."+v.type
			else :
				OS.alert("请导入资源!")
		6:
			if select_res<=ReadyResArray.size()-1:
				var v=ReadyResArray[select_res]
				ImportedResArray.append(v)
				CsvDataArray[6]=project_name+"/"+v.name_+"."+v.type
			else :
				OS.alert("请导入资源!")
		
			pass
func write_lobotomy_value():
	if NowWritingValueInd !=1 and NowWritingValueInd !=28:
		print("v is not 1 or 28")
		CsvDataArray[NowWritingValueInd]=StringEdit.text.replace("\n","{n}").replace(",","{e1}").replace('"','{e2}')
	match NowWritingValueInd:
		1:
			print("value1")
			if select_res<=ReadyResArray.size()-1:
				var v=ReadyResArray[select_res]
				ImportedResArray.append(v)
				CsvDataArray[1]=project_name+"/img/"+v.name_+"."+v.type
			else :
				OS.alert("请导入资源!")
		28:
			print("value28")
			CsvDataArray[28]=""
			var t_index= StringEdit.text.split("&")
			for i in t_index:
				var n=i.to_int()
				print(n)
				if n<=ReadyResArray.size()-1:
					var v=ReadyResArray[n]
					ImportedResArray.append(v)
					
					
					CsvDataArray[28]+=project_name+"/img/"+v.name_+"."+v.type+"&"
			if CsvDataArray[28].ends_with("&"):
				CsvDataArray[28]=CsvDataArray[28].erase(CsvDataArray[28].length()-1)
			
				
	pass


func read_file(path):
	FileReader=FileAccess.open(path,FileAccess.READ)
	var b= FileReader.get_buffer(FileReader.get_length())
	FileReader.close()
	return b


func _on_output_file_selected(path: String) -> void:
	
	
	pass # Replace with function body.
	
func Preview():
	var t :String
	match res_type:
		"m":
			t="项目名称:{pn}\n歌名:{name}\n作者:{maker}\n歌词:{l}\n歌词显示时间:{wait}\n音乐文件:{music_path}\n图标:{img1}\n背景:{img}"
			var show_name= CsvDataArray[3] if CsvDataArray[3] else "null"
			var show_maker=CsvDataArray[4] if CsvDataArray[4] else "null"
			var show_l=CsvDataArray[0] if CsvDataArray[0] else "null"
			var show_wait=CsvDataArray[1] if CsvDataArray[1] else "null"
			var show_mp=CsvDataArray[2] if CsvDataArray[2] else "null"
			var show_img1=CsvDataArray[5] if CsvDataArray[5] else "null"
			var show_img=CsvDataArray[6] if CsvDataArray[6] else  "null"
			t=t.format({"pn":project_name,"name":show_name,"maker":show_maker,"l":show_l,"wait":show_wait,"music_path":show_mp,"img1":show_img1,"img":show_img})
			preview_area.text=t
			pass
		"1":
			t="项目名称:{pn}
名称:{name_}
资料图片（添地址）:{icon}
提取时文本:{info_}
编号:{subject}
等级（小写首字母）:{level}
伤害类型（r-p用1-4表示）:{attack type}
伤害区间:{attack damage}
本能偏好:{P1}
洞察偏好:{P2}
沟通偏好:{P3}
压迫偏好:{P4}
最大PE-BOX产量:{most_pe_box}
工作结果为优时对应的PE-BOX产量范围:{good_Mood_Range}
工作结果为差时对应的PE-BOX产量范围:{bad_Mood_Range}
工作结果为良时对应的PE-BOX产量范围:{Norm_Mood_Range}
该异想体是否会突破收容 :{will_Breakthrough_containment}
逆卡巴拉计数器极值:{Qliphoth_Counter}
红色伤害抗性:{red_def}
白色伤害抗性:{white_def}
黑色伤害抗性:{black_def}
蓝色伤害抗性:{pale_def}
管理须知:{Upgrades}
故事:{story}
观察等级加成:{Observation_level}
工作日志:{flavour_text}
异想体解析:{other_info}
异想体行为:{other_info_act}
解锁信息所需独立PE-BOX:{price}
图册:{texture_array}
资源类型:{type}"
			var pn_val = project_name
	# 从 CsvDataArray 按顺序取30个值
			var name_ = CsvDataArray[0] if CsvDataArray.size() > 0 and CsvDataArray[0] else "null"
			var icon = CsvDataArray[1] if CsvDataArray.size() > 1 and CsvDataArray[1] else "null"
			var info_ = CsvDataArray[2] if CsvDataArray.size() > 2 and CsvDataArray[2] else "null"
			var subject = CsvDataArray[3] if CsvDataArray.size() > 3 and CsvDataArray[3] else "null"
			var level = CsvDataArray[4] if CsvDataArray.size() > 4 and CsvDataArray[4] else "null"
			var attack_type = CsvDataArray[5] if CsvDataArray.size() > 5 and CsvDataArray[5] else "null"
			var attack_damage = CsvDataArray[6] if CsvDataArray.size() > 6 and CsvDataArray[6] else "null"
			var P1 = CsvDataArray[7] if CsvDataArray.size() > 7 and CsvDataArray[7] else "null"
			var P2 = CsvDataArray[8] if CsvDataArray.size() > 8 and CsvDataArray[8] else "null"
			var P3 = CsvDataArray[9] if CsvDataArray.size() > 9 and CsvDataArray[9] else "null"
			var P4 = CsvDataArray[10] if CsvDataArray.size() > 10 and CsvDataArray[10] else "null"
			var most_pe_box = CsvDataArray[11] if CsvDataArray.size() > 11 and CsvDataArray[11] else "null"
			var good_Mood_Range_ = CsvDataArray[12] if CsvDataArray.size() > 12 and CsvDataArray[12] else "null"  # 注意占位符有空格
			var bad_Mood_Range = CsvDataArray[13] if CsvDataArray.size() > 13 and CsvDataArray[13] else "null"
			var Norm_Mood_Range = CsvDataArray[14] if CsvDataArray.size() > 14 and CsvDataArray[14] else "null"
			var will_Breakthrough_containment = CsvDataArray[15] if CsvDataArray.size() > 15 and CsvDataArray[15] else "null"
			var Qliphoth_Counter = CsvDataArray[16] if CsvDataArray.size() > 16 and CsvDataArray[16] else "null"
			var red_def = CsvDataArray[17] if CsvDataArray.size() > 17 and CsvDataArray[17] else "null"
			var white_def = CsvDataArray[18] if CsvDataArray.size() > 18 and CsvDataArray[18] else "null"
			var black_def = CsvDataArray[19] if CsvDataArray.size() > 19 and CsvDataArray[19] else "null"
			var pale_def = CsvDataArray[20] if CsvDataArray.size() > 20 and CsvDataArray[20] else "null"
			var Upgrades = CsvDataArray[21] if CsvDataArray.size() > 21 and CsvDataArray[21] else "null"
			var story = CsvDataArray[22] if CsvDataArray.size() > 22 and CsvDataArray[22] else "null"
			var Observation_level = CsvDataArray[23] if CsvDataArray.size() > 23 and CsvDataArray[23] else "null"
			var flavour_text = CsvDataArray[24] if CsvDataArray.size() > 24 and CsvDataArray[24] else "null"
			var other_info = CsvDataArray[25] if CsvDataArray.size() > 25 and CsvDataArray[25] else "null"
			var other_info_act = CsvDataArray[26] if CsvDataArray.size() > 26 and CsvDataArray[26] else "null"
			var price = CsvDataArray[27] if CsvDataArray.size() > 27 and CsvDataArray[27] else "null"
			var texture_array = CsvDataArray[28] if CsvDataArray.size() > 28 and CsvDataArray[28] else "null"
			var type = CsvDataArray[29] if CsvDataArray.size() > 29 and CsvDataArray[29] else "null"
	
			t = t.format({
"pn": pn_val,
"name_": name_,
		"icon": icon,
		"info_": info_,
		"subject": subject,
		"level": level,
		"attack type": attack_type,
		"attack damage": attack_damage,
		"P1": P1,
		"P2": P2,
		"P3": P3,
		"P4": P4,
		"most_pe_box": most_pe_box,
		"good_Mood_Range": good_Mood_Range_,  # 注意键名包含末尾空格
		"bad_Mood_Range": bad_Mood_Range,
		"Norm_Mood_Range": Norm_Mood_Range,
		"will_Breakthrough_containment": will_Breakthrough_containment,
		"Qliphoth_Counter": Qliphoth_Counter,
		"red_def": red_def,
		"white_def": white_def,
		"black_def": black_def,
		"pale_def": pale_def,
		"Upgrades": Upgrades,
		"story": story,
		"Observation_level": Observation_level,
		"flavour_text": flavour_text,
		"other_info": other_info,
		"other_info_act": other_info_act,
		"price": price,
		"texture_array": texture_array,
		"type": type
	})
			preview_area.text = t
		"doc":   # 新增
			var name_val = CsvDataArray[0] if CsvDataArray.size() > 0 else "未填写"
			var icon_val = CsvDataArray[1] if CsvDataArray.size() > 1 else "未填写"
			var content_val = (CsvDataArray[2] if CsvDataArray.size() > 2 else "").replace("{n}", "\n")
			var author_val = CsvDataArray[3] if CsvDataArray.size() > 3 else "未填写"
			t = "项目名称: {pn}\n名称: {name}\n图标: {icon}\n作者: {author}\n\n文档内容:\n{content}"
			t = t.format({
				"pn": project_name,
				"name": name_val,
				"icon": icon_val,
				"author": author_val,
				"content": content_val
			})
			preview_area.text = t
			


func _on_preview_button_down() -> void:
	Preview()
	pass # Replace with function body.


func _on_file_dialog_dir_selected(dir: String) -> void:
	export(dir)
	
	pass # Replace with function body.


func _on_clear_button_down() -> void:
	get_tree().change_scene_to_file("res://screen/mod.tscn")
	pass # Replace with function body.

func export(dir:String):
	print("a")
	var packer=ZIPPacker.new()
	match res_type:
		"m":
			print("ok")
			var csv_text=",,,,,,,\n,,,,,,,\n"
			for i in CsvDataArray:
				if i==CsvDataArray.back():
					csv_text+=i
				else :
					csv_text+=i+","
					
			packer.open(dir+"/"+project_name+".ires")
			OS.alert("目标路径:"+dir+"/"+project_name+".ires")
			
			packer.start_file(project_name+"/模板.csv")
			packer.write_file(csv_text.to_utf8_buffer())
			packer.close_file()
			
			packer.start_file(project_name+"/l.txt")
			packer.write_file(txt_saver.to_utf8_buffer())
			packer.close_file()
			
			for i in ImportedResArray:
				packer.start_file(project_name+"/"+i.name_+"."+i.type)
				packer.write_file(i.b)
				packer.close_file()
			packer.close()
			OS.alert("over!")
		"1":
			print("ok")
			var csv_text="\n\n"
			for i in CsvDataArray:
				if i==CsvDataArray.back():
					csv_text+=i
				else :
					csv_text+=i+","
					
			packer.open(dir+"/"+project_name+".ires")
			OS.alert("目标路径:"+dir+"/"+project_name+".ires")
			
			packer.start_file(project_name+"/模板.csv")
			packer.write_file(csv_text.to_utf8_buffer())
			packer.close_file()
			
			
			
			for i in ImportedResArray:
				packer.start_file(project_name+"/img/"+i.name_+"."+i.type)
				packer.write_file(i.b)
				packer.close_file()
			packer.close()
			OS.alert("over!")
			pass
		"doc":   # 新增
			print("导出文档项目")
			var csv_text = "\n\n"
			for i in CsvDataArray:
				if i == CsvDataArray.back():
					csv_text += i
				else:
					csv_text += i + ","
			packer.open(dir + "/" + project_name + ".ires")
			OS.alert("目标路径:" + dir + "/" + project_name + ".ires")
			packer.start_file(project_name + "/模板.csv")
			packer.write_file(csv_text.to_utf8_buffer())
			packer.close_file()
			for i in ImportedResArray:
				packer.start_file(project_name + "/" + i.name_ + "." + i.type)
				packer.write_file(i.b)
				packer.close_file()
			packer.close()
			OS.alert("文档项目导出完成!")

func read_project(project:DIYProject):
	value_choice_node.clear()
	match res_type:
		"m":
			build_music_res_op()
		"1":
			build_lobotomy_res_op()
		"doc":               # 新增
			build_documentation_res_op()

	project_name=project.project_name
	res_type=project.type
	CsvDataArray=project.csv_data
	ImportedResArray=project.imported_data
	ReadyResArray=project.ready_data
	txt_saver=project.txt
	$Panel2.hide()
	OS.alert("已读取!")
	
	pass

func read_project_list():
	var arr=get_file_paths_in_directory("user://DIYProjects")
	for i in arr:
		project_list.append(load(i))
	
	pass

func rewrite_Project(projec:DIYProject):
	var new_project=projec
	new_project.project_name=project_name
	new_project.type=res_type
	var time =Time.get_datetime_dict_from_system()
	new_project.time=str(time.get("month"))+"."+str(time.get("day"))+" "+str(time.get("hour"))+":"+str(time.get("minute"))
	new_project.txt=txt_saver
	new_project.csv_data=CsvDataArray
	new_project.imported_data=ImportedResArray
	new_project.ready_data=ReadyResArray
	ResourceSaver.save(new_project,"user://DIYProjects/"+new_project.project_name+".tres")
	$Panel2.hide()
	OS.alert("完成!")
	pass

func write_project():
	var new_project=DIYProject.new()
	new_project.project_name=project_name
	new_project.type=res_type
	var time =Time.get_datetime_dict_from_system()
	new_project.time=str(time.get("month"))+"."+str(time.get("day"))+" "+str(time.get("hour"))+":"+str(time.get("minute"))
	new_project.txt=txt_saver
	new_project.csv_data=CsvDataArray
	new_project.imported_data=ImportedResArray
	new_project.ready_data=ReadyResArray
	DirAccess.make_dir_recursive_absolute("user://DIYProjects/")
	ResourceSaver.save(new_project,"user://DIYProjects/"+project_name+".tres")
	$Panel2.hide()
	OS.alert("完成!")
	pass
func remove_project(project:DIYProject):
	DirAccess.remove_absolute("user://DIYProjects/"+project.project_name+".tres")
	project_list.erase(project)
	$Panel2.hide()
	OS.alert("已删除!")
func get_file_paths_in_directory(dir_path: String) -> PackedStringArray:
	#thank you,deepseek
	var paths = PackedStringArray()
	var dir = DirAccess.open(dir_path)
	if dir == null:
		push_error("无法打开目录: ", dir_path)
		return paths
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if file_name != "." and file_name != "..":
			if not dir.current_is_dir():  # 只取文件，忽略子目录
				var full_path = dir_path.path_join(file_name)
				paths.append(full_path)
		file_name = dir.get_next()
	dir.list_dir_end()
	return paths

func _on_open_project_list_button_down() -> void:
	if not $Panel.visible:
		project_list=[]
		read_project_list()
		
		for i in $Panel2/ScrollContainer/project_List_here.get_children():
			i.queue_free()
			print("free")
		for i in project_list:
			var b = preload("res://screen/diy_project_b.tscn").instantiate()
			b.res=i
			$Panel2/ScrollContainer/project_List_here.add_child(b)
			var r =b.read as Signal
			var rw =b.rewrite as Signal
			var rm=b.remove as Signal
			r.connect(read_project.bind(b.res))
			rw.connect(rewrite_Project.bind(b.res))
			rm.connect(remove_project.bind(b.res))
		$Panel2.show()
	pass # Replace with function body.


func _on_project_list_exit_button_down() -> void:
	$Panel2.hide()
	project_list=[]
	pass # Replace with function body.


func _on_write_button_down() -> void:
	write_project()
	pass # Replace with function body.


func _on_help_button_down() -> void:
	$help/TabContainer.show()
	
	pass # Replace with function body.


func _on_help_exit_button_down() -> void:
	$help/TabContainer.hide()
	pass # Replace with function body.
