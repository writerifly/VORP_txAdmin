-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für vorp
CREATE DATABASE IF NOT EXISTS `vorp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vorp`;

-- Exportiere Struktur von Tabelle vorp.banks
CREATE TABLE IF NOT EXISTS `banks` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.banks: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` (`name`) VALUES
	('Blackwater'),
	('SaintDenis'),
	('Valentine');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.bank_users
CREATE TABLE IF NOT EXISTS `bank_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `money` double(22,2) DEFAULT 0.00,
  `gold` double(22,2) DEFAULT 0.00,
  `items` longtext DEFAULT '[]',
  `invspace` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `bankusers` (`identifier`),
  CONSTRAINT `bank` FOREIGN KEY (`name`) REFERENCES `banks` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bankusers` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.bank_users: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `bank_users` DISABLE KEYS */;
INSERT INTO `bank_users` (`id`, `name`, `identifier`, `charidentifier`, `money`, `gold`, `items`, `invspace`) VALUES
	(1, 'Valentine', 'steam:110000102bfe58a', 1, 500.00, 0.00, '[]', 10);
/*!40000 ALTER TABLE `bank_users` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.banneds
CREATE TABLE IF NOT EXISTS `banneds` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_steam` varchar(100) NOT NULL,
  `b_license` varchar(255) DEFAULT NULL,
  `b_discord` varchar(100) DEFAULT NULL,
  `b_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `b_banned` varchar(100) NOT NULL,
  `b_unban` varchar(100) NOT NULL,
  `b_permanent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.banneds: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `banneds` DISABLE KEYS */;
/*!40000 ALTER TABLE `banneds` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.bills
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longtext DEFAULT NULL,
  `playername` longtext DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `issuer` longtext DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.bills: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `steamname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `charidentifier` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(10) COLLATE utf8mb4_bin DEFAULT 'user',
  `money` double(11,2) DEFAULT 0.00,
  `gold` double(11,2) DEFAULT 0.00,
  `rol` double(11,2) NOT NULL DEFAULT 0.00,
  `xp` int(11) DEFAULT 0,
  `healthouter` int(4) DEFAULT 500,
  `healthinner` int(4) DEFAULT 100,
  `staminaouter` int(4) DEFAULT 100,
  `staminainner` int(4) DEFAULT 100,
  `hours` float NOT NULL DEFAULT 0,
  `LastLogin` date DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `status` varchar(140) COLLATE utf8mb4_bin DEFAULT '{}',
  `meta` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT ' ',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT ' ',
  `skinPlayer` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `compPlayer` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `jobgrade` int(11) DEFAULT 0,
  `coords` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `isdead` tinyint(1) DEFAULT 0,
  `clanid` int(11) DEFAULT 0,
  `trust` int(11) DEFAULT 0,
  `supporter` int(11) DEFAULT 0,
  `walk` varchar(50) COLLATE utf8mb4_bin DEFAULT 'noanim',
  `crafting` longtext COLLATE utf8mb4_bin DEFAULT '{"medical":0,"blacksmith":0,"basic":0,"survival":0,"brewing":0,"food":0}',
  `info` longtext COLLATE utf8mb4_bin DEFAULT '{}',
  `gunsmith` double(11,2) DEFAULT 0.00,
  `ammo` longtext COLLATE utf8mb4_bin DEFAULT '{}',
  `clan` int(11) DEFAULT 0,
  `discordid` varchar(255) COLLATE utf8mb4_bin DEFAULT '0',
  `lastjoined` longtext COLLATE utf8mb4_bin DEFAULT '[]',
  `motel` varchar(255) COLLATE utf8mb4_bin DEFAULT '0',
  `moonshineenty` longtext COLLATE utf8mb4_bin DEFAULT '{}',
  UNIQUE KEY `identifier_charidentifier` (`identifier`,`charidentifier`) USING BTREE,
  KEY `charidentifier` (`charidentifier`) USING BTREE,
  KEY `clanid` (`clanid`),
  KEY `crafting` (`crafting`(768)),
  KEY `compPlayer` (`compPlayer`(768)),
  KEY `info` (`info`(768)),
  KEY `inventory` (`inventory`(768)),
  KEY `coords` (`coords`(768)),
  KEY `money` (`money`),
  KEY `meta` (`meta`),
  KEY `steamname` (`steamname`),
  KEY `ammo` (`ammo`(768)),
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.characters: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`identifier`, `steamname`, `charidentifier`, `group`, `money`, `gold`, `rol`, `xp`, `healthouter`, `healthinner`, `staminaouter`, `staminainner`, `hours`, `LastLogin`, `inventory`, `job`, `status`, `meta`, `firstname`, `lastname`, `skinPlayer`, `compPlayer`, `jobgrade`, `coords`, `isdead`, `clanid`, `trust`, `supporter`, `walk`, `crafting`, `info`, `gunsmith`, `ammo`, `clan`, `discordid`, `lastjoined`, `motel`, `moonshineenty`) VALUES
	('steam:110000102bfe58a', 'Nerzors', 1, 'admin', 3500.00, 1.00, 0.00, 0, 500, 100, 500, 100, 0, '2023-05-04', '{}', 'unemployed', '{"Metabolism":-700,"Thirst":302,"Hunger":650}', '{}', 'Edward', 'China', '{"sex":"mp_male","HeadType":908431499,"BodyType":383947425,"LegsType":-2068143351,"HeadSize":0.3,"EyeBrowH":0.0,"EyeBrowW":0.0,"EyeBrowD":0.0,"EarsH":0.0,"EarsW":0.0,"EarsD":0.0,"EarsL":0.0,"EyeLidH":0.0,"EyeLidW":0.0,"EyeD":0.0,"EyeAng":0.0,"EyeDis":0.0,"EyeH":0.0,"NoseW":0.0,"NoseS":0.0,"NoseH":0.0,"NoseAng":0.0,"NoseC":0.0,"NoseDis":0.0,"CheekBonesH":0.0,"CheekBonesW":0.0,"CheekBonesD":0.0,"MouthW":0.0,"MouthD":0.0,"MouthX":0.0,"MouthY":0.0,"ULiphH":0.0,"ULiphW":0.0,"ULiphD":0.0,"LLiphH":0.0,"LLiphW":0.0,"LLiphD":0.0,"JawH":0.0,"JawW":0.0,"JawD":0.0,"ChinH":0.0,"ChinW":0.0,"ChinD":0.0,"Beard":1783629149,"Hair":2622916743,"Body":61606861,"Waist":2249546070,"Eyes":1864171073,"Scale":1.05,"eyebrows_visibility":1,"eyebrows_tx_id":0,"scars_visibility":1,"scars_tx_id":0,"spots_visibility":0,"spots_tx_id":0,"disc_visibility":0,"disc_tx_id":0,"complex_visibility":0,"complex_tx_id":0,"acne_visibility":0,"acne_tx_id":0,"ageing_visibility":0,"ageing_tx_id":0,"freckles_visibility":0,"freckles_tx_id":0,"moles_visibility":0,"moles_tx_id":0,"grime_visibility":0,"grime_tx_id":0,"lipsticks_visibility":0,"lipsticks_tx_id":0,"lipsticks_palette_id":0,"lipsticks_palette_color_primary":0,"shadows_visibility":0,"shadows_tx_id":0,"shadows_palette_id":0,"shadows_palette_color_primary":0,"albedo":317354806}', '{"Hat":-1,"EyeWear":-1,"Mask":-1,"NeckWear":-1,"NeckTies":-1,"Shirt":2183442,"Suspender":-1,"Vest":1626773673,"Coat":331167570,"Poncho":-1,"Cloak":-1,"Glove":1266290862,"RingRh":-1,"RingLh":-1,"Bracelet":-1,"Gunbelt":-1,"Belt":7635313,"Buckle":-1,"Holster":-1,"Pant":315909040,"Skirt":-1,"Chap":-1,"Boots":951372388,"Spurs":-1,"Spats":-1,"GunbeltAccs":-1,"Gauntlets":-1,"Loadouts":-1,"Accessories":-1,"Satchels":-1,"CoatClosed":-1}', 0, '{"z":117.5223388671875,"heading":85.03936767578125,"x":-313.4637451171875,"y":790.087890625}', 0, 0, 0, 0, 'MP_Style_Casual', '{"medical":0,"blacksmith":0,"basic":0,"survival":0,"brewing":0,"food":0}', '{}', 0.00, '{}', 0, '0', '[]', '0', '{}');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.character_inventories
CREATE TABLE IF NOT EXISTS `character_inventories` (
  `character_id` int(11) DEFAULT NULL,
  `inventory_type` varchar(100) NOT NULL DEFAULT 'default',
  `item_crafted_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  KEY `character_inventory_idx` (`character_id`,`inventory_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.character_inventories: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `character_inventories` DISABLE KEYS */;
INSERT INTO `character_inventories` (`character_id`, `inventory_type`, `item_crafted_id`, `amount`, `created_at`) VALUES
	(1, 'default', 2, 2, '2023-05-04 23:00:56'),
	(1, 'default', 1, 1, '2023-05-04 23:00:56');
/*!40000 ALTER TABLE `character_inventories` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.doors
CREATE TABLE IF NOT EXISTS `doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doorinfo` longtext NOT NULL DEFAULT '[]',
  `job` longtext NOT NULL DEFAULT '[]',
  `item` longtext NOT NULL,
  `break` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.doors: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `doors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doors` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.herbalists
CREATE TABLE IF NOT EXISTS `herbalists` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  UNIQUE KEY `identifier_charidentifier` (`identifier`,`charidentifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.herbalists: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `herbalists` DISABLE KEYS */;
/*!40000 ALTER TABLE `herbalists` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.horses
CREATE TABLE IF NOT EXISTS `horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `charid` int(11) NOT NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `model` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `components` varchar(5000) NOT NULL DEFAULT '{}',
  `exp` int(11) NOT NULL DEFAULT 0,
  `items` longtext DEFAULT '{}',
  `sex` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_horses_characters` (`charid`),
  KEY `model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.horses: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `horses` DISABLE KEYS */;
/*!40000 ALTER TABLE `horses` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.horse_complements
CREATE TABLE IF NOT EXISTS `horse_complements` (
  `identifier` varchar(50) NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `complements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.horse_complements: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `horse_complements` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse_complements` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.housing
CREATE TABLE IF NOT EXISTS `housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `charidentifier` int(11) NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL,
  `open` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34307 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.housing: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `housing` DISABLE KEYS */;
