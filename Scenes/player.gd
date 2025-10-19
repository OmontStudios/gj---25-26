extends CharacterBody2D

@export var speed: float = 300.0
var target_position: Vector2 = Vector2.ZERO
var inventory_ui: Node

func _ready():
	target_position = global_position

func _physics_process(delta):
	var direction = (target_position - global_position)
	if direction.length() > 5.0:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		target_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("use_item"):
		if inventory_ui:
			inventory_ui.use_item()
