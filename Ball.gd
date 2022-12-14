extends RigidBody2D
class_name Ball
@export var speed = 400

signal entered_danger_mode
signal exited_danger_mode

const MAX_SPEED = 800

@onready var timer = $Timer

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var bounce_counter = 1;
var speed_modifier = 1.05
var default_speed;
var is_danger_mode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	default_speed = speed;
	reset_ball()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = direction * speed
	
	var collision = move_and_collide(direction * speed * delta)

	if collision:
		_ball_speed_modifier()
		var collider = collision.get_collider()
		direction = direction.bounce(collision.get_normal())
		
		if not is_danger_mode:
			bounce_counter += 1
		if (collider is Paddle or collider is AI) and is_danger_mode:
			collider.add_points(-2)
			

func _ball_speed_modifier():
	if (bounce_counter % 10 == 0):
		increase_speed(speed_modifier)
	elif (bounce_counter % 9 == 0 and not is_danger_mode):
		is_danger_mode = true
		emit_signal("entered_danger_mode")
		timer.start()
		modulate = '#FF0000'

func increase_speed(modifier):
	speed *= modifier
	
	if speed > MAX_SPEED:
		speed = MAX_SPEED

func reset_ball():
	direction.x = [-1,1][randi() % 2]
	direction.y = [-0.8,0.8][randi() % 2]
	position.x = 640
	position.y = 320
	bounce_counter = 1
	speed = default_speed
	
func _on_timer_timeout():
	bounce_counter += 1
	is_danger_mode = false
	modulate = '#FFF'
	emit_signal("exited_danger_mode")
