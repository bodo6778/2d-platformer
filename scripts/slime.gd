extends CharacterBody2D

@export var collision_shape : CollisionShape2D
@export var state_machine : StateMachine

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func hit():
	state_machine.on_child_transition(state_machine.current_state, "EnemyHit")
	
func died():
	collision_shape.queue_free()

	
