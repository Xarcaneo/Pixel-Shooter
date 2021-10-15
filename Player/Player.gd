extends KinematicBody2D

signal life_changed(health)

var plBullet: = preload("res://Bullet/AllyBullet/AllyBullet.tscn")
var pShield: = preload("res://Player/Shield/Shield.tscn")
var health

onready var statistics: Node = get_node("Statistics")
onready var camera: Camera2D = get_node("Camera2D")
onready var fire_timer: Timer = get_node("Fire_cooldown") 
onready var firing_position: Node2D = get_node("FiringPosition")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var sprite : AnimatedSprite = get_node("Sprite")

var previous_cursor_position
var can_move = false

func _ready():
	_load_data()
	emit_signal("life_changed", health)
	
	fire_timer.set_wait_time(statistics.ship_statistics.fire_cooldown)
	fire_timer.start()
		
func _process(delta):
	_move(delta)
	
func _move(delta):
	if Input.is_action_pressed("ui_touch"):
		if previous_cursor_position != null:
			var cursor_position_distance = get_viewport().get_mouse_position() - previous_cursor_position
			var velocity = cursor_position_distance * statistics.ship_statistics.speed * delta
			move_and_slide(velocity)
		previous_cursor_position = get_viewport().get_mouse_position()
			
	if Input.is_action_just_released("ui_touch"):
		previous_cursor_position = null	

func _load_data():
	statistics.load_statistics(Game.save_manager.game_data.current_ship)
	health = statistics.ship_statistics.max_health
	
func _shoot():
	for child in firing_position.get_children():
		var bullet: = plBullet.instance()
		bullet.global_position = child.global_position
		bullet.speed = statistics.ship_statistics.bullet_speed
		bullet.damage = statistics.ship_statistics.bullet_damage
		get_tree().current_scene.add_child(bullet)
		
func create_shield():
	for child in get_children():
		if child.is_in_group("shield"):
			child.queue_free()
	
	var shield: = pShield.instance()
	call_deferred("add_child", shield)
		
func _on_Fire_cooldown_timeout():
	_shoot()

func _onDamageDetector_area_entered(area):
	if area.is_in_group("enemy"):
		health = 0
		
	if health <= 0:
		animation_player.play("Explode")
		
	emit_signal("life_changed", health)
