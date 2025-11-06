extends Node2D


func _ready() -> void:
	Gamemanager.total_score = 0
	Gamemanager.current_score =0
	$MainContainer/SettingsMenu/Fullscreen.button_pressed = true if(DisplayServer.window_get_mode())==(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN) else false
	$MainContainer/SettingsMenu/mainVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$MainContainer/SettingsMenu/SFXVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	$MainContainer/SettingsMenu/MusicVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BG_music")))
#MainBUttons ---------------------------------------
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(str("res://Scenes/Level1.tscn"))
	

func _on_settings_pressed() -> void:
	$MainContainer/MainButtons.visible = false
	$MainContainer/SettingsMenu.visible = true

func _on_credits_pressed() -> void:
	$MainContainer/MainButtons.visible = false
	$MainContainer/CreditsMenu.visible = true

func _on_quit_pressed() -> void:
	
	get_tree().quit()
#MainBUttons ---------------------------------------

#Backbutton-----------------------------------------
func _on_back_pressed() -> void:
	$MainContainer/MainButtons.visible = true
	$MainContainer/SettingsMenu.visible = false
	$MainContainer/CreditsMenu.visible = false
#Backbutton-----------------------------------------



#SettingsMenu---------------------------------------
func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if(toggled_on):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
func _on_main_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))
func _on_sfx_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),linear_to_db(value))
func _on_music_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BG_music"),linear_to_db(value))
#SettingsMenu---------------------------------------
