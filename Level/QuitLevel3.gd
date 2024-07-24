extends Area2D

var entered = false

func _on_body_entered(_body: PhysicsBody2D) -> void:
	entered = true

func _on_body_exited(_body: PhysicsBody2D) -> void:
	entered = false

func _physics_process(_delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("ui_quit_level"):
		get_tree().change_scene_to_file("res://End_Game_Menu/end_game_menu.tscn")
