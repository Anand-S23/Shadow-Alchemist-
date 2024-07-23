extends CanvasLayer

@onready var player := get_tree().get_first_node_in_group("player")

func activate():
	player.disable_camera_movement()
	visible = true

func deactivate():
	player.enable_camera_movement()
	visible = false

func _ready():
	visible = false
