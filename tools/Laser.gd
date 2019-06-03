extends Area2D

const BULLETSPEED = 400

var bullet = preload("res://tools/Bullet.tscn")

func action():
	var node = bullet.instance()
	if get_parent().FacingRight():
		node.setVelocity(Vector2(BULLETSPEED, 0))
		node.position = get_parent().position + Vector2(16, 0)
	else:
		node.setVelocity(Vector2(-BULLETSPEED, 0))
		node.position = get_parent().position + Vector2(-16, 0)
	get_parent().get_parent().add_child(node)
	get_child(2).play()

func _on_Laser_body_entered(body):
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
