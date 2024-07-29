extends Control

@onready var ui := $UI
@onready var orders := $UI/Container/MainContainer/Orders
@onready var recipies := $UI/Container/MainContainer/Recipies

var orders_active := true

func start_orders():
	orders.start()

func update_display():
	if orders_active:
		orders.visible = true
		recipies.visible = false
	else:
		orders.visible = false
		recipies.visible = true

func _input(event):
	if event.is_action_pressed("tab"):
		ui.visible = !ui.visible
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
