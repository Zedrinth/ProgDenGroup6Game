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
@onready var sfx_jump: AudioStreamPlayer2D = $sFx_Jump
@onready var sfx_dash: AudioStreamPlayer2D = $SFx_Dash
@onready var sfx_hit: AudioStreamPlayer2D = $SFx_Hit
var current_health: int = 3
var can_take_damage = true
@export var KnockbackPower: int = 5
@onready var dash_animation: GPUParticles2D = $Dash_Animation
signal animation_finished
var n : int = 1


func _ready():
	Global.keys = 0
	Global.current_health = 3
	GameManager.player = self

func take_damage():
	if can_take_damage: 
		iframes()
		#GameManager.hitstop()
		Global.current_health -= 0
		sfx_hit.play()
		knockback()
		Global.hit.emit()
		$AnimatedSprite2D.play("Dmged")
		if Global.current_health <= 0:
			game_over()
			
	else:
		set_physics_process(true)
	

func iframes():
	can_take_damage = false
	set_physics_process(false)
	await get_tree().create_timer(.5).timeout
	set_physics_process(true)
	can_take_damage = true
	

#Movement
func _physics_process(delta):
	var direction = Input.get_axis("moveLeft", "moveRight")
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()
		$AnimatedSprite2D.play("Dash")
		sfx_dash.play()
		$Dash_Animation.visible = true
	if direction:
		if dashing:
			velocity.x = direction * DASH_SPEED
			dash_animation.emitting = true
		else:
			velocity.x = direction * SPEED
			dash_animation.emitting = false
		if is_on_floor():
			$AnimatedSprite2D.play("Walking")
	else:
		velocity.x = 0
		if is_on_floor:
			$AnimatedSprite2D.play("Idle")
	
	
	#Rotation So I dont have to manualy edit the SPIRTE!!!
	if direction != 0:
		$AnimatedSprite2D.flip_h = direction < 0
		dash_animation.scale.x = -1 if direction < 0 else 1
	
	#Jumping
	if Input.is_action_just_pressed("jump") and Jump_Available:
		velocity.y -= JUMP_VELOCITY
		Jump_Available = false
		$AnimatedSprite2D.play("Jumping")
		sfx_jump.play()
		
		
	#Gravity
	if not is_on_floor():
		if Jump_Available:
			get_tree().create_timer(Cayote_Time).timeout.connect(Cayote_Timeout)
		velocity.y += GRAVITY * delta
	else:
		Jump_Available = true
	move_and_slide()


# Find yourself bouncing when hitting enemies or obstacles? It's not a bug, its a feature! Use it to save seconds for your speedrun!
func knockback():
	var direction = Input.get_axis("moveLeft", "moveRight")
	if !dashing:
		var knockbackDirection = direction + -velocity.x * KnockbackPower
		velocity.x = knockbackDirection
		velocity.y = 0
		move_and_slide()
	else:
		var knockbackDirection = direction + -velocity.x * 2
		velocity.x = knockbackDirection
		velocity.y = 0
		move_and_slide()

func Cayote_Timeout():
	Jump_Available = false

func _on_dash_timer_timeout() -> void:
	dashing = false

func _on_dash_again_timer_timeout() -> void:
	can_dash = true
	
func game_over():
	Global.previous_screen = get_tree().current_scene.scene_file_path
	print(Global.previous_screen)
	#ignore error on line 42. Since it changes to another scene anyway, making the error null
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	print("game over")
	print("current_health ",Global.current_health)
	
