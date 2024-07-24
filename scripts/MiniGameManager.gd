extends CanvasLayer

@onready var player := get_tree().get_first_node_in_group("player")
@onready var mg_container := $MiniGameContainer

const mg_rect_size = Vector2(850, 850)

var test_scene = preload("res://scenes/MG_SpamClick.tscn")
var mini_game_instance: Node

func activate():
	player.disable_camera_movement()
	visible = true
	mini_game_instance = test_scene.instantiate()
	mini_game_instance.position += (mg_rect_size / 2)
	print(mg_container.global_position, mg_container.position, mini_game_instance.global_position)
	mg_container.add_child(mini_game_instance)

func deactivate():
	player.enable_camera_movement()
	visible = false

func is_active():
	return visible

func _ready():
	visible = false

func _on_game_completed():
	print("we here")
	deactivate()
