extends Node
class_name AttackComponent

func _on_area_entered(area):
	if area is HitboxComponent:
		area.damage(1)
