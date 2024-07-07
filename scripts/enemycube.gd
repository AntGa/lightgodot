extends Sprite2D

var speed : int = 100

var velocity : Vector2 = Vector2()

func _physics_process(delta: float) ->  void:
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
	
	global_position += velocity * speed * delta

