@tool
@icon("res://addons/mouton_fsm/assets/PhysicsState.svg")
extends State
## Uses a Machine as its parent to receive inputs, data and define behaviour.
class_name PhysicsState

func state_input(_event: InputEvent) -> void:
	pass

func state_process(_delta: float) -> void:
	pass

func state_physics(_delta: float) -> void:
	pass
