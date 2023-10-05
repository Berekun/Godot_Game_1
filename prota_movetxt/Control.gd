extends Control

var hearts = 3 setget set_hearts
var max_hearts = 3 setget set_max_hearts

onready var player = get_parent().get_parent().get_child(2).get_node("player")


onready var label = $Label

func set_hearts(value):
	hearts = clamp(value,0,max_hearts)
	if label != null:
		label.text = "HP" + str(hearts)

func set_max_hearts(value):
	max_hearts = max(value, 1)
	
