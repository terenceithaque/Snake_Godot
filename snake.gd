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


# Dimensions de la grille de jeu
var grid_width := 6
var grid_height := 6



func generer_corps(taille:int=4) -> Array:
	"""Prend en paramètres un entier taille.
	Renvoie un tableau de sprites constituant le corps du serpent."""
	
	var body := []
	
	for n in range(taille):
		var sprite = Sprite2D.new()
		sprite.texture = body_sprite
		body.append(sprite)	
	
	return body

func generer_grille(grid_width:int, grid_height:int) -> Array:
	var grid := []
	
	for l in range(grid_height):
		
		var ligne := []
		for c in range(grid_width):
			
			ligne.append(Vector2i(c, l))
		
		grid.append(ligne)	
		
	
	return grid		


func position_cartesienne(grille:Array, l:int, c:int) -> Vector2i:
	"""Prend en paramètres une grille, une ligne l et une colonne c.
	Renvoie les coordonnées cartésiennes de la case située à la ligne l et à la colonne c."""
	
	return Vector2i(l*10, c*10)


# Tableau des positions du serpent
var positions = [
	Vector2(0, 0),
	Vector2(1, 0),
	Vector2(3, 0),
	Vector2(4, 0),
	Vector2(5, 0)
]

var grille = generer_grille(11, 11)

func _ready():
	# Récupérer le noeud BodyContainer
	var body_container = $BodyContainer
	var body_sprite = get_node("BodyContainer/BodyElement")
	print(grille)


func move_left():
	"""Déplace le serpent vers la gauche."""
	pass


func move_right():
	"""Déplace le serpent vers la droite."""
	pass


func move_up():
	"""Déplace le serpent vers le haut."""
	pass


func move_down():
	"""Déplace le serpent vers le bas."""
	pass	
			
	

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
			print("Déplacement vers le bas")
			direction = Vector2i.DOWN
			update_head_sprite()
			move_down() # Déplacer le serpent vers le bas
		
		elif Input.is_action_pressed("move_up"):
			print("Déplacement vers le haut")
			direction = Vector2i.UP
			update_head_sprite()
			move_up() # Déplacer le serpent vers le haut
		
		elif Input.is_action_pressed("move_left"):
			print("Déplacement vers la gauche")
			direction = Vector2i.LEFT
			update_head_sprite()
			move_left() # Déplacer le serpent vers la gauche
		
		elif Input.is_action_pressed("move_right"):
			print("Déplacement vers la droite")
			direction = Vector2i.RIGHT
			update_head_sprite()
			move_right() # Déplacer le serpent vers la droite
	
	else:
		print(get_local_mouse_position())
