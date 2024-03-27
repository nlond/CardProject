extends CharacterBody2D

# adjust player speed with this var
@export var movement_speed = 150.0
@onready var sprite = $Sprite2D

func _physics_process(delta):
	movement()
	
func movement():
	# player movement with WASD
	var x_move = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_move = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	var move = Vector2(x_move, y_move)
	
	# flip player direction to face direction of movement
	if move.x > 0:
		sprite.flip_h = false
	elif move.x < 0:
		sprite.flip_h = true
	
	velocity = move.normalized() * movement_speed
	move_and_slide()
