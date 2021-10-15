extends Area2D

export var durability: float = 3.0

onready var durability_timer: Timer = get_node("DurabilityTimer")
onready var animation_timer: Timer = get_node("Animation/AnimationTimer")
onready var animation_player : AnimationPlayer = get_node("Animation/AnimationPlayer")

func _ready():
	durability_timer.set_wait_time(durability)
	durability_timer.start()

	animation_timer.set_wait_time(0.3)
	animation_timer.start()
	
func _on_Durability_timer_timeout():
	queue_free()

func _on_AnimationTimer_timeout():
	animation_player.play("animate")

func _on_Shield_area_entered(area):
	queue_free()
