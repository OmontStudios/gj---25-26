extends CharacterBody2D

var speed = 200

func _physics_process(delta):
	
	velocity.x = 0
	velocity.y = 0
	
	# Input básico
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	
	move_and_collide(speed * delta)
