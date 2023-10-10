extends KinematicBody2D

const acceleration = 1000
const max_speed = 150
const friction = 1000

const Bala = preload("res://Bullets/Bala.tscn")
const cam = preload("res://prota_movetxt/Camera2D.tscn")

var velocity = Vector2.ZERO

var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	stats.connect("no_health", self, "queue_free")
	var camera = cam.instance()
	self.add_child(camera)
	$Timer.start(0.4)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = 	Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationState.travel("Walk")
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else: 
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	velocity = move_and_slide(velocity)

func shoot():
	if Input.is_action_pressed("shoot"):
		var bala = Bala.instance()
		bala.position = self.position
		bala.angle = get_angle_to(get_global_mouse_position())
		get_parent().add_child(bala)
		

func _on_Timer_timeout():
	shoot()
