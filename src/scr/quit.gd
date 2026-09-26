extends Node

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		print("Changing to main.tscn")
		get_tree().change_scene_to_file("res://main.tscn")
