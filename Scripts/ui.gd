class_name UI extends Control

var score := 0
@export var start_HP := 3
@onready var score_label: Label = $Score
@onready var HP_label: Label = $HP

var HP = start_HP
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#HP_label.text = "HP: " + str(HP) 
	#score_label.text = str(score)
	#HP_label.text = str(HP) 
	$Score.text = str(score)
	$HP.text = str(start_HP)
	


func update_score() -> void:
	score += 1 
	#score_label.text = "Score: " + str(score) 
	#score_label.text = str(score) 
	$Score.text = str(score)

func update_HP() -> void:
	HP -= 1
	#HP_label.text = "HP: " + str(HP) 
	#HP_label.text = str(HP) 
	$HP.text = str(HP)
	if HP == 0:
		reset_UI()
		
		
func reset_UI() -> void:
		score = 0
		HP = start_HP
		#HP_label.text = "HP: " + str(HP) 
		#score_label.text = "Score: " + str(score) 
		#HP_label.text = str(HP) 
		#score_label.text = str(score)
		$Score.text = str(score)
		$HP.text = str(HP)
	
