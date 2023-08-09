extends HBoxContainer

export (PackedScene) var item_slot_scene

func _ready():
	generate_slots()

func generate_slots():
	for row in Inventory.hotbar_slots:
		var item_slot_instance = item_slot_scene.instance()
		var index = row
		item_slot_instance.index = index
		add_child(item_slot_instance)
