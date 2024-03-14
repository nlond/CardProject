extends CharacterBody2D

@export var movement_speed = 150.0

func _physics_process(delta):
	movement()
	
func movement():
	var x_move = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_move = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	var move = Vector2(x_move, y_move)
	velocity = move.normalized() * movement_speed
	move_and_slide()
