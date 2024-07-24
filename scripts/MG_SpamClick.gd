extends Node2D

@onready var progress = $ProgressBar
@onready var decrease_timer = $DecreaseTimer

var value := 0

func _process(delta):
	value = clamp(value, 0, 100)
	if value == 100:
		decrease_timer.stop()
		MiniGameManager.deactivate()
	
	progress.value = value

func _input(event):
	if event.is_action_pressed("click"):
		value += 5

func _on_decrease_timer_timeout():
	value -= 5
