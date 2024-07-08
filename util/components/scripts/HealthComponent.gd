extends Node2D
class_name HealthComponent

signal health_changed(health: float)

@export var max_health : float = 10.0
@onready var enemy : enemy_cube = get_owner()
var health : float

func _ready() -> void:
	health = max_health
	health_changed.emit(health)
	
func _on_enemycubehitbox_damaged(attack: Attack) -> void:
	if !enemy.alive:
		return
	health -= attack.attack_damage
	health_changed.emit(health)
	
	enemy.velocity = (enemy.position - attack.attack_position).normalized()*attack.knockback_force
	
	if health <= 0:
		health = 0
		enemy.alive = false
		get_parent().queue_free()
		

