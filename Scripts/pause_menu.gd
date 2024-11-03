extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func _resume():
	get_tree().paused = false
	$AnimationPlayer.play("RESET")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func escPause():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		_resume()

func _on_resume_pressed():
	_resume()


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_pause_menu_l1.tscn")


func _on_quit_to_menu_pressed():
	_resume()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicManager.lv1bgm.stop()
	MusicManager.lv2bgm.stop()

func _process(_delta):
	escPause()
