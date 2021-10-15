extends Enemy

func _ready():
	pass # Replace with function body.


func _on_Heron_enemy_area_entered(area):
	is_alive = false
	die()
