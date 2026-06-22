extends Control



func _ready() -> void:
	
	# Récupérer les différents boutons du menu
	var panel_container = $PanelContainer
	var title_label = get_node("PanelContainer/VBoxContainer/Title")
	var play_button = get_node("PanelContainer/VBoxContainer/PlayButton")
	var quit_button = get_node("PanelContainer/VBoxContainer/QuitButton")
	
	# Musique du menu
	var title_music = $TitleMusic
	title_music.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	
	# Remplacer la scène par celle du jeu
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_button_pressed() -> void:
	"""Quitte le jeu"""
	get_tree().quit() # Quitter le jeu
