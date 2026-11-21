extends Node2D

@export var distance_x: float
@export var distance_y: float
@export var reverse_direction: EventResource
@export_flags_2d_physics var collision_mask: int

func _ready() -> void:
	%RayCast2D.set_deferred("collision_mask", collision_mask)
	%RayCast2D.target_position.x = distance_x
	%RayCast2D.target_position.y = distance_y
	%RayCast2D.position.x = distance_x


func _physics_process(_delta: float) -> void:
	if not %RayCast2D.is_colliding():
		reverse_direction.event.emit()
