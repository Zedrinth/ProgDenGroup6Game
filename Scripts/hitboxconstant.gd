extends Node2D


func _physics_process(delta: float) -> void:
	for body in $Area2D.get_overlapping_bodies():
		if (body.get_collision_layer() == 1):
			body.take_damage()
