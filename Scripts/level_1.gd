extends Node2D

func _ready():
	MusicManager.mmbgm.stop()
	MusicManager.lvbgm.play()
