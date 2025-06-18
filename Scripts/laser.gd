extends Line2D

@export var decay_time: float = 0.2

func _ready():
    var timer := Timer.new()
    timer.wait_time = decay_time
    timer.connect("timeout", _on_timer_timeout)
    timer.autostart = true
    add_child(timer)

func _process(_delta):
    self.default_color.a *= 0.9

func _on_timer_timeout():
    queue_free()