extends Control

@export var item_name: String
@export var item_image: Texture2D
@export var index: int
@export var time_limit_in_seconds : int

@onready var circular_timer := $CircularTimer
@onready var timer := $Timer

func _ready():
	$ItemName.text = item_name
	$ItemImage.texture = item_image
	circular_timer.time_limit_in_seconds = time_limit_in_seconds
	timer.wait_time = time_limit_in_seconds
	timer.start()

func _on_timer_timeout():
	queue_free()
