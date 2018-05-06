-- phpMyAdmin SQL Dump
-- version 4.1.0
-- http://www.phpmyadmin.net
--
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Slug` varchar(50) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ConfirmationMessage` varchar(300) NOT NULL,
  `Theme` varchar(50) DEFAULT NULL,
  `NotificationEmail` varchar(50) DEFAULT NULL,
  `DateAdded` timestamp NULL DEFAULT NULL,
  `ExtendedProperties` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;


--
-- Table structure for table `form_field_values`
--

CREATE TABLE IF NOT EXISTS `form_field_values` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FieldId` int(11) NOT NULL,
  `EntryId` char(38) NOT NULL,
  `Value` varchar(500) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsComplete` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FieldId` (`FieldId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1019 ;

--
-- Table structure for table `form_fields`
--

CREATE TABLE IF NOT EXISTS `form_fields` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) DEFAULT NULL,
  `Text` varchar(50) DEFAULT NULL,
  `FieldType` varchar(20) DEFAULT NULL,
  `IsRequired` tinyint(1) DEFAULT NULL,
  `MaxChars` int(11) DEFAULT NULL,
  `HoverText` varchar(150) DEFAULT NULL,
  `Hint` varchar(150) DEFAULT NULL,
  `SubLabel` varchar(50) DEFAULT NULL,
  `Size` varchar(10) DEFAULT NULL,
  `SelectedOption` varchar(50) NOT NULL,
  `Columns` int(11) DEFAULT NULL,
  `Rows` int(11) DEFAULT NULL,
  `Options` varchar(300) DEFAULT NULL,
  `Validation` varchar(50) DEFAULT NULL,
  `DomId` int(11) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `MinimumAge` int(11) DEFAULT NULL,
  `MaximumAge` int(11) DEFAULT NULL,
  `HelpText` varchar(50) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MaxFilesizeInKb` int(11) DEFAULT NULL,
  `MinFilesizeInKb` int(11) DEFAULT NULL,
  `ValidFileExtensions` varchar(50) DEFAULT NULL,
  `ExtendedProperties` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=458 ;


--
-- Table structure for table `form_form_fields`
--

CREATE TABLE IF NOT EXISTS `form_form_fields` (
  `formId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  PRIMARY KEY (`formId`,`fieldId`),
  KEY `fk_form_fields_form_form_fields` (`fieldId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `form_field_values`
--
ALTER TABLE `form_field_values` ADD CONSTRAINT `fk_form_fields_form_field_values` FOREIGN KEY (`FieldId`) REFERENCES `form_fields` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_form_fields`
--
ALTER TABLE `form_form_fields`
  ADD CONSTRAINT `fk_form_fields_form_form_fields` FOREIGN KEY (`fieldId`) REFERENCES `form_fields` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_form_form_form_fields` FOREIGN KEY (`formId`) REFERENCES `form` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;