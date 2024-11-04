extends CharacterBody2D

class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = 255
const GRAVITY = 700
@export var Cayote_Time: float = 0.1
var Jump_Available: bool = true
const DASH_SPEED = 400.0
var dashing = false
var can_dash = true
#Movement
func _physics_process(delta):
	
	var direction = Input.get_axis("moveLeft", "moveRight")
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()
		$AnimatedSprite2D.play("Dash")
		
	if direction:
		if dashing:
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED
		if is_on_floor():
			$AnimatedSprite2D.play("Walking")
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite2D.play("Idle")
	
	#Rotation So I dont have to manualy edit the SPIRTE!!!
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
		
	#Jumping
	
	if Input.is_action_just_pressed("jump") and Jump_Available:
		velocity.y -= JUMP_VELOCITY
		Jump_Available = false
		$AnimatedSprite2D.play("Jumping")
	#Gravity
	if not is_on_floor():
		if Jump_Available:
			get_tree().create_timer(Cayote_Time).timeout.connect(Cayote_Timeout)
		velocity.y += GRAVITY * delta
	else:
		Jump_Available = true
	move_and_slide()


func Cayote_Timeout():
	Jump_Available = false

func _on_dash_timer_timeout() -> void:
	dashing = false


func _on_dash_again_timer_timeout() -> void:
	can_dash = true
