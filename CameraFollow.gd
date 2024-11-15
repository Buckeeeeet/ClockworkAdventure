extends Camera2D

@onready var GLOBALS = get_node("/root/Node2D")

var player
# Called when the node enters the scene tree for the first time.
func _ready():
	while !GLOBALS.started:
		continue
	player = get_node("/root/Node2D/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position
