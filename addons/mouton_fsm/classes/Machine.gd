@tool
@icon("res://addons/mouton_fsm/assets/StateMachine.svg")
extends Node
## Switches through mutiple States (as children of the machine)
class_name Machine

## Default state to fall back to (for when the current state is deleted)
@export var default_state : State

## Array of states currently tracked.
var states : Array[State]
## Current enabled state.
var current_state : State

## Called on state changed.
signal state_changed(from : State, to : State)

func _ready() -> void :
	if Engine.is_editor_hint() :
		child_order_changed.connect(on_child_changed)
	else :
		refetch_states()
		current_state = states[0]

## Refreshes current states array.
func refetch_states() -> void :
	states = []
	for child in get_children() :
		if child is State and not child.is_queued_for_deletion():
			states.append(child)
	print("Refetched states : ",states)

# Changes the current state, returns old state
func change_state(new_state : State) -> State :
	var old_state : State = current_state
	current_state = new_state
	print("State changed from ",old_state.name ," to ",new_state.name)
	old_state.left(new_state)
	old_state.state_left.emit()
	state_changed.emit(old_state, new_state)
	new_state.entered(old_state)
	new_state.state_entered.emit()
	return current_state

# Changes the current state from state namestring, returns old state
func change_state_from_name(new_state_name : String) -> State :
	var that_one_state : State
	for state in states :
		if state.name == new_state_name :
			that_one_state = state
	return change_state(that_one_state)

# Changes the current state from state index, returns old state
func change_state_from_index(new_state_index : int) -> State :
	return change_state(states[new_state_index % len(states)])

## Adds a new state. Returns the new state on success.
func add_state(new_state : State) -> State :
	self.add_child(new_state)
	refetch_states()
	return new_state

## Deletes a state from the array.
func delete_state(state : State):
	state.queue_free()
	refetch_states()

func on_child_changed() -> void :
	update_configuration_warnings()

func _get_configuration_warnings():
	var warnings : Array[String] = []
	var state_found := false
	for child in self.get_children() :
		if child is State :
			state_found = true
	if not state_found :
		if get_children() :
			warnings.append("It's recommended that all children of the Machine be of class State !")
		else :
			warnings.append("This Machine needs at least one State child to properly function !")
	return warnings
