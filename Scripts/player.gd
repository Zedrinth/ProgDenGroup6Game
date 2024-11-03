extends CharacterBody2D

class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = 255
const GRAVITY = 700

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
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= JUMP_VELOCITY
		$AnimatedSprite2D.play("Jumping")
	#Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	move_and_slide()
	


func _on_dash_timer_timeout() -> void:
	dashing = false


func _on_dash_again_timer_timeout() -> void:
	can_dash = true
