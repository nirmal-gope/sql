CREATE TABLE `restaurant` (
  `id_restaurant` int(3) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `type` enum('gastronomique','brasserie','pizzeria','autre') DEFAULT NULL,
  `note` int(1) NOT NULL,
  `avis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `restaurant` (`id_restaurant`, `nom`, `adresse`, `telephone`, `type`, `note`, `avis`) VALUES
(1, 'Quick', 'Paris', '0112235468', 'pizzeria', 2, 'bon'),
(2, 'Le Cigale', 'Paris', '0112235468', 'gastronomique', 3, 'tr&egrave;s bon'),
(3, 'Hypotalamis', 'Paris', '0112235468', 'gastronomique', 4, 'bien');


ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`);


ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

