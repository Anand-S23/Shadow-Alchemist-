extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group('player')
@onready var interactable: Interactable = $Interactable
@onready var item_sprite: Sprite2D = $ItemSprite
@export var item: Item

func _ready():
	if item != null:
		item_sprite.texture = item.icon
		interactable.item_name = "[F] " + item.name
		
	interactable.pickup = Callable(self, "_on_interact")

func _on_interact():
	player.add_item(item)
	queue_free()
