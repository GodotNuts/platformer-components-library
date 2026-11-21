class_name DoubleJumpComponent
extends ReactBase

@export var physics_constants: PhysicsConstants
@export var is_on_floor: IsOnFloor

var jumps_left = 0

func _on_event(...args: Array) -> void:
	var body = args[0]
	var falling = body.velocity.y > 0.0 and not is_on_floor.is_on_floor()
	if falling and jumps_left > 0:
		jumps_left -= 1
		body.velocity.y = -physics_constants.player_jump_strength * physics_constants.jump_strength_fraction

func _physics_process(_delta: float) -> void:
	if is_on_floor.is_on_floor():
		jumps_left = physics_constants.allowed_jumps
