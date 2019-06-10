extends Node2D

func _on_Play_pressed():
	get_tree().change_scene("res://levels/Level1.tscn")

func _on_Quit_pressed():
	get_tree().quit()
