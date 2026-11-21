class_name ActionJustPressed
extends ActionInputBase

func _is_triggering(action: String) -> bool:
	return Input.is_action_just_pressed(action)
