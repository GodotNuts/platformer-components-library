class_name LevelReady
extends Node

@export var level_readied: EventResource

func _ready() -> void:
	owner.ready.connect(level_readied.event.emit.bind(owner), CONNECT_ONE_SHOT)
