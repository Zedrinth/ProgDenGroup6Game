extends Node2D

const SPEED = 50

var direction = -1

@onready var ray_cast_up = $RayCastUp
@onready var ray_cast_down = $RayCastDown
@onready var dragonfly = $AnimatedSprite2D

func _process(delta: float) -> void:
	position.y += direction * SPEED * delta
	if ray_cast_up.is_colliding():
		direction = 1
	
	if ray_cast_down.is_colliding():
		direction = -1


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		area.get_parent().take_damage()
		#GameManager.hitstop()
