extends StaticBody2D

@onready var item_sprite := $ItemSprite
@onready var interactable :=  $Interactable
@onready var player := get_tree().get_first_node_in_group("player")

@export var item : Item

func _ready():
	interactable.pickup = Callable(self, "_on_interact")

func _on_interact():
	if item != null:
		print("Start Minigame")
	else:
		var current_item: Item = player.get_item()
		if current_item != null:
			player.drop_item()
		player.add_item(item)

