extends Area2D
class_name AttackComponent

@export var ATTACK_DAMAGE_AMOUNT = 1

func _on_area_entered(area):
	
	#print("HitboxComponent AREA: ", area, ATTACK_DAMAGE_AMOUNT)
	
	if area is HitboxComponent:
		area.damage(ATTACK_DAMAGE_AMOUNT)
