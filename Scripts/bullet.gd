extends Area2D

@export var speed = 100

func _physics_process(delta: float) -> void:
	global_position.y -= speed*delta


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	GameManager.add_score(1)
	queue_free()
