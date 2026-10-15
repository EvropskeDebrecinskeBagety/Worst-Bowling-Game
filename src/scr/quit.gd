extends Node

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		print("Quitting to menu")
		get_tree().change_scene_to_file("res://menu.tscn")
