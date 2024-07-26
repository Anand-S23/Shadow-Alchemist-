extends Control

func ItemPopup(slot: Rect2i, item):
	var mouse_pos := get_viewport().get_mouse_position()
	var correction: Vector2i
	if mouse_pos.y <= get_viewport_rect().size.y / 2:
		correction = Vector2i(0, slot.size.y)
	else:
		correction = -Vector2i(0, %ItemPopup.size.y)
	
	%ItemPopup.popup(Rect2i(slot.position + correction, %ItemPopup.size))
	
func HideItemPopup():
	%ItemPopup.hide()
