extends Control

func _process(delta: float) -> void:
	$LabelScore.text = "Score: " + str(GameManager.score)
	$LabelRecord.text = "Record: " + str(GameManager.record)
	$LabelLives.text = "Lives: " + str(GameManager.lives)
