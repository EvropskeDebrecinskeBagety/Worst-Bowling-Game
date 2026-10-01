extends Control

@export var input_field: LineEdit
@export var log_window: TextEdit

func _ready() -> void:
	hide()
func balltotest():
	cannotusefunc()
func voidtheball():
	cannotusefunc()
func balltoparkour():
	cannotusefunc()
func oldcommand():
	log_window.text = "This is a legacy/unsupported command and has been disabled"
	print("[WARN] This is a legacy/unsupported command and has been disabled")
func notinusecommand():
	log_window.text = "This command is not use currently, it may be reserved for future use"
	print("[WARN] This command is not in use currently, it may be reserved for future use")
func cannotusehere():
	log_window.text = "This command cannot be used in this scene"
	print("[WARN] This command cannot be used in this scene")
func cannotusefunc():
	log_window.text = "This function cannot be used in this scene"
	print("[WARN] This function cannot be used in this scene")
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("console.open"):
		print("[INFO] opening console")
		log_window.visible = true
		show()
		input_field.clear()
		if input_field:
			input_field.grab_focus()
		
	if Input.is_action_just_pressed("console.close"):
		print("[INFO] closing console")
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
			log_window.text = "available command: help, quit, dev, give, clear"
			print("[CONSOLE] available command: help, quit, dev, give, clear")
		"quit":
			log_window.text = "quitting"
			print("[CONSOLE] quitting")
			get_tree().quit()
		"clear":
			log_window.text = ""
		# dev section
		"dev testmap":
			notinusecommand()
		"dev hellomoto":
			log_window.text = "Hello moto *tune doesnt start playing due to copyright*"
			print("[CONSOLE] Hello moto *tune doesnt start playing due to copyright*")
		"dev alahakbar":
			log_window.text = "'Today a plane crashed into the towers and our mothers too'"
			print("[CONSOLE] 'Today a plane crashed into the towers and our mothers too'")
		"dev parkour":
			cannotusehere()
		# end of dev section
		# test section
		"devtest error":
			push_error("Testing error")
		"devtest warn":
			push_warning("Testing warning")
		# end of test section
		# useless section
		"useless mj":
			log_window.text = "no"
			print("[CONSOLE] no")
		"voidme":
			oldcommand()
			#log_window.text = "voiding player..."
			#print("console: voiding player...")
			#voidtheball()
		# give section
		"give cords":
			cannotusehere()
		# end of give section
		_:
			log_window.text = "unknown command. please check that you entered it correctly."
			print("[CONSOLE] unknown command: ", cmd)
