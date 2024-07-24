extends Node
class_name CharacterStateMachine

@export var character: CharacterBody2D
@export var animation_tree: AnimationTree
@export var current_state: State 

var state: Array[State]

func _ready() -> void:
	for child in get_children():
		if child is State:
			state.append(child)
			child.character = character
			child.playback = animation_tree["parameters/playback"]
		else: 
			push_warning(child.name + " not correct State")

func _physics_process(delta: float) -> void:
	if current_state.change_state_to != null:
		switch_states(current_state.change_state_to)
	
	current_state.state_process(delta)

func check_if_can_move():
	return current_state.can_move

func switch_states(new_state:State):
	if current_state != null:
		current_state.on_exit()
		current_state.change_state_to = null
	current_state = new_state
	
	current_state.on_enter()

func _input(event: InputEvent) -> void:
	current_state.state_input(event)
