extends Area2D

func action():
	var children = get_parent().get_parent().get_children()
	
	var closest
	var distance = 9999
	
	for child in children:
		if child.get_name() == "Portal":
			if position.distance_to(child.position) < distance:
				closest = child
	
	get_parent().position = closest.position + Vector2(16, -35)

func _on_Teleporter_body_entered(body):
	# Move the node to be a child of the player
	if body.get_name() == "Player" && body.get_child_count() == 2:
		get_parent().call_deferred("remove_child", self)
		body.call_deferred("add_child", self)
		
		# Change the nodes position
		self.position = Vector2(0, 0)
