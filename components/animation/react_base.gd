class_name ReactBase
extends Node

@export var event: EventResource

func _ready() -> void:
	event.event.connect(_on_event)
	
func _on_event(..._args: Array) -> void:
	pass 
