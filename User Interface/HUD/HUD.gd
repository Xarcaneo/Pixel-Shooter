extends Control

var pLifeIcon = preload("res://User Interface/HUD/Life Icon/LifeIcon.tscn")

onready var life_container : HBoxContainer = get_node("LifeContainer")
	
func clearLives():
	for child in life_container.get_children():
		life_container.remove_child(child)
		child.queue_free()
		
func setLives(lives : int):
	clearLives()
	for i in range(lives):
		life_container.add_child(pLifeIcon.instance())


func _on_Player_life_changed(health):
	setLives(health)
