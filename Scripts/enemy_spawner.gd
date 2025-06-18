extends Node
@export var enemy_list: Array[PackedScene]

@export var offset_y = -20
@export var offset_x_min = 10
@export var offset_x_max = 1100

@export var spawn_interval = 1

func _ready():
    var timer := Timer.new()
    timer.one_shot = false
    timer.wait_time = spawn_interval
    timer.connect("timeout", _on_timer_timeout)
    timer.autostart = true
    add_child(timer)

func _on_timer_timeout():
    spawn_enemy()

func spawn_enemy():
    if len(enemy_list) == 0:
        return
    var enemy: PackedScene = enemy_list.pick_random()
    var clone = enemy.instantiate()
    clone.position = Vector2(randf_range(offset_x_min, offset_x_max), offset_y)
    add_child(clone)
	