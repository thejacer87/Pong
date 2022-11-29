extends CharacterBody2D
class_name AI

const SPEED = 300.0
@onready var score = 0
var ball

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta):
	var direction = Vector2(0, move_to_target(ball))
	velocity.y = direction.y * SPEED
	move_and_slide()

func move_to_target(target):
	if abs(target.position.y - position.y) > 32:
		if target.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0

func add_points(points = 1):
	score += points
