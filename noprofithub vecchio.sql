-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 08, 2025 alle 20:55
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
  `data_emissione` date DEFAULT NULL,
  `descrizione` text DEFAULT NULL,
  `data_rilascio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `attestati`
--

INSERT INTO `attestati` (`id`, `id_volontario`, `id_progetto`, `file_attestato`, `data_emissione`, `descrizione`, `data_rilascio`) VALUES
(5, 12, 8, NULL, NULL, NULL, '2025-07-07'),
(6, 12, 8, NULL, NULL, NULL, '2025-07-07');

-- --------------------------------------------------------

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
(11, 'Traduzione');

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

--
-- Dump dei dati per la tabella `disponibilita_volontario`
--

INSERT INTO `disponibilita_volontario` (`id`, `id_volontario`, `giorno`, `fascia_oraria`) VALUES
(10, 12, 'Domenica', 'Pomeriggio'),
(6, 12, 'Giovedì', 'Mattina'),
(1, 12, 'Lunedì', 'Mattina'),
(2, 12, 'Lunedì', 'Pomeriggio'),
(3, 12, 'Martedì', 'Mattina'),
(4, 12, 'Martedì', 'Pomeriggio'),
(5, 12, 'Mercoledì', 'Pomeriggio'),
(9, 12, 'Sabato', 'Pomeriggio'),
(7, 12, 'Venerdì', 'Pomeriggio'),
(8, 12, 'Venerdì', 'Sera');

-- --------------------------------------------------------

--
-- Struttura della tabella `fasce_orarie`
--

CREATE TABLE `fasce_orarie` (
  `id` int(11) NOT NULL,
  `fascia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `fasce_orarie`
--

INSERT INTO `fasce_orarie` (`id`, `fascia`) VALUES
(1, 'Mattina (08:00 - 12:00)'),
(2, 'Pomeriggio (12:00 - 16:00)'),
(3, 'Sera (16:00 - 20:00)'),
(4, 'Notte (20:00 - 00:00)');

-- --------------------------------------------------------

--
-- Struttura della tabella `giorni_settimana`
--

CREATE TABLE `giorni_settimana` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `giorni_settimana`
--

INSERT INTO `giorni_settimana` (`id`, `nome`) VALUES
(1, 'Lunedì'),
(2, 'Martedì'),
(3, 'Mercoledì'),
(4, 'Giovedì'),
(5, 'Venerdì'),
(6, 'Sabato'),
(7, 'Domenica');

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

--
-- Dump dei dati per la tabella `iscrizioni`
--

INSERT INTO `iscrizioni` (`id`, `id_progetto`, `id_volontario`, `data_iscrizione`, `stato`, `data_candidatura`) VALUES
(16, 12, 21, '2025-07-08 19:56:10', 'accettato', '2025-07-08 19:59:24'),
(17, 12, 19, '2025-07-08 20:01:03', 'in_attesa', '2025-07-08 20:01:03'),
(18, 12, 12, '2025-07-08 20:01:49', 'in_attesa', '2025-07-08 20:01:49');

-- --------------------------------------------------------

--
-- Struttura della tabella `ore_volontariato`
--

CREATE TABLE `ore_volontariato` (
  `id` int(11) NOT NULL,
  `id_volontario` int(11) NOT NULL,
  `id_progetto` int(11) NOT NULL,
  `ore` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipazioni`
--

CREATE TABLE `partecipazioni` (
  `id` int(11) NOT NULL,
  `id_volontario` int(11) DEFAULT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `ore_volontariato` int(11) DEFAULT NULL,
  `stato` enum('in attesa','approvato','rifiutato') DEFAULT 'in attesa'
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
  `ore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `turni`
--

INSERT INTO `turni` (`id`, `id_progetto`, `id_volontario`, `data_turno`, `ore`) VALUES
(3, 8, 12, '2023-04-04', 1455);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `tipo` enum('volontario','associazione','admin') NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `competenze` text DEFAULT NULL,
  `disponibilita` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `tipo`, `nome`, `email`, `password`, `competenze`, `disponibilita`) VALUES
