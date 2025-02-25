extends Node

@export var player : Player

var score = 0
#var health = player.health_component.health
var health = 4
@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
