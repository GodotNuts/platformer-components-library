class_name CoyoteJump
extends ReactBase

@export var physics_constants: PhysicsConstants
@export var is_on_floor: IsOnFloor

var _time_since_floor = 0.0
var _used = false

func _on_event(...args: Array) -> void:
	var body = args[0]
	if _can_jump(body):
		_used = true
		body.velocity.y = -physics_constants.player_jump_strength

func _physics_process(delta: float) -> void:
	if is_on_floor.is_on_floor():
		_time_since_floor = 0.0
		_used = false
	else:
		_time_since_floor += delta

func _can_jump(body: CharacterBody2D) -> bool:
	var walked_off_ledge = body.velocity.y >= 0.0 and not is_on_floor.is_on_floor()
	return walked_off_ledge and not _used and _time_since_floor <= physics_constants.coyote_time
