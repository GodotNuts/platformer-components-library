extends CharacterBody2D

@export var physics_constants: PhysicsConstants
@export var actions_just_pressed: EventResource
@export var actions_held: EventResource
@export var input_vector_changed: EventResource
@export var jump: EventResource
@export var dash: EventResource
@export var wall_grab: EventResource
@export var direction_changed: EventResource
@export var player_hurt: EventResource
@export var enemy_stomped: EventResource
@export var max_health: int = 3

var holding_grab = false
var input_vector = Vector2.ZERO
var health = 0

func _ready() -> void:
	health = max_health
	actions_just_pressed.event.connect(_on_actions_just_pressed)
	actions_held.event.connect(_on_actions_held)
	input_vector_changed.event.connect(_on_input_vector_changed)
	player_hurt.event.connect(_on_player_hurt)
	enemy_stomped.event.connect(_on_enemy_stomped)

func _physics_process(_delta: float) -> void:
	if holding_grab:
		wall_grab.event.emit(self, input_vector)

func _on_actions_just_pressed(actions: Dictionary) -> void:
	if actions.get("jump", false):
		jump.event.emit(self)
	if actions.get("dash", false):
		dash.event.emit(self)

func _on_actions_held(actions: Dictionary) -> void:
	holding_grab = actions.get("grab", false)

func _on_input_vector_changed(input: Vector2) -> void:
	input_vector = input
	direction_changed.event.emit(self, input)

func _on_player_hurt(player: Node2D, damage: int, _source: Node2D) -> void:
	if player != self:
		return
	health -= damage
	if health <= 0:
		get_tree().reload_current_scene.call_deferred()

func _on_enemy_stomped(player: Node2D) -> void:
	if player == self:
		velocity.y = -physics_constants.player_jump_strength * physics_constants.jump_strength_fraction
