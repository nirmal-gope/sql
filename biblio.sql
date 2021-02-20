--Requête SQL pour afficher tous les emprunts du livre nommé Dune"

SELECT e.*
FROM emprunt e JOIN livre l ON e.livre_id = l.id
WHERE l.titre = "Dune"

--Le titre des livres empruntés par l'abonné "admin"
SELECT  DISTINCT l.titre
FROM anonne a
    JOIN emprunt e ON a.id = e.abonne_id
    JOIN livre l ON l.id = e.livre_id
WHERE a.pseudo = "admin";