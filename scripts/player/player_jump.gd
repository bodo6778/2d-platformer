extends State
class_name PlayerJump

const JUMP_VELOCITY = -300.0
const SPEED = 130.0

@export var player : CharacterBody2D
@export var animated_sprite : AnimatedSprite2D
@onready var audio_manager: Node2D = $"../../AudioManager"

func enter():
	animated_sprite.play("jump")
	audio_manager.get_node("JumpSound").play()
	player.velocity.y = JUMP_VELOCITY

func physics_update(_delta: float) -> void:	
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	player.velocity.x = direction * SPEED
	
	if Input.is_action_just_pressed("attack_roll"):
		Transitioned.emit(self, "PlayerAttack")	
	
	if direction != 0 and player.is_on_floor():
		Transitioned.emit(self, "PlayerRun")
		
	if direction == 0 and player.is_on_floor():
		Transitioned.emit(self, "PlayerIdle")
	
	
