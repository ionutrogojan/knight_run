extends Node2D

export(Resource) var res

export (NodePath) var labelReference
onready var scoreText = get_node(labelReference)

var pointLayerValue = 4

var currentPos = 0.5
enum playerPosX { leftPosX = -216, midPosX = 0, rightPosX = 216}


func _ready():
	# warning-ignore:return_value_discarded
	$Area2D.connect("area_entered", self, "restart")
	scoreText.text = str(res.ROUND_SCORE)
#	print_debug(res.obstacle_space)

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		match currentPos:
			-1:
				pass
			-0.5, 0.5:
				currentPos = -1
			1:
				currentPos = -0.5
	elif Input.is_action_just_pressed("ui_right"):
		match currentPos:
			-1:
				currentPos = 0.5
			-0.5, 0.5:
				currentPos = 1
			1:
				pass
	match currentPos:
		-1:
			if self.position.x > playerPosX.leftPosX:
				self.position.x -= res.GAME_SPEED * delta
			else:
				self.position.x = playerPosX.leftPosX
		-0.5:
			if self.position.x > playerPosX.midPosX:
				self.position.x -= res.GAME_SPEED * delta
			else:
				self.position.x = playerPosX.midPosX
		0.5:
			if self.position.x < playerPosX.midPosX:
				self.position.x += res.GAME_SPEED * delta
			else:
				self.position.x = playerPosX.midPosX
		1:
			if self.position.x < playerPosX.rightPosX:
				self.position.x += res.GAME_SPEED * delta
			else:
				self.position.x = playerPosX.rightPosX

func restart(contact: Area2D):
	if(contact.get_collision_layer() == pointLayerValue) :
		res.ROUND_SCORE += 1
		scoreText.text = str(res.ROUND_SCORE)
	else:
		print("Restarting! ", contact.get_parent().name)
		res.ROUND_SCORE = 0
		# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
