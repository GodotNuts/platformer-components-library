class_name MoveAndSlide
extends Node

@export var body: CharacterBody2D

func _enter_tree() -> void:
	process_physics_priority = 4000

func _physics_process(_delta: float) -> void:
	body.move_and_slide()
