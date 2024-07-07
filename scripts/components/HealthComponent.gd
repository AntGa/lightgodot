extends Node2D
class_name HealthComponent

@export var MAX_HEALTH : float = 10.0
var health : float

func _ready() -> void:
	health = MAX_HEALTH
	
func damage(attack : Attack):
	health -= attack.attack_damage
	get_parent().velocity = (global_position - attack.attack_position).normalized() * attack.knockback_force
	if health <= 0:
		get_parent().queue_free()