/*!40000 ALTER TABLE `housing` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.items
CREATE TABLE IF NOT EXISTS `items` (
  `item` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT 1,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(50) DEFAULT 'item_standard',
  `usable` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`metadata`)),
  `desc` varchar(5550) NOT NULL DEFAULT 'nice item',
  PRIMARY KEY (`item`) USING BTREE,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.items: ~730 rows (ungefähr)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `id`, `metadata`, `desc`) VALUES
	('acid', 'Acid', 10, 1, 'item_standard', 1, 1, '{}', 'nice item'),
	('Agarita', 'Agarita', 10, 1, 'item_standard', 1, 2, '{}', 'nice item'),
	('Agarita_Seed', 'Agarita Seed', 10, 1, 'item_standard', 1, 3, '{}', 'nice item'),
	('Alaskan_Ginseng', 'Alaskan Ginseng', 10, 1, 'item_standard', 1, 4, '{}', 'nice item'),
	('Alaskan_Ginseng_Seed', 'Alaskan Ginseng Seed', 10, 1, 'item_standard', 1, 5, '{}', 'nice item'),
	('alcohol', 'Alcohol', 10, 1, 'item_standard', 1, 6, '{}', 'nice item'),
	('aligatormeat', 'Alligator Meat', 20, 1, 'item_standard', 1, 568, '{}', 'nice item'),
	('aligators', 'Alligator pelt', 20, 1, 'item_standard', 1, 544, '{}', 'nice item'),
	('aligatorto', 'Alligator tooth', 20, 1, 'item_standard', 1, 543, '{}', 'nice item'),
	('American_Ginseng', 'American Ginseng', 10, 1, 'item_standard', 1, 7, '{}', 'nice item'),
	('American_Ginseng_Seed', 'American Ginseng Seed', 10, 1, 'item_standard', 1, 8, '{}', 'nice item'),
	('ammoarrowdynamite', 'Arrow Dynamite', 10, 1, 'item_standard', 1, 10, '{}', 'nice item'),
	('ammoarrowfire', 'Arrow Fire', 10, 1, 'item_standard', 1, 11, '{}', 'nice item'),
	('ammoarrowimproved', 'Arrow Improved', 10, 1, 'item_standard', 1, 12, '{}', 'nice item'),
	('ammoarrownormal', 'Arrow Normal', 10, 1, 'item_standard', 1, 9, '{}', 'nice item'),
	('ammoarrowpoison', 'Arrow Poison', 10, 1, 'item_standard', 1, 13, '{}', 'nice item'),
	('ammoarrowsmallgame', 'Arrow Small Game', 10, 1, 'item_standard', 1, 14, '{}', 'nice item'),
	('ammobolahawk', 'Bola Ammo Hawk', 10, 1, 'item_standard', 1, 15, '{}', 'nice item'),
	('ammobolainterwired', 'Bola Ammo Interwired', 10, 1, 'item_standard', 1, 16, '{}', 'nice item'),
	('ammobolaironspiked', 'Bola Ammo Ironspiked', 10, 1, 'item_standard', 1, 17, '{}', 'nice item'),
	('ammobolla', 'Bolla Ammo', 10, 1, 'item_standard', 1, 18, '{}', 'nice item'),
	('ammodynamite', 'Dynamite Ammo', 10, 1, 'item_standard', 1, 19, '{}', 'nice item'),
	('ammoelephant', 'Elephant Rifle Ammo', 10, 1, 'item_standard', 1, 20, '{}', 'nice item'),
	('ammoknives', 'Knives Ammo', 10, 1, 'item_standard', 1, 21, '{}', 'nice item'),
	('ammomolotov', 'Molotov Ammo', 10, 1, 'item_standard', 1, 22, '{}', 'nice item'),
	('ammopistolexplosive', 'Pistol Ammo Explosive', 10, 1, 'item_standard', 1, 23, '{}', 'nice item'),
	('ammopistolexpress', 'Pistol Ammo Express', 10, 1, 'item_standard', 1, 24, '{}', 'nice item'),
	('ammopistolnormal', 'Pistol Ammo Normal', 10, 1, 'item_standard', 1, 25, '{}', 'nice item'),
	('ammopistolsplitpoint', 'Pistol Ammo Splitpoint', 10, 1, 'item_standard', 1, 26, '{}', 'nice item'),
	('ammopistolvelocity', 'Pistol Ammo Velocity', 10, 1, 'item_standard', 1, 27, '{}', 'nice item'),
	('ammopoisonbottle', 'Poison Bottle Ammo', 10, 1, 'item_standard', 1, 28, '{}', 'nice item'),
	('ammorepeaterexplosive', 'Repeater Ammo Explosive', 10, 1, 'item_standard', 1, 29, '{}', 'nice item'),
	('ammorepeaterexpress', 'Repeater Ammo Express', 10, 1, 'item_standard', 1, 30, '{}', 'nice item'),
	('ammorepeaternormal', 'Repeater Ammo Normal', 10, 1, 'item_standard', 1, 31, '{}', 'nice item'),
	('ammorepeatersplitpoint', 'Repeater Ammo Splitpoint', 10, 1, 'item_standard', 1, 32, '{}', 'nice item'),
	('ammorepeatervelocity', 'Repeater Ammo Velocity', 10, 1, 'item_standard', 1, 33, '{}', 'nice item'),
	('ammorevolverexplosive', 'Revolver Ammo Explosive', 10, 1, 'item_standard', 1, 34, '{}', 'nice item'),
	('ammorevolverexpress', 'Revolver Ammo Express', 10, 1, 'item_standard', 1, 35, '{}', 'nice item'),
	('ammorevolvernormal', 'Revolver Ammo Normal', 10, 1, 'item_standard', 1, 36, '{}', 'nice item'),
	('ammorevolversplitpoint', 'Revolver Ammo Splitpoint', 10, 1, 'item_standard', 1, 37, '{}', 'nice item'),
	('ammorevolvervelocity', 'Revolver Ammo Velocity', 10, 1, 'item_standard', 1, 38, '{}', 'nice item'),
	('ammorifleexplosive', 'Rifle Ammo Explosive', 10, 1, 'item_standard', 1, 39, '{}', 'nice item'),
	('ammorifleexpress', 'Rifle Ammo Express', 10, 1, 'item_standard', 1, 40, '{}', 'nice item'),
	('ammoriflenormal', 'Rifle Ammo Normal', 10, 1, 'item_standard', 1, 41, '{}', 'nice item'),
	('ammoriflesplitpoint', 'Rifle Ammo Splitpoint', 10, 1, 'item_standard', 1, 42, '{}', 'nice item'),
	('ammoriflevelocity', 'Rifle Ammo Velocity', 10, 1, 'item_standard', 1, 43, '{}', 'nice item'),
	('ammoshotgunexplosive', 'Shotgun Ammo Explosive', 10, 1, 'item_standard', 1, 44, '{}', 'nice item'),
	('ammoshotgunincendiary', 'Shotgun Ammo Incendiary', 10, 1, 'item_standard', 1, 45, '{}', 'nice item'),
	('ammoshotgunnormal', 'Shotgun Ammo Normal', 10, 1, 'item_standard', 1, 46, '{}', 'nice item'),
	('ammoshotgunslug', 'Shotgun Ammo Slug', 10, 1, 'item_standard', 1, 47, '{}', 'nice item'),
	('ammotomahawk', 'Tonmahawk Ammo', 10, 1, 'item_standard', 1, 48, '{}', 'nice item'),
	('ammovarmint', 'Varmint Ammo', 10, 1, 'item_standard', 1, 49, '{}', 'nice item'),
	('ammovarminttranq', 'Varmint Tranquilizer Ammo', 10, 1, 'item_standard', 1, 50, '{}', 'nice item'),
	('ammovoldynamite', 'Volatile Dynamite Ammo', 10, 1, 'item_standard', 1, 51, '{}', 'nice item'),
	('ammovolmolotov', 'Volatile Molotov Ammo', 10, 1, 'item_standard', 1, 52, '{}', 'nice item'),
	('antipoison', 'Antipoison', 20, 1, 'item_standard', 1, 53, '{}', 'nice item'),
	('antipoison2', 'Anti Snake Poison', 20, 1, 'item_standard', 1, 617, '{}', 'nice item'),
	('apple', 'Apple', 20, 1, 'item_standard', 1, 54, '{}', 'nice item'),
	('applebarrel', 'Apple Barrel', 20, 1, 'item_standard', 1, 762, '{}', 'nice item'),
	('applebasket', 'Apple Basket', 20, 1, 'item_standard', 1, 763, '{}', 'nice item'),
	('appleCrumbMash', 'Minty Berry Mash', 10, 1, 'item_standard', 1, 55, '{}', 'nice item'),
	('appleCrumbMoonshine', 'Minty Berry Moonshine', 10, 1, 'item_standard', 1, 56, '{}', 'nice item'),
	('apple_barrel', 'Apple Barrel', 20, 1, 'item_standard', 1, 634, '{}', 'nice item'),
	('apple_basket', 'Apple Basket', 20, 1, 'item_standard', 1, 635, '{}', 'nice item'),
	('Apple_Seed', 'Apple Seed', 10, 1, 'item_standard', 1, 727, '{}', 'nice item'),
	('armadilloc', 'Armadillo claws', 20, 1, 'item_standard', 1, 449, '{}', 'nice item'),
	('armadillos', 'Armadillo pelt', 20, 1, 'item_standard', 1, 448, '{}', 'nice item'),
	('asnakes', 'Copperhead Snake pelt', 20, 1, 'item_standard', 1, 487, '{}', 'nice item'),
	('a_c_fishbluegil_01_ms', 'Medium Bluegil', 10, 1, 'item_standard', 0, 57, '{}', 'nice item'),
	('a_c_fishbluegil_01_sm', 'Small Bluegil', 5, 1, 'item_standard', 0, 58, '{}', 'nice item'),
	('a_c_fishbullheadcat_01_ms', 'Medium Bullhead', 10, 1, 'item_standard', 0, 59, '{}', 'nice item'),
	('a_c_fishbullheadcat_01_sm', 'Small Bullhead', 5, 1, 'item_standard', 0, 60, '{}', 'nice item'),
	('a_c_fishchainpickerel_01_ms', 'Medium Pickerel', 10, 1, 'item_standard', 0, 61, '{}', 'nice item'),
	('a_c_fishchainpickerel_01_sm', 'Small Pickerel', 5, 1, 'item_standard', 0, 62, '{}', 'nice item'),
	('a_c_fishlargemouthbass_01_ms', 'Lardgemouth Bass', 10, 1, 'item_standard', 0, 63, '{}', 'nice item'),
	('a_c_fishperch_01_ms', 'Medium Perch', 10, 1, 'item_standard', 0, 64, '{}', 'nice item'),
	('a_c_fishperch_01_sm', 'Small Perch', 5, 1, 'item_standard', 0, 65, '{}', 'nice item'),
	('a_c_fishrainbowtrout_01_ms', 'Rainbow Trout', 10, 1, 'item_standard', 0, 66, '{}', 'nice item'),
	('a_c_fishredfinpickerel_01_ms', 'Medium Redfin Pickerel', 10, 1, 'item_standard', 0, 67, '{}', 'nice item'),
	('a_c_fishredfinpickerel_01_sm', 'Small Redfin Pickerel', 5, 1, 'item_standard', 0, 68, '{}', 'nice item'),
	('a_c_fishrockbass_01_ms', 'Medium Rockbass', 10, 1, 'item_standard', 0, 69, '{}', 'nice item'),
	('a_c_fishrockbass_01_sm', 'Small Rockbass', 5, 1, 'item_standard', 0, 70, '{}', 'nice item'),
	('a_c_fishsalmonsockeye_01_ms', 'Sockeye Salmon', 10, 1, 'item_standard', 0, 71, '{}', 'nice item'),
	('a_c_fishsmallmouthbass_01_ms', 'Smallmouth Bass', 10, 1, 'item_standard', 0, 72, '{}', 'nice item'),
	('badgers', 'Badger skin', 20, 1, 'item_standard', 1, 491, '{}', 'nice item'),
	('bait', 'Bait', 20, 1, 'item_standard', 1, 73, '{}', 'nice item'),
	('banana', 'Banana', 20, 1, 'item_standard', 1, 74, '{}', 'nice item'),
	('bandage', 'Bandage', 20, 1, 'item_standard', 1, 75, '{}', 'nice item'),
	('barrel', 'Barrel', 5, 1, 'item_standard', 1, 800, '{}', 'nice item'),
	('bat_c', 'Bat', 20, 1, 'item_standard', 1, 420, '{}', 'nice item'),
	('Bay_Bolete', 'Bay Bolete', 10, 1, 'item_standard', 1, 76, '{}', 'nice item'),
	('Bay_Bolete_Seed', 'Bay Bolete Seed', 10, 1, 'item_standard', 1, 77, '{}', 'nice item'),
	('bbears', 'Black Bear skin', 20, 1, 'item_standard', 1, 452, '{}', 'nice item'),
	('bbirdb', 'Cormorant beak', 20, 1, 'item_standard', 1, 528, '{}', 'nice item'),
	('bbirdf', 'Cormorant feather', 20, 1, 'item_standard', 1, 527, '{}', 'nice item'),
	('bcandle', 'Bottle Candle', 20, 1, 'item_standard', 1, 663, '{}', 'nice item'),
	('bearbench', 'Bear Bench', 20, 1, 'item_standard', 1, 773, '{}', 'nice item'),
	('bearc', 'Bear claws', 20, 1, 'item_standard', 1, 450, '{}', 'nice item'),
	('beart', 'Bear tooth', 20, 1, 'item_standard', 1, 451, '{}', 'nice item'),
	('bear_bench', 'Bear Bench', 20, 1, 'item_standard', 1, 645, '{}', 'nice item'),
	('beavertail', 'Beaver tail', 20, 1, 'item_standard', 1, 542, '{}', 'nice item'),
	('beawers', 'Beaver pelt', 20, 1, 'item_standard', 1, 541, '{}', 'nice item'),
	('beef', 'Beef', 20, 1, 'item_standard', 1, 567, '{}', 'nice item'),
	('beefjerky', 'Beef Jerky', 20, 1, 'item_standard', 1, 78, '{}', 'nice item'),
	('beer', 'Beer', 10, 1, 'item_standard', 1, 79, '{}', 'nice item'),
	('beerbox', 'Beer Box', 20, 1, 'item_standard', 1, 586, '{}', 'nice item'),
	('bigchest', 'Big Chest', 1, 1, 'item_standard', 1, 658, '{}', 'nice item'),
	('biggame', 'Big Game Meat', 20, 1, 'item_standard', 1, 565, '{}', 'nice item'),
	('Big_Leather', 'Big Leather', 10, 1, 'item_standard', 1, 80, '{}', 'nice item'),
	('bird', 'Bird Meat', 20, 1, 'item_standard', 1, 569, '{}', 'nice item'),
	('bisonhorn', 'Bison horn', 20, 1, 'item_standard', 1, 461, '{}', 'nice item'),
	('bisons', 'Bison pelt', 20, 1, 'item_standard', 1, 462, '{}', 'nice item'),
	('Bitter_Weed', 'Bitter Weed', 10, 1, 'item_standard', 1, 81, '{}', 'nice item'),
	('Bitter_Weed_Seed', 'Bitter Weed Seed', 10, 1, 'item_standard', 1, 82, '{}', 'nice item'),
	('blackberryale', 'Black Berry Ale', 10, 1, 'item_standard', 1, 83, '{}', 'nice item'),
	('Black_Berry', 'Black Berry', 10, 1, 'item_standard', 1, 84, '{}', 'nice item'),
	('Black_Berry_Seed', 'Black Berry Seed', 10, 1, 'item_standard', 1, 85, '{}', 'nice item'),
	('Black_Currant', 'Black Currant', 10, 1, 'item_standard', 1, 86, '{}', 'nice item'),
	('Black_Currant_Seed', 'Black Currant Seed', 10, 1, 'item_standard', 1, 87, '{}', 'nice item'),
	('blanketbox', 'Blanket Box', 20, 1, 'item_standard', 1, 760, '{}', 'nice item'),
	('blanket_box', 'Blanket Box', 20, 1, 'item_standard', 1, 632, '{}', 'nice item'),
	('Blood_Flower', 'Blood Flower', 10, 1, 'item_standard', 1, 88, '{}', 'nice item'),
	('Blood_Flower_Seed', 'Blood Flower Seed', 10, 1, 'item_standard', 1, 89, '{}', 'nice item'),
	('blueberry', 'Blueberry', 10, 1, 'item_standard', 1, 90, '{}', 'nice item'),
	('bluejay_c', 'Blue jay', 20, 1, 'item_standard', 1, 421, '{}', 'nice item'),
	('bmdresser', 'brown mirror dresser', 20, 1, 'item_standard', 1, 652, '{}', 'nice item'),
	('boarmusk', 'Boar tusk', 20, 1, 'item_standard', 1, 456, '{}', 'nice item'),
	('boars', 'Boar pelt', 20, 1, 'item_standard', 1, 457, '{}', 'nice item'),
	('boaskin', 'Boa Snake pelt', 20, 1, 'item_standard', 1, 486, '{}', 'nice item'),
	('boiledegg', 'Boiled Egg', 10, 1, 'item_standard', 1, 91, '{}', 'nice item'),
	('boobyb', 'Red-footed booby beak', 20, 1, 'item_standard', 1, 501, '{}', 'nice item'),
	('boobyf', 'Red-footed booby feather', 20, 1, 'item_standard', 1, 500, '{}', 'nice item'),
	('book', 'Book', 5, 1, 'item_standard', 1, 92, '{}', 'nice item'),
	('bountylicns', 'Bounty Hunter License', 10, 1, 'item_standard', 1, 93, '{}', 'nice item'),
	('bouquet', 'Bouquet', 1, 1, 'item_standard', 1, 342, '{}', 'nice item'),
	('bparrotb', 'Parrot beak', 20, 1, 'item_standard', 1, 522, '{}', 'nice item'),
	('bparrotf', 'Parrot feather', 20, 1, 'item_standard', 1, 521, '{}', 'nice item'),
	('buckantler', 'Buck Antlers', 20, 1, 'item_standard', 1, 459, '{}', 'nice item'),
	('bucks', 'Buck skin', 20, 1, 'item_standard', 1, 460, '{}', 'nice item'),
	('bullhorn', 'Bull horn', 20, 1, 'item_standard', 1, 463, '{}', 'nice item'),
	('bulls', 'Bull pelt', 20, 1, 'item_standard', 1, 464, '{}', 'nice item'),
	('Bulrush', 'Bulrush', 10, 1, 'item_standard', 1, 94, '{}', 'nice item'),
	('Bulrush_Seed', 'Bulrush Seed', 10, 1, 'item_standard', 1, 95, '{}', 'nice item'),
	('bunkbed', 'bunk bed', 20, 1, 'item_standard', 1, 665, '{}', 'nice item'),
	('Burdock_Root', 'Burdock Root', 10, 1, 'item_standard', 1, 96, '{}', 'nice item'),
	('Burdock_Root_Seed', 'Burdock Root Seed', 10, 1, 'item_standard', 1, 97, '{}', 'nice item'),
	('butchertable1', 'Small Butcher Table', 20, 1, 'item_standard', 1, 583, '{}', 'nice item'),
	('butchertable2', 'Medium Butcher Table', 20, 1, 'item_standard', 1, 582, '{}', 'nice item'),
	('butchertable3', 'Large Butcher Table', 20, 1, 'item_standard', 1, 581, '{}', 'nice item'),
	('bwdresser', 'brown wood dresser', 20, 1, 'item_standard', 1, 651, '{}', 'nice item'),
	('camera', 'Camera', 1, 1, 'item_standard', 1, 346, '{}', 'nice item'),
	('campfire', 'Campfire', 5, 1, 'item_standard', 1, 98, '{}', 'nice item'),
	('candlea', 'Candle', 20, 1, 'item_standard', 1, 661, '{}', 'nice item'),
	('cane', 'Cane', 1, 1, 'item_standard', 1, 344, '{}', 'nice item'),
	('cardinal_c', 'Cardinal bird', 20, 1, 'item_standard', 1, 422, '{}', 'nice item'),
	('Cardinal_Flower', 'Cardinal Flower', 10, 1, 'item_standard', 1, 99, '{}', 'nice item'),
	('Cardinal_Flower_Seed', 'Cardinal Flower Seed', 10, 1, 'item_standard', 1, 100, '{}', 'nice item'),
	('carrots', 'Carrot', 10, 1, 'item_standard', 1, 101, '{}', 'nice item'),
	('cedarwaxwing_c', 'Cedar waxwing', 20, 1, 'item_standard', 1, 423, '{}', 'nice item'),
	('Chanterelles', 'Chanterelles', 10, 1, 'item_standard', 1, 102, '{}', 'nice item'),
	('Chanterelles_Seed', 'Chanterelles Seed', 10, 1, 'item_standard', 1, 103, '{}', 'nice item'),
	('char', 'Char', 10, 1, 'item_standard', 0, 104, '{}', 'nice item'),
	('chestc', 'Chest C', 20, 1, 'item_standard', 1, 578, '{}', 'nice item'),
	('chewingtobacco', 'Chewing Tobacco', 20, 1, 'item_standard', 1, 105, '{}', 'nice item'),
	('chickenf', 'Chicken feather', 20, 1, 'item_standard', 1, 525, '{}', 'nice item'),
	('chickenheart', 'Chicken heart', 20, 1, 'item_standard', 1, 526, '{}', 'nice item'),
	('chipmunk_c', 'Chipmunk', 20, 1, 'item_standard', 1, 419, '{}', 'nice item'),
	('Choc_Daisy', 'Choc Daisy', 10, 1, 'item_standard', 1, 106, '{}', 'nice item'),
	('Choc_Daisy_Seed', 'Choc Daisy Seed', 10, 1, 'item_standard', 1, 107, '{}', 'nice item'),
	('cigar', 'Cigar', 20, 1, 'item_standard', 1, 108, '{}', 'nice item'),
	('cigarette', 'Cigarette', 20, 1, 'item_standard', 1, 109, '{}', 'nice item'),
	('cigarettefilter', 'Cig Filter', 20, 1, 'item_standard', 1, 110, '{}', 'nice item'),
	('cinematicket', 'Ticket', 2, 1, 'item_standard', 0, 351, '{}', 'nice item'),
	('clay', 'Clay', 20, 1, 'item_standard', 1, 111, '{}', 'nice item'),
	('cleanser', 'Cleanser', 5, 1, 'item_standard', 1, 340, '{}', 'nice item'),
	('clothbench', 'Cloth Bench', 20, 1, 'item_standard', 1, 776, '{}', 'nice item'),
	('clothesline', 'Clothes Line', 20, 1, 'item_standard', 1, 766, '{}', 'nice item'),
	('clothes_line', 'Clothes Line', 20, 1, 'item_standard', 1, 638, '{}', 'nice item'),
	('cloth_bench', 'Cloth Bench', 20, 1, 'item_standard', 1, 648, '{}', 'nice item'),
	('coal', 'Coal', 20, 1, 'item_standard', 1, 112, '{}', 'nice item'),
	('cockc', 'Rooster claws', 20, 1, 'item_standard', 1, 499, '{}', 'nice item'),
	('cockf', 'Rooster feather', 20, 1, 'item_standard', 1, 498, '{}', 'nice item'),
	('cocoa', 'Cocoa', 20, 1, 'item_standard', 1, 113, '{}', 'nice item'),
	('cocoaseeds', 'Cocoa Seeds', 10, 1, 'item_standard', 1, 733, '{}', 'nice item'),
	('coffindecor', 'Coffin Decor', 20, 1, 'item_standard', 1, 629, '{}', 'nice item'),
	('condenser', 'Condenser', 5, 1, 'item_standard', 1, 816, '{}', 'nice item'),
	('condorb', 'Condor beak', 20, 1, 'item_standard', 1, 480, '{}', 'nice item'),
	('condorf', 'Condor feather', 20, 1, 'item_standard', 1, 479, '{}', 'nice item'),
	('consumable_bluegil', 'Dried Bluegil', 10, 1, 'item_standard', 1, 114, '{}', 'nice item'),
	('consumable_breakfast', 'Breakfast', 5, 1, 'item_standard', 1, 115, '{}', 'nice item'),
	('consumable_caramel', 'Caramel', 5, 1, 'item_standard', 1, 116, '{}', 'nice item'),
	('consumable_chocolate', 'Chocolate Bar', 10, 1, 'item_standard', 1, 117, '{}', 'nice item'),
	('consumable_coffee', 'Coffee', 5, 1, 'item_standard', 1, 118, '{}', 'nice item'),
	('consumable_fruitsalad', 'Fruit Salad', 5, 1, 'item_standard', 1, 119, '{}', 'nice item'),
	('consumable_game', 'Jerkied GameMeat', 10, 1, 'item_standard', 1, 120, '{}', 'nice item'),
	('consumable_haycube', 'Haycube', 10, 1, 'item_standard', 1, 121, '{}', 'nice item'),
	('consumable_herb_chanterelles', 'Chanterelles', 10, 1, 'item_standard', 1, 122, '{}', 'nice item'),
	('consumable_herb_evergreen_huckleberry', 'Evergreen Huckleberry', 10, 1, 'item_standard', 1, 123, '{}', 'nice item'),
	('consumable_herb_oregano', 'Oregano', 10, 1, 'item_standard', 1, 124, '{}', 'nice item'),
	('consumable_herb_vanilla_flower', 'Vanilla Flower', 10, 1, 'item_standard', 1, 125, '{}', 'nice item'),
	('consumable_herb_wintergreen_berry', 'Wintergreen Berry', 10, 1, 'item_standard', 1, 126, '{}', 'nice item'),
	('consumable_kidneybeans_can', 'Kidney Beans', 5, 1, 'item_standard', 1, 127, '{}', 'nice item'),
	('consumable_lock_breaker', 'Lock Breaker', 10, 1, 'item_standard', 1, 128, '{}', 'nice item'),
	('consumable_meat_greavy', 'Meat Stew', 12, 1, 'item_standard', 1, 129, '{}', 'nice item'),
	('consumable_medicine', 'Medicine', 10, 1, 'item_standard', 1, 130, '{}', 'nice item'),
	('consumable_peach', 'Peach', 5, 1, 'item_standard', 1, 131, '{}', 'nice item'),
	('consumable_pear', 'Pear', 10, 1, 'item_standard', 1, 132, '{}', 'nice item'),
	('consumable_raspberrywater', 'Berry Water', 10, 1, 'item_standard', 1, 133, '{}', 'nice item'),
	('consumable_salmon', 'Dried Salmon', 10, 1, 'item_standard', 1, 134, '{}', 'nice item'),
	('consumable_salmon_can', 'Salmon Can', 10, 1, 'item_standard', 1, 135, '{}', 'nice item'),
	('consumable_trout', 'Cooked Trout', 10, 1, 'item_standard', 1, 136, '{}', 'nice item'),
	('consumable_veggies', 'Edible Veggies', 5, 1, 'item_standard', 1, 137, '{}', 'nice item'),
	('cookedbluegil', 'Cooked Bluegil with Veggies', 5, 1, 'item_standard', 1, 138, '{}', 'nice item'),
	('copper', 'Copper', 30, 1, 'item_standard', 1, 139, '{}', 'nice item'),
	('corn', 'Corn', 10, 1, 'item_standard', 1, 140, '{}', 'nice item'),
	('cornseed', 'Corn seed', 10, 1, 'item_standard', 1, 141, '{}', 'nice item'),
	('cougarf', 'Cougar tooth', 20, 1, 'item_standard', 1, 558, '{}', 'nice item'),
	('cougars', 'Cougar skin', 20, 1, 'item_standard', 1, 557, '{}', 'nice item'),
	('cougartaxi', 'Cougar Taxidermy', 20, 1, 'item_standard', 1, 771, '{}', 'nice item'),
	('cougar_taxidermy', 'Cougar Taxidermy', 20, 1, 'item_standard', 1, 643, '{}', 'nice item'),
	('cowh', 'Cow horn', 20, 1, 'item_standard', 1, 562, '{}', 'nice item'),
	('cows', 'Cow pelt', 20, 1, 'item_standard', 1, 561, '{}', 'nice item'),
	('coyotef', 'Coyote tooth', 20, 1, 'item_standard', 1, 560, '{}', 'nice item'),
	('coyotepelt', 'Coyote Pelt', 20, 1, 'item_standard', 1, 759, '{}', 'nice item'),
	('coyotes', 'Coyote skin', 20, 1, 'item_standard', 1, 559, '{}', 'nice item'),
	('coyotetaxi', 'Coyote Taxidermy', 20, 1, 'item_standard', 1, 768, '{}', 'nice item'),
	('coyote_pelt', 'Coyote Pelt', 20, 1, 'item_standard', 1, 631, '{}', 'nice item'),
	('coyote_taxidermy', 'Coyote Taxidermy', 20, 1, 'item_standard', 1, 640, '{}', 'nice item'),
	('crab_c', 'Crab', 20, 1, 'item_standard', 1, 425, '{}', 'nice item'),
	('craftingfire', 'Crafting Fire', 20, 1, 'item_standard', 1, 753, '{}', 'nice item'),
	('crafting_fire', 'Crafting Fire', 20, 1, 'item_standard', 1, 625, '{}', 'nice item'),
	('crawfish_c', 'Crawfish', 20, 1, 'item_standard', 1, 424, '{}', 'nice item'),
	('Creeking_Thyme', 'Creeping Thyme', 10, 1, 'item_standard', 1, 142, '{}', 'nice item'),
	('Creeking_Thyme_Seed', 'Creeping Thyme Seed', 10, 1, 'item_standard', 1, 143, '{}', 'nice item'),
	('Creekplum', 'Creekplum', 10, 1, 'item_standard', 1, 144, '{}', 'nice item'),
	('Creekplum_Seed', 'Creekplum Seed', 10, 1, 'item_standard', 1, 145, '{}', 'nice item'),
	('Crows_Garlic', 'Crows Garlic', 10, 1, 'item_standard', 1, 146, '{}', 'nice item'),
	('Crows_Garlic_Seed', 'Crows Garlic Seed', 10, 1, 'item_standard', 1, 147, '{}', 'nice item'),
	('crow_c', 'Crow', 20, 1, 'item_standard', 1, 426, '{}', 'nice item'),
	('darub', 'Crane beak', 20, 1, 'item_standard', 1, 530, '{}', 'nice item'),
	('daruf', 'Crane feather', 20, 1, 'item_standard', 1, 529, '{}', 'nice item'),
	('dbcandle', 'Dbl Candle', 20, 1, 'item_standard', 1, 660, '{}', 'nice item'),
	('decortent1', 'Decor Tent 1 Set', 20, 1, 'item_standard', 1, 600, '{}', 'nice item'),
	('decortent2', 'Decor Tent 2 Set', 20, 1, 'item_standard', 1, 601, '{}', 'nice item'),
	('decortent3', 'Decor Tent 3 Set', 20, 1, 'item_standard', 1, 602, '{}', 'nice item'),
	('deerheart', 'Deer heart', 20, 1, 'item_standard', 1, 466, '{}', 'nice item'),
	('deerpelt', 'Deer Pelt', 20, 1, 'item_standard', 1, 758, '{}', 'nice item'),
	('deerskin', 'Deer skin', 20, 1, 'item_standard', 1, 465, '{}', 'nice item'),
	('deertaxi', 'Deer Taxidermy', 20, 1, 'item_standard', 1, 770, '{}', 'nice item'),
	('deer_pelt', 'Deer Pelt', 20, 1, 'item_standard', 1, 630, '{}', 'nice item'),
	('deer_taxidermy', 'Deer Taxidermy', 20, 1, 'item_standard', 1, 642, '{}', 'nice item'),
	('Desert_Sage', 'Desert Sage', 10, 1, 'item_standard', 1, 148, '{}', 'nice item'),
	('Desert_Sage_Seed', 'Desert Sage Seed', 10, 1, 'item_standard', 1, 149, '{}', 'nice item'),
	('diamond', 'Diamond', 20, 1, 'item_standard', 1, 150, '{}', 'nice item'),
	('dleguans', 'Desert Iguana pelt', 20, 1, 'item_standard', 1, 551, '{}', 'nice item'),
	('dreamcatcher', 'Dream Catcher', 20, 1, 'item_standard', 1, 591, '{}', 'nice item'),
	('Drink_For_Dog', 'Pet Water', 10, 1, 'item_standard', 1, 151, '{}', 'nice item'),
	('duckfat', 'Duck fat', 20, 1, 'item_standard', 1, 467, '{}', 'nice item'),
	('Duck_Egg', 'Duck Egg', 10, 1, 'item_standard', 1, 152, '{}', 'nice item'),
	('dynamite', 'Pipe charge dynamite', 30, 1, 'item_standard', 1, 153, '{}', 'nice item'),
	('eaglef', 'Eagle feather', 20, 1, 'item_standard', 1, 468, '{}', 'nice item'),
	('eaglet', 'Eagle claws', 20, 1, 'item_standard', 1, 469, '{}', 'nice item'),
	('egg', 'Egg', 20, 1, 'item_standard', 1, 796, '{}', 'nice item'),
	('eggs', 'Egg', 50, 1, 'item_standard', 1, 154, '{}', 'nice item'),
	('egretb', 'Snowy Egret beak', 20, 1, 'item_standard', 1, 473, '{}', 'nice item'),
	('egretf', 'Snowy Egret feather', 20, 1, 'item_standard', 1, 472, '{}', 'nice item'),
	('elkantler', 'Elk antler', 20, 1, 'item_standard', 1, 474, '{}', 'nice item'),
	('elks', 'Vapiti pelt', 20, 1, 'item_standard', 1, 475, '{}', 'nice item'),
	('emerald', 'Emerald', 20, 1, 'item_standard', 1, 155, '{}', 'nice item'),
	('English_Mace', 'English Mace', 10, 1, 'item_standard', 1, 156, '{}', 'nice item'),
	('English_Mace_Seed', 'English Mace Seed', 10, 1, 'item_standard', 1, 157, '{}', 'nice item'),
	('Evergreen_Huckleberry', 'Evergreen Huckleberry', 10, 1, 'item_standard', 1, 158, '{}', 'nice item'),
	('Evergreen_Huckleberry_Seed', 'Evergreen Huckleberry Seed', 10, 1, 'item_standard', 1, 159, '{}', 'nice item'),
	('fan', 'Fan', 5, 1, 'item_standard', 1, 160, '{}', 'nice item'),
	('fancydouble', 'fancy double', 20, 1, 'item_standard', 1, 667, '{}', 'nice item'),
	('Fat', 'Animal Fat', 10, 1, 'item_standard', 1, 161, '{}', 'nice item'),
	('Feather', 'Feather', 20, 1, 'item_standard', 1, 162, '{}', 'nice item'),
	('Feed_For_Dog', 'Dog Food', 10, 1, 'item_standard', 1, 163, '{}', 'nice item'),
	('fertilizer', 'Fertilizer', 10, 1, 'item_standard', 1, 736, '{}', 'nice item'),
	('fertilizerbless', 'Blessed Fertilizer', 10, 1, 'item_standard', 1, 738, '{}', 'nice item'),
	('fertilizeregg', 'Fertilizer with Eggs', 10, 1, 'item_standard', 1, 737, '{}', 'nice item'),
	('fertilizerpro', 'Fertilizer with Produce', 10, 1, 'item_standard', 1, 740, '{}', 'nice item'),
	('fertilizerpulpsap', 'Fertilizer with Pulp/Sap', 10, 1, 'item_standard', 1, 741, '{}', 'nice item'),
	('fertilizersn', 'Fertilizer with Snake', 10, 1, 'item_standard', 1, 742, '{}', 'nice item'),
	('fertilizersq', 'Fertilizer with Squirrel', 10, 1, 'item_standard', 1, 743, '{}', 'nice item'),
	('fertilizersw', 'Fertilizer with Soft Wood', 10, 1, 'item_standard', 1, 745, '{}', 'nice item'),
	('fertilizersyn', 'Synful Fertilizer', 10, 1, 'item_standard', 1, 739, '{}', 'nice item'),
	('fertilizerwoj', 'Fertilizer with Wojape', 10, 1, 'item_standard', 1, 744, '{}', 'nice item'),
	('fibers', 'Fibers', 20, 1, 'item_standard', 0, 164, '{}', 'nice item'),
	('fish', 'Fish', 50, 1, 'item_standard', 1, 165, '{}', 'nice item'),
	('fishbait', 'Fishbait', 10, 1, 'item_standard', 1, 166, '{}', 'nice item'),
	('fishchips', 'Fish and Chips', 10, 1, 'item_standard', 1, 167, '{}', 'nice item'),
	('fishmeat', 'Bigfish Meat', 20, 1, 'item_standard', 1, 572, '{}', 'nice item'),
	('flag', 'Camp Flag', 10, 1, 'item_standard', 1, 168, '{}', 'nice item'),
	('flowerboxes', 'Flower Boxes', 20, 1, 'item_standard', 1, 628, '{}', 'nice item'),
	('foodbarrel', 'Food Barrel', 20, 1, 'item_standard', 1, 764, '{}', 'nice item'),
	('food_barrel', 'Food Barrel', 20, 1, 'item_standard', 1, 636, '{}', 'nice item'),
	('foxskin', 'Foxskin', 20, 1, 'item_standard', 1, 512, '{}', 'nice item'),
	('foxt', 'Fox tooth', 20, 1, 'item_standard', 1, 513, '{}', 'nice item'),
	('friedtater', 'Fried Taters', 10, 1, 'item_standard', 1, 169, '{}', 'nice item'),
	('frogbull2_c', 'Poisoned Frogbull', 20, 1, 'item_standard', 1, 428, '{}', 'nice item'),
	('frogbull_c', 'Frogbull', 20, 1, 'item_standard', 1, 427, '{}', 'nice item'),
	('fsnakes', 'Blacktail rattlesnake pelt', 20, 1, 'item_standard', 1, 488, '{}', 'nice item'),
	('game', 'Game Meat', 20, 1, 'item_standard', 1, 570, '{}', 'nice item'),
	('Gamey_Meat', 'Gamey Meat', 10, 1, 'item_standard', 1, 170, '{}', 'nice item'),
	('Gator_Egg_3', 'Aligator Egg 3', 10, 1, 'item_standard', 1, 171, '{}', 'nice item'),
	('Gator_Egg_4', 'Aligator Egg 4', 10, 1, 'item_standard', 1, 172, '{}', 'nice item'),
	('Gator_Egg_5', 'Aligator Egg 5', 10, 1, 'item_standard', 1, 173, '{}', 'nice item'),
	('gbarrelx', 'Gun Barrel', 20, 1, 'item_standard', 1, 761, '{}', 'nice item'),
	('gbears', 'Grizzly Bear skin', 20, 1, 'item_standard', 1, 453, '{}', 'nice item'),
	('ginsengtea', 'Ginseng Tea', 10, 1, 'item_standard', 1, 174, '{}', 'nice item'),
	('glassbottle', 'Glass Bottle', 15, 1, 'item_standard', 1, 175, '{}', 'nice item'),
	('gleguans', 'Green Iguana pelt', 20, 1, 'item_standard', 1, 552, '{}', 'nice item'),
	('goathead', 'Goat head', 20, 1, 'item_standard', 1, 556, '{}', 'nice item'),
	('goats', 'Goat pelt', 20, 1, 'item_standard', 1, 555, '{}', 'nice item'),
	('goldbar', 'GoldBar', 5, 1, 'item_standard', 1, 176, '{}', 'nice item'),
	('Golden_Currant', 'Golden Currant', 10, 1, 'item_standard', 1, 177, '{}', 'nice item'),
	('Golden_Currant_Seed', 'Golden Currant Seed', 10, 1, 'item_standard', 1, 178, '{}', 'nice item'),
	('goldfish', 'Gold Fish', 10, 1, 'item_standard', 0, 179, '{}', 'nice item'),
	('goldpan', 'Gold pan', 10, 1, 'item_standard', 1, 181, '{}', 'nice item'),
	('goldring', 'Gold Ring', 10, 1, 'item_standard', 1, 182, '{}', 'nice item'),
	('gold_nugget', 'Gold nugget', 30, 1, 'item_standard', 0, 180, '{}', 'nice item'),
	('gooseb', 'Goose beak', 20, 1, 'item_standard', 1, 532, '{}', 'nice item'),
	('goosef', 'Goose feather', 20, 1, 'item_standard', 1, 531, '{}', 'nice item'),
	('Goose_Egg_4', 'Goose Egg', 10, 1, 'item_standard', 1, 183, '{}', 'nice item'),
	('guitar', 'Classic Guitar', 1, 1, 'item_standard', 1, 341, '{}', 'nice item'),
	('gun_barrel', 'Gun Barrel', 20, 1, 'item_standard', 1, 633, '{}', 'nice item'),
	('gypsywagon', 'Gypsys Wagon Set', 20, 1, 'item_standard', 1, 585, '{}', 'nice item'),
	('hairpomade', 'Hair Pomade', 5, 1, 'item_standard', 1, 184, '{}', 'nice item'),
	('handcuffs', 'Handcuffs', 10, 1, 'item_standard', 1, 185, '{}', 'nice item'),
	('hatchet', 'Hatchet', 1, 1, 'item_standard', 1, 186, '{}', 'nice item'),
	('hawkf', 'Hawk feather', 20, 1, 'item_standard', 1, 535, '{}', 'nice item'),
	('hawkt', 'Hawk claws', 20, 1, 'item_standard', 1, 536, '{}', 'nice item'),
	('Health_For_Dog', 'Pet Bandages', 10, 1, 'item_standard', 1, 187, '{}', 'nice item'),
	('hemp', 'Hemp', 10, 1, 'item_standard', 1, 188, '{}', 'nice item'),
	('hemp_cig', 'Hemp Cigarette', 1, 1, 'item_standard', 1, 189, '{}', 'nice item'),
	('hemp_seed', 'Hemp Seed', 20, 1, 'item_standard', 1, 615, '{}', 'nice item'),
	('herbal_medicine', 'Herbal Medicine', 20, 1, 'item_standard', 1, 338, '{}', 'nice item'),
	('herbal_tonic', 'Herbal Tonic', 20, 1, 'item_standard', 1, 339, '{}', 'nice item'),
	('herbmed', 'Herbal Remedy', 10, 1, 'item_standard', 1, 190, '{}', 'nice item'),
	('heroin', 'Heroin', 5, 1, 'item_standard', 1, 191, '{}', 'nice item'),
	('herptile', 'Herptile meat', 20, 1, 'item_standard', 1, 573, '{}', 'nice item'),
	('hitchingpost', 'Hitching Post', 20, 1, 'item_standard', 1, 580, '{}', 'nice item'),
	('hoe', 'Garden Hoe', 10, 1, 'item_standard', 1, 679, '{}', 'nice item'),
	('honey', 'Honey', 10, 1, 'item_standard', 1, 192, '{}', 'nice item'),
	('hop', 'Hop', 10, 1, 'item_standard', 1, 685, '{}', 'nice item'),
	('hop_seed', 'Hop Seed', 10, 1, 'item_standard', 1, 684, '{}', 'nice item'),
	('horsebrush', 'Horse Brush', 5, 1, 'item_standard', 1, 193, '{}', 'nice item'),
	('horsehitches', 'Horse Hitches Set', 20, 1, 'item_standard', 1, 603, '{}', 'nice item'),
	('horsemeal', 'Horse ration', 10, 1, 'item_standard', 1, 348, '{}', 'nice item'),
	('Hummingbird_Sage', 'Hummingbird Sage', 10, 1, 'item_standard', 1, 194, '{}', 'nice item'),
	('Hummingbird_Sage_Seed', 'Hummingbird Sage Seed', 10, 1, 'item_standard', 1, 195, '{}', 'nice item'),
	('hwood', 'Hard Wood', 20, 1, 'item_standard', 0, 196, '{}', 'nice item'),
	('Indian_Tobbaco', 'Indian Tobbaco', 20, 1, 'item_standard', 1, 197, '{}', 'nice item'),
	('Indian_Tobbaco_Seed', 'Indian Tobbaco Seed', 10, 1, 'item_standard', 1, 198, '{}', 'nice item'),
	('iron', 'Iron Ore', 30, 1, 'item_standard', 1, 199, '{}', 'nice item'),
	('ironbar', 'Iron Bar', 30, 1, 'item_standard', 1, 200, '{}', 'nice item'),
	('ironextract', 'Iron Extract', 1, 1, 'item_standard', 0, 201, '{}', 'nice item'),
	('ironhammer', 'Iron Hammer', 5, 1, 'item_standard', 1, 202, '{}', 'nice item'),
	('kbirdb', 'Great Blue Heron beak', 20, 1, 'item_standard', 1, 534, '{}', 'nice item'),
	('kbirdf', 'Great Blue Heron feather', 20, 1, 'item_standard', 1, 533, '{}', 'nice item'),
	('kitchencounter', 'Kitchen Counter', 20, 1, 'item_standard', 1, 611, '{}', 'nice item'),
	('kit_bandana', 'Bandana', 2, 1, 'item_standard', 1, 203, '{}', 'nice item'),
	('lamppost1', 'Lamp Post 1 Set', 20, 1, 'item_standard', 1, 606, '{}', 'nice item'),
	('lamppost2', 'Lamp Post 2 Set', 20, 1, 'item_standard', 1, 607, '{}', 'nice item'),
	('lanterna', 'Lantern', 20, 1, 'item_standard', 1, 659, '{}', 'nice item'),
	('leather', 'Leather', 50, 1, 'item_standard', 1, 204, '{}', 'nice item'),
	('leatherchair', 'Leather Chair', 20, 1, 'item_standard', 1, 748, '{}', 'nice item'),
	('leather_chair', 'Leather Chair', 20, 1, 'item_standard', 1, 620, '{}', 'nice item'),
	('legalbook', 'Legal Book', 1, 1, 'item_standard', 1, 892, '{}', 'nice item'),
	('legaligators', 'Legendary Alligator pelt', 20, 1, 'item_standard', 1, 417, '{}', 'nice item'),
	('legaligators1', 'Legendary Teca Alligator pelt', 20, 1, 'item_standard', 1, 400, '{}', 'nice item'),
	('legaligators2', 'Legendary Sun Alligator pelt', 20, 1, 'item_standard', 1, 401, '{}', 'nice item'),
	('legaligators3', 'Legendary Banded Alligator pelt', 20, 1, 'item_standard', 1, 402, '{}', 'nice item'),
	('legalpaper', 'Legal Paper', 4, 1, 'item_standard', 1, 891, '{}', 'nice item'),
	('legbears1', 'Legendary Deadly Bear pelt', 20, 1, 'item_standard', 1, 376, '{}', 'nice item'),
	('legbears2', 'Legendary Owiza Bear pelt', 20, 1, 'item_standard', 1, 377, '{}', 'nice item'),
	('legbears3', 'Legendary Ridgeback Spirit Bear pelt', 20, 1, 'item_standard', 1, 378, '{}', 'nice item'),
	('legbears4', 'Legendary Golden Spirit Bear pelt', 20, 1, 'item_standard', 1, 379, '{}', 'nice item'),
	('legbeavers1', 'Legendary Grey Beaver pelt', 20, 1, 'item_standard', 1, 397, '{}', 'nice item'),
	('legbeavers2', 'Legendary White Beaver pelt', 20, 1, 'item_standard', 1, 398, '{}', 'nice item'),
	('legbeavers3', 'Legendary Black Beaver pelt', 20, 1, 'item_standard', 1, 399, '{}', 'nice item'),
	('legbeawers', 'Legendary Beaver pelt', 20, 1, 'item_standard', 1, 411, '{}', 'nice item'),
	('legbisonhorn', 'Legendary Bison Horns', 20, 1, 'item_standard', 1, 353, '{}', 'nice item'),
	('legbisons', 'Legendary Bison pelt', 20, 1, 'item_standard', 1, 416, '{}', 'nice item'),
	('legbisons1', 'Legendary Tatanka Bison pelt', 20, 1, 'item_standard', 1, 365, '{}', 'nice item'),
	('legbisons2', 'Legendary Winyan Bison pelt', 20, 1, 'item_standard', 1, 366, '{}', 'nice item'),
	('legbisons3', 'Legendary Payata Bison pelt', 20, 1, 'item_standard', 1, 367, '{}', 'nice item'),
	('legbisonstak', 'Legendary Takanta Bison pelt', 20, 1, 'item_standard', 1, 415, '{}', 'nice item'),
	('legboars', 'Legendary Boar pelt', 20, 1, 'item_standard', 1, 414, '{}', 'nice item'),
	('legboars1', 'Legendary Cogi Boar pelt', 20, 1, 'item_standard', 1, 393, '{}', 'nice item'),
	('legboars2', 'Legendary Wakpa Boar pelt', 20, 1, 'item_standard', 1, 394, '{}', 'nice item'),
	('legboars3', 'Legendary Icahi Boar pelt', 20, 1, 'item_standard', 1, 395, '{}', 'nice item'),
	('legboars4', 'Legendary Wildhog pelt', 20, 1, 'item_standard', 1, 396, '{}', 'nice item'),
	('legbucks', 'Legendary Buck skin', 20, 1, 'item_standard', 1, 410, '{}', 'nice item'),
	('legbucks1', 'Legendary Buck pelt', 20, 1, 'item_standard', 1, 368, '{}', 'nice item'),
	('legbucks2', 'Legendary Mudrunner Buck pelt', 20, 1, 'item_standard', 1, 369, '{}', 'nice item'),
	('legbucks3', 'Legendary Snow Buck pelt', 20, 1, 'item_standard', 1, 370, '{}', 'nice item'),
	('legbucks4', 'Legendary Shadow Buck pelt', 20, 1, 'item_standard', 1, 371, '{}', 'nice item'),
	('legcougars', 'Legendary Cougar skin', 20, 1, 'item_standard', 1, 409, '{}', 'nice item'),
	('legcougars1', 'Legendary Iguga Cougar pelt', 20, 1, 'item_standard', 1, 389, '{}', 'nice item'),
	('legcougars2', 'Legendary Maza Cougar pelt', 20, 1, 'item_standard', 1, 390, '{}', 'nice item'),
	('legcougars3', 'Legendary Sapa Cougar pelt', 20, 1, 'item_standard', 1, 391, '{}', 'nice item'),
	('legcougars4', 'Legendary Black Cougar pelt', 20, 1, 'item_standard', 1, 392, '{}', 'nice item'),
	('legcoyotes', 'Legendary Coyote skin', 20, 1, 'item_standard', 1, 408, '{}', 'nice item'),
	('legcoyotes1', 'Legendary Red Streak Coyote pelt', 20, 1, 'item_standard', 1, 386, '{}', 'nice item'),
	('legcoyotes2', 'Legendary Midnight Paw Coyote pelt', 20, 1, 'item_standard', 1, 387, '{}', 'nice item'),
	('legcoyotes3', 'Legendary Milk Coyote pelt', 20, 1, 'item_standard', 1, 388, '{}', 'nice item'),
	('legelkantler', 'Legendary Elk Antlers', 20, 1, 'item_standard', 1, 355, '{}', 'nice item'),
	('legelks', 'Legendary Elk pelt', 20, 1, 'item_standard', 1, 403, '{}', 'nice item'),
	('legelks1', 'Legendary Katata Elk pelt', 20, 1, 'item_standard', 1, 362, '{}', 'nice item'),
	('legelks2', 'Legendary Ozula Elk pelt', 20, 1, 'item_standard', 1, 363, '{}', 'nice item'),
	('legelks3', 'Legendary Inahme Elk pelt', 20, 1, 'item_standard', 1, 364, '{}', 'nice item'),
	('legendbuckantler', 'Legendary Buck Antlers', 20, 1, 'item_standard', 1, 356, '{}', 'nice item'),
	('legendsnakes', 'Legendary Boa pelt', 20, 1, 'item_standard', 1, 418, '{}', 'nice item'),
	('legfoxs2', 'Legendary Marble Fox pelt', 20, 1, 'item_standard', 1, 360, '{}', 'nice item'),
	('legfoxs3', 'Legendary Cross Fox pelt', 20, 1, 'item_standard', 1, 361, '{}', 'nice item'),
	('legfoxskin', 'Legendary Fox skin', 20, 1, 'item_standard', 1, 413, '{}', 'nice item'),
	('leggbears', 'Legendary Bear skin', 20, 1, 'item_standard', 1, 404, '{}', 'nice item'),
	('legmooseantler', 'Legendary Moose Antlers', 20, 1, 'item_standard', 1, 352, '{}', 'nice item'),
	('legmooses', 'Legendary Moose pelt', 20, 1, 'item_standard', 1, 405, '{}', 'nice item'),
	('legmooses1', 'Legendary Snowflake Moose pelt', 20, 1, 'item_standard', 1, 357, '{}', 'nice item'),
	('legmooses2', 'Legendary Knight Moose pelt', 20, 1, 'item_standard', 1, 358, '{}', 'nice item'),
	('legmooses3', 'Legendary Rudy Moose pelt', 20, 1, 'item_standard', 1, 359, '{}', 'nice item'),
	('legpanthers1', 'Legendary Nightwalker Panther pelt', 20, 1, 'item_standard', 1, 383, '{}', 'nice item'),
	('legpanthers2', 'Legendary Ghost Panther pelt', 20, 1, 'item_standard', 1, 384, '{}', 'nice item'),
	('legpanthers3', 'Legendary Iwakta Panther pelt', 20, 1, 'item_standard', 1, 385, '{}', 'nice item'),
	('legprongs', 'Legendary Pronghorn skin', 20, 1, 'item_standard', 1, 407, '{}', 'nice item'),
	('legramhorn', 'Legendary Ram Horns', 20, 1, 'item_standard', 1, 354, '{}', 'nice item'),
	('legrams', 'Legendary Ram pelt', 20, 1, 'item_standard', 1, 412, '{}', 'nice item'),
	('legrams1', 'Legendary Gabbro Horn Ram pelt', 20, 1, 'item_standard', 1, 372, '{}', 'nice item'),
	('legrams2', 'Legendary Chalk Horn Ram pelt', 20, 1, 'item_standard', 1, 373, '{}', 'nice item'),
	('legrams3', 'Legendary Rutile Horn Ram pelt', 20, 1, 'item_standard', 1, 374, '{}', 'nice item'),
	('legrams4', 'Legendary GreatHorn Ram pelt', 20, 1, 'item_standard', 1, 375, '{}', 'nice item'),
	('legwolfpelt', 'Legendary Wolf skin', 20, 1, 'item_standard', 1, 406, '{}', 'nice item'),
	('legwolfs1', 'Legendary Emerald Wolf pelt', 20, 1, 'item_standard', 1, 380, '{}', 'nice item'),
	('legwolfs2', 'Legendary Onyx Wolf pelt', 20, 1, 'item_standard', 1, 381, '{}', 'nice item'),
	('legwolfs3', 'Legendary Moonstone Wolf pelt', 20, 1, 'item_standard', 1, 382, '{}', 'nice item'),
	('lizardl', 'Lizard foot', 20, 1, 'item_standard', 1, 554, '{}', 'nice item'),
	('lizards', 'Lizard pelt', 20, 1, 'item_standard', 1, 553, '{}', 'nice item'),
	('lockpick', 'Lockpick', 5, 1, 'item_standard', 1, 205, '{}', 'nice item'),
	('lockpickmold', 'Lockpick Mold', 5, 1, 'item_standard', 1, 206, '{}', 'nice item'),
	('logbechs', 'Log Bench 2', 20, 1, 'item_standard', 1, 775, '{}', 'nice item'),
	('logbench', 'Log Bench 1', 20, 1, 'item_standard', 1, 774, '{}', 'nice item'),
	('log_bencha', 'Log Bench 1', 20, 1, 'item_standard', 1, 646, '{}', 'nice item'),
	('log_benchb', 'Log Bench 2', 20, 1, 'item_standard', 1, 647, '{}', 'nice item'),
	('loonb', 'Common loon beak', 20, 1, 'item_standard', 1, 538, '{}', 'nice item'),
	('loonf', 'Common loon feather', 20, 1, 'item_standard', 1, 537, '{}', 'nice item'),
	('loungechair', 'Lounge Chair', 20, 1, 'item_standard', 1, 598, '{}', 'nice item'),
	('loungechair2', 'Lounge Chair 2', 20, 1, 'item_standard', 1, 599, '{}', 'nice item'),
	('lumberaxe', 'Lumber Axe', 1, 1, 'item_standard', 1, 345, '{}', 'nice item'),
	('mackerel', 'Mackerel', 10, 1, 'item_standard', 0, 207, '{}', 'nice item'),
	('marriagebook', 'Marriage Book', 1, 1, 'item_standard', 1, 894, '{}', 'nice item'),
	('marriagecertification', 'Marriage Certify', 2, 1, 'item_standard', 1, 895, '{}', 'nice item'),
	('mashalaskan', 'Alaskan Gin Mash', 20, 1, 'item_standard', 1, 824, '{}', 'nice item'),
	('mashamerican', 'Alaskan Gin Mash', 20, 1, 'item_standard', 1, 825, '{}', 'nice item'),
	('mashapple', 'Apple Mash', 20, 1, 'item_standard', 1, 826, '{}', 'nice item'),
	('mashblackberry', 'Blackberry Mash', 20, 1, 'item_standard', 1, 827, '{}', 'nice item'),
	('mashblackberry90p', 'Blackberry Mash 90p', 20, 1, 'item_standard', 1, 828, '{}', 'nice item'),
	('mashpeach', 'Peach Mash', 20, 1, 'item_standard', 1, 829, '{}', 'nice item'),
	('mashplum', 'Plum Mash', 20, 1, 'item_standard', 1, 830, '{}', 'nice item'),
	('mashraspberry', 'Raspberry Mash', 20, 1, 'item_standard', 1, 831, '{}', 'nice item'),
	('mashraspberry90p', 'Raspberry Mash 90p', 20, 1, 'item_standard', 1, 832, '{}', 'nice item'),
	('mashstrong', 'Strong Mash Batch', 20, 1, 'item_standard', 1, 833, '{}', 'nice item'),
	('meat', 'Meat', 20, 1, 'item_standard', 1, 208, '{}', 'nice item'),
	('milk', 'Milk', 50, 1, 'item_standard', 1, 209, '{}', 'nice item'),
	('Milk_Weed', 'Milk Weed', 10, 1, 'item_standard', 1, 210, '{}', 'nice item'),
	('Milk_Weed_Seed', 'Milk Weed Seed', 10, 1, 'item_standard', 1, 211, '{}', 'nice item'),
	('moonshine', 'Moonshine', 10, 1, 'item_standard', 1, 212, '{}', 'nice item'),
	('mooseantler', 'Moose Antlers', 20, 1, 'item_standard', 1, 548, '{}', 'nice item'),
	('mooses', 'Moose pelt', 20, 1, 'item_standard', 1, 549, '{}', 'nice item'),
	('morpcert', 'Morphine Perscription', 10, 1, 'item_standard', 1, 213, '{}', 'nice item'),
	('morphine', 'Morphine', 10, 1, 'item_standard', 1, 214, '{}', 'nice item'),
	('mountainmen', 'Mountain Camp Set', 20, 1, 'item_standard', 1, 608, '{}', 'nice item'),
	('mp001_p_mp_still02x', 'Brennerei', 1, 1, 'item_standard', 1, 215, '{}', 'nice item'),
	('muskrats', 'Muskrat skin', 20, 1, 'item_standard', 1, 547, '{}', 'nice item'),
	('Mutton', 'Mutton', 20, 1, 'item_standard', 1, 216, '{}', 'nice item'),
	('nails', 'Nails', 40, 1, 'item_standard', 1, 217, '{}', 'nice item'),
	('nativebasket1', 'Native Basket 1', 20, 1, 'item_standard', 1, 593, '{}', 'nice item'),
	('nativebasket2', 'Native Basket 2', 20, 1, 'item_standard', 1, 594, '{}', 'nice item'),
	('nativedecor', 'Native Decor Set', 20, 1, 'item_standard', 1, 584, '{}', 'nice item'),
	('nativepot', 'Native Pot', 20, 1, 'item_standard', 1, 592, '{}', 'nice item'),
	('nativeskull', 'Native Decor 1', 20, 1, 'item_standard', 1, 595, '{}', 'nice item'),
	('naturalwagon', 'Naturalists Wagon Set', 20, 1, 'item_standard', 1, 605, '{}', 'nice item'),
	('newspaper', 'NewsPaper', 20, 1, 'item_standard', 1, 218, '{}', 'nice item'),
	('nightstand', 'night stand', 20, 1, 'item_standard', 1, 653, '{}', 'nice item'),
	('nitrite', 'Nitrite', 20, 1, 'item_standard', 1, 219, '{}', 'nice item'),
	('nitroglyserolia', 'Nitroglycerol', 30, 1, 'item_standard', 1, 220, '{}', 'nice item'),
	('normaltable', 'Table', 20, 1, 'item_standard', 1, 750, '{}', 'nice item'),
	('notebook', 'Notebook', 5, 1, 'item_standard', 1, 221, '{}', 'nice item'),
	('obed', 'Old bed', 20, 1, 'item_standard', 1, 664, '{}', 'nice item'),
	('Oleander_Sage', 'Oleander Sage', 10, 1, 'item_standard', 1, 222, '{}', 'nice item'),
	('Oleander_Sage_Seed', 'Oleander Sage Seed', 10, 1, 'item_standard', 1, 223, '{}', 'nice item'),
	('opossumc', 'Opossum claws', 20, 1, 'item_standard', 1, 515, '{}', 'nice item'),
	('opossums', 'Opossum skin', 20, 1, 'item_standard', 1, 514, '{}', 'nice item'),
	('orden_presidente', 'Order of the President', 10, 1, 'item_standard', 0, 224, '{}', 'nice item'),
	('Oregano', 'Oregano', 10, 1, 'item_standard', 1, 225, '{}', 'nice item'),
	('Oregano_Seed', 'Oregano Seed', 10, 1, 'item_standard', 1, 226, '{}', 'nice item'),
	('oriole2_c', 'Hooded Oriole', 20, 1, 'item_standard', 1, 430, '{}', 'nice item'),
	('oriole_c', 'Oriole', 20, 1, 'item_standard', 1, 429, '{}', 'nice item'),
	('owlf', 'Owl feather', 20, 1, 'item_standard', 1, 539, '{}', 'nice item'),
	('owlt', 'Owl claws', 20, 1, 'item_standard', 1, 540, '{}', 'nice item'),
	('oxhorn', 'Angus Bull horn', 20, 1, 'item_standard', 1, 545, '{}', 'nice item'),
	('oxs', 'Angus Bull pelt', 20, 1, 'item_standard', 1, 546, '{}', 'nice item'),
	('panthere', 'Panther eyes', 20, 1, 'item_standard', 1, 564, '{}', 'nice item'),
	('panthers', 'Panther skin', 20, 1, 'item_standard', 1, 563, '{}', 'nice item'),
	('paper', 'Paper', 20, 1, 'item_standard', 1, 227, '{}', 'nice item'),
	('parasol', 'Parasol', 1, 1, 'item_standard', 1, 343, '{}', 'nice item'),
	('Parasol_Mushroom', 'Parasol Mushroom', 10, 1, 'item_standard', 1, 228, '{}', 'nice item'),
	('Parasol_Mushroom_Seed', 'Parasol Mushroom Seed', 10, 1, 'item_standard', 1, 229, '{}', 'nice item'),
	('peachseeds', 'Peach Seeds', 10, 1, 'item_standard', 1, 735, '{}', 'nice item'),
	('peasantb', 'Peasant beak', 20, 1, 'item_standard', 1, 518, '{}', 'nice item'),
	('peasantf', 'Peasant feather', 20, 1, 'item_standard', 1, 517, '{}', 'nice item'),
	('pecaris', 'Peccary pelt', 20, 1, 'item_standard', 1, 550, '{}', 'nice item'),
	('pelicanb', 'Pelican beak', 20, 1, 'item_standard', 1, 520, '{}', 'nice item'),
	('pelicanf', 'Pelican feather', 20, 1, 'item_standard', 1, 519, '{}', 'nice item'),
	('pen', 'Pen', 2, 1, 'item_standard', 0, 896, '{}', 'nice item'),
	('pheasant_taxidermy', 'Pheasant Taxidermy', 20, 1, 'item_standard', 1, 641, '{}', 'nice item'),
	('phestaxi', 'Pheasant Taxidermy', 20, 1, 'item_standard', 1, 769, '{}', 'nice item'),
	('pickaxe', 'Pickaxe', 1, 1, 'item_standard', 0, 230, '{}', 'nice item'),
	('pigeon_c', 'Pigeon', 20, 1, 'item_standard', 1, 431, '{}', 'nice item'),
	('pigs', 'Pig pelt', 20, 1, 'item_standard', 1, 516, '{}', 'nice item'),
	('pipe', 'Pipe', 5, 1, 'item_standard', 1, 231, '{}', 'nice item'),
	('pipecopper', 'Copper Pipe', 5, 1, 'item_standard', 1, 835, '{}', 'nice item'),
	('planttrimmer', 'Plant Trimmer', 10, 1, 'item_standard', 1, 678, '{}', 'nice item'),
	('pocket_watch', 'Pocket Watch', 5, 1, 'item_standard', 1, 232, '{}', 'nice item'),
	('pokerset', 'Poker Table Set', 20, 1, 'item_standard', 1, 579, '{}', 'nice item'),
	('pork', 'Pork', 20, 1, 'item_standard', 1, 571, '{}', 'nice item'),
	('porkfat', 'Pig fat', 20, 1, 'item_standard', 1, 458, '{}', 'nice item'),
	('pot', 'Distillery Pot', 1, 1, 'item_standard', 1, 836, '{}', 'nice item'),
	('pota', 'House Pot', 20, 1, 'item_standard', 1, 626, '{}', 'nice item'),
	('potato', 'Potato', 20, 1, 'item_standard', 1, 233, '{}', 'nice item'),
	('potatoseed', 'Potato Seed', 10, 1, 'item_standard', 1, 731, '{}', 'nice item'),
	('prairib', 'Prairi chicken beak', 20, 1, 'item_standard', 1, 509, '{}', 'nice item'),
	('Prairie_Poppy', 'Prairie Poppy', 10, 1, 'item_standard', 1, 234, '{}', 'nice item'),
	('Prairie_Poppy_Seed', 'Prairie Poppy Seed', 10, 1, 'item_standard', 1, 235, '{}', 'nice item'),
	('prairif', 'Prairi chicken feather', 20, 1, 'item_standard', 1, 508, '{}', 'nice item'),
	('pronghornh', 'Pronghorn horn', 20, 1, 'item_standard', 1, 511, '{}', 'nice item'),
	('prongs', 'Pronghorn skin', 20, 1, 'item_standard', 1, 510, '{}', 'nice item'),
	('provision_jail_keys', 'Jail Keys', 10, 1, 'item_standard', 1, 236, '{}', 'nice item'),
	('pulp', 'Pulp', 20, 1, 'item_standard', 0, 237, '{}', 'nice item'),
	('p_baitBread01x', 'Bread Bait', 20, 1, 'item_standard', 1, 838, '{}', 'nice item'),
	('p_barrelmoonshine', 'Barrel', 1, 1, 'item_standard', 1, 238, '{}', 'nice item'),
	('quailb', 'Quail beak', 20, 1, 'item_standard', 1, 471, '{}', 'nice item'),
	('quailf', 'Quail feather', 20, 1, 'item_standard', 1, 470, '{}', 'nice item'),
	('quartz', 'Quartz', 20, 1, 'item_standard', 1, 239, '{}', 'nice item'),
	('rabbitpaw', 'Rabbitfoot', 20, 1, 'item_standard', 1, 507, '{}', 'nice item'),
	('rabbits', 'Rabbitskin', 20, 1, 'item_standard', 1, 506, '{}', 'nice item'),
	('raccoons', 'Raccoon skin', 20, 1, 'item_standard', 1, 504, '{}', 'nice item'),
	('raccoont', 'Raccoon tooth', 20, 1, 'item_standard', 1, 505, '{}', 'nice item'),
	('rajahdysoljy', 'Explosive Oil', 30, 1, 'item_standard', 1, 240, '{}', 'nice item'),
	('ramhorn', 'Ram Horn', 20, 1, 'item_standard', 1, 454, '{}', 'nice item'),
	('rams', 'Ram pelt', 20, 1, 'item_standard', 1, 455, '{}', 'nice item'),
	('Rams_Head', 'Rams Head', 10, 1, 'item_standard', 1, 241, '{}', 'nice item'),
	('Rams_Head_Seed', 'Rams Head Seed', 10, 1, 'item_standard', 1, 242, '{}', 'nice item'),
	('raspberryale', 'Raspberry Ale', 10, 1, 'item_standard', 1, 243, '{}', 'nice item'),
	('rat_c', 'Rat', 20, 1, 'item_standard', 1, 432, '{}', 'nice item'),
	('ravenc', 'Raven claws', 20, 1, 'item_standard', 1, 502, '{}', 'nice item'),
	('ravenf', 'Raven feather', 20, 1, 'item_standard', 1, 503, '{}', 'nice item'),
	('rectable', 'Rectangle Table', 20, 1, 'item_standard', 1, 751, '{}', 'nice item'),
	('rectangle_table', 'Rectangle Table', 20, 1, 'item_standard', 1, 623, '{}', 'nice item'),
	('Red_Raspberry', 'Red Raspberry', 10, 1, 'item_standard', 1, 244, '{}', 'nice item'),
	('Red_Raspberry_Seed', 'Red Raspberry Seed', 10, 1, 'item_standard', 1, 245, '{}', 'nice item'),
	('Red_Sage', 'Red Sage', 10, 1, 'item_standard', 1, 246, '{}', 'nice item'),
	('Red_Sage_Seed', 'Red Sage Seed', 10, 1, 'item_standard', 1, 247, '{}', 'nice item'),
	('repeaterbarrel', 'Repeater Barrel', 5, 1, 'item_standard', 1, 248, '{}', 'nice item'),
	('repeatermold', 'Repeater Mold', 5, 1, 'item_standard', 1, 249, '{}', 'nice item'),
	('repeaterreceiver', 'Repeater Receiver', 5, 1, 'item_standard', 1, 250, '{}', 'nice item'),
	('repeaterrecmold', 'Repeater Receiver Mold', 5, 1, 'item_standard', 1, 251, '{}', 'nice item'),
	('repeaterstock', 'Repeater Stock', 5, 1, 'item_standard', 1, 252, '{}', 'nice item'),
	('revolverbarrel', 'Revolver Barrel', 5, 1, 'item_standard', 1, 253, '{}', 'nice item'),
	('revolvercylinder', 'Revolver Cylinder', 5, 1, 'item_standard', 1, 254, '{}', 'nice item'),
	('revolverhandle', 'Revolver Handle', 5, 1, 'item_standard', 1, 255, '{}', 'nice item'),
	('revolvermold', 'Revolver Mold', 5, 1, 'item_standard', 1, 256, '{}', 'nice item'),
	('riflebarrel', 'Rifle Barrel', 5, 1, 'item_standard', 1, 257, '{}', 'nice item'),
	('riflemold', 'Rifle Mold', 5, 1, 'item_standard', 1, 258, '{}', 'nice item'),
	('riflereceiver', 'Rifle Receiver', 5, 1, 'item_standard', 1, 259, '{}', 'nice item'),
	('riflerecmold', 'Rifle Receiver Mold', 5, 1, 'item_standard', 1, 260, '{}', 'nice item'),
	('riflestock', 'Rifle Stock', 5, 1, 'item_standard', 1, 261, '{}', 'nice item'),
	('roach', 'Roach', 10, 1, 'item_standard', 0, 262, '{}', 'nice item'),
	('robberyplanning', 'Robbery Planning Set', 20, 1, 'item_standard', 1, 604, '{}', 'nice item'),
	('robin_c', 'Robin', 20, 1, 'item_standard', 1, 433, '{}', 'nice item'),
	('rock', 'Rock', 30, 1, 'item_standard', 0, 263, '{}', 'nice item'),
	('rollingpaper', 'Rolling paper', 30, 1, 'item_standard', 1, 264, '{}', 'nice item'),
	('roundtable', 'Round Table', 20, 1, 'item_standard', 1, 749, '{}', 'nice item'),
	('round_table', 'Round Table', 20, 1, 'item_standard', 1, 621, '{}', 'nice item'),
	('rspoonb', 'Roseta Spoonbill beak', 20, 1, 'item_standard', 1, 497, '{}', 'nice item'),
	('rspoonf', 'Roseta Spoonbill feather', 20, 1, 'item_standard', 1, 496, '{}', 'nice item'),
	('rubber', 'Rubber', 20, 1, 'item_standard', 0, 265, '{}', 'nice item'),
	('rubbertube', 'Rubber Tube', 5, 1, 'item_standard', 0, 841, '{}', 'nice item'),
	('salamelle', 'Fresh Pork ', 20, 1, 'item_standard', 1, 266, '{}', 'nice item'),
	('salmon', 'Salmon', 10, 1, 'item_standard', 0, 267, '{}', 'nice item'),
	('salt', 'Salt', 20, 1, 'item_standard', 1, 268, '{}', 'nice item'),
	('Saltbush', 'Saltbush', 10, 1, 'item_standard', 1, 269, '{}', 'nice item'),
	('Saltbush_Seed', 'Saltbush Seed', 10, 1, 'item_standard', 1, 270, '{}', 'nice item'),
	('sap', 'Sap', 20, 1, 'item_standard', 0, 271, '{}', 'nice item'),
	('sarsaparilla', 'Sarsaparilla', 10, 1, 'item_standard', 1, 272, '{}', 'nice item'),
	('scale', 'Scale', 5, 1, 'item_standard', 1, 273, '{}', 'nice item'),
	('scentg', 'Scent glad', 20, 1, 'item_standard', 1, 492, '{}', 'nice item'),
	('seagullb', 'Seagull beak', 20, 1, 'item_standard', 1, 495, '{}', 'nice item'),
	('seagullf', 'Seagull feather', 20, 1, 'item_standard', 1, 494, '{}', 'nice item'),
	('secondchance', 'Second Chance', 10, 1, 'item_standard', 1, 274, '{}', 'nice item'),
	('sheephead', 'Sheep head', 20, 1, 'item_standard', 1, 493, '{}', 'nice item'),
	('shellcasing', 'Shell Casing', 40, 1, 'item_standard', 1, 275, '{}', 'nice item'),
	('shootingtarget', 'Shooting Target', 20, 1, 'item_standard', 1, 613, '{}', 'nice item'),
	('shotgunbarrel', 'Shotgun Barrel', 5, 1, 'item_standard', 1, 276, '{}', 'nice item'),
	('shotgunmold', 'Shotgun Mold', 5, 1, 'item_standard', 1, 277, '{}', 'nice item'),
	('shotgunstock', 'Shotgun Stock', 5, 1, 'item_standard', 1, 278, '{}', 'nice item'),
	('shrimps', 'Shrimp Stew', 1, 1, 'item_standard', 1, 279, '{}', 'nice item'),
	('sidetable', 'side table 1', 20, 1, 'item_standard', 1, 782, '{}', 'nice item'),
	('sidetablea', 'side table 2', 20, 1, 'item_standard', 1, 783, '{}', 'nice item'),
	('sidetableb', 'side table 3', 20, 1, 'item_standard', 1, 784, '{}', 'nice item'),
	('side_table', 'side table 1', 20, 1, 'item_standard', 1, 654, '{}', 'nice item'),
	('side_tablea', 'side table 2', 20, 1, 'item_standard', 1, 655, '{}', 'nice item'),
	('side_tableb', 'side table 3', 20, 1, 'item_standard', 1, 656, '{}', 'nice item'),
	('singlebed', 'single bed', 20, 1, 'item_standard', 1, 666, '{}', 'nice item'),
	('skullpost', 'Skull Post', 20, 1, 'item_standard', 1, 597, '{}', 'nice item'),
	('smallchest', 'Small Chest', 1, 1, 'item_standard', 1, 657, '{}', 'nice item'),
	('smallmcandle', 'Small Melted Candle', 20, 1, 'item_standard', 1, 662, '{}', 'nice item'),
	('Small_Leather', 'Small Leather', 10, 1, 'item_standard', 1, 280, '{}', 'nice item'),
	('SnakeSkin', 'Snake Skin', 20, 1, 'item_standard', 1, 281, '{}', 'nice item'),
	('snaket', 'Snake tooth', 20, 1, 'item_standard', 1, 490, '{}', 'nice item'),
	('Snake_Poison', 'Snake Poison', 10, 1, 'item_standard', 1, 282, '{}', 'nice item'),
	('soborno', 'Soborno Alcohol', 15, 1, 'item_standard', 0, 283, '{}', 'nice item'),
	('songbird2_c', 'Scarlet songbird', 20, 1, 'item_standard', 1, 435, '{}', 'nice item'),
	('songbird_c', 'Songbird', 20, 1, 'item_standard', 1, 434, '{}', 'nice item'),
	('sparrow0_c', 'Common Sparrow', 20, 1, 'item_standard', 1, 436, '{}', 'nice item'),
	('sparrow1_c', 'Sparrow', 20, 1, 'item_standard', 1, 437, '{}', 'nice item'),
	('sparrow2_c', 'Golden Sparrow', 20, 1, 'item_standard', 1, 438, '{}', 'nice item'),
	('squirrel_black_c', 'Black Squirrel', 20, 1, 'item_standard', 1, 441, '{}', 'nice item'),
	('squirrel_grey_c', 'Gray Squirrel', 20, 1, 'item_standard', 1, 439, '{}', 'nice item'),
	('squirrel_red_c', 'Red Squirrel', 20, 1, 'item_standard', 1, 440, '{}', 'nice item'),
	('standard_table', 'Table', 20, 1, 'item_standard', 1, 622, '{}', 'nice item'),
	('standingtorch', 'Stading Torch', 20, 1, 'item_standard', 1, 612, '{}', 'nice item'),
	('steak', 'Steak', 10, 1, 'item_standard', 1, 284, '{}', 'nice item'),
	('steakveg', 'Steak with Veggies', 10, 1, 'item_standard', 1, 285, '{}', 'nice item'),
	('stillkit', 'Still Kit', 5, 1, 'item_standard', 1, 843, '{}', 'nice item'),
	('stim', 'Horse Stimulant', 2, 1, 'item_standard', 1, 286, '{}', 'nice item'),
	('stolenmerch', 'Stolen Items', 10, 1, 'item_standard', 0, 287, '{}', 'nice item'),
	('stonehammer', 'Stone Hammer', 5, 1, 'item_standard', 1, 288, '{}', 'nice item'),
	('stringy', 'Stringy meat', 20, 1, 'item_standard', 1, 574, '{}', 'nice item'),
	('sugar', 'Sugar', 20, 1, 'item_standard', 0, 289, '{}', 'nice item'),
	('sugarcaneseed', 'Surgarcane seed', 10, 1, 'item_standard', 1, 290, '{}', 'nice item'),
	('sugarcube', 'Sugar Cube', 10, 1, 'item_standard', 1, 347, '{}', 'nice item'),
	('sulfur', 'Sulfur', 30, 1, 'item_standard', 0, 291, '{}', 'nice item'),
	('syn', 'Syn', 50, 1, 'item_standard', 1, 292, '{}', 'nice item'),
	('synpackage', 'Syn Package', 10, 1, 'item_standard', 1, 293, '{}', 'nice item'),
	('syringe', 'Syringe', 20, 1, 'item_standard', 1, 294, '{}', 'nice item'),
	('syringecert', 'Syringe Cert', 10, 1, 'item_standard', 1, 295, '{}', 'nice item'),
	('tent', 'Tent', 1, 1, 'item_standard', 1, 296, '{}', 'nice item'),
	('tent2', 'Trader Tent', 20, 1, 'item_standard', 1, 588, '{}', 'nice item'),
	('tent3', 'Simple Tent', 20, 1, 'item_standard', 1, 589, '{}', 'nice item'),
	('tent4', 'Canvas Shade', 20, 1, 'item_standard', 1, 590, '{}', 'nice item'),
	('tequila', 'Tequila', 10, 1, 'item_standard', 1, 297, '{}', 'nice item'),
	('Texas_Bonnet', 'Texas Bonnet', 10, 1, 'item_standard', 1, 298, '{}', 'nice item'),
	('Texas_Bonnet_Seed', 'Texas Bonnet Seed', 10, 1, 'item_standard', 1, 299, '{}', 'nice item'),
	('timbertable', 'Timber Table', 20, 1, 'item_standard', 1, 752, '{}', 'nice item'),
	('timber_table', 'Timber Table', 20, 1, 'item_standard', 1, 624, '{}', 'nice item'),
	('tipi', 'Native Tipi', 20, 1, 'item_standard', 1, 596, '{}', 'nice item'),
	('toaddesert_c', 'Desert Toad', 20, 1, 'item_standard', 1, 444, '{}', 'nice item'),
	('toadpoison_c', 'Poisoned Toad', 20, 1, 'item_standard', 1, 443, '{}', 'nice item'),
	('toad_c', 'Toad', 20, 1, 'item_standard', 1, 442, '{}', 'nice item'),
	('token', 'Camp License', 5, 1, 'item_standard', 1, 300, '{}', 'nice item'),
	('toolbarrel', 'Tool Barrel', 20, 1, 'item_standard', 1, 767, '{}', 'nice item'),
	('tool_barrel', 'Tool Barrel', 20, 1, 'item_standard', 1, 639, '{}', 'nice item'),
	('trainkey', 'Train Key', 1, 1, 'item_standard', 1, 301, '{}', 'nice item'),
	('trayoffood', 'Serving Table', 20, 1, 'item_standard', 1, 614, '{}', 'nice item'),
	('tropicalPunchMash', 'Ginseng Mash', 10, 1, 'item_standard', 0, 302, '{}', 'nice item'),
	('tropicalPunchMoonshine', 'Ginseng Moonshine', 10, 1, 'item_standard', 0, 303, '{}', 'nice item'),
	('trout', 'Trout', 10, 1, 'item_standard', 0, 304, '{}', 'nice item'),
	('turkeyb', 'Turkey beak', 20, 1, 'item_standard', 1, 484, '{}', 'nice item'),
	('turkeyf', 'Turkey feather', 20, 1, 'item_standard', 1, 483, '{}', 'nice item'),
	('TurtleShell', 'Turtle Shell', 20, 1, 'item_standard', 1, 305, '{}', 'nice item'),
	('turtlet', 'Turtle tooth', 20, 1, 'item_standard', 1, 482, '{}', 'nice item'),
	('tylenol', 'Tylenol', 10, 1, 'item_standard', 1, 306, '{}', 'nice item'),
	('undertaker1', 'Coffin', 20, 1, 'item_standard', 1, 609, '{}', 'nice item'),
	('undertaker2', 'Flower Coffin', 20, 1, 'item_standard', 1, 610, '{}', 'nice item'),
	('unique_brad_horsesugar', 'Brad Horse Sugar', 5, 1, 'item_standard', 1, 350, '{}', 'nice item'),
	('unique_horse_feed', 'Horse Feed', 5, 1, 'item_standard', 1, 349, '{}', 'nice item'),
	('vanillaFlower', 'Vanille Flower', 20, 1, 'item_standard', 0, 307, '{}', 'nice item'),
	('venison', 'Venison', 20, 1, 'item_standard', 1, 566, '{}', 'nice item'),
	('Violet_Snowdrop', 'Violet Snowdrop', 10, 1, 'item_standard', 1, 308, '{}', 'nice item'),
	('Violet_Snowdrop_Seed', 'Violet Snowdrop Seed', 10, 1, 'item_standard', 1, 309, '{}', 'nice item'),
	('vodka', 'Vodka', 10, 1, 'item_standard', 1, 310, '{}', 'nice item'),
	('Volture_Egg', 'Volture Egg', 10, 1, 'item_standard', 1, 311, '{}', 'nice item'),
	('vulturetaxi', 'Vulture Taxidermy', 20, 1, 'item_standard', 1, 772, '{}', 'nice item'),
	('vulture_taxidermy', 'Vulture Taxidermy', 20, 1, 'item_standard', 1, 644, '{}', 'nice item'),
	('washtub', 'Wash Tub', 20, 1, 'item_standard', 1, 637, '{}', 'nice item'),
	('water', 'Water', 15, 1, 'item_standard', 1, 312, '{}', 'nice item'),
	('waterbarrel', 'Water Barrel', 20, 1, 'item_standard', 1, 587, '{}', 'nice item'),
	('wateringcan', 'Water Jug', 10, 1, 'item_standard', 1, 313, '{}', 'nice item'),
	('wateringcan_dirtywater', 'Dirty Watering Jug', 10, 1, 'item_standard', 1, 314, '{}', 'nice item'),
	('wateringcan_empty', 'Empty Watering Jug', 10, 1, 'item_standard', 1, 315, '{}', 'nice item'),
	('waterpump', 'Water Pump', 20, 1, 'item_standard', 1, 755, '{}', 'nice item'),
	('water_pump', 'Water Pump', 20, 1, 'item_standard', 1, 627, '{}', 'nice item'),
	('whisky', 'Whisky', 10, 1, 'item_standard', 1, 316, '{}', 'nice item'),
	('wickerbench', 'Wicker Bench', 20, 1, 'item_standard', 1, 778, '{}', 'nice item'),
	('wicker_bench', 'Wicker Bench', 20, 1, 'item_standard', 1, 650, '{}', 'nice item'),
	('wildCiderMash', 'Black Berry Mash', 10, 1, 'item_standard', 0, 317, '{}', 'nice item'),
	('wildCiderMoonshine', 'Black Berry Moonshine', 10, 1, 'item_standard', 0, 318, '{}', 'nice item'),
	('Wild_Carrot', 'Wild Carrot', 10, 1, 'item_standard', 1, 319, '{}', 'nice item'),
	('Wild_Carrot_Seed', 'Wild Carrot Seed', 10, 1, 'item_standard', 1, 320, '{}', 'nice item'),
	('Wild_Feverfew', 'Wild Feverfew', 10, 1, 'item_standard', 1, 321, '{}', 'nice item'),
	('Wild_Feverfew_Seed', 'Wild Feverfew Seed', 10, 1, 'item_standard', 1, 322, '{}', 'nice item'),
	('Wild_Mint', 'Wild Mint', 10, 1, 'item_standard', 1, 323, '{}', 'nice item'),
	('Wild_Mint_Seed', 'Wild Mint Seed', 10, 1, 'item_standard', 1, 324, '{}', 'nice item'),
	('Wild_Rhubarb', 'Wild Rhubarb', 10, 1, 'item_standard', 1, 325, '{}', 'nice item'),
	('Wild_Rhubarb_Seed', 'Wild Rhubarb Seed', 10, 1, 'item_standard', 1, 326, '{}', 'nice item'),
	('wine', 'Wine', 10, 1, 'item_standard', 1, 327, '{}', 'nice item'),
	('Wintergreen_Berry', 'Wintergreen Berry', 10, 1, 'item_standard', 1, 328, '{}', 'nice item'),
	('Wintergreen_Berry_Seed', 'Wintergreen Berry Seed', 10, 1, 'item_standard', 1, 329, '{}', 'nice item'),
	('Wisteria', 'Wisteria', 10, 1, 'item_standard', 1, 330, '{}', 'nice item'),
	('Wisteria_Seed', 'Wisteria Seed', 10, 1, 'item_standard', 1, 331, '{}', 'nice item'),
	('wojape', 'Wojape', 5, 1, 'item_standard', 1, 332, '{}', 'nice item'),
	('wolfheart', 'Wolf heart', 20, 1, 'item_standard', 1, 476, '{}', 'nice item'),
	('wolfpelt', 'Wolf skin', 20, 1, 'item_standard', 1, 477, '{}', 'nice item'),
	('wolftooth', 'Wolf tooth', 20, 1, 'item_standard', 1, 478, '{}', 'nice item'),
	('wood', 'Soft Wood', 20, 1, 'item_standard', 0, 333, '{}', 'nice item'),
	('woodbench', 'Wooden Bench', 20, 1, 'item_standard', 1, 777, '{}', 'nice item'),
	('woodchair', 'Wood Chair', 20, 1, 'item_standard', 1, 747, '{}', 'nice item'),
	('wooden_bench', 'Wooden Bench', 20, 1, 'item_standard', 1, 649, '{}', 'nice item'),
	('wooden_boards', 'Wooden Boards', 25, 1, 'item_standard', 0, 334, '{}', 'nice item'),
	('woodpeck01_c', 'Woodpecker', 20, 1, 'item_standard', 1, 445, '{}', 'nice item'),
	('woodpeck02_c', 'Woodpecker 2', 20, 1, 'item_standard', 1, 446, '{}', 'nice item'),
	('wood_chair', 'Wood Chair', 20, 1, 'item_standard', 1, 619, '{}', 'nice item'),
	('wool', 'Wool', 50, 1, 'item_standard', 1, 335, '{}', 'nice item'),
	('wsnakes', 'Western rattlesnake pelt', 20, 1, 'item_standard', 1, 489, '{}', 'nice item'),
	('wsnakeskin', 'Watersnake pelt', 20, 1, 'item_standard', 1, 485, '{}', 'nice item'),
	('Yarrow', 'Yarrow', 10, 1, 'item_standard', 1, 336, '{}', 'nice item'),
	('Yarrow_Seed', 'Yarrow Seed', 10, 1, 'item_standard', 1, 337, '{}', 'nice item');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.items_crafted
CREATE TABLE IF NOT EXISTS `items_crafted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`),
  KEY `crafted_item_idx` (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.items_crafted: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `items_crafted` DISABLE KEYS */;
