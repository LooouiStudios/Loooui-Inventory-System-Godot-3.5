extends Node

signal selected_changed()

var open = true

var is_carrying = false
var carrying_item = {}

var items = []
var selected = 0

var hotbar_slots = 4

var coloumns = 4
var rows = 9

var slots = hotbar_slots + (coloumns * rows)

func _ready():
	for slot in slots:
		items.append({})


func get_selected() -> Dictionary:
	return items[selected]


func set_item(item, index, quantity = 1):
	items[index] = {"item": item, "quantity": quantity}
	update_slots()


func remove_item(index):
	items[index] = {}
	update_slots()


func set_quantity(index, quantity):
	items[index].quantity = quantity
	update_slots()


func set_selected(new_selected):
	selected = new_selected
	emit_signal("selected_changed")


func update_slots():
	for slot in get_tree().get_nodes_in_group("item_slot"):
		slot.update()

func find_empty():
	for slot in slots:
		if items[slot].size() == 0:
			return slot

func get_item_by_key(key):
	return load("res://Inventory/items/" + key + ".tres")
