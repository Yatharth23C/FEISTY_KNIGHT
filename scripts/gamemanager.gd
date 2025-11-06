extends Node
var total_score = 0
var current_score =0
var lives =3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(lives==0):
		get_tree().call_deferred("change_scene_to_file","res://Scenes/game_over_screen.tscn")
		lives =3
		Engine.time_scale = 1
