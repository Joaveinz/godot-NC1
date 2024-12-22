extends Sprite2D
class_name Bullet

@export var speed = 300;
@export var explosion: PackedScene;

func _physics_process(delta):
	translate(Vector2(1 ,0) * speed * delta)

func trigger_explosion():
	var _particle = explosion.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	queue_free()

func _on_area_2d_body_entered(body):
	if body is Enemy:
		body.queue_free()
		trigger_explosion()
