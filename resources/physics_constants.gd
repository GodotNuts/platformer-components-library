class_name PhysicsConstants
extends Resource

@export var player_jump_strength: float
@export var player_time_in_air: float
@export var jump_strength_fraction: float = 0.85
@export var allowed_jumps: int = 1
@export var coyote_time: float = 0.1
@export var dash_speed: float = 600.0
@export var dash_time: float = 0.15
@export var dash_cooldown: float = 0.4
@export var air_dashes: int = 1
@export var gamma_time_window: float = 0.2
@export var wall_climb_speed: float = 120.0
@export var wall_slide_gravity_scale: float = 0.2
@export var wall_slide_max_speed: float = 90.0
@export var x_max_speed: float
@export var x_acceleration: float
@export var x_deceleration: float
@export var y_max_speed: float
@export var y_acceleration: float
@export var y_deceleration: float

var gravity_direction = Vector2.DOWN

func get_player_gravity() -> float:
	return 2 * player_jump_strength / player_time_in_air
