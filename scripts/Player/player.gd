class_name Player
extends CharacterBody2D

const SPEED: float = 300.0
var bullet = preload("res://scenes/bullet.tscn")
var can_shoot: bool = true
var aim_position : Vector2 = Vector2(1, 0)

func _ready() -> void:
	Global.player = self
	
func _exit_tree() -> void:
	Global.player = null
		
func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("click") and Global.node_creation_parent != null:
		$reloadspeed.start()
		Global.instance_node(bullet, global_position, Global.node_creation_parent)
		can_shoot = false

func _on_reload_speed_timeout() -> void:
	can_shoot = true
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var half_viewport = get_viewport_rect().size / 2.0
		aim_position = (event.position - half_viewport)

	
