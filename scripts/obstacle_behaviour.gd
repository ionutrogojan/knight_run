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
#	print_debug(self.)
	var speed: int
	if res.GAME_SPEED > 0:
		speed = res.GAME_SPEED + (res.ROUND_SCORE * 2)
	else:
		speed = 0
	self.position.y += round(speed * delta)
	if self.position.y <= res.obstacle_space : return
	spawnNext()
	if self.position.y <= endPosY : return
#	print_debug("Getting deleted")
	self.queue_free()
#	pass
