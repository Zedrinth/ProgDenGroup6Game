extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		area.get_parent().take_damage()
		#GameManager.hitstop()
		#await get_tree().create_timer(2)
		GameManager.respawn_player()
		
