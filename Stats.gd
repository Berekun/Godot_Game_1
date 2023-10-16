extends Node

var max_health = 3 setget set_max_health
onready var health = max_health setget set_health

signal no_health
signal max_health_changed(value)
signal health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed")

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
