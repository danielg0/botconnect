extends Control

# Variable indicating where held items start
var tools = 3

func updateItems(player):
	if player.get_child_count() > tools:
		$Use.texture = player.get_child(tools).get_child(0).texture
	else:
		$Use.texture = $Blank.texture
	if player.get_child_count() > tools + 1:
		$Held.texture = player.get_child(tools + 1).get_child(0).texture
	else:
		$Held.texture = $Blank.texture
