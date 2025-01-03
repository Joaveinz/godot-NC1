extends Node2D

const bullet_path = preload("res://scenes/bullet.tscn");

func _process(delta):
	look_at(get_global_mouse_position())

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("left_click"):
		shoot()

func shoot():
	var bullet = bullet_path.instantiate()
	get_parent().get_parent().get_parent().add_child(bullet)
	bullet.position = $Bullet_pos.get_global_position()
	bullet.look_at(get_global_mouse_position())
	bullet.velocity = get_global_mouse_position() - bullet.position
	
