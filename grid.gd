"""Définit une classe grille représentant une grille de jeu."""
extends Node

class_name Grille

# Tableau représentant la grille
var tableau = []

var taille_case = Vector2i() # Dimensions d'une case


func _init(nb_lignes:int, nb_colonnes:int, larg_case:int=32, haut_case:int=32) -> void:
	"""Génère la grille de dimensions (nb_lignes, nb_colonnes).
	Les paramètres larg_case et haut_case permettent de définir la largeur et la hauteur d'une case en pixels.
	Si aucune valeur n'est précisée, une case est considérée comme ayant une dimension de 32*32 pixels."""
	
	taille_case.x = larg_case
	taille_case.y = haut_case
	
	for i in range(nb_lignes):
		var ligne = []
		for j in range(nb_colonnes):
			ligne.append(Vector2i(i, j))
		
		tableau.append(ligne)


func coordonnees_cartesiennes(l:int, c:int) -> Vector2i:
	"""Renvoie les coordonnées cartésiennes d'une case située à la ligne l et à la colonne c."""
	
	return Vector2i(c*taille_case.x, l*taille_case.y)
	

func coordonnees_grille(x:int, y:int) -> Vector2i:
	"""Renvoie les coordonnées de la case correspondant à x et y des coordonnées cartésiennes."""
	
	return Vector2i(
		y / taille_case.y,
		x / taille_case.x
	)
		
				
		
