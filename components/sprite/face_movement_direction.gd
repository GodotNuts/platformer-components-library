extends ReactBase

@export var target: Sprite2D

func _on_event(...args: Array) -> void:
	var input_direction = args[0] as Vector2
	if not is_zero_approx(input_direction.x):
		target.scale.x = sign(input_direction.x)
