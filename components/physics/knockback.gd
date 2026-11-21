class_name Knockback
extends ReactBase

@export var minimum_damage: float = 1.0
@export_flags_2d_physics var knockback_layers: int = 0xFFFFFFFF
@export var force: Vector2 = Vector2(300.0, -250.0)
@export var set_x_velocity: SetXVelocity
@export var knockback_time: float = 0.25

var _time_left = 0.0

func _on_event(...args: Array) -> void:
	var body = args[0]
	var damage = args[1]
	var source = args[2]
	if damage < minimum_damage or not _knocks_back(source):
		return
	body.velocity = Vector2(_away_from(source, body) * force.x, force.y)
	_time_left = knockback_time
	_set_steering(false)

func _physics_process(delta: float) -> void:
	if _time_left <= 0.0:
		return
	_time_left -= delta
	if _time_left <= 0.0:
		_set_steering(true)

func _knocks_back(source: Node) -> bool:
	return source is CollisionObject2D and source.collision_layer & knockback_layers != 0

func _away_from(source: Node2D, body: CharacterBody2D) -> float:
	var away = signf(body.global_position.x - source.global_position.x)
	if away == 0.0:
		return 1.0
	return away

func _set_steering(enabled: bool) -> void:
	if set_x_velocity != null:
		set_x_velocity.set_physics_process(enabled)
