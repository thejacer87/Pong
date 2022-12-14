extends CharacterBody2D
class_name AI

const SPEED = 300.0
@onready var score = 0
var ball
var hit_zone_offset = 32

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta):
	var direction = Vector2(0, move(ball))
	velocity.y = direction.y * SPEED
	move_and_slide()

func move(target):
	var direction = 0
	if target.is_danger_mode:
		hit_zone_offset = 40
	
	if abs(target.position.y - position.y) > hit_zone_offset:
		if target.position.y > position.y:
			direction = 1
		else:
			direction = -1

	if target.is_danger_mode:
		direction *= -1
		
	return direction

func add_points(points = 1):
	score += points
	if score < 0:
		score = 0
