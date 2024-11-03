extends Node2D

func _ready():
	MusicManager.lv2bgm.play()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TransitionScreen.transitionToNormal()
	
