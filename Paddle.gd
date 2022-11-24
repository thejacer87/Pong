extends CharacterBody2D
class_name Paddle

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var score = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var rotate = Input.get_axis("paddle_rotate_up", "paddle_rotate_down")
	rotation = deg_to_rad(15.0) * rotate
	
	var direction = Input.get_axis("paddle_up", "paddle_down")
	velocity.y = direction * SPEED

	move_and_slide()


func add_points(points = 1):
	score += points
