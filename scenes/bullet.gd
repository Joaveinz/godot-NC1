extends CharacterBody2D

@export var speed = 300;
@export var explosion: PackedScene;
var timeCollided = 0;
#@export var velocity = Vector2(0, 0);

# Called when the node enters the scene tree for the first time.
#func _ready():
	#position.direction_to(target) * speed

	
 
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * delta * speed);
	if timeCollided != 0:
		if  self.scale.x < 0.1 && self.scale.y < 0.1:
			queue_free()
		else:
			self.scale.x -= 0.2
			self.scale.y -= 0.2
	elif(collision):
		#queue_free()
		timeCollided = Time.get_ticks_msec()
		explode()

func explode():
	print("explode!")
	var _particle = explosion.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	queue_free()
