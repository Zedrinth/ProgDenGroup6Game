extends Node2D

var speed = 40
var player_chase = false
@onready var player = get_parent().get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)/speed
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.play("Left direction")
		else:
			$AnimatedSprite2D.play("Right direction")
	else: 
		$AnimatedSprite2D.play("Idle")
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		area.get_parent().take_damage()


func _on_detection_area_area_entered(area: Area2D) -> void:
	player_chase = true


func _on_detection_area_area_exited(area: Area2D) -> void:
	player_chase  = false
