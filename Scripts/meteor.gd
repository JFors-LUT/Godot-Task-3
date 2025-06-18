class_name Meteor extends Area2D

@export var SPEED = 20.0 #200.0
@export var GAME_AREA = 700
@export var HP = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += SPEED * delta
	if position.y > 700:
		queue_free()
		
func take_hit():
	HP -= 1
	print("Meteor health: ", HP)
	if HP <= 0:
		queue_free()
