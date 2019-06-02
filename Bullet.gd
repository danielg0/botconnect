extends KinematicBody2D

var velocity = Vector2()

func setVelocity(v):
	velocity = v

# Delete this node as soon as it collides with a wall
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		get_parent().remove_child(self)
