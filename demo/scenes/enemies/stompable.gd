extends ReactBase

@export var died: EventResource
@export var enemy_stomped: EventResource
@export var player_hurt: EventResource
@export var stomp_margin: float = 8.0
@export var damage: int = 1

func _on_event(...args: Array) -> void:
	var player = args[0]
	var detector = args[1]
	if _landed_on_top(player, detector):
		enemy_stomped.event.emit(player)
		died.event.emit()
		detector.owner.queue_free()
	else:
		player_hurt.event.emit(player, damage, detector.owner)

func _landed_on_top(player: CharacterBody2D, detector: Area2D) -> bool:
	return player.velocity.y > 0.0 and player.global_position.y < detector.global_position.y - stomp_margin
