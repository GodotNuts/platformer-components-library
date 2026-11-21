class_name Dash
extends ReactBase

@export var physics_constants: PhysicsConstants
@export var is_on_floor: IsOnFloor
@export var gravity: ApplyGravity
@export var input_vector_changed: EventResource

var _body: CharacterBody2D
var _facing = 1.0
var _time_left = 0.0
var _cooldown_left = 0.0
var _air_dashes_left = 0

func _enter_tree() -> void:
	process_physics_priority = 3500

func _ready() -> void:
	super._ready()
	input_vector_changed.event.connect(_on_input_vector_changed)

func _on_input_vector_changed(input: Vector2) -> void:
	if not is_zero_approx(input.x):
		_facing = sign(input.x)

func _on_event(...args: Array) -> void:
	if _can_dash():
		_start_dash(args[0])

func _physics_process(delta: float) -> void:
	_cooldown_left = max(_cooldown_left - delta, 0.0)
	if is_on_floor.is_on_floor():
		_air_dashes_left = physics_constants.air_dashes
	if _time_left > 0.0:
		_continue_dash(delta)

func _can_dash() -> bool:
	return _time_left <= 0.0 and _cooldown_left <= 0.0 and (is_on_floor.is_on_floor() or _air_dashes_left > 0)

func _start_dash(body: CharacterBody2D) -> void:
	if not is_on_floor.is_on_floor():
		_air_dashes_left -= 1
	_body = body
	_time_left = physics_constants.dash_time
	_cooldown_left = physics_constants.dash_cooldown
	gravity.set_physics_process(false)

func _continue_dash(delta: float) -> void:
	_body.velocity = Vector2(_facing * physics_constants.dash_speed, 0.0)
	_time_left -= delta
	if _time_left <= 0.0:
		gravity.set_physics_process(true)
