@tool
extends Node2D

@export var radius: float = 12.0:
	set(value):
		radius = value
		queue_redraw()
@export var color: Color = Color.ROYAL_BLUE:
	set(value):
		color = value
		queue_redraw()

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)
