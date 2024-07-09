extends State
class_name PlayerState

@onready var Player : Player = get_owner()

var movement_component : MovementComponent

signal transitioned(state: EnemyCubeState, new_state_name: String)
