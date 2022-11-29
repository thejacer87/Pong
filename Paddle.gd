extends CharacterBody2D
class_name Paddle

const SPEED = 300.0
@onready var score = 0
@export var is_smacking = false;

func _physics_process(delta):
	var rotate = Input.get_axis("paddle_rotate_up", "paddle_rotate_down")
	rotation = deg_to_rad(15.0) * rotate

	var direction = Input.get_axis("paddle_up", "paddle_down")
	velocity.y = direction * SPEED

	move_and_slide()
	pass

func _input(event):
	if event.is_action_pressed("smack"):
		$AnimationPlayer.play("Smack")

func add_points(points = 1):
	score += points
	
func set_collision(value: bool):
	$CollisionShape2D.set_deferred("disabled", value)
