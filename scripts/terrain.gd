extends Node2D

export(Resource) var res
var endPosY = 3240

export(NodePath) var terrain1Node
export(NodePath) var terrain2Node
export(NodePath) var terrain3Node
onready var terrain1 = get_node(terrain1Node)
onready var terrain2 = get_node(terrain2Node)
onready var terrain3 = get_node(terrain3Node)

onready var terrains = [terrain1, terrain2, terrain3]

func _ready():
	pass
	
func _process(delta):
	for tile in terrains:
#		add speed over time to move down
		tile.position.y += res.GAME_SPEED * delta
		if tile.position.y <= endPosY : continue
		tile.position.y -= 3888
