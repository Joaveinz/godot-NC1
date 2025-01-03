extends CharacterBody2D
class_name Player

@onready var animationPlayer = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var timer: Timer

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animationPlayer.play("jump_start")

	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if(direction != 0):
		sprite.flip_h = (direction == -1)
	
	update_animations(direction)
	move_and_slide()

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("idle")
		else:
			animationPlayer.play("running")
	else:
		animationPlayer.play("jump_loop")

func die():
	print("You died!")
	await get_tree().create_timer(0.2).timeout
	get_tree().reload_current_scene()
	
	
