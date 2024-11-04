extends Node2D

func _ready():
	TransitionScreen.transitionToNormal()
	MusicManager.mmbgm.stop()
	MusicManager.lv1bgm.play()
