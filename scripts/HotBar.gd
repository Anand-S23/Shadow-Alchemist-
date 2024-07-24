extends VBoxContainer

@onready var slots := get_children()

var current_index: int:
	set(value):
		current_index = value
		reset_focus()
		set_focus()

func _ready():
	current_index = 0

func reset_focus():
	for slot in slots:
		slot.set_process_input(false)

func set_focus():
	get_child(current_index).grab_focus()
	get_child(current_index).set_process_input(true)

func add_item(item):
	for slot in slots:
		if slot.item == null:
			slot.item = item
			return

func drop_item():
	slots[current_index].item = null

func get_item() -> Item:
	return slots[current_index].item
