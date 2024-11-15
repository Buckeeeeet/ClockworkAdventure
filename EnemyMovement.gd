extends CharacterBody2D

@export var SPEED : float = 80.0
@export var GRAVITY : float = 100.0
var direction = -1
var direction_cooldown = 5
var dirty_direction_change = false
var is_defeated = false

@onready var player = get_node("/root/Node2D/Player")
@onready var _animated_sprite = $AnimatedSprite2D
@onready var _collision = $CollisionShape2D
@onready var GLOBALS = get_node("/root/Node2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	while !GLOBALS.started:
		continue
	_animated_sprite.play("default")
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_defeated:
		return
	velocity.y += delta * GRAVITY
	velocity.x = SPEED * direction
	move_and_slide()
	if max(player.position.x, position.x) - min(player.position.x, position.x) < 40 and player.is_on_floor():
		defeat()
	for i in get_slide_collision_count():
		var collider = get_slide_collision(i).get_collider()
		if collider.name == "Player":
			player.defeat(direction)

func _physics_process(delta):
	if !is_on_floor_only() and !is_defeated:
		direction *= -1
		_animated_sprite.flip_h = !_animated_sprite.flip_h
		print(direction)

func defeat():
	player.jump()
	_animated_sprite.play("hurt")
	velocity.x = 0
	is_defeated = true
	GLOBALS.score += 150
