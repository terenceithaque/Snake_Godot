extends Node2D


# Récupérer les différents sprites de la tête du serpent

@onready var head_sprite = $Head

var head_up : Texture2D
var head_down : Texture2D
var head_left : Texture2D
var head_right : Texture2D

# Direction actuelle du serpent
var direction = Vector2i.LEFT


func update_head_sprite():
	"""Met à jour le sprite de la tête du serpent selon la direction."""
	
	match direction:
		Vector2i.UP: # Si le serpent va vers le haut
			head_sprite.texture = head_up
		
		Vector2i.DOWN: # Si le serpent va vers le bas
			head_sprite.texture = head_down
		
		Vector2i.LEFT: # vers la gauche
			head_sprite.texture = head_left
		
		Vector2i.RIGHT: # ou vers la droite
			head_sprite.texture = head_right	
				


func _process(float) -> void:
	if Input.is_action_pressed("move_down"):
		print("Déplacement vers le bas")
		direction = Vector2i.DOWN
		update_head_sprite()
	
	elif Input.is_action_pressed("move_up"):
		print("Déplacement vers le haut")
		direction = Vector2i.UP
		update_head_sprite()
	
	elif Input.is_action_pressed("move_left"):
		print("Déplacement vers la gauche")
		direction = Vector2i.LEFT
		update_head_sprite()
	
	elif Input.is_action_pressed("move_right"):
		print("Déplacement vers la droite")
		direction = Vector2i.RIGHT
		update_head_sprite()
	
