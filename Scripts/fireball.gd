extends CharacterBody2D

@export var SPEED = 200

var dir : float
var spawnPos : Vector2
var spawnRot : float
var zdex : int


func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	z_index = zdex
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(dir)
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		print("hit")
		body.take_damage()
		body.die()
	queue_free()
