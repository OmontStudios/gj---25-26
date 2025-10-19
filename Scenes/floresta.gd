extends Node2D

@onready var player = $Player

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var click_position = get_global_mouse_position()
		player.target_position = click_position
