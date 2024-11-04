extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func escPause():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		get_tree().paused = true
		$AnimationPlayer.play("blur")

	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		get_tree().paused = false
		$AnimationPlayer.play("RESET")

func _on_resume_pressed():
	get_tree().paused = false
	$AnimationPlayer.play("RESET")

func _on_restart_pressed():
	get_tree().reload_current_scene()



func _on_quit_to_menu_pressed():
	get_tree().paused = false
	MusicManager.lv1bgm.stop()
	MusicManager.lv2bgm.stop()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
