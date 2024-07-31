extends Button

@onready var texture := $TextureRect
@onready var label := $Label

var recipe_slot := preload("res://scenes/RecipeSlot.tscn")

var steps: Array[Step]
@export var recipe: Recipe:
	set(value):
		label.text = value.item_name
		texture.texture = value.item_image
		steps = value.steps

@export var view_container: VBoxContainer
@export var selected_label: Label

func _on_pressed():
	Sidebar.toggle_timeline_for_first_click()
	for child in view_container.get_children():
		child.queue_free()
		 
	for step in steps:
		var new_rs := recipe_slot.instantiate()
		view_container.add_child(new_rs)
		new_rs.step = step
		new_rs.scale = Vector2(4, 4)
		if step.ingredients.size() > 1:
			new_rs.custom_minimum_size = Vector2(320, 80)
	
	selected_label.text = "Selected: " + label.text
