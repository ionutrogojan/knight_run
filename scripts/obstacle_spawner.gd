extends Node

const spawningPos = Vector2(0, -324)

var obstacleReference_0 = preload("res://scenes/obstacle_pattern_0.tscn")
var obstacleReference_1 = preload("res://scenes/obstacle_pattern_1.tscn")
var obstacleReference_2 = preload("res://scenes/obstacle_pattern_2.tscn")
var obstacleReference_3 = preload("res://scenes/obstacle_pattern_3.tscn")
var obstacleReferences = [obstacleReference_0, obstacleReference_1, obstacleReference_2, obstacleReference_3]

func _ready():
	spawn("spawning start")

func spawn(_message):
	#	randomize the seed based on time
	randomize()
#	get a random integer to pick a pattern
	var number = randi() % 4
#	instantiate the pattern
	var obstaclePattern = obstacleReferences[number].instance()
#	set position
	obstaclePattern.position = spawningPos
#	add to spawner
	obstaclePattern.connect("init_spawn", self, "spawn")
	add_child(obstaclePattern)
#	print_debug(message)

