extends Sprite2D

var velocity = Vector2(1,0)
var speed = 250

var look_once = true

func _physics_process(delta):
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta
	
func _ready() -> void:
	$despawn.start()

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is despawn_area:
		queue_free()


func _on_despawn_timeout() -> void:
	queue_free()
