extends Panel

@export var gamemenu: Panel
@export var achievmenu: Panel
@export var consolebox: LineEdit
@export var consolenote: Label

func _ready():
	if gamemenu:
		consolebox.clear()
		consolebox.visible = false
		consolenote.visible = false
		gamemenu.visible = false
		achievmenu.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event):
	if event.is_action_pressed("exit") and not get_tree().paused:
		pause_game()

func pause_game():
	consolebox.grab_focus()
	consolebox.visible = true
	consolenote.visible = true
	if gamemenu:
		gamemenu.visible = true

func _on_unpause_button_pressed():
	get_tree().paused = false
	achievmenu.visible = false
	consolebox.visible = false
	consolenote.visible = false
	consolebox.clear()
	if gamemenu:
		gamemenu.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_quitmenu() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_achiev_pressed() -> void:
	achievmenu.visible = true
