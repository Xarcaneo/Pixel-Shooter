extends Area2D

class_name Power_up

export var chance = 0

var velocity = Vector2(0, 200)

func _process(delta):
	translate(velocity*delta)
	
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
