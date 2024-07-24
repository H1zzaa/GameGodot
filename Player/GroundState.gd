extends State
class_name GroundState

@export var jump_velocity: float = -300
@export var air_state: State
@export var attack_state: State
@export var jump_animation: String = "JumpStart"
@export var attack_animation: String = "Attack1"

func state_process(delta):
	if !character.is_on_floor():
		change_state_to = air_state

func state_input(event: InputEvent):
	if event.is_action_pressed("ui_jump"):
		jump()
		$"../../JumpSound".play()
	if event.is_action_pressed("ui_attack"):
		$"../../GuitarAttackSound".play()
		attack()

func jump():
	character.velocity.y = jump_velocity 
	change_state_to = air_state
	playback.travel(jump_animation)

func attack():
	change_state_to = attack_state
	playback.travel(attack_animation)
