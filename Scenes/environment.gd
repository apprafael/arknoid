extends Node2D

@onready var time_reset = $TimerReset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_death_zone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		time_reset.start()
		


func _on_timer_reset_timeout() -> void:
	get_tree().reload_current_scene()
	GameManager.started = false
