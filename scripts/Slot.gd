extends Button

@onready var button_icon := $TextureRect
@onready var background := $Background

@export var disable_background := false

@export var item : Item = null:
	set(value):
		item = value
		if value != null:
			var texture_path = value.icon.resource_path
			button_icon.texture = load(texture_path)
		else:
			button_icon.texture = null

func _on_mouse_entered():
	if item != null:
		Tooltip.ItemPopup(Rect2i(Vector2i(global_position), Vector2i(size)), item)

func _on_mouse_exited():
	Tooltip.HideItemPopup()
	
func _ready():
	if disable_background:
		background.visible = false
