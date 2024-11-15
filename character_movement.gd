extends CharacterBody2D

@export var SPEED = 250.0
@export var GRAVITY = 600.0
@export var JUMP = -350.0

var score


@onready var GLOBALS = get_node("/root/Node2D")

@onready var _animated_sprite = $AnimatedSprite2D

var is_hurt = false

#@onready var nodeCamera2D : Camera2D = get_node("/root/Node2D/Camera2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	while !GLOBALS.started:
		continue
	score = 0
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animate()
	pass #nodeCamera2D.position = position
	
func _physics_process(delta):
	var motion = velocity * delta
	move_and_collide(motion)
	
	velocity.y += delta * GRAVITY
	
	if !is_hurt:
		if (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_jump")) and is_on_floor():
			jump()
		if Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			_animated_sprite.flip_h = true
		elif Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			_animated_sprite.flip_h = false
		else:
			velocity.x = 0
		
	move_and_slide()

func animate():
	if is_hurt:
		_animated_sprite.play("hurt")
	elif !is_on_floor():
		_animated_sprite.play("jump")
	elif velocity.x != 0:
		_animated_sprite.play("default")
	else:
		_animated_sprite.play("default")
		_animated_sprite.stop()
	if is_on_floor():
		is_hurt = false
	
func jump():
	velocity.y = JUMP
	
func defeat(direction):
	jump()
	velocity.x = direction * SPEED * 0.5
	_animated_sprite.flip_h = (direction > 0)
	is_hurt = true
	
