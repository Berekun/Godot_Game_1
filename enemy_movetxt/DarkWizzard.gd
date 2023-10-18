extends KinematicBody2D

const Bala = preload("res://Bullets/Enemy_Bullet.tscn")
onready var player = get_parent().get_node("player")

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
var isInside = false
onready var movement = player.position - self.position

onready var stats = $Stats

var velocity = 100

func _ready():
	$ShootTimer.start(1)
	$AreaDelay.start()

func _physics_process(delta): 
	player = get_parent().get_node("player")
	
	if movement == Vector2.ZERO:
		animationState.travel("Idle")
	else:
		if player != null:
			movement = player.position - self.position
			
		animationTree.set("parameters/Idle/blend_position", movement)
		animationTree.set("parameters/run/blend_position", movement)
		animationState.travel("run")
		movement = movement.normalized() * velocity
		
	movement = move_and_slide(movement)
	
func shoot():
	var bala = Bala.instance()
	bala.position = self.position
	if player != null:
		bala.angle = get_angle_to(player.position)
	get_parent().add_child(bala)


func _on_Timer_timeout():
	shoot()

func _on_Area2D_body_entered(body):
	if body != self && body.name == "player":
		isInside = true
	
func _on_Area2D_body_exited(body):
	if body.name == "player":
		isInside = false

func _on_AreaDelay_timeout():
	if player != null:
		if isInside:
			movement = Vector2.ZERO
		else:
			movement = player.position - self.position


func _on_Stats_no_health():
	queue_free()
