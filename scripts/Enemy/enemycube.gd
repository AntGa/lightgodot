class_name enemy_cube
extends CharacterBody2D

signal damaged(attack: Attack)

var alive := true
var stunned := false

func _ready():
	pass
	
func _on_enemycubehitbox_damaged(attack: Attack) -> void:
	damaged.emit(attack)
