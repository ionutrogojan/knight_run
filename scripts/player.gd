extends Node2D

export(Resource) var res
export (NodePath) var score_ref_round
onready var scoreText = get_node(score_ref_round)
export (NodePath) var score_ref_best
onready var bestText = get_node(score_ref_best)

var pointLayerValue = 4

var currentPos = 0.5
enum playerPosX { leftPosX = -216, midPosX = 0, rightPosX = 216}

func _ready():
	# warning-ignore:return_value_discarded
	$Area2D.connect("area_entered", self, "restart")
	res.ROUND_SCORE = 0
	scoreText.text = str(res.ROUND_SCORE)
	bestText.text = str(res.BEST_SCORE)

func _process(delta):
	var speed: int
	if res.GAME_SPEED > 0:
		speed = res.GAME_SPEED + (res.ROUND_SCORE * 2)
	else:
		speed = 0
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
				self.position.x -= speed * delta
			else:
				self.position.x = playerPosX.leftPosX
		-0.5:
			if self.position.x > playerPosX.midPosX:
				self.position.x -= speed * delta
			else:
				self.position.x = playerPosX.midPosX
		0.5:
			if self.position.x < playerPosX.midPosX:
				self.position.x += speed * delta
			else:
				self.position.x = playerPosX.midPosX
		1:
			if self.position.x < playerPosX.rightPosX:
				self.position.x += speed * delta
			else:
				self.position.x = playerPosX.rightPosX

func restart(contact: Area2D):
	if(contact.get_collision_layer() == pointLayerValue) :
		res.ROUND_SCORE += 1
		scoreText.text = str(res.ROUND_SCORE)
	else:
#		print("Restarting! ", contact.get_parent().name)
		if res.ROUND_SCORE > res.BEST_SCORE:
			res.BEST_SCORE = res.ROUND_SCORE
		# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
