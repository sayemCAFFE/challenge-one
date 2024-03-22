extends Area2D

func _ready():
	pass 


func _on_freeze_body_entered(body):
	if body.is_in_group("player1"):
		GlobalVars.player2_speed = 0
		queue_free()
	if body.is_in_group("player2"):
		GlobalVars.player1_speed = 0
		queue_free()
