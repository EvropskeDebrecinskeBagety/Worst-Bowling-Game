extends Node

@onready var backimage: TextureRect = $BackImage
@export var mapchoose: Panel


var gamedir = OS.get_executable_path().get_base_dir().path_join("../../")

func start():
	print("[INFO] Loading main scene")
	get_tree().change_scene_to_file("res://main.tscn")

func quit():
	print("Quitting")
	get_tree().quit()
	
func choosemapopen():
	mapchoose.show()
	
func choosemapclose():
	mapchoose.hide()

func _ready() -> void:
	mapchoose.hide()
	var assetdir = ""
	if OS.has_feature("editor"):
		assetdir = ProjectSettings.globalize_path("res://../assets/menubackground.jpeg")
	else:
		assetdir = OS.get_executable_path().get_base_dir().path_join("../../assets/menubackground.jpeg")
		
	if FileAccess.file_exists(assetdir):
		var img = Image.new()
		if img.load(assetdir) == OK:
			backimage.texture = ImageTexture.create_from_image(img)
		else:
			print("[ERROR] Failed to load resource at: ", assetdir)
	else:
		print("[ERROR] Asset not found at path: ", assetdir)
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dev.testmap"):
		get_tree().change_scene_to_file("res://outmaps/wbg_grass.tscn")
		
# map functions

func wbg_grassopen():
	var mappath = gamedir.path_join("maps/" + "wbg_grass" + "/map.tscn")
	#var mapinfo = gamedir.path_join("maps/" + map_name + "/info.json")
	
	if FileAccess.file_exists(mappath):
		print("[INFO] Opening map from path: ", mappath)
		var packed_scene = ResourceLoader.load(mappath)
		if packed_scene:
			get_tree().change_scene_to_packed(packed_scene)
		else:
			print("[ERROR] Failed to load resource at: ", mappath)
	else:
		print("[ERROR] Map not found at path: ", mappath)
		
func wbg_parkouropen():
	var mappath = gamedir.path_join("maps/" + "wbg_parkour" + "/map.tscn")
	#var mapinfo = gamedir.path_join("maps/" + map_name + "/info.json")
	
	if FileAccess.file_exists(mappath):
		print("[INFO] Opening map from path: ", mappath)
		var packed_scene = ResourceLoader.load(mappath)
		if packed_scene:
			get_tree().change_scene_to_packed(packed_scene)
		else:
			print("[ERROR] Failed to load resource at: ", mappath)
	else:
		print("[ERROR] Map not found at path: ", mappath)

func choosethirdopen():
	pass
