extends CharacterBody2D

@onready var anim := $AnimatedSprite2D


const SPEED = 300.0


func _physics_process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
	var input_vector := Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1
	input_vector = input_vector.normalized()
	velocity = input_vector * SPEED
	move_and_slide()
	
	if(abs(mouse_pos.x - global_position.x) > 1 && abs(mouse_pos.y - global_position.y) > 1):
		look_at(mouse_pos)
		
	if input_vector != Vector2.ZERO:
		anim.play("walk")
	else:
		anim.stop()
		anim.frame = 0  # optional: reset to first frame
	
