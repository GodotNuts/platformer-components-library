@tool
extends Node2D

@export var size: float = 24.0:
	set(value):
		size = value
		queue_redraw()
@export var color: Color = Color.CRIMSON:
	set(value):
		color = value
		queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(Vector2(-size, -size) / 2.0, Vector2(size, size)), color)
