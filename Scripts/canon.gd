extends Node2D


@onready var main = get_tree().get_root().get_node(".")
@onready var projectile = load("res://Scenes/fireball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = 180


func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	instance.zdex = z_index
	self.add_child(instance)
	

func _on_cooldown_timeout() -> void:
	shoot()
