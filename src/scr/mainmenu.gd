extends Node

@onready var backimage: TextureRect = $BackImage

func start():
	print("[INFO] Loading main scene")
	get_tree().change_scene_to_file("res://main.tscn")

func quit():
	print("Quitting")
	get_tree().quit()

func _ready() -> void:
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
