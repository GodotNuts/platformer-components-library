class_name IsOnFloor
extends Node

@export var body: CharacterBody2D

func is_on_floor() -> bool:
	return body.is_on_floor()
