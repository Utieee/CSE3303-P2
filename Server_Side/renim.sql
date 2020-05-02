-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2020 at 04:35 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `renim`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `BuyerID` varchar(6) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `NoOfItems` int(255) NOT NULL,
  `FName` varchar(100) NOT NULL,
  `LName` varchar(100) NOT NULL,
  `BProductID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` varchar(6) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `NoOfItems` int(255) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `end-product`
--

CREATE TABLE `end-product` (
  `ProductID` varchar(6) NOT NULL,
  `CommercialApplication` varchar(500) NOT NULL,
  `CompostMaterial` varchar(500) NOT NULL,
  `EPOrderID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `FName` varchar(15) NOT NULL,
  `LName` varchar(15) NOT NULL,
  `ReferalID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `retail company`
--

CREATE TABLE `retail company` (
  `ClientID` varchar(6) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `RCCustomerID` varchar(6) NOT NULL,
  `RCOrderID` varchar(6) NOT NULL,
  `RCUsedDenim` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `OrderID` varchar(6) NOT NULL,
  `OrderDate` date NOT NULL,
  `Deadline` date NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Amount` int(255) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `InBulk` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`BuyerID`),
  ADD UNIQUE KEY `Address` (`Address`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD UNIQUE KEY `LName` (`LName`),
  ADD UNIQUE KEY `BProductID` (`BProductID`),
  ADD KEY `NoOfItems` (`NoOfItems`),
  ADD KEY `FName` (`FName`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `LName` (`LName`),
  ADD UNIQUE KEY `Address` (`Address`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `FName` (`FName`),
  ADD KEY `NoOfItems` (`NoOfItems`),
  ADD KEY `Phone` (`Phone`);

--
-- Indexes for table `end-product`
--
ALTER TABLE `end-product`
  ADD PRIMARY KEY (`ProductID`),
  ADD UNIQUE KEY `EPOrderID` (`EPOrderID`),
  ADD KEY `CommercialApplication` (`CommercialApplication`),
  ADD KEY `CompostMaterial` (`CompostMaterial`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD UNIQUE KEY `ReferalID` (`ReferalID`),
  ADD KEY `FName` (`FName`),
  ADD KEY `LName` (`LName`);

--
-- Indexes for table `retail company`
--
ALTER TABLE `retail company`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `RCCustomerID` (`RCCustomerID`),
  ADD UNIQUE KEY `RCOrderID` (`RCOrderID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `Address` (`Address`),
  ADD KEY `RCUsedDenim` (`RCUsedDenim`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `OrderDate` (`OrderDate`),
  ADD KEY `Deadline` (`Deadline`),
  ADD KEY `Email` (`Email`),
  ADD KEY `Phone` (`Phone`),
  ADD KEY `Amount` (`Amount`),
  ADD KEY `Address` (`Address`),
  ADD KEY `InBulk` (`InBulk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`BProductID`) REFERENCES `end-product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `end-product`
--
ALTER TABLE `end-product`
  ADD CONSTRAINT `end-product_ibfk_1` FOREIGN KEY (`EPOrderID`) REFERENCES `warehouse` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retail company`
--
ALTER TABLE `retail company`
  ADD CONSTRAINT `retail company_ibfk_1` FOREIGN KEY (`RCCustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retail company_ibfk_2` FOREIGN KEY (`RCOrderID`) REFERENCES `warehouse` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
