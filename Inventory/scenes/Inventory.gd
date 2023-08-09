extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.set_item(Inventory.get_item_by_key("sword"), Inventory.find_empty())
	Inventory.set_item(Inventory.get_item_by_key("hat"), Inventory.find_empty())
	Inventory.set_item(Inventory.get_item_by_key("health_potion"), Inventory.find_empty())
	Inventory.set_item(Inventory.get_item_by_key("shirt"), Inventory.find_empty())
	Inventory.set_item(Inventory.get_item_by_key("pants"), Inventory.find_empty())
