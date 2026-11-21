class_name SetXVelocity
extends ReactBase

@export var body: CharacterBody2D
@export var physics_constants: PhysicsConstants

var _input = 0.0

func _enter_tree() -> void:
	process_physics_priority = 3000

func _on_event(...args: Array) -> void:
	_input = args[0].x

func _physics_process(delta: float) -> void:
	var target = _input * physics_constants.x_max_speed
	var rate = physics_constants.x_deceleration if is_zero_approx(target) else physics_constants.x_acceleration
	body.velocity.x = move_toward(body.velocity.x, target, rate * delta)
