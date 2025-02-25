extends CanvasLayer

@export var player : Player

@onready var player_health: PlayerHealth = $PlayerHealth

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_player_hit() -> void:
	player_health.CURRENT_HEALTH = player.health_component.health
	player_health.update_health_display()
	pass # Replace with function body.
