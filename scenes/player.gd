extends CharacterBody2D

const SPEED = 100.0

@onready var player_animation: AnimatedSprite2D = $AnimatedSprite2D

func get_input_direction() -> Vector2:
	var direction = Vector2()
	if Input.is_action_pressed('move_right'):
		direction.x += 1
		player_animation.play('move_right_animation')
	elif Input.is_action_pressed('move_left'):
		direction.x -= 1
		player_animation.play('move_left_animation')
	elif Input.is_action_pressed('move_down'):
		direction.y += 1
		player_animation.play('move_down_animation')
	elif Input.is_action_pressed('move_up'):
		direction.y -= 1
		player_animation.play('move_up_animation')
	if direction.length() == 0:
		player_animation.play('idle')
	return direction.normalized()

func _physics_process(delta: float) -> void:
	var direction = get_input_direction()
	velocity = direction * SPEED

	move_and_slide()
