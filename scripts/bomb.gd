extends Area2D

var collect_count = 0

func _ready():
	collect_count = get_tree().get_nodes_in_group("collect").size()

func _on_bomb_body_entered(body):
	if body.is_in_group("player1"):
		Signal.emit_signal("collect_destroy")
		queue_free()
	if body.is_in_group("player2"):
		Signal.emit_signal("collect_destroy")
		queue_free()

func _on_collectTimer_timeout():
	if collect_count > 4:
		Signal.emit_signal("collect_load")
