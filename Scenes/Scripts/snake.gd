extends Node2D


# Récupérer les différents sprites de la tête du serpent

@onready var head_sprite = $Head

var head_up = preload("res://assets/images/head_up.png")
var head_down = preload("res://assets/images/head_down.png")
var head_left = preload("res://assets/images/head_left.png")
var head_right = preload("res://assets/images/head_right.png")
var body_sprite = preload("res://assets/images/body_element.png")

# Direction actuelle du serpent
var direction = Vector2i.LEFT

# Variable d'état de la pause
var pause = false


# Charger la grille de jeu
var grille = preload("res://Scenes/Scripts/grid.gd")
var grille_jeu = grille.new(20, 31) # Grille de jeu

func positions_actuelles(sprites:Array) -> Array:
	"""Renvoie la liste des positions dans la grille de jeu de chaque sprite de la liste sprites."""
	
	var positions = []
	
	for sprite in sprites:
		positions.append(grille_jeu.coordonnees_grille(sprite.position.x, sprite.position.y))
	
	return positions


func generer_corps(taille:int=4) -> Array:
	"""Prend en paramètres un entier taille.
	Renvoie un tableau de sprites constituant le corps du serpent."""
	
	var body := []
	print(body_sprite)
	
	for n in range(taille):
		var sprite = Sprite2D.new()
		sprite.texture = body_sprite
		body.append(sprite)
	
	return body
	



# Positions des différentes parties du corps du serpent
var positions_corps = [
	Vector2(0, 0),
	Vector2(1, 0),
	Vector2(3, 0),
	Vector2(4, 0),
]




var body_sprites = generer_corps(4) # Tableau des sprites du corps

func _ready():
	# Récupérer le noeud BodyContainer
	var body_container = $BodyContainer
	body_container.position = Vector2.ZERO
	#var body_sprite = get_node("BodyContainer/BodyElement")
	
	for i in range(len(body_sprites)):
		var sprite = body_sprites[i]
		print(sprite)
		var sprite_pos = positions_corps[i]
		var coords_cartesiennes = grille_jeu.coordonnees_cartesiennes(sprite_pos.x, sprite_pos.y)
		print("Coordonnées cartésiennes du sprite du corps :", coords_cartesiennes)
		sprite.position.x = coords_cartesiennes.x
		sprite.position.y = coords_cartesiennes.y
		body_container.add_child(sprite)
	
	


var snake = [head_sprite] + body_sprites


func move_left():
	"""Déplace le serpent vers la gauche."""
	
	# Déplacer la tête
	head_sprite.move_local_x(-5)
	
	
	# Repositionner la tête si elle sort de l'écran
	if head_sprite.position.x < 0:
		head_sprite.position.x = 1100
	
	# Déplacement des éléments du corps
	for i in range(1, len(snake) -1):
		var body_element = body_sprites[i]
		var precedent = body_sprites[i-1]
		body_element.position = precedent.position
		
		


func move_right():
	"""Déplace le serpent vers la droite."""
	
	# Déplacer la tête
	head_sprite.move_local_x(5)
	
	var window_size = DisplayServer.window_get_size()
	
	# Repositionner la tête si elle sort de l'écran
	if head_sprite.position.x > window_size.x:
		head_sprite.position.x = 8

func move_up():
	"""Déplace le serpent vers le haut."""
	
	# Déplacer la tête
	head_sprite.move_local_y(-5)
		
	# Repositionner la tête si elle sort de l'écran
	if head_sprite.position.y < 0:
		head_sprite.position.y = 620


func move_down():
	"""Déplace le serpent vers le bas."""
	
	# Déplacer la tête
	head_sprite.move_local_y(5)
	
	var window_size = DisplayServer.window_get_size()
	
	# Repositionner la tête si elle sort de l'écran
	if head_sprite.position.y > window_size.y:
		head_sprite.position.y = 8
			
	

func deplacer_serpent():
	"""Déplace le serpent dans la direction actuelle."""
	
	# Déplacements vers la gauche
	if direction == Vector2i.LEFT:
		move_left()
	
	# Déplacements vers la droite:
	elif direction == Vector2i.RIGHT:
		move_right()
	
	# Déplacements vers le haut
	elif direction == Vector2i.UP:
		move_up()
	
	
	# Déplacements vers le bas
	elif direction == Vector2i.DOWN:
		move_down()			
		
		 
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
	"""Fonction principale du jeu."""
	

	
	# Si le joueur appuie sur la touche de pause (espace)
	if Input.is_action_just_pressed("pause"):
		
		# Désactiver la pause si elle est déjà active
		if pause == true:
			pause = false
		
		# Sinon, activer la pause
		else:
			pause = true
	
	# Si la pause n'est pas active		
	if not pause:
		
		# Vérifier les autres événements éventuellement déclenchés			
		if Input.is_action_pressed("move_down"):
			direction = Vector2i.DOWN
			update_head_sprite()
			
		
		elif Input.is_action_pressed("move_up"):
			direction = Vector2i.UP
			update_head_sprite()
			
		
		elif Input.is_action_pressed("move_left"):
			direction = Vector2i.LEFT
			update_head_sprite()
		
		elif Input.is_action_pressed("move_right"):
			direction = Vector2i.RIGHT
			update_head_sprite()
		
		deplacer_serpent() # Déplacer le serpent
	else:
		var pos_souris = get_local_mouse_position()
		print(pos_souris, grille_jeu.coordonnees_grille(pos_souris[0], pos_souris[1]))
