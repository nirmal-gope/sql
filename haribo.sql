CREATE DATABASE IF NOT EXISTS haribo;
USE haribo;
CREATE TABLE IF NOT EXISTS stagiaires(
id_stagiaire int(11) NOT NULL AUTO_INCREMENT,
prenom VARCHAR(100) NOT NULL,
yeux VARCHAR(30) NOT NULL,
genre enum('m','f')  NOT NULL,
PRIMARY KEY (id_stagiaire)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS bonbons(
id_bonbon int(11)  NOT NULL AUTO_INCREMENT,
nom varchar(100) NOT NULL,
saveur varchar(100) NOT NULL,
PRIMARY KEY (id_bonbon)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS manger(
id_manger int(11)  NOT NULL AUTO_INCREMENT,
id_bonbon  int(11) NULL,
id_stagiaire int(11) NULL,
date_manger DATE NOT NULL,
quantite int(11) NOT NULL,
PRIMARY KEY(id_manger)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;


INSERT INTO bonbons (nom,saveur) VALUES
    ('dragibus', 'cole'),
    ('Tagada', 'fraise'),
    ('nounours', 'citron'),
    ('chamallow', 'framboise'),
    ('schtroumpf', 'acidule'),
    ('chamallow', 'vanille');

INSERT INTO stagiaires (prenom,yeux,genre) VALUES
    ('jhordan', 'marron', 'm'),
    ('MohamedA', 'marron', 'm'),
    ('Anas', 'marron', 'm'),
    ('MohamedB', 'marron', 'm'),
    ('Mehdi', 'marron', 'm'),
    ('Mathieu', 'marron', 'm'),
    ('Hakim', 'marron', 'm'),
    ('Sonia', 'marron', 'f'),
    ('Julie', 'vert', 'f'),
    ('Assa', 'marron', 'f'),
    ('Magalie', 'marron', 'f'),
    ('Yvette', 'marron', 'f');

INSERT INTO manger (id_bonbon,id_stagiaire,date_manger,quantite) VALUES
    (4, 7, '2018-09-20', 5),
    (2, 4, '2018-09-10', 10),
    (3, 1, '2018-09-18', 5),
    (2, 2, '2018-09-05', 18),
    (4, 3, '2018-09-01', 18),
    (5, 6, '2018-08-25', 24),
    (4, 1, '2018-06-10', 12),
    (4, 5, '2018-07-24', 5),
    (2, 17, '2019-09-15', 5);

--1-- lister toutes les BDD de PHPMyAdmin


--2-- Créer une base de données SQL nommée HARIBO


--3/4/5--
/* TABLE STAGIAIRES */

/* TABLE BONBONS */

/* TABLE BONBON MANGES PAR LES STAGIAIRES */

--6--insertion dans la table stagiaires 
--7--Insertion dans la table bonbons
--8--Insertion dans la table manger

--9-- Lister les tables de la BDD *haribo*
SHOW TABLES
--10-- voir les paramètres de la table *bonbon*
DESC bonbons  
--11-- Sélectionner tous les champs de tous les enregistrements de la table *stagiaire*

SELECT *
FROM stagiaires
--12-- Rajouter un nouveau stagiaire *Patriiiick* en forçant la numérotation de l'id
INSERT INTO stagiaires
    (id_stagiaire,prenom)
VALUES
    (100, 'Patriiiick');
--13-- Rajouter un nouveau stagiaire *Mila* SANS forcer la numérotation de l'id
INSERT INTO stagiaires
    (prenom)
VALUES
    ('Mila');
--14-- Changer le prénom du stagiaire qui a l'id 100(35) de *Patriiiick* à *Patrick*

UPDATE stagiaires SET prenom="Patrick", id_stagiaire=35 WHERE id_stagiaire = 100;

--15-- Rajouter dans la table manger que Patrick a mangé 5 Tagada purple le 2021-02-02

INSERT INTO bonbons
    (nom,saveur)
VALUES
    ('Tagada', 'purple');

INSERT INTO manger
    (id_bonbon,id_stagiaire,date_manger,quantite)
VALUES
    (7, 35, '2021-02-02', 5);

--16-- Sélectionner tous les noms des bonbons

SELECT nom FROM bonbons
--17-- Sélectionner tous les noms des bonbons en enlevant les doublons

SELECT DISTANCT(nom) FROM bonbons
--18-- Récupérer les couleurs des yeux des stagiaires (Sélectionner plusieurs champs dans une table)
SELECT yeux
FROM stagiaires
--19-- Dédoublonner un résultat sur plusieurs champs
SELECT DISTINCT (yeux)
FROM stagiaires;

--20-- Sélectionner le stagiaire qui a l'id 5

SELECT *
FROM stagiaires
WHERE id_stagiaire=5;
--21-- Sélectionner tous les stagiaires qui ont les yeux marrons

SELECT *
FROM stagiaires
WHERE yeux = "marron";
--22-- Sélectionner tous les stagiaires dont l'id est plus grand que 9
SELECT *
FROM stagiaires
WHERE id_stagiaire>9;

--23-- Sélectionner tous les stagiaires SAUF celui dont l'id est 10 (soyons supersticieux !) :!\ il y a 2 façons de faire
SELECT *
FROM stagiaires
WHERE id_stagiaire!=10;

--24-- Sélectionner tous les stagiaires qui ont un id inférieur ou égal à 10
SELECT *
FROM stagiaires
WHERE id_stagiaire<=10;


--25-- Sélectionner tous les stagiaires dont l'id est compris entre 7 et 11
SELECT *
FROM stagiaires
WHERE id_stagiaire BETWEEN 7 AND 11;

--26-- Sélectionner les stagiaires dont le prénom commence par un *S*
SELECT *
FROM stagiaires
WHERE prenom LIKE 'S%';


--27-- Trier les stagiaires femmes par id décroissant
SELECT *
FROM stagiaires
WHERE genre='f'
ORDER BY id_stagiaire DESC;

--28-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique

SELECT *
FROM stagiaires
WHERE genre='m'
ORDER BY prenom ASC;
--29-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique
SELECT *
FROM stagiaires
ORDER BY genre DESC,
yeux ASC;

--30-- Limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premires résultats
SELECT *
FROM stagiaires
WHERE id_stagiaire LIMIT 0,3;


--31-- Limiter l'affichage d'une requête de sélection de tous les stagiaires à partir du 3ème résultat et des 5 suivants

SELECT *
FROM stagiaires
WHERE id_stagiaire
LIMIT 2,5;

--32-- Afficher les 4 premiers stagiaires qui ont les yeux marron

SELECT *
FROM stagiaires
WHERE yeux = 'marron'
LIMIT 0,4;


--33-- Pareil mais en triant les prénoms dans l'ordre alphabétique

SELECT *
FROM stagiaires
WHERE yeux = 'marron'
ORDER BY prenom ASC
LIMIT 0,4;

--34-- Compter le nombre de stagiaires
SELECT COUNT(*) AS 'nombre de stagiaires'
FROM stagiaires;


--35-- Compter le nombre de stagiaires hommes mais en changeant le nom de la colonne de résultat par *nb_stagiaires_H* 

SELECT COUNT(genre) AS nb_stagiaires_H
FROM stagiaires WHERE genre= "m";

--36-- Compter le nombre de couleurs d'yeux différentes

SELECT COUNT(DISTINCT(yeux)) AS nb_yeux
FROM stagiaires;


--37-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus petit
SELECT prenom,yeux, MIN(id_stagiaire) FROM stagiaires;

--38-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus grand /!\ c'est une requête imbriquée qu'il faut faire (requête sur le résultat d'une autre requête)
SELECT prenom, yeux, MAX(id_stagiaire)
FROM stagiaires;

        or

SELECT prenom, yeux,id_stagiaire
FROM stagiaires
WHERE id_stagiaire IN(SELECT MAX(id_stagiaire)
FROM stagiaires);

--39-- Afficher les stagiaires qui ont les yeux bleu et vert
SELECT * FROM stagiaires WHERE yeux IN('bleu', 'vert');

--40-- A l'inverse maintenant, afficher les stagiaires qui n'ont pas les yeux bleu ni vert
SELECT *
FROM stagiaires
WHERE yeux NOT IN('bleu', 'vert');

--41-- récupérer tous les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations
-- Je vais modifier les consommations pour que tout le monde n'en ai pas mangé 5.
SELECT *
FROM manger
WHERE id_bonbon IN(SELECT id_bonbon
FROM bonbons);

--42-- récupérer que les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations

SELECT * FROM manger WHERE id_bonbon IN(SELECT id_bonbon FROM bonbons);

--43-- prénom du stagiaire, le nom du bonbon, la date de consommation pour tous les stagiaires qui ont mangé au moins une fois
SELECT quantite
FROM manger
WHERE id_stagiaire IN(SELECT id_stagiaire
FROM stagiaires);
--44-- Afficher les quantités consommées par les stagiaires (uniquement ceux qui ont mangé !)



--45-- Calculer combien de bonbons ont été mangés au total par chaque stagiaire et afficher le nombre de fois où ils ont mangé


--46-- Afficher combien de bonbons ont été consommés au total


--47-- Afficher le total de *Tagada* consommées


--48-- Afficher les prénoms des stagiaires qui n'ont rien mangé


--49-- Afficher les saveurs des bonbons (sans doublons)

SELECT DISTINCT(saveur) FROM bonbons;
--50-- Afficher le prénom du stagiaire qui a mangé le plus de bonbons

