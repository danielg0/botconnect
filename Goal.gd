extends Area2D

func _on_Goal_body_entered(body):
	if body.get_name() == "Player":
		get_parent().nextLevel()
