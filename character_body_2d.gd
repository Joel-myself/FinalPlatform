extends CharacterBody2D


const SPEED = 400


var took_damage= false


const JUMP_VELOCITY = -600





func respawn():
	self.global_position = Vector2(8000,-150)
	took_damage= false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)

		if collision.get_collider().name == "spikes":
			if took_damage == false:
				took_damage = true
				respawn()

	# Handle jump. 
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
