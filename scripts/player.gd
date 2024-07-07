extends CharacterBody2D
const SPEED: float = 300.0
var bullet = preload("res://scenes/bullet.tscn")

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	velocity = velocity.move_toward(Vector2.ZERO, SPEED * delta)
	move_and_slide()	
	
	global_position: float += speed * velocity * delta
	if Input.is_action_just_pressed("click"):
		Global.instance_node(bullet, global_position, get_parent())

func _process(delta):
	# Update camera position based on mouse position
	var mouse_offset = (get_viewport().get_mouse_position() - get_viewport().size / 2.0)
	$Camera2D.position = lerp(Vector2(), mouse_offset.normalized() * 500, mouse_offset.length() / 1000)
