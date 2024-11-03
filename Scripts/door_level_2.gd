extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var isOverDoor := false
var isLocked := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isOverDoor and Input.is_action_just_pressed("use") and !isLocked:
		$AnimatedSprite2D.play("Opened")
		

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "Opened":
		#TransitionScreen.transitionToBlack()
		#await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
		

func _on_body_entered(body: Node2D) -> void:
	isOverDoor = true

 
func _on_body_exited(body: Node2D) -> void:
	isOverDoor = false


func _on_near_door_body_entered(body: Node2D) -> void:
	if Global.keys == 3:
		$AnimatedSprite2D.play("Closed")
		$AudioStreamPlayer.play()
		isLocked = false
		Global.keys = 0
		