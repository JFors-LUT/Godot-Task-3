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
		process_ray_cast(click_point)
		ray_cast_gfx(click_point)


# -- TASK 3 Raycast functionality HERE -- #
func process_ray_cast(target_position: Vector2):
	pass

# --------------------------------------- #

func ray_cast_gfx(click_point: Vector2):
	var clone: Line2D = projectile.instantiate()
	clone.position = global_position + offset.rotated(rotation)
	clone.rotation = global_rotation
	clone.points = [Vector2.ZERO, Vector2.UP * click_point.distance_to(global_position + offset.rotated(rotation))]
	get_tree().root.add_child(clone)