-- Jour 07 - SQL : Gestion d'une université
-- Niveau L2 - SQL avancé (sous-requêtes, GROUP BY)

CREATE TABLE Etudiant (
    id_etu INTEGER PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE
);

CREATE TABLE Matiere (
    id_matiere INTEGER PRIMARY KEY,
    intitule VARCHAR(100),
    coefficient INTEGER
);

CREATE TABLE Note (
    id_note INTEGER PRIMARY KEY,
    id_etu INTEGER,
    id_matiere INTEGER,
    note DECIMAL(4,2),
    FOREIGN KEY (id_etu) REFERENCES Etudiant(id_etu),
    FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere)
);

INSERT INTO Etudiant VALUES (1, 'Diallo', 'Aminata', '2003-05-12');
INSERT INTO Etudiant VALUES (2, 'Traoré', 'Moussa', '2002-11-30');
INSERT INTO Etudiant VALUES (3, 'Lefebvre', 'Clara', '2003-02-20');

INSERT INTO Matiere VALUES (1, 'Algorithmique', 3);
INSERT INTO Matiere VALUES (2, 'Base de données', 2);
INSERT INTO Matiere VALUES (3, 'Réseaux', 2);

INSERT INTO Note VALUES (1, 1, 1, 15.5);
INSERT INTO Note VALUES (2, 1, 2, 13.0);
INSERT INTO Note VALUES (3, 2, 1, 11.0);
INSERT INTO Note VALUES (4, 2, 2, 17.5);
INSERT INTO Note VALUES (5, 3, 1, 14.0);
INSERT INTO Note VALUES (6, 3, 3, 16.0);

-- Moyenne par étudiant
SELECT e.prenom, e.nom, ROUND(AVG(n.note), 2) AS moyenne
FROM Etudiant e
JOIN Note n ON e.id_etu = n.id_etu
GROUP BY e.id_etu, e.nom, e.prenom
ORDER BY moyenne DESC;

-- Étudiants au-dessus de la moyenne générale
SELECT e.nom, e.prenom
FROM Etudiant e
JOIN Note n ON e.id_etu = n.id_etu
GROUP BY e.id_etu, e.nom, e.prenom
HAVING AVG(n.note) > (SELECT AVG(note) FROM Note);