class_name Player extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	var direction = Vector2.ZERO
		
	if Input.is_action_pressed("left"):
		direction.x -= 1
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	if Input.is_action_pressed("up"):
		direction.y -= 1
	
	if Input.is_action_pressed("down"):
		direction.y += 1
		
	if direction != Vector2.ZERO:

		direction = direction.normalized()
		self.position += direction * SPEED * delta
		velocity = direction * SPEED * delta
	#move_and_slide()
