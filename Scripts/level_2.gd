extends Node2D

func _ready():
	MusicManager.lv2bgm.play()
	TransitionScreen.transitionToNormal()
