extends Area2D

export (int) var JUMP_SPEED = -400

func action():
	if get_parent().is_on_floor():
		get_parent().velocity.y = JUMP_SPEED

func _on_Spring_body_entered(body):
	# Move the node to be a child of the player
	if body.get_name() == "Player" && body.get_child_count() == 2:
		get_parent().call_deferred("remove_child", self)
		body.call_deferred("add_child", self)
		
		# Change the nodes position
		position = Vector2(0, 0)
