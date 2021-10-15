extends Bullet

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Bullet_area_entered(area):
	if area.is_in_group("enemy"):
		area.health -= damage
		
	queue_free()
