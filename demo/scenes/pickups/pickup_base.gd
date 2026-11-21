extends Area2D

@export var pickup_received: EventResource

func _ready() -> void:
	body_entered.connect(pickup_received.event.emit.bind(self))
