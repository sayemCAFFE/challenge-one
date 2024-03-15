extends Node2D

var collect_scene = preload("res://scenes/collectC.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	Signal.connect("collect_load", self, "_collect_load")


func _collect_load():
	call_deferred("_add_collect")
	print("gitHub")

func _add_collect():
	var collect = collect_scene.instance()
	$"%collect_count".add_child(collect)
	var random_pos = Vector2(rng.randi_range(50,910), rng.randi_range(50,500))
	collect.global_position = Vector2(random_pos.x, random_pos.y)


