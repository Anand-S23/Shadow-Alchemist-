extends StaticBody2D

@onready var interactable: Interactable = $Interactable
@onready var sprite = $AnimatedSprite2D

var open := false

func _ready():
	interactable.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if open:
		sprite.animation = "open"
	else:
		sprite.animation = "closed"
	
	open = !open
	
