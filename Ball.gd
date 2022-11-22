extends CharacterBody2D

@export var speed = 200

var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	direction.x = [-1,1][randi() % 2]
	direction.y = [-0.8,0.8][randi() % 2]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = direction * speed
	
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())
