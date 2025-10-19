extends CanvasLayer

@onready var slot1 = $Slot1
@onready var item_name = $ItemName

var item_in_slot: Dictionary = {}  # Armazena o item atual

# Adiciona um item ao inventário
func add_item(item_data: Dictionary):
	item_in_slot = item_data
	slot1.texture = item_data.get("icon", null)
	item_name.text = item_data.get("name", "Item")

# Usa o item (por exemplo, imprime uma mensagem)
func use_item():
	if item_in_slot:
		print("Usando item:", item_in_slot["name"])
		clear_item()

# Limpa o slot
func clear_item():
	item_in_slot = {}
	slot1.texture = null
	item_name.text = "Vazio"
