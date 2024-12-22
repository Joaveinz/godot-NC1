extends CharacterBody2D
class_name Enemy

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity.x = -100
	move_and_slide()

func _on_player_detector_body_entered(body):
	if body is Player:
		#TODO: replace with DIE function
		body.queue_free()
