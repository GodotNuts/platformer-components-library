@tool
extends StaticBody2D

@export var size: Vector2 = Vector2(128, 16):
	set(value):
		size = value
		_resize()
@export var color: Color = Color(0.36, 0.3, 0.25):
	set(value):
		color = value
		queue_redraw()

func _ready() -> void:
	_resize()

func _resize() -> void:
	if is_node_ready():
		$CollisionShape2D.shape.size = size
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(-size / 2.0, size), color)
