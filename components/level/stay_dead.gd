class_name StayDead
extends ReactBase

@export var target: Node
@export var died: EventResource

var _id = ""

func _ready() -> void:
	super._ready()
	died.event.connect(_on_died)

func _on_event(...args: Array) -> void:
	var level = args[0]
	_id = level.scene_file_path + ":" + str(level.get_path_to(target))
	if not GameState.is_alive(_id):
		target.queue_free()

func _on_died(..._args: Array) -> void:
	GameState.mark_dead(_id)
