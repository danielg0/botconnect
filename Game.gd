extends Node2D

# Function to regenerate the HUD
func regenHud():
	$UI_item.updateItems($Player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child(2).get_name() != "Player":
		print("Game Over")
		get_tree().quit()
