extends Control

@export var item_name: String
@export var item_image: Texture2D
@export var index: int

@onready var timer := $CircularTimer

func _ready():
	$ItemName.text = item_name
	$ItemImage.texture = item_image
	
func _process(delta):
	if timer.get_progress() == 0:
		queue_free()

