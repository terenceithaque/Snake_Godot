extends Node2D


# Récupérer les différents sprites de la tête du serpent

@onready var head_sprite = $Head

var head_up = preload("res://assets/images/head_up.png")
var head_down = preload("res://assets/images/head_down.png")
var head_left = preload("res://assets/images/head_left.png")
var head_right = preload("res://assets/images/head_right.png")


# Direction actuelle du serpent
var direction = Vector2i.LEFT

func _ready():
	print(head_up)

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
	
