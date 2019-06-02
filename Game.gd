extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child(1).get_name() != "Player":
		print("Game Over")
		get_tree().quit()
