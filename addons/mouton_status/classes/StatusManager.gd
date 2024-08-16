extends Node
## Tracks Status classes (as children of the manager).
class_name StatusManager

## Array of statuses currently tracked.
var statuses : Array[Status]
## Array of status names currently tracked.
var status_names : Array[String]

func _ready() -> void :
	refetch_statuses()

## Refreshes current status array.
func refetch_statuses() -> void :
	statuses = []
	for child in get_children() :
		if child is Status and not child.is_queued_for_deletion():
			statuses.append(child)
			status_names.append(child.name)
	print("Refetched statuses : ",statuses)
	print("Refetched status names : ",status_names)
    

## Adds a new status. Returns the stacks amount on success.
func add_status(status:Status) -> int :
	if status.name in status_names :
		status = self.find_child(status.name)
		status.stacks += 1
		status.stacked()
	else :
		self.add_child(status)
		status.added()
	refetch_statuses()
	return status.stacks

## Deletes a status from the array.
func delete_status(status:Status) -> void :
	status.queue_free()
	refetch_statuses()
