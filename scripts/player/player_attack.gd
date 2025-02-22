extends State
class_name PlayerAttack

const SPEED = 350
const DISTANCE = 50
const SLOW_FACTOR = 800

@export var animated_sprite : AnimatedSprite2D
@export var player : CharacterBody2D
@export var hitbox_component : HitboxComponent
@export var attack_component : AttackComponent

var direction = 1
var slowdown_speed = SPEED

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_done)

func enter() -> void:
	if animated_sprite.flip_h:
		direction = -1
	else:
		direction = 1
	animated_sprite.play("attack")
	player.velocity.x = direction * SPEED
	hitbox_component.set_collision_layer_value(2, false)
	attack_component.set_collision_mask_value(4, true)
	
	

func physics_update(delta):
	direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = move_toward(player.velocity.x, direction * 100, delta * SLOW_FACTOR)
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "PlayerJump")	
	
func _on_animation_done():
	direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		Transitioned.emit(self, "PlayerRun")
	Transitioned.emit(self, "PlayerIdle")
	
func exit() -> void:
	hitbox_component.set_collision_layer_value(2, true)
	attack_component.set_collision_mask_value(4, false)
	pass
