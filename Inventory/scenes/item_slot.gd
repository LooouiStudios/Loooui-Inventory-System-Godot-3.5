extends Control

export (Color) var unselected_color
export (Color) var selected_color

var specific_item = "none"

onready var colorrect = get_node("ColorRect")
onready var item_sprite = get_node("ItemSprite")
var index = 0

func _ready():
	Inventory.connect("selected_changed", self, "update")
	update()

func update():
	if index == Inventory.selected:
		colorrect.color = selected_color
	else:
		colorrect.color = unselected_color
	
	var item = Inventory.items[index]
	if item.size() != 0:
		item_sprite.texture = item.item.icon
	else:
		item_sprite.texture = null

func is_item_okay() -> bool:
	if specific_item == "none": return true
	elif specific_item == Inventory.carrying_item.item.type: return true
	return false

func _physics_process(delta):
	if Input.is_action_just_pressed("inventory_interact") and Inventory.selected == index and Inventory.open:
		if Inventory.is_carrying and is_item_okay():
			if Inventory.items[index].size() == 0:
				if Inventory.carrying_item.size() != 0:
					# PLACING ITEM
					Inventory.is_carrying = false
					get_tree().get_nodes_in_group("drag_sprite")[0].texture = null
					Inventory.set_item(Inventory.carrying_item.item, index, Inventory.carrying_item.quantity)
			else:
				# REPLACING ITEM
				Inventory.is_carrying = true
				var item = Inventory.items[index]
				Inventory.set_item(Inventory.carrying_item.item, index, Inventory.carrying_item.quantity)
				Inventory.carrying_item = item
				get_tree().get_nodes_in_group("drag_sprite")[0].texture = item.item.icon
		else:
			# PICKING UP ITEM
			Inventory.is_carrying = true
			Inventory.carrying_item = Inventory.items[index]
			if Inventory.carrying_item.size() != 0:
				get_tree().get_nodes_in_group("drag_sprite")[0].texture = Inventory.carrying_item.item.icon
			Inventory.remove_item(index)
		
		if Inventory.is_carrying:
			if Inventory.carrying_item.size() == 0:
				Inventory.is_carrying = false
		
		Inventory.update_slots()


func _on_Button_mouse_entered():
	if Inventory.open:
		Inventory.selected = index
		Inventory.update_slots()
