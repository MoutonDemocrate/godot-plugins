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

## Called on state entered.
func left(new_state : State) :
	pass

## Called on state left.
func entered(old_state : State) :
	pass

## Used to ping the state, for debug purposes.
func ping() :
	pass


