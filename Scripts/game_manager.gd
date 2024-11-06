extends Node

var current_checkpoint : Checkpoint
var player : Player

func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.global_position
		player.velocity.y = 0
		

func hitstop():
	Engine.time_scale = 0
	await get_tree().create_timer(0.25, true, false, true).timeout
	Engine.time_scale = 1
