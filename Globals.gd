extends Node2D

var score
var lives
var started
var ended
var playing

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	lives = 3
	started = false
	ended = false
	playing = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
