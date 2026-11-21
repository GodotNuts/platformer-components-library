extends Node

var _dead = {}

func is_alive(id: String) -> bool:
	return not _dead.has(id)

func mark_dead(id: String) -> void:
	_dead[id] = true
