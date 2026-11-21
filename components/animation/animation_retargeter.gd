@tool
class_name AnimationRetargeter
extends AnimationPlayer

@export var target: Node:
	set(value):
		target = value
		_retarget()

func _ready() -> void:
	_retarget()

func _retarget() -> void:
	if target == null or not is_inside_tree():
		return
	root_node = get_path_to(target)
	clear_caches()