(12, 'volontario', 'Luigi', 'lui.h@h.i', '$2y$10$SzSGacYbhN9XNSmSh2tFS.681picUNAEIDJ0EXjbS6jXWmSuCjuei', NULL, 'lun_mattina,mar_mattina,mer_mattina,gio_mattina,ven_mattina,sab_pomeriggio,dom_pomeriggio'),
(14, 'associazione', 'VivaIlMare', 'h@h.i', '$2y$10$hs4qtxwgcX3Cls2oq814HuOc4lc/q5wOZ8Yp03JVjXmV32.Qc5noi', NULL, NULL),
(18, 'admin', 'Admin', 'admin@example.com', '$2y$10$fa6z9/F4hMfqWnzUiVgbp.HcM94GqgqyLHHW1iFau0sa2n7ClirIq', NULL, NULL),
(19, 'volontario', 'prova2', 'g.h@h.i', '$2y$10$txD9/QV7jF0m3mHqQ6oc8.iOjkgI3itUkxVUhxMb/vJJiMIuxNIHK', NULL, 'lun_mattina,lun_pomeriggio,mar_pomeriggio,mer_mattina,gio_mattina,gio_pomeriggio,ven_mattina,sab_pomeriggio,sab_sera,dom_mattina,dom_pomeriggio'),
(20, 'volontario', 'prova3', 'g2.h@h.i', '$2y$10$L3JYfiJN3l4jcpHBi9zReu7qGeOckdFob.ElUnG5ouFbVhBt7Eqc2', NULL, 'lun_mattina,mar_pomeriggio,mer_mattina,gio_pomeriggio,ven_mattina,sab_pomeriggio,dom_mattina'),
(21, 'volontario', 'Volontario1', 'volontario1@example.it', '$2y$10$lpllP08QjBelS21GPxSD5uIwllkKzREGHsLi4WKdIU7OAGGipqROO', NULL, 'lun_mattina,mar_pomeriggio,mer_pomeriggio,gio_mattina,ven_pomeriggio,sab_pomeriggio,dom_mattina'),
(22, 'associazione', 'Associazione1', 'associazione1@example.it', '$2y$10$35OWpf58T76AQjqeoOrLUOcSMa3eEIJQZhRm4TIENs1.ZXeut7BqW', NULL, NULL);

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
(12, 3),
(12, 5),
(12, 8),
(12, 9),
(12, 10),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(19, 11),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(20, 7),
(20, 8),
(20, 9),
(20, 10),
(20, 11),
(21, 1),
(21, 2),
(21, 5),
(21, 9),
(21, 10);

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
-- Indici per le tabelle `fasce_orarie`
--
ALTER TABLE `fasce_orarie`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `giorni_settimana`
--
ALTER TABLE `giorni_settimana`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_progetto` (`id_progetto`),
  ADD KEY `id_volontario` (`id_volontario`);

--
-- Indici per le tabelle `ore_volontariato`
--
ALTER TABLE `ore_volontariato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_volontario` (`id_volontario`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indici per le tabelle `partecipazioni`
--
ALTER TABLE `partecipazioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_volontario` (`id_volontario`),
  ADD KEY `id_progetto` (`id_progetto`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `competenze_predefinite`
--
ALTER TABLE `competenze_predefinite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `disponibilita_volontario`
--
ALTER TABLE `disponibilita_volontario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `fasce_orarie`
--
ALTER TABLE `fasce_orarie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `giorni_settimana`
--
ALTER TABLE `giorni_settimana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `iscrizioni`
--
ALTER TABLE `iscrizioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `ore_volontariato`
--
ALTER TABLE `ore_volontariato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `partecipazioni`
--
ALTER TABLE `partecipazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `progetti`
--
ALTER TABLE `progetti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `turni`
--
ALTER TABLE `turni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
-- Limiti per la tabella `ore_volontariato`
--
ALTER TABLE `ore_volontariato`
  ADD CONSTRAINT `ore_volontariato_ibfk_1` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ore_volontariato_ibfk_2` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `partecipazioni`
--
ALTER TABLE `partecipazioni`
  ADD CONSTRAINT `partecipazioni_ibfk_1` FOREIGN KEY (`id_volontario`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `partecipazioni_ibfk_2` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id`);

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
