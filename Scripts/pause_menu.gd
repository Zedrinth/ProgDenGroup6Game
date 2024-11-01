extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func escPause():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_pause_menu.tscn")


func _on_quit_to_menu_pressed():
	resume()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _process(_delta):
	escPause()
