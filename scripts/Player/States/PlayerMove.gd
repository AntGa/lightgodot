extends PlayerState

const SPEED: float = 300.0
const ACCELERATION : float = 1000.0
const FRICTION : float = 500.0
var direction : Vector2 


func physics_update(delta: float) -> void:
	direction = movement_component.get_movement_direction()
	
	if direction.y * SPEED == 0 &&  direction.x * SPEED == 0:
		transitioned.emit(self, "PlayerIdle")
	
	if direction.length() > 0:
		player.velocity = player.velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	player.move_and_slide()	
	
	
