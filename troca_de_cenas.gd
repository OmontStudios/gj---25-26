extends Area2D

@export_file("*.tscn") var next_scene: String

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":  # Ajuste para o nome do seu personagem
		if next_scene != "":
			get_tree().change_scene_to_file(next_scene)
