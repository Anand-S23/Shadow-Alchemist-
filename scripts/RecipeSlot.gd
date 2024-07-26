extends Control

@export var ingredients: Array[Item]
@export var instrument: Item
@export var output: Item

@onready var slot := preload("res://scenes/Slot.tscn")
@onready var ingredient_container := $SlotContainer/IngredientContainer
@onready var instrument_slot := $SlotContainer/Instrument
@onready var output_slot := $SlotContainer/Output

func _ready():
	for ingredient in ingredients:
		var ingredient_slot := slot.instantiate()
		ingredient_container.add_child(ingredient_slot)
		ingredient_slot.item = ingredient
	
	instrument_slot.item = instrument
	output_slot.item = output
