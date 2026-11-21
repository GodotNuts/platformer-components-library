class_name WallGrab
extends ReactBase

@export var physics_constants: PhysicsConstants
@export var is_on_floor: IsOnFloor
@export var gravity: ApplyGravity

var _grabbing = false
var _grabbed_this_frame = false
var _wall_normal = Vector2.ZERO

func _enter_tree() -> void:
	process_physics_priority = 3500

func _on_event(...args: Array) -> void:
	var body = args[0]
	var input_vector = args[1]
	if not is_on_floor.is_on_floor() and _touching_wall(body):
		body.velocity.y = _grab_velocity(body.velocity.y, input_vector.y)
		_grabbed_this_frame = true

func _physics_process(_delta: float) -> void:
	if _grabbed_this_frame != _grabbing:
		_grabbing = _grabbed_this_frame
		gravity.set_physics_process(not _grabbing)
	_grabbed_this_frame = false

func _grab_velocity(current: float, input_y: float) -> float:
	var climb = input_y * physics_constants.wall_climb_speed
	if input_y < 0.0:
		return climb
	return maxf(climb, _slide_velocity(current))

func _slide_velocity(current: float) -> float:
	var pull = physics_constants.get_player_gravity() * physics_constants.wall_slide_gravity_scale
	var slide = maxf(current, 0.0) + pull * get_physics_process_delta_time()
	return minf(slide, physics_constants.wall_slide_max_speed)

func _touching_wall(body: CharacterBody2D) -> bool:
	if body.is_on_wall():
		_wall_normal = body.get_wall_normal()
		return true
	if _wall_normal == Vector2.ZERO:
		return false
	return body.test_move(body.global_transform, -_wall_normal)
