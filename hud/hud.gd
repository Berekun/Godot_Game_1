extends Control

var hearts = 3 setget set_hearts
var max_hearts = 3 setget max_set_hearts

onready var label = $Label
onready var heartUIFull = $full_hearts
onready var heartUIHalf = $half_hearts
onready var heartUIVoid = $void_hearts

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 16
		print(heartUIFull.rect_size.x)
		print(hearts)
	
func max_set_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartUIVoid != null:
		heartUIVoid.rect_size.x = max_hearts * 16
	
func _ready():
	self.hearts = PlayerStats.health
	self.max_hearts = PlayerStats.max_health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "max_set_hearts")
