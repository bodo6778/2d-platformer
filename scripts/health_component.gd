extends Node
class_name HealthComponent

@export var MAX_HEALTH := 3
var health : float

func _ready() -> void:
	health = MAX_HEALTH

func take_damage(damageAmount):
	health -= damageAmount
	var parent = get_parent()
	if (parent.hit):
			parent.hit()
	if (health <= 0):
		if (parent.died):
			parent.died()
		
	print("HealtCoponent:", parent, ":", health)
	

	
