extends Node2D

var pShield_PowerUp = preload("res://PowerUps/Shield_PowerUp/Shield_PowerUp.tscn")

var	power_ups = [
	pShield_PowerUp
]

func spawn_power_up():
	randomize()
	var power_up_roll = randi() % power_ups.size()
	var chance_roll = randi() % 100 + 1

	var power_up = power_ups[power_up_roll].instance()
	if chance_roll <= power_up.chance:
		return power_up
	else:
		power_up.queue_free()
		
	
