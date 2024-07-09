extends PlayerState

const SPEED: float = 300.0
var direction : Vector2 

func physics_update(delta: float) -> void:
	direction = movement_component.get_movement_direction()
	
	if direction.y * SPEED == 0 &&  direction.x * SPEED == 0:
		transitioned.emit(self, "PlayerIdle")
		
	player.velocity.x = direction.x * SPEED
	player.velocity.y = direction.y * SPEED
	player.velocity = player.velocity.move_toward(Vector2.ZERO, SPEED * delta)
	player.move_and_slide()	
	
	
