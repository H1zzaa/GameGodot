extends Control

@export var game_manager: GameManager

func _ready() -> void:
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)
	

func _on_game_manager_toggle_game_paused(is_paused: bool):
	if is_paused:
		show()
		$Panel/VBoxContainer/Resume.grab_focus()
	else:
		hide()
	
func _on_resume_pressed() -> void:
	game_manager.game_paused = false

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")
