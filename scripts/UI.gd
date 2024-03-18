extends Control

var p1_score = 0
var p2_score = 0
var game_time = 10

func _ready():
	$gameTimer.start()
	$TimeLabel.text = "Time: "+str(game_time)
	Signal.connect("change_score2", self, "_change_score2")
	Signal.connect("change_score", self, "_change_score")

func _change_score():
	p1_score += 1
	$P1score.text = "P1: "+str(p1_score)


func _change_score2():
	p2_score += 1
	$P2score.text = "P1: "+str(p2_score)

func _on_gameTimer_timeout():
	game_time -= 1
	$TimeLabel.text = "Time: "+str(game_time)
	if game_time == 0:
		Signal.emit_signal("delete_collect")
		$gameTimer.stop()
