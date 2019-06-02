extends Area2D

export (int) var JUMP_SPEED = -400

func action():
	if get_parent().is_on_floor():
		get_parent().velocity.y = JUMP_SPEED
		get_child(2).play()

func _on_Spring_body_entered(body):
	# Move the node to be a child of the player
	if body.get_name() == "Player" && get_parent().get_name() != "Player":
		var count = body.get_child_count()
		if count == 3 || count == 4:
			pass
			get_parent().call_deferred("remove_child", self)
			body.call_deferred("add_child", self)
			body.get_child(2).play()

			# If being paced in second, switch items
			if count == 4:
				body.call_deferred("switch")

			# Change the nodes position
			position = Vector2(0, 0)
