extends Camera2D

@export var zoom_speed: float = 0.5        # Velocidade do zoom com scroll
@export var zoom_min: float = 0.5          # Zoom máximo (mais perto)
@export var zoom_max: float = 2.0          # Zoom mínimo (mais longe)
@export var return_delay: float = 0.5      # Tempo até começar a voltar ao normal
@export var return_speed: float = 1.5      # Velocidade do retorno (menor = mais lento)
@export var player_path: NodePath          # Caminho até o player

var default_zoom: Vector2 = Vector2.ONE    # Zoom normal (1x)
var target_zoom: Vector2 = Vector2.ONE     # Zoom que queremos alcançar
var time_since_scroll: float = 0.0         # Tempo desde o último scroll

@onready var player = get_node_or_null(player_path)

func _ready():
	zoom = default_zoom
	target_zoom = default_zoom
	if not player:
		push_warning("⚠️ Player não definido no 'player_path' da câmera!")

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			target_zoom -= Vector2(zoom_speed, zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			target_zoom += Vector2(zoom_speed, zoom_speed)

		# Limita o zoom dentro dos valores configurados
		target_zoom.x = clamp(target_zoom.x, zoom_min, zoom_max)
		target_zoom.y = clamp(target_zoom.y, zoom_min, zoom_max)

		# Reinicia o cronômetro desde o último scroll
		time_since_scroll = 0.0

func _process(delta):
	time_since_scroll += delta

	# Se o jogador parou de rolar o scroll por 'return_delay' segundos,
	# lentamente volta ao zoom padrão.
	if time_since_scroll > return_delay:
		target_zoom = default_zoom

	# Faz a transição suave do zoom atual para o alvo
	zoom = zoom.lerp(target_zoom, delta * return_speed)

	# Garante que a câmera siga o player
	if player:
		global_position = player.global_position
