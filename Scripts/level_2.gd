extends Node2D

func _ready():
	MusicManager.lv2bgm.play()
	TransitionScreen.transitionToNormal()
	get_tree().paused = false
