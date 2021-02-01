CREATE DATABASE  IF NOT EXISTS poles ;
-- on demande l'utilsation de cette base de données
USE poles;
-- la création des tables dasn cette base de données
CREATE TABLE IF NOT EXISTS employes(
id_employes int(3) NOT NULL AUTO_INCREMENT,
nom VARCHAR(30) DEFAULT NULL,
prenom VARCHAR(20) NOT NULL,
PRIMARY KEY (id_employes) --pour definir la clé primaire
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

INSERT INTO employes(nom,prenom) VALUES
('Alexis','JENDINAS'),
('Omar','MEJAI'),
('Julien','DER');

-- -- Pour vous entrainer, voici quelques questions qui vous permettront d'élaborer des requêtes et mener vers la réponse :

-- --1 Afficher la profession de l'employé 547.
SELECT service FROM employes WHERE id_employes=547
-- -- 2 Afficher la date d'embauche de : Amandine.
SELECT date_embauche FROM employes WHERE prenom='Amandine'
-- --3 Afficher le nombre de commerciaux.
SELECT COUNT(service) AS nombre FROM employes WHERE service='commercial' 
-- --4 Afficher le coût des commerciaux sur 1 année.
SELECT SUM(salaire*12) AS salaire_annual FROM employes WHERE service='commercial' 
-- --5 Afficher le salaire moyen par service.
SELECT service, round(AVG(salaire)) AS salaire_moyen FROM employes GROUP BY service
-- --6 Afficher le nombre de recrutements sur l'année 2010.
SELECT COUNT(*) AS 'recrutement' FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31'
-- --7 Augmenter le salaire pour chaque employé de 100€.
UPDATE employes SET salaire=salaire+100
-- --8 Afficher le nombre de services (différents).
SELECT COUNT(DISTINCT(service)) AS différents_services FROM employes 
-- --9 Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
-- --10 Afficher l'employé ayant été embauché en dernier.


