extends Node2D

const SPEED = 30

var direction = -1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animated_snail = $AnimatedSprite2D
func _process(delta: float) -> void:
	
	
	
	position.x += direction * SPEED * delta
	if ray_cast_right.is_colliding():
		direction = -1
		animated_snail.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_snail.flip_h = true
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		area.get_parent().take_damage()
