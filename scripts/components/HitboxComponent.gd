extends Area2D 
class_name HitboxComponenent

@export var health_component : HealthComponent

func damage(attack : Attack):
	if health_component:
		print(health_component.health)
		health_component.damage(attack)
