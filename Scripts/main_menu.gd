extends Control

func _ready():
	MusicManager.lv1bgm.stop()
	MusicManager.lv2bgm.stop()
	MusicManager.mmbgm.play() 
	get_tree().paused = false


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
