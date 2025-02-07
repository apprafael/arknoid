extends Node2D

@onready var time_reset = $TimerReset

func _on_death_zone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if GameManager.lives > 1:
			GameManager.lives -= 1
			body.reset_position()
		else:
			time_reset.start()
	else:
		body.queue_free()

func _on_timer_reset_timeout() -> void:
	get_tree().reload_current_scene()
	GameManager.started = false
