CREATE DATABASE IF NOT EXISTS bibliotheque;
USE bibliotheque;
CREATE TABLE IF NOT EXISTS abonne(
id_abonne int(3) NOT NULL AUTO_INCREMENT,
prenom VARCHAR(20) NOT NULL,
PRIMARY KEY (id_abonne)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;
CREATE TABLE IF NOT EXISTS livre(
id_livre int(3) NOT NULL AUTO_INCREMENT,
auteur VARCHAR(20) NOT NULL,
titre VARCHAR(30),
PRIMARY KEY (id_livre)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;
CREATE TABLE IF NOT EXISTS emprunt(
id_emprunt int(3) NOT NULL AUTO_INCREMENT,
id_livre int(3) NOT NULL,
id_abonne int(3) NOT NULL,
date_sortie DATE NOT NULL,
date_rendu DATE NULL,
PRIMARY KEY (id_emprunt)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;
-- l'ajout d'une clé étrangère, les clés étrangères sont déjà des clés primaires dans leurs tables d'origines
-- ALTER TABLE nom_table ADD FOREIGN KEY (le champs de clé étrangère) REFERENCES nom_db.nom_table(champs);
ALTER TABLE emprunt ADD FOREIGN KEY (id_livre) REFERENCES bibliotheque.livre (id_livre);
ALTER TABLE emprunt ADD FOREIGN KEY (id_abonne) REFERENCES bibliotheque.abonne (id_abonne);

-- requetes imbriqués

-- afficher les titre des livres qui ne sont pas rendu
SELECT titre FROM livre WHERE id_livre  IN(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);
-- Afficher les auteurs des livres qui ne sont pas rendu
SELECT auteur FROM livre WHERE id_livre  IN(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);
-- afficher le nombre de livre qui ne sont pas rendu
SELECT COUNT(*) AS 'nombre' FROM livre WHERE id_livre  IN(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);
-- afficher le nombre de livres qui sont empruntés
SELECT COUNT(*) AS 'nombre' FROM livre WHERE id_livre  IN(SELECT id_livre FROM emprunt WHERE date_sortie IS NOT NULL);
-- afficher les prenoms des abonnes qui n'ont pas rendu les livres
SELECT prenom FROM abonne WHERE id_abonne  IN(SELECT id_abonne FROM emprunt WHERE date_rendu IS NOT NULL);
-- Afficher les abonnés qui ont emprunté un livre le "2014-12-19"
SELECT prenom FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE date_sortie='2014-12-19');
-- Afficher la liste des abonnés ayant déjà emprunté un livre d'GUY DE MAUPASSANT
SELECT prenom FROM abonne WHERE id_abonne IN(SELECT id_abonne FROM emprunt WHERE id_livre IN(SELECT id_livre FROM livre WHERE auteur='GUY DE MAUPASSANT'));
-- Afficher le(s) titre de(s) livre(s) que cholé n'a pas encore emprenté à la bibliothèque
SELECT titre FROM livre WHERE id_livre NOT  IN(SELECT id_livre FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom='chloe'));
-- Afficher la liste des abonnés ayant déjà emprunté un livre d'Alphonse DAUDET
SELECT prenom FROM abonne WHERE id_abonne IN(SELECT id_abonne FROM emprunt WHERE id_livre IN(SELECT id_livre FROM livre WHERE auteur='ALPHONSE DAUDET'));

-- Syntaxe de jointure 
SELECT livre.auteur,livre.titre,emprunt.date_sortie
FROM livre ,emprunt 
WHERE livre.id_livre=emprunt.id_livre;
-- syntaxe jointure avec les alias
SELECT l.auteur,l.titre,e.date_sortie
FROM livre l ,emprunt e 
WHERE l.id_livre=e.id_livre;

--afficher les prenoms des abonnes qui ont emprunté des livres

SELECT DISTINCT a.prenom
FROM abonne a, emprunt e
WHERE a.id_abonne=e.id_abonne;

-- Afficher les dates auxquelles les livres écrits par Alphonse Daudet ont été empruntés et rendus à la bibliothèque.
SELECT e.date_sortie, e.date_rendu
FROM emprunt e, livre l
WHERE e.id_livre=l.id_livre AND l.auteur='Alphonse Daudet';

-- Afficher les titres des livres qui sont empruntés en 2014
SELECT l.titre 
FROM livre l, emprunt e
WHERE l.id_livre= e.id_livre AND e.date_sortie LIKE '2014%';

-- le livre une vie est-il emprunté combien de fois
SELECT COUNT(*) AS nombre
FROM livre l, emprunt e 
WHERE e.id_livre = l.id_livre
AND l.titre = 'Une Vie';
-- Qui a emprunté le livre 'Une Vie' sur l'année 2014 ?



