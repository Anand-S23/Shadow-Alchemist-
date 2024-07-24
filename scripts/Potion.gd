extends StaticBody2D

@onready var interactable: Interactable = $Interactable
@onready var player := get_tree().get_first_node_in_group("player")

@export var item: Item

func _ready():
	interactable.interact = Callable(self, "_on_interact")

func _on_interact():
	player.add_item(item)
	queue_free()
	MiniGameManager.activate()
