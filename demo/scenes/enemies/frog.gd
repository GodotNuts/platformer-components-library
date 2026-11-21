extends CharacterBody2D

@export var move: EventResource
@export var jump: EventResource
@export var reverse_direction: EventResource
@export var facing: Node2D

var direction = 1.0
var airborne = false
var last_turn_frame = -1

func _ready() -> void:
	reverse_direction.event.connect(_on_reverse_direction)
	for sensor in facing.get_children():
		sensor.reverse_direction = reverse_direction
	$LeapTimer.timeout.connect(_leap)

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		airborne = true
	elif airborne:
		airborne = false
		move.event.emit(Vector2.ZERO)

func _leap() -> void:
	if is_on_floor():
		move.event.emit(Vector2(direction, 0.0))
		jump.event.emit(self)

func _on_reverse_direction(..._args: Array) -> void:
	if last_turn_frame != Engine.get_physics_frames():
		last_turn_frame = Engine.get_physics_frames()
		direction = -direction
		facing.scale.x = direction
		if airborne:
			move.event.emit(Vector2(direction, 0.0))
