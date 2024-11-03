extends Node

@onready var bgm: AudioStreamPlayer = $BGM
func play_music():
	bgm.play()
