@tool
@icon("res://addons/mouton_fsm/assets/State.svg")
extends Node
## Uses a Machine as its parent to receive inputs, data and define behaviour.
class_name State

## Parent machine
@onready var machine : Machine = get_parent()

## Emitted on state left and state entered, respectively.
signal state_left()
signal state_entered()

func _ready() -> void :
	pass

func left(new_state: State) -> void:
	state_left.emit()
	_left(new_state)

## Called on state entered.
func _left(_new_state : State) :
	pass

func entered(old_state: State) -> void:
	state_entered.emit()
	_entered(old_state)

## Called on state left.
func _entered(_old_state : State) :
	pass

## Used to ping the state, for debug purposes.
func ping() :
	pass


