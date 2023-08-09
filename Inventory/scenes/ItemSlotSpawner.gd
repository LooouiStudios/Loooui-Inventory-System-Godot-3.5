extends VBoxContainer

export (PackedScene) var item_slot_scene

func _ready():
	generate_slots()

func generate_slots():
	for coloumn in Inventory.coloumns:
		var hbox = HBoxContainer.new()
		add_child(hbox)
		for row in Inventory.rows:
			var item_slot_instance = item_slot_scene.instance()
			var index = coloumn * Inventory.rows + Inventory.hotbar_slots + row
			item_slot_instance.index = index
			hbox.add_child(item_slot_instance)
