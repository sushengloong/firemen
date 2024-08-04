extends CharacterBody2D

const SPEED = 800.0

@onready var sprite = $AnimatedSprite2D

func _process(delta):
	if velocity.x > 1 || velocity.x < -1 || velocity.y > 1 || velocity.y < -1:
		sprite.animation = "moving"
	else:
		sprite.animation = "idle"

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.x != 0:
		sprite.flip_h = velocity.x < 0

	if Input.is_action_just_pressed("shoot"):
		_shoot()

func _shoot():
	#print("shooting...")
	const WATER_BALL = preload("res://waterball/waterball.tscn")
	var new_water_ball = WATER_BALL.instantiate();
	new_water_ball.direction = Vector2.RIGHT
	if sprite.flip_h:
		new_water_ball.position.x -= sprite.get_sprite_frames().get_frame_texture(sprite.animation, sprite.frame).get_width()
		new_water_ball.direction = Vector2.LEFT
	add_child(new_water_ball)
