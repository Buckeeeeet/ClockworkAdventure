extends Area2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var GLOBALS = get_node("/root/Node2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	while !GLOBALS.started:
		continue
	_animated_sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if(get_overlapping_bodies()):
		collect()

func collect():
	GLOBALS.score += 100
