extends State
class_name AttackState

@export var return_state: State
@export var return_animation_node: String = "Move"
@export var attack1_name: String = "Attack1"


#func state_input(event: InputEvent):
#	event.is_action_pressed("ui_attack")

func _on_animation_tree_animation_finished(animation_name: StringName) -> void:
	if animation_name == attack1_name:
			change_state_to = return_state
			playback.travel(return_animation_node)
