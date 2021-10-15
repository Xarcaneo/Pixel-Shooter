extends Area2D

class_name Bullet

export var speed: float = 500
export var damage: float = 20

func _physics_process(delta):
	position.y -= speed * delta
