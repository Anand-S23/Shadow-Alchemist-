extends Camera2D

const MAX_DISTANCE = 48
const MAX_ZOOM = 10.0
const MIN_ZOOM = 4.0
const SCROLL_SPEED = 0.4

var target_distace := 0
var center_pos := position
var zoom_pos := 4.0

func _process(delta):
	var direction := center_pos.direction_to(get_local_mouse_position())
	var target_pos := center_pos + direction * target_distace
	
	target_pos = target_pos.clamp(
		center_pos - Vector2(MAX_DISTANCE, MAX_DISTANCE),
		center_pos + Vector2(MAX_DISTANCE, MAX_DISTANCE)
	)
	position = target_pos
	
	zoom_pos = clamp(zoom_pos, MIN_ZOOM, MAX_ZOOM)
	zoom = Vector2(zoom_pos, zoom_pos)

func _input(event):
	if event is InputEventMouseMotion:
		target_distace = center_pos.distance_to(get_local_mouse_position()) / 3
	elif event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_pos += SCROLL_SPEED
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_pos -= SCROLL_SPEED
