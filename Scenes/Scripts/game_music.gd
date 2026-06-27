extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var game_music = $GameMusic
	game_music.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_music_finished() -> void:
	$GameMusic.play()
