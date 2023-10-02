extends KinematicBody2D

const Bala = preload("res://Bullets/Enemy_Bullet.tscn")
onready var player = get_parent().get_node("player")

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var movement = Vector2.ZERO

var velocity = 100

func _ready():
	$Timer.start(0.4)

func _physics_process(delta):
	movement = player.position - self.position
	
	if movement != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", movement)
		animationTree.set("parameters/run/blend_position", movement)
		animationState.travel("run")
		movement = movement.normalized() * velocity
	else: 
		animationState.travel("Idle")
		movement = Vector2.ZERO
		
	movement = move_and_slide(movement)
	
func shoot():
		var bala = Bala.instance()
		bala.position = self.position
		bala.angle = movement.direction_to(player.position).angle()
		get_parent().add_child(bala)


func _on_Timer_timeout():
	shoot()
