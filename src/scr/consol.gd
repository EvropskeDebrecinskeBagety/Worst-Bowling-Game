extends Control

@export var input_field: LineEdit
@export var ball: CharacterBody3D
@export var log_window: TextEdit

# yes this is NOT serious.
var helloworld = print

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
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("console.open"):
		#print("[INFO] opening console")
		#log_window.visible = true
		#show()
		#input_field.clear()
		#if input_field:
			#input_field.grab_focus()
		#
	#if Input.is_action_just_pressed("console.close"):
		#print("[INFO] closing console")
		#log_window.visible = false
		#input_field.clear()
		#hide()


func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("console.accept"):
		if input_field and input_field.text.strip_edges() != "":
			var command = input_field.text.strip_edges()
			_execute_command(command)
			input_field.clear()



func _execute_command(cmd: String) -> void:
	match cmd.to_lower():
		"help":
			log_window.text = "available command: help, quit, dev, give, clear"
			print("[CONSOLE] available command: help, quit, dev, give, clear")
		"quit":
			log_window.text = "quitting"
			print("[CONSOLE] quitting")
			get_tree().quit()
		"clear":
			oldcommand()
		# dev section
		"dev testmap":
			notinusecommand()
		"dev hellomoto":
			log_window.text = "Hello moto *tune doesnt start playing due to copyright*"
			print("[CONSOLE] Hello moto *tune doesnt start playing due to copyright*")
		"dev alahakbar":
			oldcommand()
		"dev parkour":
			log_window.text = "teleporting into parkour..."
			print("[CONSOLE] teleporting into parkour...")
			get_tree().change_scene_to_file("res://parkur.tscn")
		"dev studiogamecrash":
			print(get_viewport().fps())
			print(get_viewport().whatever())
			print(get_viewport().breastcancer())
		# end of dev section
		# test section
		"devtest error":
			print("[CONSOLE] Testing error...")
			push_error("Testing error")
		"devtest warn":
			print("[CONSOLE] Testing warning...")
			push_warning("Testing warning")
		# end of test section
		# useless section
		"useless mj":
			oldcommand()
		"voidme":
			oldcommand()
		# give section
		"give cords":
			log_window.text = "cannot show cordinates here, please look into godot console or logs"
			print("[CONSOLE] cords of ball: ", ball.position)
		"give fps":
			print("[CONSOLE] Current fps:", get_viewport().fps())
		# end of give section
		_:
			log_window.text = "unknown command. please check that you entered it correctly."
			print("[CONSOLE] unknown command: ", cmd)
