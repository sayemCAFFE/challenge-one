extends Area2D

func _ready():
	Signal.connect("delete_collect", self, "_delete_collect")
	Signal.connect("collect_destroy", self, "_collect_destroy")


func _collect_destroy():
	Signal.emit_signal("delete_collect")
	Signal.emit_signal("collect_load")
	if GlobalVars.scorer == "player1":
		Signal.emit_signal("change_score")
	if GlobalVars.scorer == "player2":
		Signal.emit_signal("change_score2")



func _on_collect_body_entered(body):
	if body.is_in_group("player1"):
		Signal.emit_signal("change_score")
		Signal.emit_signal("collect_load")
		queue_free()
	if body.is_in_group("player2"):
		Signal.emit_signal("change_score2")
		Signal.emit_signal("collect_load")
		queue_free()

func _delete_collect():
	queue_free()





