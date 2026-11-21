class_name EnemyDetection
extends Area2D

@export var enemy_detected: EventResource

func _init() -> void:
	collision_layer = 0
	collision_mask = 4

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body.is_ancestor_of(self):
		enemy_detected.event.emit(body, self)
