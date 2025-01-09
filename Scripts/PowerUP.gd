extends CharacterBody2D

@export var fall_speed = 80
@export var rotation_speed = 60

func _physics_process(delta: float) -> void:
	
	velocity.y = fall_speed
	rotation_degrees += rotation_speed * delta
	move_and_slide()
