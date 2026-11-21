class_name PlayAnimation
extends ReactBase

@export var animation_player: AnimationPlayer

func _on_event(...args: Array) -> void:
	var animation_name = args[0]
	if animation_player.has_animation(animation_name) and animation_player.current_animation != animation_name:
		animation_player.play(animation_name)
