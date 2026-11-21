class_name SetYVelocity
extends ReactBase

@export var body: CharacterBody2D
@export var physics_constants: PhysicsConstants

var _input = 0.0

func _enter_tree() -> void:
	process_physics_priority = 3000

func _ready() -> void:
	super._ready()
	body.motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _on_event(...args: Array) -> void:
	_input = args[0].y

func _physics_process(delta: float) -> void:
	var target = _input * physics_constants.y_max_speed
	var rate = physics_constants.y_deceleration if is_zero_approx(target) else physics_constants.y_acceleration
	body.velocity.y = move_toward(body.velocity.y, target, rate * delta)
