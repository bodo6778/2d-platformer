extends State
class_name EnemyHit

const JUMP_VELOCITY = -200.0
const KNOCKBACK_VALUE = 100
const SLOW_KNOCKBACK = 1.1

@export var enemy_instance : Node2D
@export var animated_sprite : AnimatedSprite2D

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_done)

func enter():
	#Transitioned.emit(self, "EnemyIdle")
	#var direction := Input.get_axis("move_left", "move_right")
	#enemy_instance.velocity.y = JUMP_VELOCITY
	#enemy_instance.velocity.x = enemy_instance.velocity.x + KNOCKBACK_VALUE
	animated_sprite.play("hit")

func _on_animation_done():
	Transitioned.emit(self, "EnemyIdle")
