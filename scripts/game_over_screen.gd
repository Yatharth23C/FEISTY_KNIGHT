extends Node2D


func _ready() -> void:
	pass

func _on_credits_pressed() -> void:
	$MainContainer/MainButtons.visible = false
	$MainContainer/CreditsMenu.visible = true
func _on_main_menu_pressed() -> void:
	
	get_tree().change_scene_to_file(str("res://Scenes/main_menu.tscn"))

#Backbutton-----------------------------------------
func _on_back_pressed() -> void:
	$MainContainer/MainButtons.visible = true
	$MainContainer/CreditsMenu.visible = false
#Backbutton-----------------------------------------
