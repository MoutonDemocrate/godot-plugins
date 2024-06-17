extends Node
## Description
class_name Status

## Description
@onready var manager : StatusManager = self.get_parent()
## Description
var stacks : int

## Description
signal status_added()
## Description
signal status_removed()
## Description
signal status_stacked(amount : int)
## Description
signal status_destacked(amount : int)
## Description
signal status_ticked()

## Description
func added() -> void :
    pass

## Description
func removed() -> void :
    pass

## Description
func stacked() -> void :
    pass

## Description
func destacked() -> void :
    pass

## Description
func tick() -> void :
    pass