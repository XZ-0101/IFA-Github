extends Control
func _ready() -> void:
	var a =$Control2.get_children()
	if a:
		for i in a:
			i.queue_free()
	if Get.going_to_Load_type=="lobotomy":
		var res=Get.going_to_load
		if res is bacis_ego and res is  not lobotomy and res is  not lobotomy_ego_Suit and res is  not lobotomy_ego_Weapon:
			var page = preload("res://screen/lobotomy_page.tscn").instantiate()
			page.g= res
			page.mode_=3
			print(3)
			$Control2.add_child(page)
			
			
			page.load_lobotomy(3)
			
			
			
		if res is lobotomy:
			var page = preload("res://screen/lobotomy_page.tscn").instantiate()
			page.a= res
			$Control2.add_child(page)
			page.load_lobotomy(0)
			page.mode_=0
		if res is lobotomy_ego_Suit:
			var page = preload("res://screen/lobotomy_page.tscn").instantiate()
			page.s= res
			page.mode_=1
			print("m1")
			$Control2.add_child(page)
			
			
			page.load_lobotomy(1)
			
		if res is lobotomy_ego_Weapon:
			var page = preload("res://screen/lobotomy_page.tscn").instantiate()
			page.w= res
			page.mode_=2
			print(2)
			$Control2.add_child(page)
			
			
			
			page.load_lobotomy(2)
			
			
	if Get.going_to_Load_type=="documentation":
		var res_d=Get.going_to_Documentation
		var page = preload("res://screen/Documentation_page.tscn").instantiate()
		page.Documentation=res_d
		$Control2.add_child(page)
		page.load_Documentation()
	if Get.going_to_Load_type=="lobotomyT":
		var res_d=Get.going_to_load
		var page = preload("res://screen/lobotomy_tool_page.tscn").instantiate()
		page.a=res_d
		$Control2.add_child(page)
		page.load_tool()
	if Get.going_to_Load_type=="TEST":
		var res_d=Get.going_to_load
		var page = preload("res://screen/lca_test_page.tscn").instantiate()
		page.a=res_d
		$Control2.add_child(page)
		page.load_test()
	if Get.going_to_Load_type=="Unreleased":
		var res_d=Get.going_to_load
		var page = preload("res://screen/unuse_page.tscn").instantiate()
		page.a=res_d
		$Control2.add_child(page)
		page.load_Unreleased()
	if Get.going_to_Load_type=="Legacy":
		var res_d=Get.going_to_load
		var page = preload("res://screen/legacy_page.tscn").instantiate()
		page.a=res_d
		$Control2.add_child(page)
		page.load_legacy()
	if Get.going_to_Load_type=="Category":
		var res_d=Get.going_to_load
		var page = preload("res://screen/all_class.tscn").instantiate()
		page.a=res_d
		$Control2.add_child(page)
		page.load_basic_class()
