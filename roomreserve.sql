-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 10:18 AM
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
-- Database: `roomreserve`
--

-- --------------------------------------------------------

--
-- Table structure for table `confirmations`
--

CREATE TABLE `confirmations` (
  `Confirm_ID` int(11) NOT NULL,
  `Users_User_ID` int(11) NOT NULL,
  `Rooms_Room_ID` int(11) NOT NULL,
  `Roles_Role_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `confirmations`
--

INSERT INTO `confirmations` (`Confirm_ID`, `Users_User_ID`, `Rooms_Room_ID`, `Roles_Role_ID`) VALUES
(1, 11, 1, 24),
(2, 11, 2, 24),
(3, 11, 3, 24);

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `Equip_ID` int(11) NOT NULL,
  `Equip_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`Equip_ID`, `Equip_Name`) VALUES
(1, 'Notebook'),
(2, 'โปรเจคเตอร์'),
(3, 'ระบบ  zoom meeting');

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `Floor_ID` int(11) NOT NULL,
  `Floor_Number` varchar(10) NOT NULL,
  `Total_Rooms` int(100) NOT NULL,
  `Floor_Type` varchar(255) NOT NULL,
  `Open_Time` time NOT NULL,
  `Close_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`Floor_ID`, `Floor_Number`, `Total_Rooms`, `Floor_Type`, `Open_Time`, `Close_Time`) VALUES
(1, '3', 1, 'ห้องศึกษากลุ่ม', '08:30:00', '17:00:00'),
(2, '4', 1, 'ห้องศึกษากลุ่ม', '09:00:00', '17:00:00'),
(3, '5', 1, 'ห้องศึกษากลุ่ม', '08:30:00', '17:00:00'),
(4, '6', 1, 'Meeting Room', '08:30:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `normalroomreserves`
--

CREATE TABLE `normalroomreserves` (
  `Reserve_ID` int(11) NOT NULL,
  `Start_Date` date NOT NULL DEFAULT current_timestamp(),
  `Start_Time` time NOT NULL,
  `End_Date` date NOT NULL DEFAULT current_timestamp(),
  `End_Time` time NOT NULL,
  `Repeat_Flag` tinyint(1) NOT NULL,
  `Repeat_End_Date` date NOT NULL DEFAULT current_timestamp(),
  `Details` text NOT NULL,
  `Rooms_Room_ID` int(11) NOT NULL,
  `Normal_Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `normalroomreserves`
--

INSERT INTO `normalroomreserves` (`Reserve_ID`, `Start_Date`, `Start_Time`, `End_Date`, `End_Time`, `Repeat_Flag`, `Repeat_End_Date`, `Details`, `Rooms_Room_ID`, `Normal_Status`) VALUES
(1, '2024-12-04', '14:00:00', '2024-12-04', '16:00:00', 0, '2024-12-04', '', 3, 'รอการอนุมัติ'),
(2, '2024-12-04', '10:00:00', '2024-12-04', '12:00:00', 0, '2024-12-04', '', 1, 'รอการอนุมัติ');

-- --------------------------------------------------------

--
-- Table structure for table `reserveequipment`
--

