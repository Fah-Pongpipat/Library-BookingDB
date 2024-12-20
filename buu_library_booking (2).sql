-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 10:31 AM
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
-- Table structure for table `confirmation`
--

CREATE TABLE `confirmation` (
  `confirm_Id` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileType` varchar(50) NOT NULL,
  `fileSize` bigint(20) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `eq_Id` int(11) NOT NULL,
  `equip_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_booking`
--

CREATE TABLE `equipment_booking` (
  `eqb_Id` int(11) NOT NULL,
  `eq_Id` int(11) NOT NULL,
  `srb_Id` int(11) NOT NULL,
  `require` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `floorId` int(11) NOT NULL,
  `floor_Number` int(11) NOT NULL,
  `total_Room` int(11) NOT NULL,
  `openTime` time NOT NULL,
  `closedTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`floorId`, `floor_Number`, `total_Room`, `openTime`, `closedTime`) VALUES
(1, 2, 0, '08:00:00', '20:00:00'),
(2, 3, 5, '08:00:00', '20:00:00'),
(3, 4, 5, '08:00:00', '20:00:00'),
(4, 5, 8, '08:00:00', '20:00:00'),
(5, 6, 18, '08:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `normal_room_booking`
--

CREATE TABLE `normal_room_booking` (
  `nrbId` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endDate` date NOT NULL,
  `endTime` time NOT NULL,
  `repeat_Flag` varchar(255) NOT NULL,
  `repeat_End_Flag` date NOT NULL,
  `details` varchar(255) NOT NULL,
  `roomBookingRoomId` int(11) NOT NULL,
  `reseve_status` enum('รอ','อนุมัติ','ยกเลิก') NOT NULL DEFAULT 'รอ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `normal_room_booking`
--

INSERT INTO `normal_room_booking` (`nrbId`, `startDate`, `startTime`, `endDate`, `endTime`, `repeat_Flag`, `repeat_End_Flag`, `details`, `roomBookingRoomId`, `reseve_status`) VALUES
(1, '2024-12-19', '13:00:00', '2024-12-19', '15:00:00', 'No', '2024-12-19', 'อ่านหนังสือสอบ', 1, 'รอ');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orders_ID` int(11) NOT NULL,
  `Serve_Time` int(11) NOT NULL,
  `Serve_Name` varchar(255) NOT NULL,
  `Serve_Categories` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CostPerson` decimal(10,2) NOT NULL,
  `SpecialRoomBooking_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participant_ID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `userbookingUserbookingId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participant_ID`, `fullName`, `userbookingUserbookingId`) VALUES
(1, 'ขนมจีนป่าไหมนะ', 4),
(2, 'ต้มจืด อร่อยดี', 4);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_assignment`
--

CREATE TABLE `role_assignment` (
  `roleAssId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  ` userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_room_access`
--

CREATE TABLE `role_room_access` (
  `access_ID` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomId` int(11) NOT NULL,
  `room_Name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `max_hours` int(11) NOT NULL,
  `room_Status` enum('ว่าง','ไม่ว่าง','จอง') NOT NULL DEFAULT 'ว่าง',
  `room_Type` varchar(255) NOT NULL,
  `room_Minimum` int(11) NOT NULL,
  `orderFood` varchar(255) NOT NULL,
  `floorFloorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomId`, `room_Name`, `capacity`, `max_hours`, `room_Status`, `room_Type`, `room_Minimum`, `orderFood`, `floorFloorId`) VALUES
(1, 'SmartTV 1', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2),
(2, 'SmartTV 2', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2),
(3, 'SmartTV 3', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2),
(4, 'SmartTV 4', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2),
(5, 'SmartTV 5', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2),
(6, 'SmartTV 1', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3),
(7, 'SmartTV 2', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3),
(8, 'SmartTV 3', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3),
(9, 'SmartTV 4', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3),
(10, 'SmartTV 5', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3),
(11, 'SmartTV 1', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4),
(12, 'SmartTV 2', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4),
(13, 'SmartTV 3', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4),
(14, 'SmartTV 4', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4),
(15, 'SmartTV 5', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4),
(16, 'Lecture\'s room 1', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 4),
(17, 'Lecture\'s room 2', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 4),
(18, 'Lecture\'s room 3', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 4),
(19, 'Room 640 Smart Board', 10, 2, 'ว่าง', 'Meeting', 8, 'No', 5),
(20, 'ห้องคาราโอเกะ 01', 5, 2, 'ว่าง', 'Entertain', 3, 'No', 5),
(21, 'ห้องคาราโอเกะ 02', 5, 2, 'ว่าง', 'Entertain', 3, 'No', 5),
(22, 'Mimi theater', 30, 2, 'ว่าง', 'Entertain', 10, 'No', 5),
(23, 'Room STV-1', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(24, 'Room STV-2', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(25, 'Room STV-3', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(26, 'Room STV-4', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(27, 'Room STV-5', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(28, 'Room STV-6', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(29, 'Room STV-7', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(30, 'Room STV-8', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(31, 'Room STV-9', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5),
(32, 'Mimi Studios 1', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 5),
(33, 'Mimi Studios 2', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 5),
(34, 'Mimi Studios 3', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 5),
(35, 'CYBER ZONE |', 70, 24, 'ว่าง', 'Meeting', 1, 'Yes', 5),
(36, 'CYBER ZONE || ', 30, 24, 'ว่าง', 'Meeting', 1, 'Yes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `special_room_booking`
--

CREATE TABLE `special_room_booking` (
  `srb_Id` int(11) NOT NULL,
  `people_Count` int(11) NOT NULL,
  `contract_Number` int(11) NOT NULL,
  `start_Date` date NOT NULL,
  `start_Time` time NOT NULL,
  `end_Date` date NOT NULL,
  `end_Time` time NOT NULL,
  `stage_Name` varchar(255) NOT NULL,
  `reseve_status` enum('รอ','อนุมัติ','ไม่อนุมัติ') NOT NULL DEFAULT 'รอ',
  `equip_Descript` text NOT NULL,
  `order_Description` text NOT NULL,
  `documentId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `firstName`, `lastName`, `email`) VALUES
(1, 'john_doe', 'pass123', 'John', 'Doe', 'john.doe@example.com'),
(2, 'jane_smith', 'secure456', 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'michael_brown', 'michael789', 'Michael', 'Brown', 'michael.brown@example.com'),
(4, 'emily_clark', 'emily123', 'Emily', 'Clark', 'emily.clark@example.com'),
(5, 'david_jones', 'david456', 'David', 'Jones', 'david.jones@example.com'),
(6, 'sarah_wilson', 'sarah789', 'Sarah', 'Wilson', 'sarah.wilson@example.com'),
(7, 'chris_moore', 'chris123', 'Chris', 'Moore', 'chris.moore@example.com'),
(8, 'lisa_white', 'lisa456', 'Lisa', 'White', 'lisa.white@example.com'),
(9, 'mark_taylor', 'mark789', 'Mark', 'Taylor', 'mark.taylor@example.com'),
(10, 'laura_green', 'laura123', 'Laura', 'Green', 'laura.green@example.com'),
(11, 'daniel_lee', 'daniel456', 'Daniel', 'Lee', 'daniel.lee@example.com'),
(12, 'olivia_king', 'olivia789', 'Olivia', 'King', 'olivia.king@example.com'),
(13, 'james_hill', 'james123', 'James', 'Hill', 'james.hill@example.com'),
(14, 'amanda_wright', 'amanda456', 'Amanda', 'Wright', 'amanda.wright@example.com'),
(15, 'william_scott', 'william789', 'William', 'Scott', 'william.scott@example.com'),
(16, 'emma_turner', 'emma123', 'Emma', 'Turner', 'emma.turner@example.com'),
(17, 'anthony_harris', 'anthony456', 'Anthony', 'Harris', 'anthony.harris@example.com'),
(18, 'charlotte_wood', 'charlotte789', 'Charlotte', 'Wood', 'charlotte.wood@example.com'),
(19, 'patrick_martin', 'patrick123', 'Patrick', 'Martin', 'patrick.martin@example.com'),
(20, 'natalie_adams', 'natalie456', 'Natalie', 'Adams', 'natalie.adams@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_booking`
--

CREATE TABLE `user_booking` (
  `userbooking_Id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `nrbId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_booking`
--

INSERT INTO `user_booking` (`userbooking_Id`, `userId`, `nrbId`) VALUES
(4, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `confirmation`
--
ALTER TABLE `confirmation`
  ADD PRIMARY KEY (`confirm_Id`),
  ADD KEY `FK_1d6c43d1d9f54a4ebe43298ef6c` (`roleId`),
  ADD KEY `FK_0e4cebfabdbe9ac004bca866930` (`roomId`),
  ADD KEY `FK_74f1ebea7c18510697c0e2a6be4` (`userId`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`eq_Id`);

--
-- Indexes for table `equipment_booking`
--
ALTER TABLE `equipment_booking`
  ADD PRIMARY KEY (`eqb_Id`),
  ADD KEY `FK_f6ca91688a66fa4250606fc135b` (`eq_Id`),
  ADD KEY `FK_dd4f839733d740ee83be07f1eca` (`srb_Id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`floorId`),
  ADD UNIQUE KEY `IDX_428ea2f674a67f57d22eea5628` (`floor_Number`);

--
-- Indexes for table `normal_room_booking`
--
ALTER TABLE `normal_room_booking`
  ADD PRIMARY KEY (`nrbId`),
  ADD KEY `FK_3f245faeb2540f5cc68a1dc6b31` (`roomBookingRoomId`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orders_ID`),
  ADD KEY `FK_cd58500313208b8e2d90cfbdf5d` (`SpecialRoomBooking_Id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_ID`),
  ADD KEY `FK_9889567b0352af2b42b32c16605` (`userbookingUserbookingId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleId`),
  ADD UNIQUE KEY `unique_position` (`position`);

--
-- Indexes for table `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD PRIMARY KEY (`roleAssId`),
  ADD KEY `FK_f0de67fd09cd3cd0aabca79994d` (`roleId`),
  ADD KEY `FK_e380790fc3538ffc4ea83364af0` (` userId`);

--
-- Indexes for table `role_room_access`
--
ALTER TABLE `role_room_access`
  ADD PRIMARY KEY (`access_ID`),
  ADD KEY `FK_8a4caa8eca13637dcb5b5040f26` (`roomId`),
  ADD KEY `FK_b03a43a6f1cdbbbc499391b5b03` (`roleId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomId`),
  ADD KEY `FK_8697484563e73b998d9129c4a3d` (`floorFloorId`);

--
-- Indexes for table `special_room_booking`
--
ALTER TABLE `special_room_booking`
  ADD PRIMARY KEY (`srb_Id`),
  ADD UNIQUE KEY `REL_07fab35fc40d3a36e529b8c14f` (`documentId`),
  ADD KEY `FK_8f52b72c21db4ed794a7d7479d2` (`userId`),
  ADD KEY `FK_a2698ea3ee59fb004363a9f3403` (`roomId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `user_booking`
--
ALTER TABLE `user_booking`
  ADD PRIMARY KEY (`userbooking_Id`),
  ADD KEY `FK_7d6ab1e026437ee4ce83792b6b8` (`userId`),
  ADD KEY `FK_b8da943e818b43ecba47899c8e9` (`nrbId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `confirmation`
--
ALTER TABLE `confirmation`
  MODIFY `confirm_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `eq_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment_booking`
--
ALTER TABLE `equipment_booking`
  MODIFY `eqb_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `floorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `normal_room_booking`
--
ALTER TABLE `normal_room_booking`
  MODIFY `nrbId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `orders_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_assignment`
--
ALTER TABLE `role_assignment`
  MODIFY `roleAssId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_room_access`
--
ALTER TABLE `role_room_access`
  MODIFY `access_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `special_room_booking`
--
ALTER TABLE `special_room_booking`
  MODIFY `srb_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_booking`
--
ALTER TABLE `user_booking`
  MODIFY `userbooking_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `confirmation`
--
ALTER TABLE `confirmation`
  ADD CONSTRAINT `FK_0e4cebfabdbe9ac004bca866930` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_1d6c43d1d9f54a4ebe43298ef6c` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_74f1ebea7c18510697c0e2a6be4` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `equipment_booking`
--
ALTER TABLE `equipment_booking`
  ADD CONSTRAINT `FK_dd4f839733d740ee83be07f1eca` FOREIGN KEY (`srb_Id`) REFERENCES `special_room_booking` (`srb_Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f6ca91688a66fa4250606fc135b` FOREIGN KEY (`eq_Id`) REFERENCES `equipment` (`eq_Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `normal_room_booking`
--
ALTER TABLE `normal_room_booking`
  ADD CONSTRAINT `FK_3f245faeb2540f5cc68a1dc6b31` FOREIGN KEY (`roomBookingRoomId`) REFERENCES `room` (`roomId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_cd58500313208b8e2d90cfbdf5d` FOREIGN KEY (`SpecialRoomBooking_Id`) REFERENCES `special_room_booking` (`srb_Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_9889567b0352af2b42b32c16605` FOREIGN KEY (`userbookingUserbookingId`) REFERENCES `user_booking` (`userbooking_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD CONSTRAINT `FK_e380790fc3538ffc4ea83364af0` FOREIGN KEY (` userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f0de67fd09cd3cd0aabca79994d` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_room_access`
--
ALTER TABLE `role_room_access`
  ADD CONSTRAINT `FK_8a4caa8eca13637dcb5b5040f26` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b03a43a6f1cdbbbc499391b5b03` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FK_8697484563e73b998d9129c4a3d` FOREIGN KEY (`floorFloorId`) REFERENCES `floor` (`floorId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `special_room_booking`
--
ALTER TABLE `special_room_booking`
  ADD CONSTRAINT `FK_07fab35fc40d3a36e529b8c14fb` FOREIGN KEY (`documentId`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_8f52b72c21db4ed794a7d7479d2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a2698ea3ee59fb004363a9f3403` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_booking`
--
ALTER TABLE `user_booking`
  ADD CONSTRAINT `FK_7d6ab1e026437ee4ce83792b6b8` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b8da943e818b43ecba47899c8e9` FOREIGN KEY (`nrbId`) REFERENCES `normal_room_booking` (`nrbId`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
