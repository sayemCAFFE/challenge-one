extends Control

var my_score = 1
var game_time = 10

func _ready():
	$gameTimer.start()
	$TimeLabel.text = "Time: "+str(game_time)
	Signal.connect("change_score", self, "_change_score")

func _change_score():
	$scoreLabel.text = "Score: "+str(my_score)
	my_score += 1


func _on_gameTimer_timeout():
	game_time -= 1
	$TimeLabel.text = "Time: "+str(game_time)
	if game_time == 0:
		Signal.emit_signal("delete_collect")
		$gameTimer.stop()
