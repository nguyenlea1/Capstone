extends Control

func set_final_score(final_score):
	$Label.text = "Score: " + str(final_score)

func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
