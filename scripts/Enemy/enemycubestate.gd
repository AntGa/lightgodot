class_name EnemyCubeState
extends State

signal transitioned(state: EnemyCubeState, new_state_name: String)

@onready var enemy : enemy_cube = get_owner()
var player : Player


func _ready():
	player = get_tree().get_first_node_in_group("player")
	enemy.damaged.connect(on_damaged)

func on_damaged(attack: Attack):
	transitioned.emit(self, "EnemyStunned")
