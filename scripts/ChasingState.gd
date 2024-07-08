extends State

var speed : int = 100
var velocity := Vector2()

func _physics_update(delta: float) -> void:
	if Global.player != null:
		velocity = owner.global_position.direction_to(Global.player.global_position)
	owner.global_position += velocity * speed * delta

func update(delta: float) -> void:
	pass
