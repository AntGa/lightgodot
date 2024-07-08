extends State
class_name EnemyChase

@export var enemy : Sprite2D

var speed : int = 100
var velocity : Vector2 = Vector2()

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	if Global.player != null:
		velocity = enemy.position.direction_to(Global.player.global_position)
	enemy.position += velocity * speed * _delta
