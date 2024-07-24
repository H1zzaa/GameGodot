extends Control

func _ready() -> void:
	$VBoxContainer/Quit.grab_focus()

func _on_quit_pressed() -> void:
	get_tree().quit()
