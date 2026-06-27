"""Définit une classe grille représentant une grille de jeu."""
extends Node

class_name Grille

# Tableau représentant la grille
var tableau = []

func _init(nb_lignes:int, nb_colonnes:int) -> void:
	"""Génère la grille de dimensions (nb_lignes, nb_colonnes)."""
	
	for i in range(nb_lignes):
		var ligne = []
		for j in range(nb_colonnes):
			ligne.append(Vector2i(i, j))
		
		tableau.append(ligne)
