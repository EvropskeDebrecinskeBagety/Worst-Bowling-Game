extends Control

@export var input_field: LineEdit
@export var ball: CharacterBody3D
@export var log_window: TextEdit
@export var window: Window

# yes this is NOT serious.
var helloworld = print

# the log window for the console is old and not working. PLEASE DO NOT TRY TO REPAIR IT YOURSELF.

func _ready() -> void:
	window.hide()


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
		"map":
			if parts.size() > 1:
				var map_name = parts[1]
				open_map(map_name)
			else:
				print("[CONSOLE] Usage: map <mapName>")
		_:
			print("[CONSOLE] unknown command: ", cmd)


func open_map(map_name: String) -> void:
	var gamedir = OS.get_executable_path().get_base_dir().path_join("../../")
	var mappath = gamedir.path_join("maps/" + map_name + "/map.tscn")
	var mapinfo = gamedir.path_join("maps/" + map_name + "/info.json")
	
	if FileAccess.file_exists(mapinfo):
		print("[INFO] Looking into " + mapinfo)
	else:
		print("[ERROR] file '" + mapinfo + "' does not exist")
	
	if FileAccess.file_exists(mappath):
		print("[INFO] Opening map from path: ", mappath)
		var packed_scene = ResourceLoader.load(mappath)
		if packed_scene:
			get_tree().change_scene_to_packed(packed_scene)
		else:
			print("[ERROR] Failed to load resource at: ", mappath)
	else:
		print("[ERROR] Map not found at path: ", mappath)


func _on_partychoose_close_requested() -> void:
	window.hide()


func _on_button_pressed() -> void:
	window.show()
