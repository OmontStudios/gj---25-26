class_name AnimacaoTroca extends CanvasLayer

@onready var fade_rect = $ColorRect
@onready var animation = $ColorRect/Animation
var duration := 0.5  # tempo do fade em segundos

# Fade out
func fade_out():
	animation.play("transition_in")
	await animation.animation_finished

# Fade in
func fade_in():
	animation.play("transition_out")
	await animation.animation_finished

# Função global de transição
func transition_to(scene_path: String):
	await fade_out()
	get_tree().change_scene_to_file(scene_path)
	await fade_in()
