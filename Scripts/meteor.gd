class_name Meteor extends Area2D

@export var SPEED := 200
@export var GAME_AREA := 700
@export var HP := 3

signal destroyed
signal hit_player

@onready var gui = get_tree().get_root().get_node("Node/UI")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(gui)
	connect("destroyed", Callable(gui, "update_score"))
	connect("hit_player", Callable(gui, "update_HP"))
#	connect("body_entered", Callable(self, "_on_body_entered"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += SPEED * delta
	#if position.y > GAME_AREA:
	#	queue_free()
		
func take_hit():
	HP -= 1
	if HP <= 0:
		emit_signal("destroyed")
		queue_free()
		
func _on_body_entered(body):
	if body is Player:
		emit_signal("hit_player")
		queue_free()
