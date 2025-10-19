extends CharacterBody2D

@export var speed: float = 200.0
var target_position: Vector2 = Vector2.ZERO

func _ready():
	target_position = global_position

func _physics_process(delta):
	var direction = (target_position - global_position)
	if direction.length() > 5.0:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
