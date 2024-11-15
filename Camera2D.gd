extends Camera2D

@onready var GLOBALS = get_node("/root/Node2D")
@onready var title = $Title
@onready var console_off = $Console2
@onready var press_start = $PressStart
@onready var player = get_node("/root/Node2D/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	player.visible = false
	title.visible = true
	press_start.visible = false
	console_off.visible = false
	GLOBALS.started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if (!GLOBALS.playing and !GLOBALS.started):
		var postitleinit = title.position.y
		title.position.y += 500
		position.y -= 1000
		wait(2, delta)
		console_off.visible = false
		wait(2, delta)
		console_off.visible = true
		wait(1, delta)
		console_off.visible = false
		#while title.position.y > postitleinit:
		#	title.position.y += 3
		wait(1, delta)
		press_start.visible = true
		GLOBALS.started = true
	if GLOBALS.started:
		press_start.visible = false
		title.visible = false
		var i = 0
		while i < 1000:
			position.y += 50
			i+= 50
		wait(2, delta)
		player.visible = true
		GLOBALS.started = false
		GLOBALS.playing = true
	if GLOBALS.ended:
		wait(2, delta)
		var i = 0
		while i < 0:
			position.y -= 50
			i += 50
		console_off.visible = true

func wait(t, d):
	var waiting = 0
	while waiting < t:
		waiting += d
