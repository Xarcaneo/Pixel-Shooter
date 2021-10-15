extends Area2D

class_name Enemy

export var health = 1 setget set_health

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var powerup_spawner: Node2D = get_node("PowerUp_Spawner")

var is_alive : bool = true setget ,is_alive_get

func _ready():
	pass # Replace with function body.

func die():
		animation_player.play("Explode")

func set_health(new_value):
	health = new_value

	if health <= 0:
		is_alive = false
		drop_pick_up()
		die()

func is_alive_get():
	return is_alive
	
func drop_pick_up():
	var pick_up = powerup_spawner.spawn_power_up()
	if pick_up:
		pick_up.global_position = global_position
		get_tree().current_scene.call_deferred("add_child", pick_up)
