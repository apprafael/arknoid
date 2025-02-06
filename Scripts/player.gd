extends CharacterBody2D

@export var SPEED = 400.0
@onready var shot_bullet = $SpawnBullet
var bullet_scene = preload("res://Scenes/bullet.tscn")

var max_bullet = 20
var bullet_count = 0

func _ready() -> void:
	GameManager.on_powerup.connect(spawn_bullet)

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_collide(velocity*delta)

func spawn_bullet():
	var left_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(left_shoot_instance)
	left_shoot_instance.global_position.x = global_position.x - 35
	left_shoot_instance.global_position.y = global_position.y - 20
	
	var right_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(right_shoot_instance)
	right_shoot_instance.global_position.x = global_position.x + 35
	right_shoot_instance.global_position.y = global_position.y - 20

	if bullet_count < max_bullet:
		shot_bullet.start()
		bullet_count += 1
	else:
		bullet_count = 0

func _on_spawn_bullet_timeout() -> void:
		spawn_bullet()
