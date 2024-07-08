extends Area2D 
class_name HitboxComponenent

signal damaged

func damage(attack : Attack):
	damaged.emit(attack)
