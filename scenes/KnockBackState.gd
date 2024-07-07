extends State

func enter() -> void:
	owner.velocity = -owner.velocity
	await get_tree().create_timer(0.2)
	transition.emit("chasingstate")
	
func exit() -> void:
	pass