INSERT INTO `items_crafted` (`id`, `character_id`, `item_id`, `updated_at`, `metadata`) VALUES
	(1, 1, 36, '2023-05-04 23:00:56', '[]'),
	(2, 1, 133, '2023-05-04 23:00:56', '[]');
/*!40000 ALTER TABLE `items_crafted` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.jail
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `characterid` varchar(5) NOT NULL DEFAULT '0',
  `time` varchar(100) NOT NULL DEFAULT '0',
  `time_s` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle vorp.jail: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `jail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jail` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.loadout
CREATE TABLE IF NOT EXISTS `loadout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ammo` varchar(255) NOT NULL DEFAULT '{}',
  `components` varchar(255) NOT NULL DEFAULT '{}',
  `dirtlevel` double DEFAULT 0,
  `mudlevel` double DEFAULT 0,
  `conditionlevel` double DEFAULT 0,
  `rustlevel` double DEFAULT 0,
  `used` tinyint(4) DEFAULT 0,
  `used2` tinyint(4) DEFAULT 0,
  `dropped` int(11) NOT NULL DEFAULT 0,
  `comps` longtext NOT NULL DEFAULT '{}',
  `label` varchar(50) DEFAULT NULL,
  `curr_inv` varchar(100) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `FK_loadout_users` (`identifier`),
  CONSTRAINT `FK_loadout_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.loadout: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `loadout` DISABLE KEYS */;
