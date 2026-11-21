class_name PlayerDetection
extends Area2D

@export var player_detected: EventResource

func _init() -> void:
	collision_layer = 0
	collision_mask = 2

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body.is_ancestor_of(self):
		player_detected.event.emit(body, self)
