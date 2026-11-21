class_name PickupReceived
extends ReactBase

@export var distance: float
@export var time: float

func _on_event(...args: Array) -> void:
	var pickup = args[1]
	pickup.set_deferred("monitoring", false)
	var tween = create_tween().bind_node(pickup)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(pickup, "position:y", pickup.position.y - distance, time)
	await tween.finished
	pickup.queue_free()
