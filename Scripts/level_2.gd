extends Node2D

func _ready():
	MusicManager.lv2bgm.play()
	#TransitionScreen.transitionToBlack()
	TransitionScreen.transitionToNormal()
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
