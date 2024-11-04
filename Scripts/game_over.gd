extends Control

func _ready() -> void:
	MusicManager.lv1bgm.stop()
	MusicManager.lv2bgm.stop()
	MusicManager.dbgm.play()

func _on_button_pressed() -> void:
	MusicManager.dbgm.stop()
	get_tree().change_scene_to_file(Global.previous_screen)


func _on_button_2_pressed() -> void:
	MusicManager.dbgm.stop()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
