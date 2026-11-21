class_name GammaTime
extends ReactBase

@export var physics_constants: PhysicsConstants
@export var is_on_floor: IsOnFloor

var _was_on_floor = true
var _window_left = 0.0

func _on_event(...args: Array) -> void:
	var body = args[0]
	var input = args[1] as Vector2
	if _window_left > 0.0 and is_on_floor.is_on_floor() and _is_reversal(body, input):
		body.velocity.x = 0.0
		_window_left = 0.0

func _physics_process(delta: float) -> void:
	var on_floor = is_on_floor.is_on_floor()
	if on_floor and not _was_on_floor:
		_window_left = physics_constants.gamma_time_window
	else:
		_window_left = max(_window_left - delta, 0.0)
	_was_on_floor = on_floor

func _is_reversal(body: CharacterBody2D, input: Vector2) -> bool:
	var moving = sign(body.velocity.x)
	return moving != 0.0 and sign(input.x) == -moving