INSERT INTO `loadout` (`id`, `identifier`, `charidentifier`, `name`, `ammo`, `components`, `dirtlevel`, `mudlevel`, `conditionlevel`, `rustlevel`, `used`, `used2`, `dropped`, `comps`, `label`, `curr_inv`) VALUES
	(1, 'steam:110000102bfe58a', 1, 'WEAPON_MELEE_KNIFE', '[]', '[]', 0, 0, 0, 0, 0, 0, 0, '{}', NULL, 'default'),
	(2, 'steam:110000102bfe58a', 1, 'WEAPON_PISTOL_VOLCANIC', '{"nothing":0}', '["nothing"]', 0, 0, 0, 0, 0, 0, 0, '{}', NULL, 'default');
/*!40000 ALTER TABLE `loadout` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.mailbox_mails
CREATE TABLE IF NOT EXISTS `mailbox_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(50) DEFAULT NULL,
  `sender_firstname` varchar(50) DEFAULT NULL,
  `sender_lastname` varchar(50) DEFAULT NULL,
  `receiver_id` varchar(50) DEFAULT NULL,
  `receiver_firstname` varchar(50) DEFAULT NULL,
  `receiver_lastname` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `opened` tinyint(1) DEFAULT 0,
  `received_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.mailbox_mails: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `mailbox_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailbox_mails` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.outfits
CREATE TABLE IF NOT EXISTS `outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comps` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.outfits: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `outfits` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interiorId` int(11) NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `identifier` varchar(60) NOT NULL,
  `charidentifier` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.rooms: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.stables
CREATE TABLE IF NOT EXISTS `stables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `modelname` varchar(70) NOT NULL,
  `type` varchar(11) NOT NULL,
  `status` longtext DEFAULT NULL,
  `xp` int(11) DEFAULT 0,
  `injured` int(11) DEFAULT 0,
  `gear` longtext DEFAULT NULL,
  `isDefault` int(11) NOT NULL DEFAULT 0,
  `inventory` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.stables: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `stables` DISABLE KEYS */;
