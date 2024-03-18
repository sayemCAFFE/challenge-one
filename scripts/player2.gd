extends KinematicBody2D

export var speed = 400

func _ready():
	pass

func _process(delta):
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("up2"):
		direction.y = -1
	if Input.is_action_pressed("down2"):
		direction.y = 1
	if Input.is_action_pressed("left2"):
		direction.x = -1
	if Input.is_action_pressed("right2"):
		direction.x = 1

	
	direction = direction.normalized()
	
	move_and_slide(direction * speed)
