extends Node2D

class_name Level

@onready var initial_camera_limiter = $CameraLimiters/CameraLimit
@onready var player: Player = $Player

func _ready():
	player.camera.camera_limit_manager.set_limiter(initial_camera_limiter, true)
