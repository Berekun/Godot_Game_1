extends KinematicBody2D

var movement = Vector2.ZERO

var velocity  = 200 
var angle = 0

func _ready():
	movement.x = cos(angle)
	movement.y = sin(angle)
	
func _physics_process(delta):
	
	movement = movement.normalized() * velocity
	movement = move_and_slide(movement)
	
func _on_Area2D_body_entered(body):
	self.queue_free()
	
	if body.get_collision_layer() == 2:
		body.stats.health -= 1
