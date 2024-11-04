extends Control

func _ready():
	get_tree().paused = false
	MusicManager.vbgm.play()


func _on_back_main_menu_pressed() -> void:
	MusicManager.vbgm.stop()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
