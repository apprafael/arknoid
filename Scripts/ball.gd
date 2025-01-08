extends CharacterBody2D


@export var y_speed = -250.0
@export var angle = [250,-250]
var started = false


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and !GameManager.started:
		playGame()

	var collision = move_and_collide(velocity*delta)
	if collision != null:
		velocity = velocity.bounce(collision.get_normal())
	

func playGame():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
