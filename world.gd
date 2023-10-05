extends Node2D

const dw = preload("res://enemy_movetxt/DarkWizzard.tscn")
const p = preload("res://prota_movetxt/player.tscn")
const hud = preload("res://prota_movetxt/HUD.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
	_createPlayer()
	_createEnemys()
	_createHud()

func _createEnemys():
	var i = 0
	
	while i < 1:
		i += 1
		var enemy = dw.instance()
		var newPosition = Vector2.ZERO
		newPosition.x = rng.randi_range(-400, 400)
		print(newPosition.x)
		newPosition.y = rng.randi_range(-300, 300)
		print(newPosition.y)
		enemy.position = newPosition
		get_node("YSort").add_child(enemy)

func _createPlayer():
	var player = p.instance()
	player.position = Vector2.ZERO
	get_node("YSort").add_child(player)
	
func _createHud():
	var h = hud.instance()
	get_node("CanvasLayer").add_child(h)
