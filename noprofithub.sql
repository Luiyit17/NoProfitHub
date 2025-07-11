-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 12, 2025 alle 09:21
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noprofithub`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attestati`
--

CREATE TABLE `attestati` (
  `id` int(11) NOT NULL,
  `id_volontario` int(11) NOT NULL,
  `id_progetto` int(11) NOT NULL,
  `file_attestato` varchar(255) DEFAULT NULL,
  `descrizione` text DEFAULT NULL,
  `data_rilascio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Struttura della tabella `competenze_predefinite`
--

CREATE TABLE `competenze_predefinite` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `competenze_predefinite`
--

INSERT INTO `competenze_predefinite` (`id`, `nome`) VALUES
(1, 'Logistica'),
(2, 'Comunicazione'),
(3, 'Grafica'),
(4, 'Marketing'),
(5, 'Gestione Eventi'),
(6, 'Supporto Tecnico'),
(7, 'Raccolta Fondi'),
(8, 'Assistenza Anziani'),
(9, 'Educazione Bambini'),
(10, 'Lavori Manuali'),
(11, 'Traduzione'),
(12, 'digitalmento alfabetizzato');

-- --------------------------------------------------------

--
-- Struttura della tabella `disponibilita_volontario`
--

CREATE TABLE `disponibilita_volontario` (
  `id` int(11) NOT NULL,
  `id_volontario` int(11) NOT NULL,
  `giorno` varchar(20) NOT NULL,
  `fascia_oraria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Struttura della tabella `iscrizioni`
--

CREATE TABLE `iscrizioni` (
  `id` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `id_volontario` int(11) DEFAULT NULL,
  `data_iscrizione` datetime DEFAULT current_timestamp(),
  `stato` enum('in_attesa','accettato','rifiutato') DEFAULT 'in_attesa',
  `data_candidatura` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `progetti`
--

CREATE TABLE `progetti` (
  `id` int(11) NOT NULL,
  `id_associazione` int(11) DEFAULT NULL,
  `titolo` varchar(150) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `progetti`
--

INSERT INTO `progetti` (`id`, `id_associazione`, `titolo`, `descrizione`, `data_inizio`, `data_fine`) VALUES
(8, 14, 'Mare Pulito', 'Ci riuniremo e in tutta la giornata proveremo a rinnovare il nostro litorale', '2025-07-07', '2025-07-08'),
(9, 14, 'MareAmico', 'campagna senzibilizzazione sull\'inquinamento, e rinnove dei litorali', '2025-07-07', '2025-07-10'),
(12, 22, 'Supporto Scolastico', 'un\'iniziativa che prevede il tutoraggio individuale o in piccoli gruppi di studenti che necessitano di aiuto nei compiti o nello studio, o un progetto che offre attività di doposcuola con supporto educativo', '2025-09-10', '2026-06-01');

-- --------------------------------------------------------

--
-- Struttura della tabella `progetto_competenze`
--

CREATE TABLE `progetto_competenze` (
  `id_progetto` int(11) NOT NULL,
  `id_competenza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `progetto_competenze`
--

INSERT INTO `progetto_competenze` (`id_progetto`, `id_competenza`) VALUES
(8, 1),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 9),
(9, 10),
(12, 1),
(12, 5),
(12, 6),
(12, 7),
(12, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `turni`
--

CREATE TABLE `turni` (
  `id` int(11) NOT NULL,
  `id_progetto` int(11) NOT NULL,
  `id_volontario` int(11) NOT NULL,
  `data_turno` date NOT NULL,
  `ore` int(11) NOT NULL,
  `fascia_oraria` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `turni`
--

INSERT INTO `turni` (`id`, `id_progetto`, `id_volontario`, `data_turno`, `ore`, `fascia_oraria`) VALUES
(20, 8, 12, '2025-07-07', 4, 'Mattina'),
(21, 9, 23, '2025-07-08', 8, 'Mattina');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `tipo` enum('volontario','associazione','admin') NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `tipo`, `nome`, `email`, `password`) VALUES
(12, 'volontario', 'Luigi', 'lui.h@h.i', '$2y$10$SzSGacYbhN9XNSmSh2tFS.681picUNAEIDJ0EXjbS6jXWmSuCjuei'),
(14, 'associazione', 'VivaIlMare', 'h@h.i', '$2y$10$hs4qtxwgcX3Cls2oq814HuOc4lc/q5wOZ8Yp03JVjXmV32.Qc5noi'),
(18, 'admin', 'Admin', 'admin@example.com', '$2y$10$fa6z9/F4hMfqWnzUiVgbp.HcM94GqgqyLHHW1iFau0sa2n7ClirIq'),
(19, 'volontario', 'prova2', 'g.h@h.i', '$2y$10$txD9/QV7jF0m3mHqQ6oc8.iOjkgI3itUkxVUhxMb/vJJiMIuxNIHK'),
(20, 'volontario', 'prova3', 'g2.h@h.i', '$2y$10$L3JYfiJN3l4jcpHBi9zReu7qGeOckdFob.ElUnG5ouFbVhBt7Eqc2'),
(21, 'volontario', 'Volontario1', 'volontario1@example.it', '$2y$10$lpllP08QjBelS21GPxSD5uIwllkKzREGHsLi4WKdIU7OAGGipqROO'),
(22, 'associazione', 'Associazione1', 'associazione1@example.it', '$2y$10$35OWpf58T76AQjqeoOrLUOcSMa3eEIJQZhRm4TIENs1.ZXeut7BqW'),
(23, 'volontario', 'tototr', 'tore@gg', '$2y$10$9XZ6f/33pOgP9XwOU9xu8.53HlqeKzu7blgQcVv5Oi9dgCRyUCHYa');

-- --------------------------------------------------------

--
-- Struttura della tabella `volontario_competenze`
--

CREATE TABLE `volontario_competenze` (
  `id_volontario` int(11) NOT NULL,
  `id_competenza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `volontario_competenze`
--

INSERT INTO `volontario_competenze` (`id_volontario`, `id_competenza`) VALUES
(12, 1),
(12, 2),
(12, 3),
(12, 5),
(12, 8),
(12, 9),
(12, 10),
(21, 1),
(21, 2),
(21, 4),
(21, 8),
(21, 10),
(23, 5),
(23, 7),
(23, 8),
(23, 11),
(23, 12);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attestati`
--
ALTER TABLE `attestati`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_volontario` (`id_volontario`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indici per le tabelle `competenze_predefinite`
--
ALTER TABLE `competenze_predefinite`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `disponibilita_volontario`
--
ALTER TABLE `disponibilita_volontario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_volontario` (`id_volontario`,`giorno`,`fascia_oraria`);

--
-- Indici per le tabelle `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_progetto` (`id_progetto`),
  ADD KEY `id_volontario` (`id_volontario`);

--
-- Indici per le tabelle `progetti`
--
ALTER TABLE `progetti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_associazione` (`id_associazione`);

--
-- Indici per le tabelle `progetto_competenze`
--
ALTER TABLE `progetto_competenze`
  ADD PRIMARY KEY (`id_progetto`,`id_competenza`),
  ADD KEY `id_competenza` (`id_competenza`);

--
-- Indici per le tabelle `turni`
--
ALTER TABLE `turni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_progetto` (`id_progetto`),
  ADD KEY `id_volontario` (`id_volontario`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `volontario_competenze`
--
ALTER TABLE `volontario_competenze`
  ADD PRIMARY KEY (`id_volontario`,`id_competenza`),
  ADD KEY `id_competenza` (`id_competenza`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attestati`
--
ALTER TABLE `attestati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `competenze_predefinite`
--
ALTER TABLE `competenze_predefinite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `disponibilita_volontario`
--
ALTER TABLE `disponibilita_volontario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `iscrizioni`
--
ALTER TABLE `iscrizioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `progetti`
--
ALTER TABLE `progetti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `turni`
--
ALTER TABLE `turni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attestati`
--
ALTER TABLE `attestati`
  ADD CONSTRAINT `attestati_ibfk_1` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attestati_ibfk_2` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `disponibilita_volontario`
--
ALTER TABLE `disponibilita_volontario`
  ADD CONSTRAINT `disponibilita_volontario_ibfk_1` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD CONSTRAINT `iscrizioni_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id`),
  ADD CONSTRAINT `iscrizioni_ibfk_2` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`);

--
-- Limiti per la tabella `progetti`
--
ALTER TABLE `progetti`
  ADD CONSTRAINT `progetti_ibfk_1` FOREIGN KEY (`id_associazione`) REFERENCES `utenti` (`id`);

--
-- Limiti per la tabella `progetto_competenze`
--
ALTER TABLE `progetto_competenze`
  ADD CONSTRAINT `progetto_competenze_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `progetto_competenze_ibfk_2` FOREIGN KEY (`id_competenza`) REFERENCES `competenze_predefinite` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `turni`
--
ALTER TABLE `turni`
  ADD CONSTRAINT `turni_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id`),
  ADD CONSTRAINT `turni_ibfk_2` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`);

--
-- Limiti per la tabella `volontario_competenze`
--
ALTER TABLE `volontario_competenze`
  ADD CONSTRAINT `volontario_competenze_ibfk_1` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `volontario_competenze_ibfk_2` FOREIGN KEY (`id_competenza`) REFERENCES `competenze_predefinite` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
