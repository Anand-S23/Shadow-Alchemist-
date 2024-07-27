extends Control

@onready var orders = $OrdersContainer
@onready var timer = $Timer

@export var order_count := 10
@export var min_gen_time := 10
@export var max_gen_time := 30

@export var recipies: Array[Recipe]

var order_template := preload("res://scenes/Order.tscn")
var mod_value: int

func _ready():
	mod_value = max_gen_time - min_gen_time + 1
	
func generate_order():
	var random_recipe := recipies[(randi() % recipies.size())]
	var new_order := order_template.instantiate()
	new_order.item_name = random_recipe.item_name
	new_order.item_image = random_recipe.item_image
	new_order.index = orders.get_child_count()
	orders.add_child(new_order)
	new_order.size = Vector2(250, 40)
	
	timer.wait_time = randi() % mod_value + min_gen_time
	timer.start()
	
	order_count -= 1

func start():
	generate_order()

func _on_timer_timeout():
	if order_count > 1:
		generate_order()
	else:
		print("day completed")
