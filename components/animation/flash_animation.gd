class_name FlashAnimation
extends ReactBase

@export var target: CanvasItem
@export var flash_color: Color
@export var flash_time: float
@export var number_of_flashes: int

func _on_event(..._args: Array) -> void:
	var tween = create_tween().bind_node(target)
	tween.set_loops(number_of_flashes)
	tween.tween_property(target, "modulate", flash_color, flash_time)
	tween.tween_property(target, "modulate", Color.WHITE, flash_time)
