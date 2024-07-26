extends Control

@export var item_name: String
@export var item_image: Texture2D

func _ready():
	$ItemName.text = item_name
	$ItemImage.texture = item_image
