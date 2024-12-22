extends Node2D

@onready var spawn_pos = $spawnPoint

func get_spawn_pos():
	return spawn_pos.global_position
