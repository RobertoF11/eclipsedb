-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 08, 2026 la 06:13 PM
-- Versiune server: 10.4.32-MariaDB
-- Versiune PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `elite`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `arm_registersysten`
--

CREATE TABLE `arm_registersysten` (
  `id` int(11) NOT NULL,
  `Nume_Utilizator` varchar(255) DEFAULT NULL,
  `Parola` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `auto_login` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `player_stats`
--

CREATE TABLE `player_stats` (
  `player_id` varchar(50) NOT NULL,
  `kills` int(11) DEFAULT 0,
  `deaths` int(11) DEFAULT 0,
  `kd` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `player_toggle_tokens`
--

CREATE TABLE `player_toggle_tokens` (
  `user_id` int(11) NOT NULL,
  `toggle_mafiot_tokens` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `user_outfits`
--

CREATE TABLE `user_outfits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`clothes_data`)),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `user_usage`
--

CREATE TABLE `user_usage` (
  `user_id` int(11) NOT NULL,
  `togglemafiot_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vip_data`
--

CREATE TABLE `vip_data` (
  `user_id` int(11) NOT NULL,
  `vip_days` int(11) NOT NULL DEFAULT 0,
  `vip_expire_date` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vip_users`
--

CREATE TABLE `vip_users` (
  `user_id` int(11) NOT NULL,
  `vip_expire_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_garages`
--

CREATE TABLE `vrp_garages` (
  `id` int(255) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `bID` int(11) NOT NULL DEFAULT 0,
  `bColor` int(11) NOT NULL DEFAULT 0,
  `facion` int(11) NOT NULL DEFAULT 0,
  `gtype` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_organizator`
--

CREATE TABLE `vrp_organizator` (
  `id` int(11) NOT NULL,
  `organizatorLvl` int(11) NOT NULL DEFAULT 0,
  `organizatorTime` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_srv_data`
--

CREATE TABLE `vrp_srv_data` (
  `dkey` varchar(255) NOT NULL DEFAULT '',
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_turfs`
--

CREATE TABLE `vrp_turfs` (
  `id` int(255) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `blipRadius` float NOT NULL,
  `faction` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_users`
--

CREATE TABLE `vrp_users` (
  `id` int(11) NOT NULL,
  `username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` varchar(255) DEFAULT 'nil',
  `coords` text NOT NULL DEFAULT '913.58294677734,-3070.7683105469,-97.123664855957',
  `whitelisted` tinyint(1) DEFAULT NULL,
  `skin` longtext DEFAULT '{"props":{"1":["glasses",-1],"2":["earrings",-1],"3":["mouth",-1],"4":["lhand",-1],"5":["rhand",-1],"6":["watches",-1],"7":["braclets",-1],"0":["hats",-1]},"tatuaje":[],"eyeColor":-1,"hairColor":[1,1],"headOverlay":[{"firstColour":0,"name":"Blemishes","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0},{"firstColour":0,"name":"FacialHair","secondColour":0,"overlayValue":255,"overlayOpacity":0.0,"colourType":1},{"firstColour":0,"name":"Eyebrows","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":1},{"firstColour":0,"name":"Ageing","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0},{"firstColour":0,"name":"Makeup","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":2},{"firstColour":0,"name":"Blush","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":2},{"firstColour":0,"name":"Complexion","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0},{"firstColour":0,"name":"SunDamage","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0},{"firstColour":0,"name":"Lipstick","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":15},{"firstColour":0,"name":"MolesFreckles","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0},{"firstColour":0,"name":"ChestHair","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":1},{"firstColour":0,"name":"BodyBlemishes","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0},{"firstColour":0,"name":"AddBodyBlemishes","secondColour":0,"overlayValue":255,"overlayOpacity":1.0,"colourType":0}],"proptextures":[["hats",-1],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]],"headBlend":{"shapeMix":0.0,"shapeThird":0,"skinMix":1.0,"skinFirst":15,"thirdMix":0.0,"shapeFirst":0,"skinSecond":0,"shapeSecond":0,"skinThird":0,"hasParent":false},"drawtextures":[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",0],["neck",0],["undershirts",0],["vest",0],["decals",0],["jackets",0]],"model":1885233650,"drawables":{"1":["masks",0],"2":["hair",55],"3":["torsos",0],"4":["legs",4],"5":["bags",0],"6":["shoes",16],"7":["neck",0],"8":["undershirts",0],"9":["vest",0],"10":["decals",0],"11":["jackets",0],"0":["face",0]},"headStructure":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]}',
  `banned` tinyint(1) DEFAULT NULL,
  `job` varchar(100) NOT NULL DEFAULT 'Somer',
  `faction` text NOT NULL,
  `isFactionLeader` int(255) NOT NULL DEFAULT 0,
  `isFactionCoLeader` int(255) NOT NULL DEFAULT 0,
  `factionRank` text NOT NULL,
  `hoursPlayed` float NOT NULL DEFAULT 0,
  `refferedBy` int(11) NOT NULL DEFAULT 0,
  `age` text NOT NULL DEFAULT '18',
  `firstName` varchar(100) NOT NULL DEFAULT 'Nume',
  `secondName` varchar(100) NOT NULL DEFAULT 'Prenume',
  `sex` text NOT NULL DEFAULT '\'\\\'Nedefinit\\\'\'',
  `height` longtext NOT NULL DEFAULT '\'\\\'0\\\'\'',
  `playerRegistered` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'false',
  `warns` int(255) NOT NULL DEFAULT 0,
  `finalSansa` int(255) NOT NULL DEFAULT 0,
  `warnr1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `warnr2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `warnr3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `warnid1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `warnid2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `warnid3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `bankMoney` int(255) NOT NULL DEFAULT 35000000,
  `walletMoney` int(255) NOT NULL DEFAULT 15000000,
  `Bitcoins` int(255) NOT NULL DEFAULT 0,
  `Diamante` int(255) NOT NULL DEFAULT 0,
  `adminLvl` int(11) NOT NULL DEFAULT 0,
  `vipLvl` int(11) DEFAULT NULL,
  `Ruleta` int(255) NOT NULL DEFAULT 0,
  `wanted` longtext DEFAULT NULL,
  `permis` int(11) DEFAULT NULL,
  `raport` int(11) DEFAULT 0,
  `rent` int(11) DEFAULT 0,
  `pet` varchar(50) NOT NULL DEFAULT 'Nu are',
  `chei` varchar(270) DEFAULT '{"c1":0,"c2":0,"c3":0,"c4":0,"c5":0}',
  `level` text DEFAULT NULL,
  `phoneBg` text NOT NULL DEFAULT 'https://i.imgur.com/p6lkCsY.png',
  `BgColor` text NOT NULL DEFAULT '255, 77, 249',
  `menuTopBottom` float NOT NULL DEFAULT 0,
  `menuLeftRight` float NOT NULL DEFAULT 0,
  `vipTime` int(11) DEFAULT NULL,
  `isWeaponDealer` int(11) DEFAULT 0,
  `WeaponDealerTime` int(11) NOT NULL DEFAULT 0,
  `dmvtest` tinyint(1) NOT NULL DEFAULT 0,
  `StarterPack` tinyint(1) DEFAULT 0,
  `background` text NOT NULL DEFAULT 'default-1',
  `pskin` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `aJailCP` int(11) DEFAULT NULL,
  `bannedTemp` int(255) NOT NULL DEFAULT 0,
  `bannedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bannedReason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BanTempZile` int(255) NOT NULL DEFAULT 0,
  `BanTempData` varchar(255) DEFAULT NULL,
  `BanTempExpire` varchar(255) DEFAULT NULL,
  `inreg` tinyint(1) NOT NULL DEFAULT 0,
  `creditsData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT 0,
  `Nickname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theJob` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nrcaziere` int(10) DEFAULT 0,
  `rockstarLicense` varchar(128) DEFAULT NULL,
  `discordLicense` varchar(128) DEFAULT NULL,
  `license2` varchar(128) DEFAULT NULL,
  `iban` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `phonedata` longtext DEFAULT NULL,
  `registered` longtext DEFAULT NULL,
  `buletin` longtext DEFAULT '0',
  `isSponsor` longtext DEFAULT NULL,
  `sponsorTime` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT '[]',
  `weapons` longtext DEFAULT '[]',
  `tickete` int(11) DEFAULT 0,
  `last_ticket_time` int(11) DEFAULT 0,
  `vip` tinyint(1) NOT NULL DEFAULT 0,
  `vip_expire` bigint(20) NOT NULL DEFAULT 0,
  `userVip` text DEFAULT NULL,
  `donationCoins` int(11) DEFAULT 0,
  `referal` int(11) DEFAULT NULL,
  `referalused` tinyint(1) NOT NULL DEFAULT 0,
  `pending_referral_notify` int(1) NOT NULL DEFAULT 0,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `eventKills` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_userstats`
--

CREATE TABLE `vrp_userstats` (
  `user_id` int(11) NOT NULL,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `headshots` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_user_data`
--

CREATE TABLE `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(255) NOT NULL,
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_user_ids`
--

CREATE TABLE `vrp_user_ids` (
  `id` int(255) NOT NULL,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_user_toggledata`
--

CREATE TABLE `vrp_user_toggledata` (
  `user_id` int(11) NOT NULL,
  `toggle_count` int(11) NOT NULL DEFAULT 0,
  `last_used_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `vrp_user_vehicles`
--

CREATE TABLE `vrp_user_vehicles` (
  `id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `vehicle` varchar(255) NOT NULL DEFAULT '',
  `veh_type` varchar(255) NOT NULL DEFAULT 'car',
  `vehicle_plate` varchar(255) NOT NULL,
  `upgrades` text NOT NULL,
  `isVipVeh` int(69) NOT NULL DEFAULT 0,
  `storedhouse` int(255) NOT NULL DEFAULT 0,
  `xenon` int(11) NOT NULL DEFAULT 0,
  `olxcar` int(255) NOT NULL DEFAULT 0,
  `sechestrat` int(255) NOT NULL DEFAULT 0,
  `vId` int(11) NOT NULL DEFAULT 0,
  `stage` varchar(255) NOT NULL DEFAULT '0',
  `damage` tinyint(4) NOT NULL DEFAULT 0,
  `faction` int(5) NOT NULL DEFAULT 0,
  `pret` int(255) NOT NULL DEFAULT 0,
  `trunk` longtext DEFAULT '[]',
  `glovebox` longtext DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `arm_registersysten`
--
ALTER TABLE `arm_registersysten`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexuri pentru tabele `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indexuri pentru tabele `player_stats`
--
ALTER TABLE `player_stats`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexuri pentru tabele `player_toggle_tokens`
--
ALTER TABLE `player_toggle_tokens`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexuri pentru tabele `user_outfits`
--
ALTER TABLE `user_outfits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_outfit` (`user_id`,`name`);

--
-- Indexuri pentru tabele `user_usage`
--
ALTER TABLE `user_usage`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexuri pentru tabele `vip_data`
--
ALTER TABLE `vip_data`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexuri pentru tabele `vip_users`
--
ALTER TABLE `vip_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexuri pentru tabele `vrp_garages`
--
ALTER TABLE `vrp_garages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexuri pentru tabele `vrp_organizator`
--
ALTER TABLE `vrp_organizator`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `vrp_srv_data`
--
ALTER TABLE `vrp_srv_data`
  ADD PRIMARY KEY (`dkey`);

--
-- Indexuri pentru tabele `vrp_turfs`
--
ALTER TABLE `vrp_turfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `vrp_users`
--
ALTER TABLE `vrp_users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexuri pentru tabele `vrp_userstats`
--
ALTER TABLE `vrp_userstats`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexuri pentru tabele `vrp_user_data`
--
ALTER TABLE `vrp_user_data`
  ADD PRIMARY KEY (`user_id`,`dkey`);

--
-- Indexuri pentru tabele `vrp_user_ids`
--
ALTER TABLE `vrp_user_ids`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `vrp_user_toggledata`
--
ALTER TABLE `vrp_user_toggledata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexuri pentru tabele `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `user_outfits`
--
ALTER TABLE `user_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `vrp_garages`
--
ALTER TABLE `vrp_garages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `vrp_turfs`
--
ALTER TABLE `vrp_turfs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `vrp_users`
--
ALTER TABLE `vrp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `vrp_user_ids`
--
ALTER TABLE `vrp_user_ids`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
