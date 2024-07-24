extends State
class_name LandingState

@export var landing_animation_name: String = "JumpEnd"
@export var ground_state: State

func _on_animation_tree_animation_finished(animation_name: StringName) -> void:
	if animation_name == landing_animation_name:
		change_state_to = ground_state
