extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false
	color_rect.modulate.a = 0.1
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "FadeToBlack":
		#animation_player.play("FadeToNormal")
		on_transition_finished.emit()
		print("finished")
	elif anim_name == "FadeToNormal":
		on_transition_finished.emit()
		print("finished")
		#color_rect.visible = false


func transitionToBlack():
	color_rect.visible = true
	animation_player.play("FadeToBlack")

func transitionToNormal():
	color_rect.visible = true
	animation_player.play("FadeToNormal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
