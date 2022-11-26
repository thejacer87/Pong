extends RigidBody2D
class_name Ball
@export var speed = 200

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var bounce_counter = 0;
var speed_modifier = 1.05
var default_speed;

# Called when the node enters the scene tree for the first time.
func _ready():
	default_speed = speed;
	reset_ball()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = direction * speed
	
	_ball_speed_modifier()
	
	var collision = move_and_collide(direction * speed * delta)

	if collision:
		var collider = collision.get_collider()
		direction = direction.bounce(collision.get_normal())
		bounce_counter += 1
		if collider is Paddle and collider.is_smacking:
			increase_speed(1.5)

func _ball_speed_modifier():
	if (bounce_counter == 10):
		increase_speed(speed_modifier)
		bounce_counter = 0;

func increase_speed(modifier):
	speed *= modifier

func reset_ball(): 
	direction.x = [-1,1][randi() % 2]
	direction.y = [-0.8,0.8][randi() % 2]
	position.x = 640
	position.y = 320
	bounce_counter = 0
	speed = default_speed
	
