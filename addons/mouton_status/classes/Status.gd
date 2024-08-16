extends Node
## Uses a StatusManager as its parent to control Status effects
class_name Status

## StatusManager which the status is linked to
@onready var manager : StatusManager = self.get_parent()
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

## Called on status added
func added() -> void :
    pass

## Called on status removed
func removed() -> void :
    pass

## Called on status stacked (if stackable)
func stacked() -> void :
    pass

## Called on status destacked (if stackable)
func destacked() -> void :
    pass

## Called on status ticked
func tick() -> void :
    pass
