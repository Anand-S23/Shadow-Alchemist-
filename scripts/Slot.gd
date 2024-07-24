extends Button

@onready var player := get_tree().get_first_node_in_group("player")
@onready var button_icon := $TextureRect

@export var item : Item = null:
	set(value):
		item = value
		if value != null:
			var texture_path = value.icon.resource_path
			button_icon.texture = load(texture_path)
		else:
			button_icon.texture = null

