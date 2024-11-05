extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

var isOverDoor := false
var isLocked := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if isOverDoor and Input.is_action_just_pressed("use") and !isLocked:
		$AnimatedSprite2D.play("Opened")
		$AnimationPlayer.play("RESET")

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "Opened":
		#TransitionScreen.transitionToBlack()
		#await TransitionScreen.on_transition_finished
		MusicManager.lv2bgm.stop()
		get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
		

func _on_body_entered(_body: Node2D) -> void:
	isOverDoor = true

 
func _on_body_exited(_body: Node2D) -> void:
	isOverDoor = false


func _on_near_door_body_entered(_body: Node2D) -> void:
	if Global.keys == 3:
		$AnimationPlayer.play("vanish")
		$AnimatedSprite2D.play("Closed")
		$AudioStreamPlayer.play()
		isLocked = false
		Global.keys = 0
		
