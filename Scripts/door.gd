extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var isOverDoor := false
var isLocked := true


func _on_body_entered(body: Node2D) -> void:
	isOverDoor = true



func _on_body_exited(body: Node2D) -> void:
	isOverDoor = false


func _on_near_door_body_entered(body: Node2D) -> void:
	if Global.keys == 3:
		$AnimatedSprite2D.play("Closed")
		isLocked = false
		Global.keys = 0
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
