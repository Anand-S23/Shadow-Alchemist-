extends Control

@onready var progress_bar := $ProgressBar
@onready var timer := $Timer

@export var h_start = 0.0
@export var h_end = 0.45
@export var s_start = 0.3
@export var s_end = 1.0
@export var v_start = 0.3
@export var v_end = 1.0

@export var time_limit_in_seconds := 30
var progress := 100

func _ready():
	progress_bar.value = progress

func _process(delta):
	progress = clamp(progress, 0, 100)	
	progress_bar.value = progress
	update_color()

func get_progress() -> int:
	return progress

func range_lerp(value, min1, max1, min2, max2):
	var value_norm = inverse_lerp(min1, max1, value)
	return lerp( min2, max2, value_norm)

func update_color():
	progress_bar.tint_progress.h = range_lerp(progress_bar.value, progress_bar.min_value, progress_bar.max_value, h_start, h_end)
	progress_bar.tint_progress.s = range_lerp(progress_bar.value, progress_bar.min_value, progress_bar.max_value, s_start, s_end)
	progress_bar.tint_progress.v = range_lerp(progress_bar.value, progress_bar.min_value, progress_bar.max_value, v_start, v_end)

func _on_timer_timeout():
	progress -= 1