/*!40000 ALTER TABLE `stables` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` tinyint(1) DEFAULT NULL,
  `banneduntil` int(10) DEFAULT 0,
  `char` varchar(50) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.users: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `group`, `warnings`, `banned`, `banneduntil`, `char`) VALUES
	('steam:110000102bfe58a', 'user', 0, 0, 0, 'false');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.wagons
CREATE TABLE IF NOT EXISTS `wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `charid` int(11) NOT NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `model` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `items` longtext DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `FK_horses_characters` (`charid`),
  KEY `model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle vorp.wagons: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `wagons` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagons` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.wagon_water
CREATE TABLE IF NOT EXISTS `wagon_water` (
  `identifier` varchar(255) COLLATE latin1_general_cs DEFAULT '0',
  `charid` varchar(255) COLLATE latin1_general_cs DEFAULT '0',
  `wagon` varchar(255) COLLATE latin1_general_cs DEFAULT '0',
  `water` varchar(255) COLLATE latin1_general_cs DEFAULT '0',
  `wagon_name` varchar(50) COLLATE latin1_general_cs DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- Exportiere Daten aus Tabelle vorp.wagon_water: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `wagon_water` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagon_water` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle vorp.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `firstconnection` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE,
  CONSTRAINT `FK_characters_whitelist` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle vorp.whitelist: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
INSERT INTO `whitelist` (`id`, `identifier`, `status`, `firstconnection`) VALUES
	(1, 'steam:110000102bfe58a', 0, 0);
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
