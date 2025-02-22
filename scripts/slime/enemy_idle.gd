extends State
class_name EnemyIdle

const SPEED = 60
var direction = 1

@export var enemy_instance : Node2D
@export var animated_sprite : AnimatedSprite2D
@export var ray_cast_right: RayCast2D 
@export var ray_cast_left: RayCast2D 

func enter():
	animated_sprite.play("default")

func physics_update(delta: float) -> void:	
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	enemy_instance.position.x += direction * SPEED * delta
