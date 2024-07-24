extends CharacterBody2D
class_name Player

const SPEED = 200

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine
signal camera_turn

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	animation_tree.active = true

func _physics_process(delta):
	#gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#run
	player_direction = Input.get_vector("ui_run_left", "ui_run_right", "ui_jump", "ui_get_down")
	
	if player_direction.x != 0 and state_machine.check_if_can_move():
		velocity.x = player_direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	update_animation_parameters()
	update_facing_diraction()

func player_detection_area():
	pass

func player_detection_area_enemy_attack():
	pass

func update_animation_parameters():
	animation_tree.set("parameters/Move/blend_position", player_direction.x)

func update_facing_diraction():
	if player_direction.x > 0 and sprite.is_flipped_h():
		sprite.flip_h = false
		camera_turn.emit("right")
		get_node("SwordAttackCollision").set_scale(Vector2(1,1))
	elif player_direction.x < 0 and not sprite.is_flipped_h():
		sprite.flip_h = true
		camera_turn.emit("left")
		get_node("SwordAttackCollision").set_scale(Vector2(-1,1))

func player_death():
#	$AnimationPlayer.play("Death")
#	await get_tree().create_timer(1).timeout
#	queue_free()
	get_tree().change_scene_to_file("res://Player/player_death_menu.tscn")
