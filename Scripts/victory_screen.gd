extends Control

func _ready():
	get_tree().paused = false


func _on_back_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
