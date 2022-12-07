extends RigidBody2D
class_name Ball
@export var speed = 400

signal entered_danger_mode
signal exited_danger_mode

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
	_ball_speed_modifier()
	print("ball::danger time left ", timer.time_left)
	var collision = move_and_collide(direction * speed * delta)

	if collision:
		var collider = collision.get_collider()
		direction = direction.bounce(collision.get_normal())
		
		if not is_danger_mode:
			bounce_counter += 1
		if collider is Paddle and collider.is_smacking:
			increase_speed(1.5)

func _ball_speed_modifier():
	if (bounce_counter % 10 == 0):
		increase_speed(speed_modifier)

	if (bounce_counter % 5 == 0 and not is_danger_mode):
		is_danger_mode = true
		print("ball::entered danger mode")
		emit_signal("entered_danger_mode")
		timer.start()

func increase_speed(modifier):
	speed *= modifier

func reset_ball(): 
	direction.x = [-1,1][randi() % 2]
	direction.y = [-0.8,0.8][randi() % 2]
	position.x = 640
	position.y = 320
	bounce_counter = 1
	speed = default_speed
	
func _on_timer_timeout():
	print("timeout")
	bounce_counter += 1
	is_danger_mode = false
	emit_signal("exited_danger_mode")
