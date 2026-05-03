-- Jour 03 - Base de données : Gestion d'une bibliothèque
-- Niveau L2 - SQL

-- Création des tables
CREATE TABLE Auteur (
    id_auteur INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50),
    nationalite VARCHAR(50)
);

CREATE TABLE Livre (
    id_livre INTEGER PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    annee_publication INTEGER,
    id_auteur INTEGER,
    FOREIGN KEY (id_auteur) REFERENCES Auteur(id_auteur)
);

CREATE TABLE Emprunt (
    id_emprunt INTEGER PRIMARY KEY,
    id_livre INTEGER,
    nom_lecteur VARCHAR(100),
    date_emprunt DATE,
    date_retour DATE,
    FOREIGN KEY (id_livre) REFERENCES Livre(id_livre)
);

-- Insertions
INSERT INTO Auteur VALUES (1, 'Camus', 'Albert', 'Française');
INSERT INTO Auteur VALUES (2, 'Hugo', 'Victor', 'Française');
INSERT INTO Auteur VALUES (3, 'Orwell', 'George', 'Britannique');

INSERT INTO Livre VALUES (1, 'L''Étranger', 1942, 1);
INSERT INTO Livre VALUES (2, 'Les Misérables', 1862, 2);
INSERT INTO Livre VALUES (3, '1984', 1949, 3);

INSERT INTO Emprunt VALUES (1, 1, 'Alice Martin', '2024-01-10', '2024-01-25');
INSERT INTO Emprunt VALUES (2, 3, 'Bob Dupont', '2024-01-15', NULL);

-- Requêtes
SELECT l.titre, a.prenom, a.nom
FROM Livre l
JOIN Auteur a ON l.id_auteur = a.id_auteur;

SELECT l.titre, e.nom_lecteur, e.date_emprunt
FROM Emprunt e
JOIN Livre l ON e.id_livre = l.id_livre
WHERE e.date_retour IS NULL;

SELECT a.nom, COUNT(l.id_livre) AS nb_livres
FROM Auteur a
LEFT JOIN Livre l ON a.id_auteur = l.id_auteur
GROUP BY a.nom;