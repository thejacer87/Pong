extends CharacterBody2D
class_name Paddle

const SPEED = 300.0
@onready var score = 0
@export var is_smacking = false;

func _physics_process(delta):
	var rotate = Input.get_axis("paddle_rotate_up", "paddle_rotate_down")
	rotation = deg_to_rad(15.0) * rotate

	var direction = Input.get_axis("paddle_up", "paddle_down")

	velocity.y = direction * SPEED if direction else get_mouse_wheel_input()
	move_and_slide()
	pass

func _input(event):
	if event.is_action_pressed("smack"):
		$AnimationPlayer.play("Smack")

func add_points(points = 1):
	score += points
	if score < 0:
		score = 0

func get_mouse_wheel_input():
	if Input.is_action_just_released("wheel_down"):
		return -300
	if Input.is_action_just_released("wheel_up"):
		return 300
		
	return 0
