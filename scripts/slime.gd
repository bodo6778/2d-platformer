extends Node2D

@export var state_machine : StateMachine

func hit():
	state_machine.on_child_transition(state_machine.current_state, "EnemyHit")
	
func died():
	queue_free()

	
