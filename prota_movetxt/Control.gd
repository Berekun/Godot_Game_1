extends Control

var hearts = 3 setget set_hearts
var max_hearts = 3 setget set_max_hearts

onready var player = get_parent().get_node("player") 

onready var label = $Label

func set_hearts(value):
	hearts = clamp(value,0,max_hearts)

func set_max_hearts(value):
	max_hearts = max(value, 1)
	
func _ready():
	self.hearts = player.hearts
	self.max_hearts = player.max_hearts
	