CREATE TABLE `reserveequipment` (
  `ReserveEquip_ID` int(11) NOT NULL,
  `Require` int(1) NOT NULL,
  `SpecialReserve_ID` int(11) NOT NULL,
  `Equipment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserveequipment`
--

INSERT INTO `reserveequipment` (`ReserveEquip_ID`, `Require`, `SpecialReserve_ID`, `Equipment_ID`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(6, 1, 1, 3),
(13, 1, 3, 1),
(14, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservefoods`
--

CREATE TABLE `reservefoods` (
  `ReserveFood_ID` int(11) NOT NULL,
  `Serve_Time` time NOT NULL,
  `Serve_Name` varchar(255) NOT NULL,
  `Serve_Categories` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total_People` int(11) NOT NULL,
  `CostPerson` float NOT NULL,
  `SpecialReserve_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservefoods`
--

INSERT INTO `reservefoods` (`ReserveFood_ID`, `Serve_Time`, `Serve_Name`, `Serve_Categories`, `Quantity`, `Total_People`, `CostPerson`, `SpecialReserve_ID`) VALUES
(2, '10:00:00', 'เบรค1', 'อาหารว่าง', 15, 15, 50, 1),
(3, '12:11:12', 'อาหารกลางวัน', 'อาหารกลางวัน', 50, 50, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Role_ID` int(11) NOT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Role_ID`, `Department`, `Position`) VALUES
(1, 'บุคลากรสำนักหอสมุด', 'ผู้อำนวยการสำนักหอสมุด'),
(2, 'บุคลากรสำนักหอสมุด', 'รองผู้อำนวยการฝ่ายวิชาการ'),
(3, 'บุคลากรสำนักหอสมุด', 'รองผู้อำนวยการฝ่ายแผนยุทธศาสตร์และพัฒนาองค์กร'),
(4, 'บุคลากรสำนักหอสมุด', 'ผู้ช่วยผู้อำนวยการฝ่ายพัฒนาคุณภาพการ'),
(5, 'บุคลากรสำนักหอสมุด', 'ผู้ช่วยผู้อำนวยการฝ่ายยกระดับคุณภาพการบริการ'),
(6, 'บุคลากรสำนักหอสมุด\r\n', 'ผู้ช่วยผู้อำนวยการฝ่ายบริหารภาพลักษณ์องค์กร'),
(7, 'บุคลากรสำนักหอสมุด', 'ผู้รักษาการแทนหัวหน้าสำนักงานผู้อำนวยการ'),
(8, 'บุคลากรสำนักหอสมุด', 'ผู้รักษาการแทนหัวหน้าฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา'),
(9, 'บุคลากรสำนักหอสมุด', 'ผู้รักษาการแทนหัวหน้าฝ่ายบริการสารสนเทศและนวัตกรรมการเรียนรู้'),
(10, 'บุคลากรสำนักหอสมุด', 'ผู้รักษาการแทนหัวหน้าฝ่ายเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล'),
(11, 'สำนักงานผู้อำนวยการ', 'นักวิชาการศึกษาชำนาญการ'),
(12, 'สำนักงานผู้อำนวยการ', 'นักวิชาการเงินและบัญชีชำนาญการ'),
(13, 'สำนักงานผู้อำนวยการ', 'นักวิชาการพัสดุ'),
(14, 'สำนักงานผู้อำนวยการ', 'บุคลากร'),
(15, 'สำนักงานผู้อำนวยการ', 'พนักงานขับรถยนต์'),
(16, 'สำนักงานผู้อำนวยการ', 'ผู้ปฏิบัติงานช่าง'),
(17, 'สำนักงานผู้อำนวยการ', 'เจ้าหน้าที่บริหารงานทั่วไปชำนาญการ'),
(20, 'ฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา', 'บรรณารักษ์ชำนาญการพิเศษ\r\n'),
(22, 'ฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา', 'บรรณารักษ์ชำนาญการพิเศษ'),
(23, 'ฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา', 'บรรณารักษ์ชำนาญการ'),
(24, 'ฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา', 'ผู้ปฏิบัติงานห้องสมุด'),
(25, 'ฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา', 'บรรณารักษ์'),
(26, 'ฝ่ายบริหารจัดการทรัพยากรสารสนเทศและคลังปัญญา', 'แม่บ้าน'),
(29, 'ฝ่ายบริการสารสนเทศและนวัตกรรมการเรียนรู้', 'นักเอกสารสนเทศ'),
(30, 'ฝ่ายบริการสารสนเทศและนวัตกรรมการเรียนรู้', 'ตำแหน่งนักเอกสารสนเทศ'),
(31, 'ฝ่ายบริการสารสนเทศและนวัตกรรมการเรียนรู้', 'ผู้ช่วยปฏิบัติงานบริหาร'),
(32, 'ฝ่ายบริการสารสนเทศและนวัตกรรมการเรียนรู้', 'พนักงานเข้าและเย็บเล่ม'),
(34, 'ฝ่ายเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล', 'ผู้รักษาการแทนหัวหน้าฝ่ายเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล\r\n'),
(35, 'ฝ่ายเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล', 'นักวิชาการคอมพิวเตอร์ชำนาญการ'),
(37, 'ฝ่ายเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล', 'นักวิชาการโสตทัศนศึกษา'),
(38, 'ฝ่ายเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล', 'นักวิชาการคอมพิวเตอร์'),
(39, '-', 'นักศึกษา'),
(41, '-', 'บุคคลภายนอก'),
(42, '-', 'อาจาร์ย');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `Room_ID` int(11) NOT NULL,
  `Room_Name` varchar(250) NOT NULL,
  `Capacity` int(5) NOT NULL,
  `Max_hours` int(2) NOT NULL,
  `Room_Status` varchar(250) NOT NULL,
  `Room_Type` varchar(250) NOT NULL,
  `Room_Minimum` int(3) NOT NULL,
  `Floors_Floor_ID` int(11) NOT NULL,
  `OrderFood` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`Room_ID`, `Room_Name`, `Capacity`, `Max_hours`, `Room_Status`, `Room_Type`, `Room_Minimum`, `Floors_Floor_ID`, `OrderFood`) VALUES
(1, 'SmartTV 1 ', 5, 2, 'ว่าง', 'ห้องศึกษากลุ่ม', 3, 1, 'No'),
(2, 'SmartTV 1 ', 5, 2, 'ว่าง', 'ห้องศึกษากลุ่ม', 3, 2, 'No'),
(3, 'SmartTV 1 ', 5, 2, 'ว่าง', 'ห้องศึกษากลุ่ม', 3, 3, 'No'),
(4, 'CYBER ZONE 1', 80, 24, 'ว่าง', 'คอมพิวเตอร์', 1, 4, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `specialroomreserve`
--

CREATE TABLE `specialroomreserve` (
  `Reserve_ID` int(11) NOT NULL,
  `People_Count` int(100) NOT NULL,
  `Contract_Number` varchar(10) NOT NULL,
  `Start_Date` date NOT NULL DEFAULT current_timestamp(),
  `Start_Time` time NOT NULL,
  `End_Date` date NOT NULL DEFAULT current_timestamp(),
  `End_Time` time NOT NULL,
  `Stage_Name` varchar(255) DEFAULT NULL,
  `Reserve_Status` varchar(255) NOT NULL,
  `Users_User_ID` int(11) NOT NULL,
  `Rooms_Room_ID` int(11) NOT NULL,
  `Equip_Description` text NOT NULL,
  `Food_Descript` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialroomreserve`
--

INSERT INTO `specialroomreserve` (`Reserve_ID`, `People_Count`, `Contract_Number`, `Start_Date`, `Start_Time`, `End_Date`, `End_Time`, `Stage_Name`, `Reserve_Status`, `Users_User_ID`, `Rooms_Room_ID`, `Equip_Description`, `Food_Descript`) VALUES
(1, 30, '0841237896', '2024-12-04', '12:00:00', '2024-12-04', '13:00:00', NULL, 'รอการอนุมัติ', 3, 1, 'ไม่มี', 'ไม่มี'),
(2, 15, '0845561234', '2024-12-26', '14:00:00', '2024-12-05', '15:00:00', NULL, 'รอการอนุมัติ', 3, 4, '-', '-'),
(3, 50, '021258369', '2024-12-05', '08:00:00', '2024-12-05', '17:00:00', NULL, 'รอการอนุมัติ', 3, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `userreservations`
--

CREATE TABLE `userreservations` (
  `UserReserve_ID` int(11) NOT NULL,
  `Reserve_Role` varchar(255) NOT NULL,
  `Users_User_ID` int(11) NOT NULL,
  `NormalReserve_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userreservations`
--

INSERT INTO `userreservations` (`UserReserve_ID`, `Reserve_Role`, `Users_User_ID`, `NormalReserve_ID`) VALUES
(1, 'Leader', 1, 1),
(2, 'Participant', 12, 1),
(3, 'Participant', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `UserRole_ID` int(11) NOT NULL,
  `Users_User_ID` int(11) NOT NULL,
  `Roles_Role_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`UserRole_ID`, `Users_User_ID`, `Roles_Role_ID`) VALUES
(4, 1, 39),
(5, 3, 1),
(6, 7, 16),
(7, 4, 2),
(8, 4, 10),
(9, 11, 24),
(10, 12, 39),
(11, 13, 39),
(12, 14, 39);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `User_Name` varchar(200) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `User_Name`, `Password`, `FirstName`, `LastName`, `Email`) VALUES
(1, 'Fah', '12345', 'fah', 'hahaa', '64160139@go.buu.ac.th'),
(3, 'อาจารย์เหมรัศมิ์ วชิรหัตถพงศ์', '123465', 'อาจารย์เหมรัศมิ์ ', 'วชิรหัตถพงศ์', 'hemmarat@go.buu.ac.th'),
(4, 'นางวัชรีย์พร คุณสนอง', '13465', 'นางวัชรีย์พร ', 'คุณสนอง', 'kunsanon@buu.ac.th'),
(5, 'นางนิตยา ปานเพชร', '13246', 'นางนิตยา ', 'ปานเพชร', 'comvutic@go.buu.ac.th'),
(6, 'นายพินิจ หงษ์ศิริมงคล', '123465', 'นายพินิจ ', 'หงษ์ศิริมงคล', 'pinitbuu@hotmail.com'),
(7, 'นายธนกรณ์ จินดารักษ์', 'thanakorn', 'นายธนกรณ์ ', 'จินดารักษ์', 'thanakorn.ji@go.buu.ac.th'),
(8, 'นางจิตติมา พลิคามินทร์', '1346', 'นางจิตติมา ', 'พลิคามินทร์', ''),
(9, 'pawaresn', '12346', 'นายปวเรศ ', 'นวลแก้ว', 'pawaresn@buu.ac.th'),
(10, 'kunsanon', '132465', 'นางวัชรีย์พร ', 'คุณสนอง', 'kunsanon@go.buu.ac.th'),
(11, 'orathai_na', '13246', 'นางสาวอรทัย ', 'นาสวน', 'orathai_na@buu.ac.th'),
(12, 'User1', '132465', 'ต้มจืด', 'อร่อยดี', ''),
(13, 'User2', '41asd', 'ขนมจีน', 'น้ำยาบ้านๆ', ''),
(14, 'User3', 'sadasd455', 'ส้ม', 'กล้วย', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `confirmations`
--
ALTER TABLE `confirmations`
  ADD PRIMARY KEY (`Confirm_ID`),
  ADD KEY `Users_User_ID` (`Users_User_ID`) USING BTREE,
  ADD KEY `Rooms_Room_ID` (`Rooms_Room_ID`),
  ADD KEY `Roles_Role_ID` (`Roles_Role_ID`) USING BTREE;

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`Equip_ID`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`Floor_ID`);

--
-- Indexes for table `normalroomreserves`
--
ALTER TABLE `normalroomreserves`
  ADD PRIMARY KEY (`Reserve_ID`),
  ADD KEY `Rooms_Room_ID` (`Rooms_Room_ID`) USING BTREE;

--
-- Indexes for table `reserveequipment`
--
ALTER TABLE `reserveequipment`
  ADD PRIMARY KEY (`ReserveEquip_ID`),
  ADD KEY `SpecialReserve_ID` (`SpecialReserve_ID`) USING BTREE,
  ADD KEY `Equipments_Equipment_ID` (`Equipment_ID`) USING BTREE;

--
-- Indexes for table `reservefoods`
--
ALTER TABLE `reservefoods`
  ADD PRIMARY KEY (`ReserveFood_ID`),
  ADD KEY `SpecialReserve_ID` (`SpecialReserve_ID`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Role_ID`),
  ADD UNIQUE KEY `Position` (`Position`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Room_ID`),
  ADD KEY `Floors_Floor_ID` (`Floors_Floor_ID`) USING BTREE;

--
-- Indexes for table `specialroomreserve`
--
ALTER TABLE `specialroomreserve`
  ADD PRIMARY KEY (`Reserve_ID`),
  ADD KEY `Users_User_ID` (`Users_User_ID`) USING BTREE,
  ADD KEY `Rooms_Room_ID` (`Rooms_Room_ID`) USING BTREE;

--
-- Indexes for table `userreservations`
--
ALTER TABLE `userreservations`
  ADD PRIMARY KEY (`UserReserve_ID`),
  ADD KEY `Users_User_ID` (`Users_User_ID`) USING BTREE,
  ADD KEY `NormalReserve_ID` (`NormalReserve_ID`) USING BTREE;

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`UserRole_ID`),
  ADD KEY `Users_User_ID` (`Users_User_ID`),
  ADD KEY `userroles_ibfk_2` (`Roles_Role_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `confirmations`
--
ALTER TABLE `confirmations`
  MODIFY `Confirm_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `Equip_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `Floor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `normalroomreserves`
--
ALTER TABLE `normalroomreserves`
  MODIFY `Reserve_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reserveequipment`
--
ALTER TABLE `reserveequipment`
  MODIFY `ReserveEquip_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reservefoods`
--
ALTER TABLE `reservefoods`
  MODIFY `ReserveFood_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `Room_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specialroomreserve`
--
ALTER TABLE `specialroomreserve`
  MODIFY `Reserve_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userreservations`
--
ALTER TABLE `userreservations`
  MODIFY `UserReserve_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `UserRole_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `confirmations`
--
ALTER TABLE `confirmations`
  ADD CONSTRAINT `confirmations_ibfk_1` FOREIGN KEY (`Users_User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmations_ibfk_3` FOREIGN KEY (`Rooms_Room_ID`) REFERENCES `rooms` (`Room_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmations_ibfk_4` FOREIGN KEY (`Roles_Role_ID`) REFERENCES `roles` (`Role_ID`);

--
-- Constraints for table `normalroomreserves`
--
ALTER TABLE `normalroomreserves`
  ADD CONSTRAINT `normalroomreserves_ibfk_1` FOREIGN KEY (`Rooms_Room_ID`) REFERENCES `rooms` (`Room_ID`);

--
-- Constraints for table `reserveequipment`
--
ALTER TABLE `reserveequipment`
  ADD CONSTRAINT `reserveequipment_ibfk_1` FOREIGN KEY (`Equipment_ID`) REFERENCES `equipments` (`Equip_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserveequipment_ibfk_2` FOREIGN KEY (`SpecialReserve_ID`) REFERENCES `specialroomreserve` (`Reserve_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservefoods`
--
ALTER TABLE `reservefoods`
  ADD CONSTRAINT `reservefoods_ibfk_1` FOREIGN KEY (`SpecialReserve_ID`) REFERENCES `specialroomreserve` (`Reserve_ID`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`Floors_Floor_ID`) REFERENCES `floors` (`Floor_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specialroomreserve`
--
ALTER TABLE `specialroomreserve`
  ADD CONSTRAINT `specialroomreserve_ibfk_1` FOREIGN KEY (`Users_User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `specialroomreserve_ibfk_2` FOREIGN KEY (`Rooms_Room_ID`) REFERENCES `rooms` (`Room_ID`);

--
-- Constraints for table `userreservations`
--
ALTER TABLE `userreservations`
  ADD CONSTRAINT `userreservations_ibfk_1` FOREIGN KEY (`Users_User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userreservations_ibfk_2` FOREIGN KEY (`NormalReserve_ID`) REFERENCES `normalroomreserves` (`Reserve_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`Users_User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`Roles_Role_ID`) REFERENCES `roles` (`Role_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
