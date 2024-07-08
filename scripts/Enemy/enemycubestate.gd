class_name EnemyCubeState
extends State

signal transitioned(state: EnemyCubeState, new_state_name: String)

@onready var enemy : enemy_cube = get_owner()
var player : Player


func _ready():
	player = get_tree().get_first_node_in_group("player")
	enemy.damaged.connect(on_damaged)

# Attempts to switch to chase state if it detects the player
func try_chase() -> bool:
	if get_distance_to_player() <= enemy.detection_radius:
		transitioned.emit(self, "chase")
		return true
	
	return false

func get_distance_to_player() -> float:
	return player.global_position.distance_to(enemy.global_position)

func on_damaged(attack: Attack):

	transitioned.emit(self, "EnemyStunned")
