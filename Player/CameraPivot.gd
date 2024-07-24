extends Marker2D

#var camera_direction: Vector2 = Vector2.ZERO
@onready var player = owner as Player

func _ready() -> void:
	player.camera_turn.connect(on_player_camera_turn)

func on_player_camera_turn(camera_direction):
	match camera_direction:
		"right":
			position.x = 30
		"left":
			position.x = -30
#	print(camera_direction)
