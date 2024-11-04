extends Timer


# Called when the node enters the scene tree for the first time.
@onready var timer = $"dashtimer"

func start_dash(dur):
	timer.wait_time = dur
	timer.start()

func is_dashing():
	return !timer.is_stopped()