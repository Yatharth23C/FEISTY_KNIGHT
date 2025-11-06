extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score_label: Label = $"../../CanvasLayer/Score"


func _ready() -> void:
	
	score_label.text ="Coins: "+str(Gamemanager.total_score+ Gamemanager.current_score)

func _on_body_entered(_body: Node2D) -> void:

	Gamemanager.current_score+=1
	score_label.text ="Coins: "+str(Gamemanager.total_score+ Gamemanager.current_score)
	animation_player.play("pickupanim")
