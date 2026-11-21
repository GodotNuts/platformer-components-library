class_name ApplyGravity
extends Node

@export var physics_values: PhysicsConstants
@export var body: CharacterBody2D

func _enter_tree() -> void:
	process_physics_priority = 3999

func _physics_process(delta: float) -> void:
	body.velocity += physics_values.get_player_gravity() * physics_values.gravity_direction * delta
