extends Area2D

@onready var player = owner as Player
var entered = false

func _on_body_entered(_body: PhysicsBody2D) -> void:
	entered = true 

func _on_body_exited(_body: PhysicsBody2D) -> void:
	entered = false 

func _physics_process(_delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("ui_quit_level"):
		get_tree().change_scene_to_file("res://Level/Scene2.tscn")
#		$CameraLevel1.set_enabled(false)
#		$CameraLevel2.make_current()
#		$"../CameraLevel2".set_enabled(true)


