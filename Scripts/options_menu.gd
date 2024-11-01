extends Control


# Create volume sliders in the future :)
func _on_sound_volume_pressed() -> void:
	pass # Replace with function body.


func _on_music_volume_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
