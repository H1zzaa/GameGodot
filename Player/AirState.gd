extends State
class_name AirState

@export var landing_state: State
@export var landing_animation: String = "JumpEnd"

func state_process(delta):
	if character.is_on_floor():
		change_state_to = landing_state

func on_exit():
	if change_state_to == landing_state:
		playback.travel(landing_animation)
