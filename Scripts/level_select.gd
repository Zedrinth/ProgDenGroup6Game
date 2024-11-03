extends Control

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	MusicManager.mmbgm.stop()



func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	MusicManager.mmbgm.stop()



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
