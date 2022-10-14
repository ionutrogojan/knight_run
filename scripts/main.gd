extends Node

export(Resource) var res

var state: bool = true
var defaultSpeed: int = 0

func _ready():
	state = true
	defaultSpeed = res.GAME_SPEED
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		state = not state
	if state == false:
		res.GAME_SPEED = 0
	else:
		res.GAME_SPEED = defaultSpeed
