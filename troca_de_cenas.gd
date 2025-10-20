extends Area2D

@export_file("*.tscn") var next_scene: String
@export var transicao: AnimacaoTroca

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		if next_scene != "":
			await transicao.fade_out()
			get_tree().change_scene_to_file(next_scene)
