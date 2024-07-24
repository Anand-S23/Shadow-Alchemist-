extends CharacterBody2D

var speed := 150
var looking_left := false

@onready var sprite := $AnimatedSprite2D
@onready var hotbar := $CanvasLayer/HotBar
@onready var camera := $Camera2D

var item_template := preload("res://scenes/AbstractItem.tscn")

func _physics_process(delta) -> void:
	if MiniGameManager.is_active():
		return
		
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction[0] > 0:
		sprite.flip_h = false
	elif direction[0] < 0:
		sprite.flip_h = true
		
	velocity = direction * speed
	move_and_slide()

func get_item() -> Item:
	return hotbar.get_item()

func add_item(item) -> void:
	hotbar.add_item(item)

func drop_item() -> void:
	var current_item: Item = hotbar.get_item()
	if current_item == null:
		return
		
	var abstract_item := item_template.instantiate()
	var item_container := get_tree().get_first_node_in_group('item_container')
	abstract_item.item = current_item
	abstract_item.position = position
	item_container.add_child(abstract_item)
	hotbar.drop_item()

func disable_camera_movement() -> void:
	camera.motion_enabled = false

func enable_camera_movement() -> void:
	camera.motion_enabled = true
