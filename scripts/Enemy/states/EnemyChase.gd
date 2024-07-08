extends EnemyCubeState
class_name EnemyChase


var speed : int = 100
var velocity : Vector2 = Vector2()

func Physics_Update(_delta: float):
	if Global.player != null:
		velocity = enemy.position.direction_to(Global.player.global_position)
	enemy.position += velocity * speed * _delta
