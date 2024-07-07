extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.node_creation_parent = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _exit_tree() -> void:
	Global.node_creation_parent = null
