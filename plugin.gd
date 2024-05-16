@tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("DramaQueen", "res://addons/drama_queen/drama_queen.gd")


func _exit_tree():
	remove_autoload_singleton("DramaQueen")