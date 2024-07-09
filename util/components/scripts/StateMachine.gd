extends Node

@export var inital_state : State
var states : Dictionary = {}

var current_state : State
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
		else:
			push_warning(child.name, "is not a State and is incompatible with", name)
	if inital_state:
		inital_state.enter()
		current_state = inital_state
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
			
func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_update(delta)

func on_child_transition(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	print(new_state)
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
	else:
		push_warning("State does not exist")
