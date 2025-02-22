extends State
class_name PlayerRun

const SPEED = 130.0

@export var player : CharacterBody2D
@export var animated_sprite : AnimatedSprite2D


func physics_update(_delta: float):
	if player.is_on_floor():
		animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	var direction := Input.get_axis("move_left", "move_right")
	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	player.velocity.x = direction * SPEED
		
	if Input.is_action_just_pressed("attack_roll"):
		Transitioned.emit(self, "PlayerAttack")	
		
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "PlayerJump")	
		
	if direction == 0 and player.is_on_floor():
		Transitioned.emit(self, "PlayerIdle")
	
