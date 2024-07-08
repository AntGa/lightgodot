extends Label

func _on_state_machine_state_label(state: State) -> void:
	text = "State: " + str(state.name)
