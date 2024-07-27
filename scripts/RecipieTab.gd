extends Control

@export var recipies: Array[Recipe]

@onready var recipe_list_container := $RecipeList/ListContainer
@onready var recipe_view_container := $RecipeView/ListContainer

var clickable_recipe := preload("res://scenes/ClickableRecipe.tscn")

func _ready():
	for recipe in recipies:
		var new_cr := clickable_recipe.instantiate()
		recipe_list_container.add_child(new_cr)
		new_cr.recipe = recipe
		new_cr.view_container = recipe_view_container
