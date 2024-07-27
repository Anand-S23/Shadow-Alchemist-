extends Control

@onready var slot := preload("res://scenes/Slot.tscn")
@onready var ingredient_container := $SlotContainer/IngredientContainer
@onready var instrument_slot := $SlotContainer/Instrument
@onready var output_slot := $SlotContainer/Output

@export var step: Step:
	set(value):
		for ingredient in value.ingredients:
			var ingredient_slot := slot.instantiate()
			ingredient_container.add_child(ingredient_slot)
			ingredient_slot.item = ingredient
		
		instrument_slot.item = value.instrument
		output_slot.item = value.output
