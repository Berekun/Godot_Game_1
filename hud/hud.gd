extends Control

var hearts = 3 setget set_hearts
var max_hearts = 3 setget max_set_hearts

onready var label = $Label

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	
func max_set_hearts(value):
	max_hearts = max(value, 1)
	
func _ready():
	self.hearts = PlayerStats.health
	self.max_hearts = PlayerStats.max_health
	PlayerStats.connect("health_changed", self, "set_hearts")
