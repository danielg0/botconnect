extends KinematicBody2D

export var velocity = Vector2()

func _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collided = collision.get_collider()
		if collided.get_name() == "TileMap":
			velocity = -velocity

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		body.get_parent().call_deferred("remove_child", body)
