extends Node2D
@onready var pause_menu: Node2D = $"."
var paused = false
func _ready() -> void:
	pause_menu.visible  = false
	get_tree().paused = false
	$MainContainer/SettingsMenu/Fullscreen.button_pressed = true if(DisplayServer.window_get_mode())==(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN) else false
	$MainContainer/SettingsMenu/mainVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$MainContainer/SettingsMenu/SFXVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	$MainContainer/SettingsMenu/MusicVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BG_music")))

#Handle Pausing.
func _process(_delta: float) -> void:
	#Handle PAUSEMENU
	if Input.is_action_just_pressed("pause"):
		
		paused = !paused
		pause_menu.visible = paused
		get_tree().paused = paused
#MainBUttons ---------------------------------------
func _on_continue_pressed() -> void:
	
	paused = !paused
	pause_menu.visible = paused
	get_tree().paused = paused

func _on_settings_pressed() -> void:
	$MainContainer/MainButtons.visible = false
	$MainContainer/SettingsMenu.visible = true

func _on_credits_pressed() -> void:
	$MainContainer/MainButtons.visible = false
	$MainContainer/CreditsMenu.visible = true
func _on_main_menu_pressed() -> void:
	
	get_tree().change_scene_to_file(str("res://Scenes/main_menu.tscn"))
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
	print(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))
func _on_sfx_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),linear_to_db(value))
func _on_music_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BG_music"),linear_to_db(value))
#SettingsMenu---------------------------------------
