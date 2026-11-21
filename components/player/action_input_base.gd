class_name ActionInputBase
extends Node

@export var actions: Array[String]
@export var input_changed: EventResource

var _previous_state = {}

func _physics_process(_delta: float) -> void:
	var state = _read_state()
	if state != _previous_state:
		_previous_state = state
		input_changed.event.emit(state.duplicate())

func _read_state() -> Dictionary:
	var state = {}
	for action in actions:
		state[action] = _is_triggering(action)
	return state

func _is_triggering(_action: String) -> bool:
	return false
