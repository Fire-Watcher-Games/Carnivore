extends VBoxContainer

signal show_layout_editor


func _on_wide_button_button_pressed(id):
	emit_signal("show_layout_editor")