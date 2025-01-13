extends CharacterBody2D

@export var y_speed = -250.0
@export var angle = [250,-250]
@export var drop_probability = 0.2
@export var item_scene = preload("res://Scenes/power_up.tscn")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and !GameManager.started:
		playGame()
	
	var collision = move_and_collide(velocity*delta)
	
	if collision != null:
		velocity = velocity.bounce(collision.get_normal())
		if "block" in collision.get_collider().name:
			collision.get_collider().queue_free()
			spawnItem(collision.get_position())
	

func playGame():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)			

func spawnItem(position_item: Vector2):
	if randf() < drop_probability:
		var item = item_scene.instantiate()
		item.position = position_item
		get_parent().add_child(item)
