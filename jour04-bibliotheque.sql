-- Jour 04 - Base de données : Gestion d'une bibliothèque
-- Niveau L2 - SQL : INSERT, SELECT, UPDATE, DELETE

-- Insertion de données dans Auteur
INSERT INTO Auteur (id_auteur, nom, prenom, nationalite) VALUES
(1, 'Hugo', 'Victor', 'Française'),
(2, 'Camus', 'Albert', 'Algérienne'),
(3, 'Zola', 'Émile', 'Française');

-- Insertion de données dans Livre
INSERT INTO Livre (id_livre, titre, annee_publication, id_auteur) VALUES
(1, 'Les Misérables', 1862, 1),
(2, 'L''Étranger', 1942, 2),
(3, 'Germinal', 1885, 3);

-- Afficher tous les livres avec leur auteur
SELECT l.titre, l.annee_publication, a.nom, a.prenom
FROM Livre l
JOIN Auteur a ON l.id_auteur = a.id_auteur;

-- Mettre à jour un livre
UPDATE Livre SET annee_publication = 1863 WHERE id_livre = 1;

-- Supprimer un auteur
DELETE FROM Auteur WHERE id_auteur = 3;