extends Panel

@export var gamemenu: Panel
@export var achievmenu: Panel

func _ready():
	if gamemenu:
		gamemenu.visible = false
		achievmenu.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event):
	if event.is_action_pressed("exit") and not get_tree().paused:
		pause_game()

func pause_game():
	get_tree().paused = true
	if gamemenu:
		gamemenu.visible = true

func _on_unpause_button_pressed():
	get_tree().paused = false
	achievmenu.visible = false
	if gamemenu:
		gamemenu.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_achiev_pressed() -> void:
	achievmenu.visible = true
