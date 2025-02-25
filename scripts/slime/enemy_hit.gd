extends State
class_name EnemyHit

const JUMP_VELOCITY = -200.0
const KNOCKBACK_VALUE = 100
const SLOW_KNOCKBACK = 1.1

@export var enemy_instance : CharacterBody2D
@export var animated_sprite : AnimatedSprite2D

var direction = 1

func _ready() -> void:
	if animated_sprite.flip_h:
		direction = -1
	else:
		direction = 1
	animated_sprite.animation_finished.connect(_on_animation_done)

func enter():
	Transitioned.emit(self, "EnemyIdle")
	enemy_instance.velocity.y = JUMP_VELOCITY
	enemy_instance.velocity.x = direction * KNOCKBACK_VALUE
	animated_sprite.play("hit")

func _on_animation_done():
	Transitioned.emit(self, "EnemyIdle")
