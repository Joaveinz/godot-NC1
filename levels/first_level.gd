extends Node2D
@export var next_level: PackedScene = null

@onready var start_position = $Spawn
@onready var player = $Player
@onready var exit = $Finish

# Called when the node enters the scene tree for the first time.
func _ready():
	exit.body_entered.connect(_on_exit_body_entered)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test"):
		reset_player();

func reset_player():
	player.global_position = start_position.get_spawn_pos()

func _on_exit_body_entered(body):
	if(body is Player):
		get_tree().change_scene_to_packed(next_level)
