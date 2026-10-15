extends Control

@export var input_field: LineEdit
@export var ball: CharacterBody3D
@export var log_window: TextEdit

# yes this is NOT serious.
var helloworld = print

# the log window for the console is old and not working. PLEASE DO NOT TRY TO REPAIR IT YOURSELF.

func _ready() -> void:
	hide()
func balltotest():
	ball.position = Vector3(55.121, 5.371, 357.982)
func voidtheball():
	ball.position = Vector3(9999, 9999, 9999)
func balltoparkour():
	ball.position = Vector3(-111.971, 1, 164.413)
func oldcommand():
	log_window.text = "This is a legacy command and has been disabled"
	print("[WARN] This is a legacy command and has been disabled")
func notinusecommand():
	log_window.text = "This command is not use currently, it may be reserved for future use"
	print("[WARN] This command is not in use currently, it may be reserved for future use")


func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("console.accept"):
		if input_field and input_field.text.strip_edges() != "":
			var command = input_field.text.strip_edges()
			_execute_command(command)
			input_field.clear()


func _execute_command(cmd: String) -> void:
	var parts = cmd.to_lower().split(" ", false)
	if parts.is_empty():
		return
		
	var main_cmd = parts[0]
	
	match main_cmd:
		"help":
			log_window.text = "available command: help, quit, give, clear, map"
			print("[CONSOLE] available commands: help, quit, give, clear, map")
		"quit":
			log_window.text = "quitting"
			print("[CONSOLE] quitting")
			get_tree().quit()
		"clear":
			oldcommand()
		# dev section
		"dev":
			if parts.size() > 1:
				match parts[1]:
					"testmap":
						notinusecommand()
					"hellomoto":
						log_window.text = "Hello moto *tune doesnt start playing due to copyright*"
						print("[CONSOLE] Hello moto *tune doesnt start playing due to copyright*")
					"studiogamecrash":
						print(get_viewport().fps())
						print(get_viewport().whatever())
						print(get_viewport().breastcancer())
					_:
						log_window.text = "unknown dev command"
			else:
				log_window.text = "missing dev subcommand"
		"devtest":
			if parts.size() > 1:
				match parts[1]:
					"error":
						print("[CONSOLE] Testing error...")
						push_error("Testing error")
					"warn":
						print("[CONSOLE] Testing warning...")
						push_warning("Testing warning")
		"useless":
			if parts.size() > 1 and parts[1] == "mj":
				oldcommand()
		"voidme":
			oldcommand()
		"give":
			if parts.size() > 1:
				match parts[1]:
					"cords":
						print("[CONSOLE] cords of ball: ", ball.position)
		"map":
			if parts.size() > 1:
				var map_name = parts[1]
				open_map(map_name)
			else:
				print("[CONSOLE] Usage: map <mapName>")
		_:
			log_window.text = "unknown command. please check that you entered it correctly."
			print("[CONSOLE] unknown command: ", cmd)


func open_map(map_name: String) -> void:
	var gamedir = OS.get_executable_path().get_base_dir().path_join("../../")
	var mappath = gamedir.path_join("maps/" + map_name + "/map.tscn")
	var mapinfo = gamedir.path_join("maps/" + map_name + "/info.json")
	
	if FileAccess.file_exists(mapinfo):
		print("[CONSOLE] Looking into " + mapinfo)
	else:
		print("[ERROR] file '" + mapinfo + "' does not exist")
	
	if FileAccess.file_exists(mappath):
		print("[CONSOLE] Opening map from path: ", mappath)
		var packed_scene = ResourceLoader.load(mappath)
		if packed_scene:
			get_tree().change_scene_to_packed(packed_scene)
		else:
			print("[ERROR] Failed to load resource at: ", mappath)
	else:
		print("[ERROR] Map not found at path: ", mappath)
