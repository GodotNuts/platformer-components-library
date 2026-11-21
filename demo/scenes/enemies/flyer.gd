extends CharacterBody2D

@export var move: EventResource
@export var reverse_direction: EventResource
@export var facing: Node2D
@export var bob_speed: float = 2.5

var direction = 1.0
var time_alive = 0.0
var last_turn_frame = -1

func _ready() -> void:
	reverse_direction.event.connect(_on_reverse_direction)
	for sensor in facing.get_children():
		sensor.reverse_direction = reverse_direction

func _physics_process(delta: float) -> void:
	time_alive += delta
	move.event.emit(Vector2(direction, sin(time_alive * bob_speed)))

func _on_reverse_direction(..._args: Array) -> void:
	if last_turn_frame != Engine.get_physics_frames():
		last_turn_frame = Engine.get_physics_frames()
		direction = -direction
		facing.scale.x = direction
