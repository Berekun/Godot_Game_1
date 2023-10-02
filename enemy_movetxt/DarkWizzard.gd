extends KinematicBody2D

const Bala = preload("res://Bullets/Bala.tscn")

var movement = Vector2.ZERO

var velocity = 200

func _physics_process(delta):
	
	movement = player.position - self.position
	movement = movement.normalized() * velocidad
	movement = move_and_slide(movement)
	
func shoot():
		var bala = Bala.instance()
		bala.position = self.position
		bala.angle = 
		get_parent().add_child(bala)
