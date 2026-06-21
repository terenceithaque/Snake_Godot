extends Control



func _ready() -> void:
	
	# Récupérer les différents boutons du menu
	var panel_container = $PanelContainer
	var title_label = get_node("PanelContainer/VBoxContainer/Title")
	var play_button = get_node("PanelContainer/VBoxContainer/PlayButton")
	var quit_button = get_node("PanelContainer/VBoxContainer/QuitButton")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
