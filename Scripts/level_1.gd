extends Node2D

func _ready():
	TransitionScreen.transitionToNormal()
	MusicManager.lv1bgm.play()

