extends Resource
## Uses a StatusManager as its parent to control Status effects
class_name Status

## StatusManager which the status is linked to
#@onready var manager : StatusManager = self.get_parent()

## Status icon
@export var icon : ImageTexture

## Status description
@export_multiline var description : String

## If true, this status can stack
@export var stackable : bool = false

## (Optional) Alignment of the status
## positive = regeneration, damage boost, etc...
## negative = poisoned, paralysed, etc...
@export var positive : bool = true

## Number of stacks of the status effect (if stackable)
var stacks : int

## Emitted on status added
signal status_added()
## Emitted on status removed
signal status_removed()
## Emitted on status stacked (if stackable)
signal status_stacked(amount : int)
## Emitted on status destacked (if stackable)
signal status_destacked(amount : int)
## Emitted on status tick
signal status_ticked()

## [internal], do not override. Use [_added()] instead.
func added() -> void :
	status_added.emit()
	_added()

## [internal], do not override. Use [_removed()] instead.
func removed() -> void :
	status_removed.emit()
	_removed()

## [internal], do not override. Use [_stacked(amount: float)] instead.
func stacked(amount: int) -> void :
	status_stacked.emit(amount)
	_stacked(amount)

## [internal], do not override. Use [_destacked(amount: float)] instead.
func destacked(amount: int) -> void :
	status_destacked.emit(amount)
	_destacked(amount)

## [internal], do not override. Use [_tick()] instead.
func tick() -> void :
	status_ticked.emit()
	_tick()

## Called on status added
func _added() -> void :
	pass

## Called on status removed
func _removed() -> void :
	pass

## Called on status stacked (if stackable)
func _stacked(_amount: int) -> void :
	pass

## Called on status destacked (if stackable)
func _destacked(_amount: int) -> void :
	pass

## Called on status ticked
func _tick() -> void :
	pass

## [experimental]
## Ping (for test purposes)
func ping() -> Error:
	return OK