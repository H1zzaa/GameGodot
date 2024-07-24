extends Control

func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()
	$Panel/AnimatedSprite2D.play("Dance")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/Scene1.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
