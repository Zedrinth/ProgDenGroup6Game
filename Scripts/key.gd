extends Area2D

signal key_collected

func _on_body_entered(_body: Node2D) -> void:
	emit_signal("key_collected")
	Global.keys = Global.keys + 1
	print (Global.keys)
	visible = false
	set_collision_mask_value(1, false)
	$KeyPickup.play()
	
	
func _on_key_pickup_finished() -> void:
	queue_free()
