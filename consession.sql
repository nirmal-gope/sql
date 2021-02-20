
CREATE TABLE `membre` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mdp` varchar(80) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` int(10) UNSIGNED ZEROFILL NOT NULL,
  `statut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `membre` (`id`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `telephone`, `statut`) VALUES
(1, 'gope', 'gope', 'gope', 'nirmal', 'nirmal-chandra.gope@lepoles.com', 0758610723, 50);



CREATE TABLE `voitures` (
  `id` int(11) NOT NULL,
  `marque` varchar(20) NOT NULL,
  `kilometrage` int(6) NOT NULL,
  `tarif` int(3) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `fiche` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `voitures` (`id`, `marque`, `kilometrage`, `tarif`, `photo`, `fiche`) VALUES
(1, 'Citron', 1500, 500, 'v1.png', 'gestion.pdf'),
(2, 'Audi', 2000, 600, 'v2.png', 'gestion.pdf'),
(3, 'BMW', 4000, 700, 'v3.png', 'gestion.pdf');


ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `voitures`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `membre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `voitures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

