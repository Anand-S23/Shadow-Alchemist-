extends Control

func ItemPopup(slot: Rect2i, item):
	var mouse_pos := get_viewport().get_mouse_position()
	var correction: Vector2i = -Vector2i(%ItemPopup.size.x / 2 - 16, %ItemPopup.size.y)
	%ItemPopup.popup(Rect2i(slot.position + correction, %ItemPopup.size))
	%ItemPopupLabel.text = item.name
	
func HideItemPopup():
	%ItemPopup.hide()
