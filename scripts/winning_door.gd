extends Area2D

var totallevels =3
var currentlevel = 0


func _ready() -> void:
	var levelname = get_tree().current_scene.name
	var temp = levelname.right(levelname.length()-5)
	currentlevel = int(temp)
	print(currentlevel)
	
func _on_body_entered(body: Node2D) -> void:
	if(body.name=="Player" && body.hasKey):
		if(currentlevel < totallevels):
			print("initiating nxt lvl")
			Gamemanager.total_score = Gamemanager.total_score + Gamemanager.current_score
			Gamemanager.current_score = 0
			get_tree().call_deferred("change_scene_to_file","res://Scenes/Level"+str(currentlevel+1)+".tscn")
		else:
			get_tree().call_deferred("change_scene_to_file","res://Scenes/main_menu.tscn")
