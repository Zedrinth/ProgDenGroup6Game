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
var noise_i: float = 0.0
var shake_strength: float = 0.0
@export var RANDOM_SHAKE_STRENGTH: float = 30.0
@export var SHAKE_DECAY_RATE: float = 5.0
@export var NOISE_SHAKE_SPEED: float = 30.0
@export var NOISE_SHAKE_STRENGTH: float = 60.0
@export var KnockbackPower: int = 1500


func _ready():
	Global.current_health = 3
	GameManager.player = self

func take_damage():
	if can_take_damage:
		iframes()
		Global.current_health -= 1
		sfx_hit.play()
		knockback()
		Global.hit.emit()
		if Global.current_health <= 0:
			Global.previous_screen = get_tree().current_scene.scene_file_path
			print(Global.previous_screen)
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
			print("game over")
		print("current_health ",Global.current_health)

func iframes():
	can_take_damage = false
	$AnimatedSprite2D.play("Dmged")
	await get_tree().create_timer(5).timeout
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
		sfx_jump.play()
		
		
	#Gravity
	if not is_on_floor():
		if Jump_Available:
			get_tree().create_timer(Cayote_Time).timeout.connect(Cayote_Timeout)
		velocity.y += GRAVITY * delta
	else:
		Jump_Available = true
	move_and_slide()


func die():
	GameManager.respawn_player()

func knockback():
	var knockbackDirection = -velocity.normalized() * KnockbackPower
	velocity = knockbackDirection
	move_and_slide()

func Cayote_Timeout():
	Jump_Available = false

func _on_dash_timer_timeout() -> void:
	dashing = false

func _on_dash_again_timer_timeout() -> void:
	can_dash = true
