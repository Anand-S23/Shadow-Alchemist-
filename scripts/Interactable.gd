extends Area2D
class_name Interactable

@export var item_name: String = "Item"

var interact: Callable = func():
	pass

var pickup: Callable = func():
	pass

func _on_body_entered(body):
	InteractionManager.register_area(self)

func _on_body_exited(body):
	InteractionManager.unregister_area(self)
