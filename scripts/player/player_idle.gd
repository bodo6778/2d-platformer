extends State
class_name PlayerIdle

const SPEED = 130.0

@export var animated_sprite : AnimatedSprite2D
@export var player : CharacterBody2D

func enter():
	animated_sprite.play("idle")

func physics_update(_delta: float) -> void:	
	var direction := Input.get_axis("move_left", "move_right")
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "PlayerJump")
		
	if direction != 0:
		Transitioned.emit(self, "PlayerRun")
	
	player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
	pass
