CREATE TABLE `Utente`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` TEXT NOT NULL,
    `hash` varchar(250) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Scarpa`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` TEXT NOT NULL,
    `descrizione` TEXT NOT NULL,
    `fkScarpa` INT NOT NULL,
    `numero` INT NOT NULL,
    `prezzo` DECIMAL(8, 2) NOT NULL,
    `marca` TEXT NOT NULL
);
CREATE TABLE `Carrello`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fkScarpa` INT NOT NULL,
    `fkOrdine` INT NOT NULL
);
CREATE TABLE `Ordine`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `numero` BIGINT NOT NULL,
    `attivo` TINYINT(1) NOT NULL,
    `fkUtente` INT NOT NULL
);
ALTER TABLE
    `Ordine` ADD CONSTRAINT `ordine_fkutente_foreign` FOREIGN KEY(`fkUtente`) REFERENCES `Utente`(`id`);
ALTER TABLE
    `Carrello` ADD CONSTRAINT `carrello_fkscarpa_foreign` FOREIGN KEY(`fkScarpa`) REFERENCES `Scarpa`(`id`);
ALTER TABLE
    `Carrello` ADD CONSTRAINT `carrello_fkordine_foreign` FOREIGN KEY(`fkOrdine`) REFERENCES `Ordine`(`id`);

ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

