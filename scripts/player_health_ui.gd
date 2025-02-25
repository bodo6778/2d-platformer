extends HBoxContainer
class_name PlayerHealth

@export var MAX_HEALTH_AMOUNT = 3
@export var CURRENT_HEALTH = 3

# Called when the node enters the scene tree for the first time
func _ready():
		#animated_sprite.animation_finished.connect(_on_animation_done)
	
	update_health_display()

# Update the heart display based on current health
func update_health_display():
	for i in range(1, MAX_HEALTH_AMOUNT + 1):
		var full_heart = get_node_or_null("FullHeart" + str(i))
		var empty_heart = get_node_or_null("EmptyHeart" + str(i))
		if full_heart and empty_heart:
			if i <= CURRENT_HEALTH:
				full_heart.visible = true
				empty_heart.visible = false
			else:
				full_heart.visible = false
				empty_heart.visible = true

# Function to change health
func set_health(value: int):
	CURRENT_HEALTH = clamp(value, 0, MAX_HEALTH_AMOUNT)
	update_health_display()
