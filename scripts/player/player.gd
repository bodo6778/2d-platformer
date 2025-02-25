extends CharacterBody2D
class_name Player

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_manager: Node2D = $AudioManager
@onready var hurt_sound: AudioStreamPlayer2D = $AudioManager/HurtSound
@export var collision_shape_2d: CollisionShape2D
@export var health_component : HealthComponent
@export var state_machine : StateMachine

signal player_hit

var knockbackVector: Vector2

func _ready() -> void:
	state_machine.on_child_transition(state_machine.current_state, "PlayerIdle")	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	
func hit():
	state_machine.on_child_transition(state_machine.current_state, "PlayerHit")
	player_hit.emit()
	
func died():
	state_machine.on_child_transition(state_machine.current_state, "PlayerDead")
	collision_shape_2d.queue_free()
