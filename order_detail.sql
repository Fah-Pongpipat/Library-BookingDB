-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 07:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buu_library_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orders_ID` int(11) NOT NULL,
  `Serve_Name` varchar(255) NOT NULL,
  `Serve_Categories` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CostPerson` decimal(10,2) NOT NULL,
  `SpecialRoomBooking_Id` int(11) NOT NULL,
  `Serve_Time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orders_ID`, `Serve_Name`, `Serve_Categories`, `Quantity`, `CostPerson`, `SpecialRoomBooking_Id`, `Serve_Time`) VALUES
(1, 'พักเบรค 1', 'อาหารว่าง', 10, 70.00, 1, '10-00-00'),
(2, 'อาหารพักเที่ยง', 'อาหารเที่ยง', 10, 70.00, 1, '12-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orders_ID`),
  ADD KEY `FK_cd58500313208b8e2d90cfbdf5d` (`SpecialRoomBooking_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `orders_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_cd58500313208b8e2d90cfbdf5d` FOREIGN KEY (`SpecialRoomBooking_Id`) REFERENCES `special_room_booking` (`srb_Id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
