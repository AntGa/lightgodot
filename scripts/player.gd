class_name Player
extends CharacterBody2D

const SPEED: float = 300.0
var bullet = preload("res://scenes/bullet.tscn")
var can_shoot: bool = true

func _ready() -> void:
	Global.player = self
	
func _exit_tree() -> void:
	Global.player = null
		
func _physics_process(delta) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	velocity = velocity.move_toward(Vector2.ZERO, SPEED * delta)
	move_and_slide()	
	
	if Input.is_action_just_pressed("click") and Global.node_creation_parent != null:
		$reloadspeed.start()
		Global.instance_node(bullet, global_position, Global.node_creation_parent)
		can_shoot = false

func _process(delta) -> void:
	# Update camera position based on mouse position
	var mouse_offset = (get_viewport().get_mouse_position() - get_viewport().size / 2.0)
	$Camera2D.position = lerp(Vector2(), mouse_offset.normalized() * 500, mouse_offset.length() / 1000)

func _on_reload_speed_timeout() -> void:
	can_shoot = true
	
