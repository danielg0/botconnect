extends KinematicBody2D

export var velocity = Vector2()

func _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		# TODO: Implement player death
		var collided = collision.get_collider()
		if collided.get_name() == "TileMap":
			velocity = -velocity
		elif collided.get_name() == "Player":
			collided.get_parent().remove_child(collided)
