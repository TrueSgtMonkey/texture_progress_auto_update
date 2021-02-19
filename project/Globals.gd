extends Node

var shot := false

func _input(event):
	if event.is_action_pressed("end_game"):
		get_tree().quit()
