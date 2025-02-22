extends State
class_name PlayerAttack

const SPEED = 350
const DISTANCE = 50
const SLOW_FACTOR = 800

@export var animated_sprite : AnimatedSprite2D
@export var player : CharacterBody2D

var slowdown_speed = SPEED

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_done)

func enter() -> void:
	var direction := Input.get_axis("move_left", "move_right")
	animated_sprite.play("attack")
	player.velocity.x = direction * SPEED

func physics_update(delta):
	var direction := Input.get_axis("move_left", "move_right")
	player.velocity.x = move_toward(player.velocity.x, direction * 100, delta * SLOW_FACTOR)
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "PlayerJump")	
	
func _on_animation_done():
	var direction := Input.get_axis("move_left", "move_right")
	if direction != 0:
		Transitioned.emit(self, "PlayerRun")
	Transitioned.emit(self, "PlayerIdle")
	
	
