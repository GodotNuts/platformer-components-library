class_name ActionPressed
extends ActionInputBase

func _is_triggering(action: String) -> bool:
	return Input.is_action_pressed(action)
