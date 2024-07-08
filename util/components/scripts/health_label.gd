extends Label

func _on_health_component_health_changed(health: float) -> void:
	text = "Health: " + str(health)
