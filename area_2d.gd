extends Area2D

var player_inside = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Player":  # Ajuste para o nome do seu personagem
		player_inside = true
		print("Player entrou na área - Pressione E para interagir")

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		print("Player saiu da área")

func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		Dialogic.start("timeline")
		# execute_action()  # Descomente se quiser executar a ação também
func execute_action():
	print("Ação executada!")  # Substitua pela sua ação
	
	# Exemplos de ações que você pode fazer:
	# - Abrir um diálogo
	# get_tree().call_group("dialog_system", "show_dialog", "texto_do_dialogo")
	
	# - Ativar um evento
	# Events.trigger("evento_especial")
	
	# - Mostrar uma mensagem
	# UI.show_message("Você interagiu com o objeto!")
	
	# - Coletar item
	# Inventory.add_item("chave")
