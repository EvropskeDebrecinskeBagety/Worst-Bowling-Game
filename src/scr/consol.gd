extends Control

@export var input_field: LineEdit
@export var ball: CharacterBody3D
@export var log_window: TextEdit

func _ready() -> void:
	hide()
func balltotest():
	ball.position = Vector3(55.121, 5.371, 357.982)
func voidtheball():
	ball.position = Vector3(9999, 9999, 9999)
func balltoparkour():
	ball.position = Vector3(-111.971, 1, 164.413)
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("console.open"):
		print("opening console")
		log_window.visible = true
		show()
		input_field.clear()
		if input_field:
			input_field.grab_focus()
		
	if Input.is_action_just_pressed("console.close"):
		print("closing console")
		log_window.visible = false
		input_field.clear()
		hide()


func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("console.accept"):
		if input_field and input_field.text.strip_edges() != "":
			var command = input_field.text.strip_edges()
			_execute_command(command)
			input_field.clear()



func _execute_command(cmd: String) -> void:
	match cmd.to_lower():
		"help":
			log_window.text = "available command: help, quit, dev, voidme, give"
			print("console: available command: help, quit, dev, voidme, give")
		"quit":
			log_window.text = "the dev wanted me to die"
			print("console: the dev wanted me to die")
			get_tree().quit()
		# dev section
		"dev testmap":
			log_window.text = "teleporting player to devtesmap..."
			print("teleporting player to devtestmap...")
			balltotest()
		"dev hellomoto":
			log_window.text = "Hello moto *tune starts playing*"
			print("console: Hello moto *tune starts playing*")
		"dev alahakbar":
			log_window.text = "'Today a plane crashed into the towers'"
			print("console: 'Today a plane crashed into the towers'")
		"dev parkour":
			log_window.text = "teleporting into parkour..."
			print("console: teleporting into parkour...")
			get_tree().change_scene_to_file("res://parkur.tscn")
		# end of dev section
		"voidme":
			log_window.text = "voiding player..."
			print("console: voiding player...")
			voidtheball()
		# give section
		"give cords":
			log_window.text = "cannot show cordinates here, please look into godot console or logs"
			print("console: cords of ball: ", ball.position)
		# end of give section
		_:
			log_window.text = "unknown command. please check that you entered it correctly."
			print("console: unknown command: ", cmd)
