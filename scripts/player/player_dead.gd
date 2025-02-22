extends State
class_name PlayerDead

const JUMP_VELOCITY = -300.0

@export var animated_sprite : AnimatedSprite2D
@export var player : CharacterBody2D
@export var audio_manager : Node2D

func enter():
	animated_sprite.play("death")
	audio_manager.get_node("HurtSound").play()
	player.velocity.y = JUMP_VELOCITY
	player.velocity.x = move_toward(player.velocity.x, 0, -JUMP_VELOCITY)
