class_name GetInputVector
extends Node

@export var vector_left: String
@export var vector_right: String
@export var vector_up: String
@export var vector_down: String
@export var input_vector_changed: EventResource

var previous = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	var input = Input.get_vector(vector_left, vector_right, vector_up, vector_down)
	if not input.is_equal_approx(previous):
		previous = input
		input_vector_changed.event.emit(input)
