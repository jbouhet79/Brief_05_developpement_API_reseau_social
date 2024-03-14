# Compte-rendu de la présentation de *Coralie ANTOINE*

## Cahier des charges
réalisé en .md à partir d'un fichier Word (copié à partir du fichier fourni)
SGBD PostgreSQL pécisé pour aider (éventuellement le développeur Fullstack)
utilisation de Copilot (de microsoft)

## Diagrammes et cardinalités


## Définitions des tables
ajout de l'attribut 'notification' avec ALTER TABLE à la table users car pas prévué initialement
TABLE follow avec la PRIMRAY KEY avec 2 valeurs car il faut les deux conditions réunies
Les liens vers les pièces jointes en VARCHAR(100) peut être un peu court en fonction les liens. souvent prévoir 255.


## Insertions des données
Remarque pour "échapper" le ', doubler la cote ''
Création de posts avec pièces jointes directement grâce à un WITH  (avec une expression commune de table)
Avec un WITH également, gestion de commentaire à un post directement
Utilisation de ILIKE pour gérer les prblèmes de Majuscules/minuscules dans une recherche (qui remplace LOWER ) --> plus performant.
Une VIEW réalisée afficher les likes, les partages de posts
Une VIEW pour afficher les users et les contenus de posts associés.


## Requêtes
récupérer le contenu et les commentaires d'un post.



Présentation très complète et claire (reste juste à gérer les groupes de partage)
Bravo !





