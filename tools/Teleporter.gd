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
	get_child(2).play()

func _on_Teleporter_body_entered(body):
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
			
			# Regen hud
			get_parent().call_deferred("regenHud")
