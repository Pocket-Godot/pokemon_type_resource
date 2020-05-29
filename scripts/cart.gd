extends Area2D

class_name Cart

export (Resource) var type

var is_mouse_over = false
var original_position
var is_draggable = false
var mouse_from_cart = Vector2()

func _ready():
	set_modulate(type.color)
	
	original_position = position
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if is_mouse_over:
				if event.is_pressed():
					is_draggable = true
					mouse_from_cart = event.position - position
				else:
					var overlaps = get_overlapping_areas()
					if overlaps.size() > 0:
						for i in overlaps.size():
							var obj = overlaps[i]
							print(obj.get_class())
							if obj.get_class() == "Frame":
								set_position(obj.position)
								obj.insert_cart(self)
							elif obj.get_class() == "Cart":
								obj.set_position(obj.original_position)
					else:
						set_position(original_position)
					is_draggable = false
	if event is InputEventMouseMotion:
		if is_draggable:
			set_position(event.position - mouse_from_cart)
	pass

func _on_mouse_entered():
	is_mouse_over = true
	pass

func _on_mouse_exited():
	is_mouse_over = false
	pass

func get_class(): return "Cart"

func get_type():
	return type
	pass
