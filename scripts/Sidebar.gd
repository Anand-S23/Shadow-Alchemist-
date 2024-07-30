extends Control

@onready var ui := $UI
@onready var orders := $UI/Container/MainContainer/Orders
@onready var recipies := $UI/Container/MainContainer/Recipies

@export var order_count := 10
@export var min_gen_time := 10
@export var max_gen_time := 30
@export var time_limit_in_seconds : int = 30

var orders_active := true

func start_orders():
	orders.start()
	
func toggle_ui():
	ui.visible = !ui.visible

func update_display():
	if orders_active:
		orders.visible = true
		recipies.visible = false
	else:
		orders.visible = false
		recipies.visible = true

func handle_signal(argument: String):
	if argument == "show_order":
		start_orders()
		toggle_ui()

func _ready():
	Dialogic.signal_event.connect(handle_signal)
	orders.order_count = order_count
	orders.min_gen_time = min_gen_time
	orders.max_gen_time = max_gen_time
	orders.time_limit_in_seconds = time_limit_in_seconds

func _input(event):
	if event.is_action_pressed("tab"):
		toggle_ui()
	elif event.is_action_pressed("one"):
		orders_active = true
		update_display()
	elif event.is_action_pressed("two"):
		orders_active = false
		update_display()

func _on_button_pressed():
	orders_active = true
	update_display()

func _on_button_2_pressed():
	orders_active = false
	update_display()
