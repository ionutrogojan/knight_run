extends Node2D

signal init_spawn

var endPosY = 2052
var endPosY1 = 1836

var fired = false

export(Resource) var res

func spawnNext():
	if fired == false:
		emit_signal("init_spawn", "spawning signal")
		fired = true

func _ready():
	pass

func _process(delta):
	self.position.y += res.GAME_SPEED * delta
	if self.position.y <= res.obstacle_space : return
	spawnNext()
	if self.position.y <= endPosY : return
	print_debug("Getting deleted")
	self.queue_free()
#	pass
