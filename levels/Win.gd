extends Node2D

export var level = 0

# Function to regenerate the HUD
func regenHud():
	$UI_item.updateItems($Player)

# Get the next level
func nextLevel():
	get_tree().change_scene("res://levels/Level" + str(level + 1) + ".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child(2).get_name() != "Player":
		print("Game Over")
		get_tree().quit()
