extends Node2D

@export var projectile: PackedScene
@export var offset: Vector2 = Vector2.ZERO
@export_flags_2d_physics var collision_mask: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	if Input.is_action_just_pressed("click"):
		# Get cursor position and pass it to raycast and gfx methods
		var click_point = get_global_mouse_position()
		var was_hit = process_ray_cast(click_point)
		if was_hit == Vector2.ZERO:
			ray_cast_gfx(click_point)
		else:
			ray_cast_gfx(was_hit)


# -- TASK 3 Raycast functionality HERE -- #
func process_ray_cast(target_position: Vector2):
	var space_state = get_world_2d().direct_space_state
	#var direction = (target_position - global_position).normalized()
	var from = global_position
	var query = PhysicsRayQueryParameters2D.create(from, target_position)
	query.collide_with_areas = true
	query.collision_mask = 1 << 1
	#query.collide_with_bodies = false
	var result = space_state.intersect_ray(query)
	
	if result:
		var collider = result.collider
		if collider is Meteor:
			collider.take_hit()
			return collider.position
	else:
		return Vector2.ZERO
		# --------------------------------------- #

func ray_cast_gfx(click_point: Vector2):
	var clone: Line2D = projectile.instantiate()
	clone.position = global_position + offset.rotated(rotation)
	clone.rotation = global_rotation
	clone.points = [Vector2.ZERO, Vector2.UP * click_point.distance_to(global_position + offset.rotated(rotation))]
	get_tree().root.add_child(clone)
