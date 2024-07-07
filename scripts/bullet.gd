extends Sprite2D

var velocity : Vector2 = Vector2(1,0)
var speed : int = 250
var look_once : bool = true

func _physics_process(delta) -> void:
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta
	
func _ready() -> void:
	$despawn.start()


func _on_despawn_timeout() -> void:
	queue_free()
