extends Sprite2D
class_name Enemy

var speed : int = 100
var velocity := Vector2()

func _ready() -> void:
	pass

func apply_velocity() -> void:
	if Global.player != null:
		velocity = owner.global_position.direction_to(Global.player.global_position)
	owner.global_position += velocity * speed

