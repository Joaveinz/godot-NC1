extends CharacterBody2D

@export var speed = 300;
#@export var velocity = Vector2(0, 0);

# Called when the node enters the scene tree for the first time.
#func _ready():
	#position.direction_to(target) * speed

	
 
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * delta * speed);

