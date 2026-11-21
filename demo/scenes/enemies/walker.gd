extends CharacterBody2D

@export var move: EventResource
@export var reverse_direction: EventResource
@export var facing: Node2D

var direction = -1.0
var last_turn_frame = -1

func _ready() -> void:
	reverse_direction.event.connect(_on_reverse_direction)
	for sensor in facing.get_children():
		sensor.reverse_direction = reverse_direction
	_face(direction)

func _on_reverse_direction(..._args: Array) -> void:
	if last_turn_frame != Engine.get_physics_frames():
		last_turn_frame = Engine.get_physics_frames()
		_face(-direction)

func _face(new_direction: float) -> void:
	direction = new_direction
	facing.scale.x = direction
	move.event.emit(Vector2(direction, 0.0))
