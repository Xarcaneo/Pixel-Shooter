extends Node2D

func _process(delta):
	if get_child_count() > 0:
		get_child(0).start_wave()
	else:
		print("level completed")
