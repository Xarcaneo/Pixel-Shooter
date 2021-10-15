extends Power_up

onready var animation_timer : Timer = get_node("Animation/AnimationTimer")
onready var animation_player : AnimationPlayer = get_node("Animation/AnimationPlayer")

func _ready():
	animation_timer.set_wait_time(2.0)
	animation_timer.start()

func _on_AnimationTimer_timeout():
	animation_player.play("animate")


func _on_ShieldPowerUp_body_entered(body):
	if body.is_in_group("player"):
		body.create_shield()
		queue_free()
