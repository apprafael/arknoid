extends Node

var started: bool = false
var lives: int = 3
var score: int = 0
var record: int = 0

signal on_powerup

func add_score(value):
	score += value

func reset_score():
	score = 0

func update_record():
	if score > record:
		record = score

func reset_lives():
	lives = 3
