-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2013 at 11:09 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_mis_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `mis_business_components`
--

CREATE TABLE IF NOT EXISTS `mis_business_components` (
  `file_id` bigint(20) unsigned NOT NULL COMMENT 'foreign key from files table',
  `value_propositions` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mis_external_environments`
--

CREATE TABLE IF NOT EXISTS `mis_external_environments` (
  `file_id` bigint(20) unsigned NOT NULL COMMENT 'foreign key from files table',
  `external_environment` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mis_files`
--

CREATE TABLE IF NOT EXISTS `mis_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_type_id` bigint(20) unsigned NOT NULL COMMENT 'a constant in the application',
  `name` varchar(70) DEFAULT NULL,
  `description` text,
  `start` date DEFAULT NULL COMMENT 'start date at which this file is effective',
  `end` date DEFAULT NULL COMMENT 'end date at which this file is effective',
  `created` datetime DEFAULT NULL COMMENT 'date the file was created',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date the file was last updated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `i_type` (`file_type_id`,`name`) COMMENT 'unique name per type',
  KEY `i_name` (`name`),
  KEY `start` (`start`),
  KEY `end` (`end`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='common field among other tables' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `mis_people`
--

CREATE TABLE IF NOT EXISTS `mis_people` (
  `file_id` bigint(20) unsigned NOT NULL COMMENT 'foreign key from files table',
  `population` double unsigned NOT NULL,
  `age_start` tinyint(3) unsigned NOT NULL,
  `age_end` tinyint(3) unsigned NOT NULL,
  `country` char(2) DEFAULT NULL,
  `state` char(5) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `zip_code` int(10) unsigned NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `i_population` (`population`),
  KEY `i_age_start` (`age_start`),
  KEY `i_age_end` (`age_end`),
  KEY `i_country` (`country`),
  KEY `i_state` (`state`),
  KEY `i_city` (`city`),
  KEY `i_zip_code` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mis_user`
--

CREATE TABLE IF NOT EXISTS `mis_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mis_user`
--

INSERT INTO `mis_user` (`id`, `username`, `password`, `email`) VALUES
(1, 'admin', 'admin', 'admin@example.com'),
(2, 'test1', 'pass1', 'test1@example.com'),
(3, 'test2', 'pass2', 'test2@example.com'),
(4, 'test3', 'pass3', 'test3@example.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
