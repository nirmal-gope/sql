-- pour la création d'une nouvelle base de données--

CREATE DATABASE  IF NOT EXISTS haribo ;

-- on demande l'utilsation de cette base de données
USE haribo;
-- la création des tables dasn cette base de données

CREATE TABLE IF NOT EXISTS stagiaires(
id_stagiaire int(11) NOT NULL AUTO_INCREMENT,
prenom VARCHAR(100) NOT NULL,
yeux VARCHAR(30) NOT NULL,
genre enum('m','f')  NOT NULL,
PRIMARY KEY (id_stagiaire) --la déclaration d'une clé primaire
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

--VARCHAR c'est une chaine de caractère
-- la création des tables dans cette base de données

CREATE TABLE IF NOT EXISTS bonbons(
id_bonbon int(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(100)  NULL, 
saveur VARCHAR(100)  NULL,
PRIMARY KEY (id_bonbon) 
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;
--les clés primaires ne se répetent pas table
CREATE TABLE IF NOT EXISTS manger(
id_manger int(11) NOT NULL AUTO_INCREMENT,
id_stagiaire int(11)  NULL,--id_stagiaire ici c'est une clé étrangère, id_id_stagiaire c'est une clé primaire de la table stagiaire
id_bonbon int(11)   NULL,--id_bonbon ici c'est une clé étrangère, id_bonbon c'est une clé primaire de la table bonbon
date_manger Date NOT NULL,
quantite int(11) NOT NULL,
PRIMARY KEY (id_manger)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;
-- l'ajout d'une clé etrangère, les cles etrangères sont deja des clés primaires dans ces tables d'origines
-- ALTER TABLE nom_table ADD FOREIGN KEY(le champ de la clé etrangère) REFERENCES nom_db.nom_table(champ);
ALTER TABLE manger ADD FOREIGN KEY (id_stagiaire) REFERENCES haribo.stagiaires (id_stagiaire);
ALTER TABLE manger ADD FOREIGN KEY (id_bonbon) REFERENCES haribo.bonbons (id_bonbon);

INSERT INTO stagiaires(prenom,yeux,genre) VALUES
('jhordan','marron','m'),
('MohamedA ','marron','m'),
('Anas','marron','m'),
('MohamedB','marron','m'),
('Mehdi','marron','m'),
('Mathieu','marron','m'),
('Hakim','marron','m'),
('Sonia ','marron','f'),
('Julie ','marron','f'),
('Assa ','marron','f'),
('Magalie ','marron','f'),
('Yvette ','marron','f');

INSERT INTO manger (id_bonbon,id_stagiaire, date_manger, quantite) VALUES
(4, 7,'2018-09-20 ', 5),
(2, 4,'2018-09-10 ', 10),
(3, 1,'2018-09-18 ', 5),
(2, 2,' 2018-09-05 ', 18),
(4, 3,'2018-09-01 ', 18),
(5, 6,' 2018-08-25  ', 24),
(4, 1,' 2018-06-10  ', 12),
(4, 5,'2018-07-24', 5),
(2, 17,'2019-09-15', 5);

INSERT INTO bonbon (nom, saveur) VALUES
('dragibus ', 'cola'),
('Tagada ', 'fraise'),
('nounours ', 'citron'),
('chamallow ', 'framboise'),
('schtroumpf ', 'acidulé'),
('chamallow ', 'vanille');

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


--10-- voir les paramètres de la table *bonbon*


--11-- Sélectionner tous les champs de tous les enregistrements de la table *stagiaire*


--12-- Rajouter un nouveau stagiaire *Patriiiick* en forçant la numérotation de l'id


--13-- Rajouter un nouveau stagiaire *Mila* SANS forcer la numérotation de l'id


--14-- Changer le prénom du stagiaire qui a l'id 100(35) de *Patriiiick* à *Patrick*


--15-- Rajouter dans la table manger que Patrick a mangé 5 Tagada purple le 15 septembre




--16-- Sélectionner tous les noms des bonbons


--17-- Sélectionner tous les noms des bonbons en enlevant les doublons


--18-- Récupérer les couleurs des yeux des stagiaires (Sélectionner plusieurs champs dans une table)

--19-- Dédoublonner un résultat sur plusieurs champs


--20-- Sélectionner le stagiaire qui a l'id 5


--21-- Sélectionner tous les stagiaires qui ont les yeux marrons


--22-- Sélectionner tous les stagiaires dont l'id est plus grand que 9


--23-- Sélectionner tous les stagiaires SAUF celui dont l'id est 13 (soyons supersticieux !) :!\ il y a 2 façons de faire


--24-- Sélectionner tous les stagiaires qui ont un id inférieur ou égal à 10


--25-- Sélectionner tous les stagiaires dont l'id est compris entre 7 et 11


--26-- Sélectionner les stagiaires dont le prénom commence par un *S*


--27-- Trier les stagiaires femmes par id décroissant


--28-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique


--29-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique


--30-- Limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premires résultats


--31-- Limiter l'affichage d'une requête de sélection de tous les stagiaires à partir du 3ème résultat et des 5 suivants


--32-- Afficher les 4 premiers stagiaires qui ont les yeux marron


--33-- Pareil mais en triant les prénoms dans l'ordre alphabétique


--34-- Compter le nombre de stagiaires


--35-- Compter le nombre de stagiaires hommes mais en changeant le nom de la colonne de résultat par *nb_stagiaires_H*
+

--36-- Compter le nombre de couleurs d'yeux différentes


--37-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus petit


--38-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus grand /!\ c'est une requête imbriquée qu'il faut faire (requête sur le résultat d'une autre requête)


--39-- Afficher les stagiaires qui ont les yeux bleu et vert


--40-- A l'inverse maintenant, afficher les stagiaires qui n'ont pas les yeux bleu ni vert


--41-- récupérer tous les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations
-- Je vais modifier les consommations pour que tout le monde n'en ai pas mangé 5.


--42-- récupérer que les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations


--43-- prénom du stagiaire, le nom du bonbon, la date de consommation pour tous les stagiaires qui ont mangé au moins une fois

--44-- Afficher les quantités consommées par les stagiaires (uniquement ceux qui ont mangé !)



--45-- Calculer combien de bonbons ont été mangés au total par chaque stagiaire et afficher le nombre de fois où ils ont mangé


--46-- Afficher combien de bonbons ont été consommés au total


--47-- Afficher le total de *Tagada* consommées


--48-- Afficher les prénoms des stagiaires qui n'ont rien mangé


--49-- Afficher les saveurs des bonbons (sans doublons)


--50-- Afficher le prénom du stagiaire qui a mangé le plus de bonbons

