extends Control

@export var input_field: LineEdit


func _ready() -> void:
	hide()


@export var ball: CharacterBody3D

func balltotest():
	ball.position = Vector3(55.121, 18.553, 357.982)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("console.open"):
		print("Opening console")
		show()
		input_field.clear()
		if input_field:
			input_field.grab_focus()
		
	if Input.is_action_just_pressed("console.close"):
		print("Closing console")
		input_field.clear()
		hide()


func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("console.accept"):
		if input_field and input_field.text.strip_edges() != "":
			var command = input_field.text.strip_edges()
			_execute_command(command)
			input_field.clear()
			
			get_viewport().set_input_as_handled()


# Tady vyhodnocuješ zadané příkazy
func _execute_command(cmd: String) -> void:
	match cmd.to_lower():
		"help":
			print("available command: help, quit, devtestmap")
		"quit":
			get_tree().quit()
		"devtestmap":
			print("teleporting player to devtestmap")
			balltotest()
		_:
			print("unknown command: ", cmd)
