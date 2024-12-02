extends Node2D

func _on_startbutton_pressed():
	$buttonClick.play()
	get_tree().change_scene_to_file("res://starry_sky.tscn")
