extends Area2D

const SPEED = 1000
const RANGE = 100

@export var direction: Vector2
var traveled_distance = 0

func _physics_process(delta):	
	#var direction = Vector2.RIGHT.rotated(rotation)
	var direction = direction.rotated(rotation)
	position += direction * SPEED * delta

	traveled_distance += SPEED * delta
	if traveled_distance > RANGE:
		queue_free()
