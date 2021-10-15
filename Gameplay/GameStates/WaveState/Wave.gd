extends Node2D

export var wave_speed: float = 1500.0
export var spawn_speed: float = 1.0

onready var enemy_follower : Path2D = get_node("EnemyFollower")
onready var enemy_container : Node2D = get_node("EnemyContainer")
onready var spawn_timer : Timer = get_node("SpawnTimer")

func _ready():
	visible = false
	
func _process(delta):
	for child in enemy_follower.get_children():
		if child.get_child_count() <= 0:
			child.queue_free()
		for enemy in child.get_children():
			if enemy.is_alive_get():
				child.set_offset(child.get_offset() + wave_speed * delta)
				if child.get_unit_offset() == 1:
					child.queue_free()
					
	if enemy_follower.get_child_count() <= 0 and enemy_container.get_child_count() <= 0:
		queue_free()
				
func set_active():
	spawn_timer.set_wait_time(spawn_speed)
	spawn_timer.start()
	visible = true
	
func _on_SpawnTimer_timeout():
	if enemy_container.get_child_count() > 0:
		var enemy = enemy_container.get_child(0)
		var new_path = PathFollow2D.new()
		enemy_container.remove_child(enemy)
		enemy.position = new_path.position
		new_path.add_child(enemy)
		new_path.loop = false
		new_path.rotate = false
		enemy_follower.add_child(new_path)
