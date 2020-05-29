extends Area2D

class_name Frame

var cart

var is_mouse_over = false

signal update_mult

func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if is_mouse_over:
				insert_cart(null)
	pass

func _on_mouse_entered():
	is_mouse_over = true
	pass

func _on_mouse_exited():
	is_mouse_over = false
	pass

func insert_cart(t):
	cart = t
	emit_signal("update_mult")
	pass

func get_class(): return "Frame"

func get_type():
	return null if cart == null else cart.get_type()
	pass
