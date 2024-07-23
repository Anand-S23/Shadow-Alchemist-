extends StaticBody2D

@onready var interactable: Interactable = $Interactable

@export var item: Item

func _ready():
	interactable.interact = Callable(self, "_on_interact")

func _on_interact():
	queue_free()
	MiniGame.activate()
