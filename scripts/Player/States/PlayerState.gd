extends State
class_name PlayerState

@onready var player : Player = get_owner()
var movement_component : MovementComponent

signal transitioned(state: EnemyCubeState, new_state_name: String)
