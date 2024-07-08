extends State
class_name EnemyChase

@export var enemy : Sprite2D
@export
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
		velocity = global_position.direction_to(Global.player.global_position)
	
	global_position += velocity * speed * delta
