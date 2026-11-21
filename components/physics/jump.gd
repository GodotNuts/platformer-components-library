class_name Jump
extends ReactBase

@export var physics_constants: PhysicsConstants

func _on_event(...args: Array) -> void:
	var body = args[0]
	if body.is_on_floor():
		body.velocity.y = -physics_constants.player_jump_strength
