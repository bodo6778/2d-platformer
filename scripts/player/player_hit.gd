extends State
class_name PlayerHit

const JUMP_VELOCITY = -200.0
const KNOCKBACK_VALUE = 100
const SLOW_KNOCKBACK = 1.1

@export var animated_sprite : AnimatedSprite2D
@export var player : CharacterBody2D
@export var audio_manager : Node2D

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_done)

func enter():
	audio_manager.get_node("HurtSound").play()
	var direction := Input.get_axis("move_left", "move_right")

	player.velocity.y = JUMP_VELOCITY
	player.velocity.x = -direction * KNOCKBACK_VALUE
	animated_sprite.play("hit")

func _on_animation_done():
	Transitioned.emit(self, "PlayerIdle")
