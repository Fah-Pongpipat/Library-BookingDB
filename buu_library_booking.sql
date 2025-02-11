-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2025 at 04:07 AM
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
  `documentPath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `fileName`, `documentPath`) VALUES
(1, 'มติที่ประชุม.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `eq_Id` int(11) NOT NULL,
  `equip_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`eq_Id`, `equip_Name`) VALUES
(1, 'โปรเจคเตอร์'),
(2, 'เครื่องคอมพิวเตอร์ (วิทยากร)'),
(3, 'โต๊ะลงทะเบียน'),
(4, 'ระบบเครื่องเสียง'),
(5, 'ระบบ ZOOM Meeting'),
(6, 'ระบบถ่ายทอดการประชุม'),
(7, 'ห้องอาหาร ชั้น 3 ตึกใหม่');

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

--
-- Dumping data for table `equipment_booking`
--

INSERT INTO `equipment_booking` (`eqb_Id`, `eq_Id`, `srb_Id`, `require`) VALUES
(1, 1, 1, 'ต้องการ'),
(2, 2, 1, 'ต้องการ'),
(3, 7, 1, 'ต้องการ');

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
(5, 6, 16, '08:00:00', '20:00:00'),
(6, 7, 16, '08:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `holiday_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id`, `holiday_name`, `holiday_date`, `created_at`, `updated_at`) VALUES
(1, NULL, '2025-01-01', '2025-01-22 08:46:58.513169', '2025-01-22 08:46:58.513169'),
(2, NULL, '2025-02-12', '2025-01-22 08:46:58.567886', '2025-01-22 08:46:58.567886'),
(3, NULL, '2025-04-07', '2025-01-22 08:46:58.595553', '2025-01-22 08:46:58.595553'),
(4, NULL, '2025-04-14', '2025-01-22 08:46:58.616762', '2025-01-22 08:46:58.616762'),
(5, NULL, '2025-04-15', '2025-01-22 08:46:58.629532', '2025-01-22 08:46:58.629532'),
(6, NULL, '2025-05-01', '2025-01-22 08:46:58.638148', '2025-01-22 08:46:58.638148'),
(7, NULL, '2025-05-05', '2025-01-22 08:46:58.643377', '2025-01-22 08:46:58.643377'),
(8, NULL, '2025-05-12', '2025-01-22 08:46:58.650163', '2025-01-22 08:46:58.650163'),
(9, NULL, '2025-06-02', '2025-01-22 08:46:58.671954', '2025-01-22 08:46:58.671954'),
(10, NULL, '2025-06-03', '2025-01-22 08:46:58.698153', '2025-01-22 08:46:58.698153'),
(11, NULL, '2025-07-10', '2025-01-22 08:46:58.719166', '2025-01-22 08:46:58.719166'),
(12, NULL, '2025-07-28', '2025-01-22 08:46:58.739107', '2025-01-22 08:46:58.739107'),
(13, NULL, '2025-08-11', '2025-01-22 08:46:58.750304', '2025-01-22 08:46:58.750304'),
(14, NULL, '2025-08-12', '2025-01-22 08:46:58.776125', '2025-01-22 08:46:58.776125'),
(15, NULL, '2025-10-13', '2025-01-22 08:46:58.786248', '2025-01-22 08:46:58.786248'),
(16, NULL, '2025-10-23', '2025-01-22 08:46:58.807138', '2025-01-22 08:46:58.807138'),
(17, NULL, '2025-12-05', '2025-01-22 08:46:58.828460', '2025-01-22 08:46:58.828460'),
(18, NULL, '2025-12-10', '2025-01-22 08:46:58.873878', '2025-01-22 08:46:58.873878'),
(19, NULL, '2025-12-31', '2025-01-22 08:46:58.889512', '2025-01-22 08:46:58.889512'),
(20, NULL, '2024-01-01', '2025-01-22 08:46:59.119696', '2025-01-22 08:46:59.119696'),
(21, NULL, '2024-02-26', '2025-01-22 08:46:59.128876', '2025-01-22 08:46:59.128876'),
(22, NULL, '2024-04-08', '2025-01-22 08:46:59.137195', '2025-01-22 08:46:59.137195'),
(23, NULL, '2024-04-12', '2025-01-22 08:46:59.148294', '2025-01-22 08:46:59.148294'),
(24, NULL, '2024-04-15', '2025-01-22 08:46:59.158262', '2025-01-22 08:46:59.158262'),
(25, NULL, '2024-04-16', '2025-01-22 08:46:59.170557', '2025-01-22 08:46:59.170557'),
(26, NULL, '2024-05-01', '2025-01-22 08:46:59.186000', '2025-01-22 08:46:59.186000'),
(27, NULL, '2024-05-06', '2025-01-22 08:46:59.200579', '2025-01-22 08:46:59.200579'),
(28, NULL, '2024-05-22', '2025-01-22 08:46:59.215528', '2025-01-22 08:46:59.215528'),
(29, NULL, '2024-06-03', '2025-01-22 08:46:59.229714', '2025-01-22 08:46:59.229714'),
(30, NULL, '2024-07-22', '2025-01-22 08:46:59.237665', '2025-01-22 08:46:59.237665'),
(31, NULL, '2024-07-29', '2025-01-22 08:46:59.251907', '2025-01-22 08:46:59.251907'),
(32, NULL, '2024-08-12', '2025-01-22 08:46:59.267621', '2025-01-22 08:46:59.267621'),
(33, NULL, '2024-10-14', '2025-01-22 08:46:59.277121', '2025-01-22 08:46:59.277121'),
(34, NULL, '2024-10-23', '2025-01-22 08:46:59.286967', '2025-01-22 08:46:59.286967'),
(35, NULL, '2024-12-05', '2025-01-22 08:46:59.298546', '2025-01-22 08:46:59.298546'),
(36, NULL, '2024-12-10', '2025-01-22 08:46:59.307342', '2025-01-22 08:46:59.307342'),
(37, NULL, '2024-12-31', '2025-01-22 08:46:59.320940', '2025-01-22 08:46:59.320940'),
(38, NULL, '2023-01-02', '2025-01-22 08:46:59.537452', '2025-01-22 08:46:59.537452'),
(39, NULL, '2023-03-06', '2025-01-22 08:46:59.543305', '2025-01-22 08:46:59.543305'),
(40, NULL, '2023-04-06', '2025-01-22 08:46:59.550452', '2025-01-22 08:46:59.550452'),
(41, NULL, '2023-04-13', '2025-01-22 08:46:59.560666', '2025-01-22 08:46:59.560666'),
(42, NULL, '2023-04-14', '2025-01-22 08:46:59.570225', '2025-01-22 08:46:59.570225'),
(43, NULL, '2023-05-01', '2025-01-22 08:46:59.575408', '2025-01-22 08:46:59.575408'),
(44, NULL, '2023-05-04', '2025-01-22 08:46:59.579885', '2025-01-22 08:46:59.579885'),
(45, NULL, '2023-05-05', '2025-01-22 08:46:59.589613', '2025-01-22 08:46:59.589613'),
(46, NULL, '2023-06-05', '2025-01-22 08:46:59.599399', '2025-01-22 08:46:59.599399'),
(47, NULL, '2023-07-28', '2025-01-22 08:46:59.608826', '2025-01-22 08:46:59.608826'),
(48, NULL, '2023-08-01', '2025-01-22 08:46:59.618809', '2025-01-22 08:46:59.618809'),
(49, NULL, '2023-08-14', '2025-01-22 08:46:59.633550', '2025-01-22 08:46:59.633550'),
(50, NULL, '2023-10-13', '2025-01-22 08:46:59.641543', '2025-01-22 08:46:59.641543'),
(51, NULL, '2023-10-23', '2025-01-22 08:46:59.652165', '2025-01-22 08:46:59.652165'),
(52, NULL, '2023-12-05', '2025-01-22 08:46:59.661895', '2025-01-22 08:46:59.661895'),
(53, NULL, '2023-12-11', '2025-01-22 08:46:59.671383', '2025-01-22 08:46:59.671383'),
(54, NULL, '2023-12-29', '2025-01-22 08:46:59.689682', '2025-01-22 08:46:59.689682'),
(55, NULL, '2022-01-03', '2025-01-22 08:46:59.878950', '2025-01-22 08:46:59.878950'),
(56, NULL, '2022-02-16', '2025-01-22 08:46:59.924407', '2025-01-22 08:46:59.924407'),
(57, NULL, '2022-04-06', '2025-01-22 08:46:59.934586', '2025-01-22 08:46:59.934586'),
(58, NULL, '2022-04-13', '2025-01-22 08:46:59.946853', '2025-01-22 08:46:59.946853'),
(59, NULL, '2022-04-14', '2025-01-22 08:46:59.958984', '2025-01-22 08:46:59.958984'),
(60, NULL, '2022-04-15', '2025-01-22 08:46:59.976384', '2025-01-22 08:46:59.976384'),
(61, NULL, '2022-05-02', '2025-01-22 08:46:59.993206', '2025-01-22 08:46:59.993206'),
(62, NULL, '2022-05-04', '2025-01-22 08:47:00.004522', '2025-01-22 08:47:00.004522'),
(63, NULL, '2022-05-16', '2025-01-22 08:47:00.022107', '2025-01-22 08:47:00.022107'),
(64, NULL, '2022-06-03', '2025-01-22 08:47:00.032856', '2025-01-22 08:47:00.032856'),
(65, NULL, '2022-07-13', '2025-01-22 08:47:00.042891', '2025-01-22 08:47:00.042891'),
(66, NULL, '2022-07-28', '2025-01-22 08:47:00.056227', '2025-01-22 08:47:00.056227'),
(67, NULL, '2022-07-29', '2025-01-22 08:47:00.064423', '2025-01-22 08:47:00.064423'),
(68, NULL, '2022-08-12', '2025-01-22 08:47:00.073532', '2025-01-22 08:47:00.073532'),
(69, NULL, '2022-10-13', '2025-01-22 08:47:00.082524', '2025-01-22 08:47:00.082524'),
(70, NULL, '2022-10-14', '2025-01-22 08:47:00.097695', '2025-01-22 08:47:00.097695'),
(71, NULL, '2022-10-24', '2025-01-22 08:47:00.113291', '2025-01-22 08:47:00.113291'),
(72, NULL, '2022-12-05', '2025-01-22 08:47:00.125446', '2025-01-22 08:47:00.125446'),
(73, NULL, '2022-12-12', '2025-01-22 08:47:00.142831', '2025-01-22 08:47:00.142831'),
(74, NULL, '2021-01-01', '2025-01-22 08:47:00.353269', '2025-01-22 08:47:00.353269'),
(75, NULL, '2021-02-12', '2025-01-22 08:47:00.388330', '2025-01-22 08:47:00.388330'),
(76, NULL, '2021-02-26', '2025-01-22 08:47:00.400671', '2025-01-22 08:47:00.400671'),
(77, NULL, '2021-04-06', '2025-01-22 08:47:00.411138', '2025-01-22 08:47:00.411138'),
(78, NULL, '2021-04-13', '2025-01-22 08:47:00.421863', '2025-01-22 08:47:00.421863'),
(79, NULL, '2021-04-14', '2025-01-22 08:47:00.432332', '2025-01-22 08:47:00.432332'),
(80, NULL, '2021-04-15', '2025-01-22 08:47:00.440338', '2025-01-22 08:47:00.440338'),
(81, NULL, '2021-05-03', '2025-01-22 08:47:00.448518', '2025-01-22 08:47:00.448518'),
(82, NULL, '2021-05-04', '2025-01-22 08:47:00.462760', '2025-01-22 08:47:00.462760'),
(83, NULL, '2021-05-26', '2025-01-22 08:47:00.471776', '2025-01-22 08:47:00.471776'),
(84, NULL, '2021-06-03', '2025-01-22 08:47:00.482576', '2025-01-22 08:47:00.482576'),
(85, NULL, '2021-07-26', '2025-01-22 08:47:00.495851', '2025-01-22 08:47:00.495851'),
(86, NULL, '2021-07-28', '2025-01-22 08:47:00.511049', '2025-01-22 08:47:00.511049'),
(87, NULL, '2021-08-12', '2025-01-22 08:47:00.521922', '2025-01-22 08:47:00.521922'),
(88, NULL, '2021-09-24', '2025-01-22 08:47:00.535231', '2025-01-22 08:47:00.535231'),
(89, NULL, '2021-10-13', '2025-01-22 08:47:00.543091', '2025-01-22 08:47:00.543091'),
(90, NULL, '2021-10-22', '2025-01-22 08:47:00.554911', '2025-01-22 08:47:00.554911'),
(91, NULL, '2021-12-06', '2025-01-22 08:47:00.566888', '2025-01-22 08:47:00.566888'),
(92, NULL, '2021-12-10', '2025-01-22 08:47:00.573242', '2025-01-22 08:47:00.573242'),
(93, NULL, '2021-12-31', '2025-01-22 08:47:00.585109', '2025-01-22 08:47:00.585109'),
(94, NULL, '2020-01-01', '2025-01-22 08:47:00.761742', '2025-01-22 08:47:00.761742'),
(95, NULL, '2020-02-10', '2025-01-22 08:47:00.785770', '2025-01-22 08:47:00.785770'),
(96, NULL, '2020-04-06', '2025-01-22 08:47:00.792295', '2025-01-22 08:47:00.792295'),
(97, NULL, '2020-05-01', '2025-01-22 08:47:00.801359', '2025-01-22 08:47:00.801359'),
(98, NULL, '2020-05-04', '2025-01-22 08:47:00.813535', '2025-01-22 08:47:00.813535'),
(99, NULL, '2020-05-06', '2025-01-22 08:47:00.836156', '2025-01-22 08:47:00.836156'),
(100, NULL, '2020-06-03', '2025-01-22 08:47:00.847456', '2025-01-22 08:47:00.847456'),
(101, NULL, '2020-07-06', '2025-01-22 08:47:00.859978', '2025-01-22 08:47:00.859978'),
(102, NULL, '2020-07-27', '2025-01-22 08:47:00.880170', '2025-01-22 08:47:00.880170'),
(103, NULL, '2020-07-28', '2025-01-22 08:47:00.892045', '2025-01-22 08:47:00.892045'),
(104, NULL, '2020-08-12', '2025-01-22 08:47:00.904407', '2025-01-22 08:47:00.904407'),
(105, NULL, '2020-09-04', '2025-01-22 08:47:00.916592', '2025-01-22 08:47:00.916592'),
(106, NULL, '2020-09-07', '2025-01-22 08:47:00.929463', '2025-01-22 08:47:00.929463'),
(107, NULL, '2020-10-13', '2025-01-22 08:47:00.941919', '2025-01-22 08:47:00.941919'),
(108, NULL, '2020-10-23', '2025-01-22 08:47:00.954132', '2025-01-22 08:47:00.954132'),
(109, NULL, '2020-12-07', '2025-01-22 08:47:00.972175', '2025-01-22 08:47:00.972175'),
(110, NULL, '2020-12-10', '2025-01-22 08:47:00.991070', '2025-01-22 08:47:00.991070'),
(111, NULL, '2020-12-11', '2025-01-22 08:47:01.002828', '2025-01-22 08:47:01.002828'),
(112, NULL, '2020-12-31', '2025-01-22 08:47:01.013835', '2025-01-22 08:47:01.013835'),
(113, NULL, '2019-01-01', '2025-01-22 08:47:01.209383', '2025-01-22 08:47:01.209383'),
(114, NULL, '2019-02-19', '2025-01-22 08:47:01.221097', '2025-01-22 08:47:01.221097'),
(115, NULL, '2019-04-08', '2025-01-22 08:47:01.238976', '2025-01-22 08:47:01.238976'),
(116, NULL, '2019-04-15', '2025-01-22 08:47:01.255841', '2025-01-22 08:47:01.255841'),
(117, NULL, '2019-04-16', '2025-01-22 08:47:01.270517', '2025-01-22 08:47:01.270517'),
(118, NULL, '2019-05-01', '2025-01-22 08:47:01.285801', '2025-01-22 08:47:01.285801'),
(119, NULL, '2019-05-06', '2025-01-22 08:47:01.302146', '2025-01-22 08:47:01.302146'),
(120, NULL, '2019-05-20', '2025-01-22 08:47:01.315501', '2025-01-22 08:47:01.315501'),
(121, NULL, '2019-06-03', '2025-01-22 08:47:01.330769', '2025-01-22 08:47:01.330769'),
(122, NULL, '2019-07-16', '2025-01-22 08:47:01.350128', '2025-01-22 08:47:01.350128'),
(123, NULL, '2019-07-29', '2025-01-22 08:47:01.370986', '2025-01-22 08:47:01.370986'),
(124, NULL, '2019-08-12', '2025-01-22 08:47:01.389805', '2025-01-22 08:47:01.389805'),
(125, NULL, '2019-10-14', '2025-01-22 08:47:01.409102', '2025-01-22 08:47:01.409102'),
(126, NULL, '2019-10-23', '2025-01-22 08:47:01.428188', '2025-01-22 08:47:01.428188'),
(127, NULL, '2019-12-05', '2025-01-22 08:47:01.445749', '2025-01-22 08:47:01.445749'),
(128, NULL, '2019-12-10', '2025-01-22 08:47:01.457632', '2025-01-22 08:47:01.457632'),
(129, NULL, '2019-12-31', '2025-01-22 08:47:01.468362', '2025-01-22 08:47:01.468362'),
(130, NULL, '2018-01-01', '2025-01-22 08:47:01.635835', '2025-01-22 08:47:01.635835'),
(131, NULL, '2018-01-02', '2025-01-22 08:47:01.644583', '2025-01-22 08:47:01.644583'),
(132, NULL, '2018-03-01', '2025-01-22 08:47:01.654892', '2025-01-22 08:47:01.654892'),
(133, NULL, '2018-04-06', '2025-01-22 08:47:01.664162', '2025-01-22 08:47:01.664162'),
(134, NULL, '2018-04-13', '2025-01-22 08:47:01.673563', '2025-01-22 08:47:01.673563'),
(135, NULL, '2018-04-16', '2025-01-22 08:47:01.685331', '2025-01-22 08:47:01.685331'),
(136, NULL, '2018-05-01', '2025-01-22 08:47:01.698058', '2025-01-22 08:47:01.698058'),
(137, NULL, '2018-05-29', '2025-01-22 08:47:01.711129', '2025-01-22 08:47:01.711129'),
(138, NULL, '2018-07-27', '2025-01-22 08:47:01.723350', '2025-01-22 08:47:01.723350'),
(139, NULL, '2018-07-30', '2025-01-22 08:47:01.735633', '2025-01-22 08:47:01.735633'),
(140, NULL, '2018-08-13', '2025-01-22 08:47:01.747630', '2025-01-22 08:47:01.747630'),
(141, NULL, '2018-10-15', '2025-01-22 08:47:01.760161', '2025-01-22 08:47:01.760161'),
(142, NULL, '2018-10-23', '2025-01-22 08:47:01.772108', '2025-01-22 08:47:01.772108'),
(143, NULL, '2018-12-05', '2025-01-22 08:47:01.785527', '2025-01-22 08:47:01.785527'),
(144, NULL, '2018-12-10', '2025-01-22 08:47:01.798310', '2025-01-22 08:47:01.798310'),
(145, NULL, '2018-12-31', '2025-01-22 08:47:01.813033', '2025-01-22 08:47:01.813033'),
(146, NULL, '2017-01-02', '2025-01-22 08:47:01.992679', '2025-01-22 08:47:01.992679'),
(147, NULL, '2017-01-03', '2025-01-22 08:47:01.998661', '2025-01-22 08:47:01.998661'),
(148, NULL, '2017-02-13', '2025-01-22 08:47:02.009408', '2025-01-22 08:47:02.009408'),
(149, NULL, '2017-04-06', '2025-01-22 08:47:02.020193', '2025-01-22 08:47:02.020193'),
(150, NULL, '2017-04-13', '2025-01-22 08:47:02.029853', '2025-01-22 08:47:02.029853'),
(151, NULL, '2017-04-14', '2025-01-22 08:47:02.039686', '2025-01-22 08:47:02.039686'),
(152, NULL, '2017-05-01', '2025-01-22 08:47:02.052997', '2025-01-22 08:47:02.052997'),
(153, NULL, '2017-05-05', '2025-01-22 08:47:02.064987', '2025-01-22 08:47:02.064987'),
(154, NULL, '2017-05-10', '2025-01-22 08:47:02.071772', '2025-01-22 08:47:02.071772'),
(155, NULL, '2017-07-10', '2025-01-22 08:47:02.083963', '2025-01-22 08:47:02.083963'),
(156, NULL, '2017-08-14', '2025-01-22 08:47:02.096795', '2025-01-22 08:47:02.096795'),
(157, NULL, '2017-10-23', '2025-01-22 08:47:02.108690', '2025-01-22 08:47:02.108690'),
(158, NULL, '2017-12-05', '2025-01-22 08:47:02.120258', '2025-01-22 08:47:02.120258'),
(159, NULL, '2017-12-11', '2025-01-22 08:47:02.132177', '2025-01-22 08:47:02.132177'),
(160, NULL, '2016-01-01', '2025-01-22 08:47:02.346917', '2025-01-22 08:47:02.346917'),
(161, NULL, '2016-02-22', '2025-01-22 08:47:02.362370', '2025-01-22 08:47:02.362370'),
(162, NULL, '2016-04-06', '2025-01-22 08:47:02.376004', '2025-01-22 08:47:02.376004'),
(163, NULL, '2016-04-13', '2025-01-22 08:47:02.386550', '2025-01-22 08:47:02.386550'),
(164, NULL, '2016-04-14', '2025-01-22 08:47:02.394015', '2025-01-22 08:47:02.394015'),
(165, NULL, '2016-04-15', '2025-01-22 08:47:02.401094', '2025-01-22 08:47:02.401094'),
(166, NULL, '2016-05-02', '2025-01-22 08:47:02.407998', '2025-01-22 08:47:02.407998'),
(167, NULL, '2016-05-05', '2025-01-22 08:47:02.414555', '2025-01-22 08:47:02.414555'),
(168, NULL, '2016-05-06', '2025-01-22 08:47:02.420451', '2025-01-22 08:47:02.420451'),
(169, NULL, '2016-05-20', '2025-01-22 08:47:02.431042', '2025-01-22 08:47:02.431042'),
(170, NULL, '2016-07-01', '2025-01-22 08:47:02.441906', '2025-01-22 08:47:02.441906'),
(171, NULL, '2016-07-18', '2025-01-22 08:47:02.453764', '2025-01-22 08:47:02.453764'),
(172, NULL, '2016-07-19', '2025-01-22 08:47:02.467722', '2025-01-22 08:47:02.467722'),
(173, NULL, '2016-08-12', '2025-01-22 08:47:02.478537', '2025-01-22 08:47:02.478537'),
(174, NULL, '2016-10-24', '2025-01-22 08:47:02.492263', '2025-01-22 08:47:02.492263'),
(175, NULL, '2016-12-05', '2025-01-22 08:47:02.504666', '2025-01-22 08:47:02.504666'),
(176, NULL, '2016-12-12', '2025-01-22 08:47:02.512400', '2025-01-22 08:47:02.512400'),
(177, NULL, '2015-01-01', '2025-01-22 08:47:02.699977', '2025-01-22 08:47:02.699977'),
(178, NULL, '2015-01-02', '2025-01-22 08:47:02.710745', '2025-01-22 08:47:02.710745'),
(179, NULL, '2015-03-04', '2025-01-22 08:47:02.722845', '2025-01-22 08:47:02.722845'),
(180, NULL, '2015-04-06', '2025-01-22 08:47:02.733073', '2025-01-22 08:47:02.733073'),
(181, NULL, '2015-04-13', '2025-01-22 08:47:02.744797', '2025-01-22 08:47:02.744797'),
(182, NULL, '2015-04-14', '2025-01-22 08:47:02.755021', '2025-01-22 08:47:02.755021'),
(183, NULL, '2015-04-15', '2025-01-22 08:47:02.768443', '2025-01-22 08:47:02.768443'),
(184, NULL, '2015-05-01', '2025-01-22 08:47:02.779501', '2025-01-22 08:47:02.779501'),
(185, NULL, '2015-05-04', '2025-01-22 08:47:02.791227', '2025-01-22 08:47:02.791227'),
(186, NULL, '2015-05-05', '2025-01-22 08:47:02.818157', '2025-01-22 08:47:02.818157'),
(187, NULL, '2015-06-01', '2025-01-22 08:47:02.838223', '2025-01-22 08:47:02.838223'),
(188, NULL, '2015-07-01', '2025-01-22 08:47:02.855925', '2025-01-22 08:47:02.855925'),
(189, NULL, '2015-07-30', '2025-01-22 08:47:02.869831', '2025-01-22 08:47:02.869831'),
(190, NULL, '2015-08-12', '2025-01-22 08:47:02.887679', '2025-01-22 08:47:02.887679'),
(191, NULL, '2015-10-23', '2025-01-22 08:47:02.900189', '2025-01-22 08:47:02.900189'),
(192, NULL, '2015-12-07', '2025-01-22 08:47:02.919477', '2025-01-22 08:47:02.919477'),
(193, NULL, '2015-12-10', '2025-01-22 08:47:02.938933', '2025-01-22 08:47:02.938933'),
(194, NULL, '2015-12-31', '2025-01-22 08:47:02.951359', '2025-01-22 08:47:02.951359');

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
  `reseve_status` enum('รอ','อนุมัติ','ยกเลิก') NOT NULL DEFAULT 'รอ',
  `reason` varchar(255) NOT NULL,
  `cancelTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Serve_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orders_ID`, `Serve_Name`, `Serve_Categories`, `Quantity`, `CostPerson`, `SpecialRoomBooking_Id`, `Serve_Time`) VALUES
(1, 'พักเบรค 1', 'อาหารว่าง', 10, 70.00, 1, '00:00:00'),
(2, 'อาหารพักเที่ยง', 'อาหารเที่ยง', 10, 70.00, 1, '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participant_ID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `userbookingUserbookingId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleId`, `position`) VALUES
(1, 'นิสิต'),
(4, 'บุคลากรภายนอก'),
(2, 'อาจาร์ย'),
(3, 'เจ้าหน้าที่');

-- --------------------------------------------------------

--
-- Table structure for table `role_assignment`
--

CREATE TABLE `role_assignment` (
  `roleAssId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  ` userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_assignment`
--

INSERT INTO `role_assignment` (`roleAssId`, `roleId`, ` userId`) VALUES
(1, 2, 64160100);

-- --------------------------------------------------------

--
-- Table structure for table `role_room_access`
--

CREATE TABLE `role_room_access` (
  `access_ID` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_room_access`
--

INSERT INTO `role_room_access` (`access_ID`, `roomId`, `roleId`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 19, 1),
(17, 20, 1),
(18, 21, 1),
(19, 22, 1),
(20, 23, 1),
(21, 24, 1),
(22, 25, 1),
(23, 26, 1),
(24, 27, 1),
(25, 28, 1),
(26, 29, 1),
(27, 30, 1),
(28, 31, 1),
(29, 1, 2),
(30, 2, 2),
(31, 3, 2),
(32, 4, 2),
(33, 5, 2),
(34, 6, 2),
(35, 7, 2),
(36, 8, 2),
(37, 9, 2),
(38, 10, 2),
(39, 11, 2),
(40, 12, 2),
(41, 13, 2),
(42, 14, 2),
(43, 15, 2),
(44, 16, 2),
(45, 17, 2),
(46, 18, 2),
(47, 19, 2),
(48, 20, 2),
(49, 21, 2),
(50, 22, 2),
(51, 23, 2),
(52, 24, 2),
(53, 25, 2),
(54, 26, 2),
(55, 27, 2),
(56, 28, 2),
(57, 29, 2),
(58, 30, 2),
(59, 31, 2),
(60, 32, 2),
(61, 35, 2),
(62, 36, 2),
(63, 1, 3),
(64, 2, 3),
(65, 3, 3),
(66, 4, 3),
(67, 5, 3),
(68, 6, 3),
(69, 7, 3),
(70, 8, 3),
(71, 9, 3),
(72, 10, 3),
(73, 11, 3),
(74, 12, 3),
(75, 13, 3),
(76, 14, 3),
(77, 15, 3),
(78, 16, 3),
(79, 17, 3),
(80, 18, 3),
(81, 19, 3),
(82, 20, 3),
(83, 21, 3),
(84, 22, 3),
(85, 23, 3),
(86, 24, 3),
(87, 25, 3),
(88, 26, 3),
(89, 27, 3),
(90, 28, 3),
(91, 29, 3),
(92, 30, 3),
(93, 31, 3),
(94, 32, 3),
(95, 35, 3),
(96, 36, 3);

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
  `floorFloorId` int(11) NOT NULL,
  `RoomKey` varchar(255) NOT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `DetailRoom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomId`, `room_Name`, `capacity`, `max_hours`, `room_Status`, `room_Type`, `room_Minimum`, `orderFood`, `floorFloorId`, `RoomKey`, `imagePath`, `DetailRoom`) VALUES
(1, 'ศึกษากลุ่ม 1', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2, '', NULL, ''),
(2, 'ศึกษากลุ่ม 2', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2, '', NULL, ''),
(3, 'ศึกษากลุ่ม 3', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2, '', NULL, ''),
(4, 'ศึกษากลุ่ม 4', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2, '', NULL, ''),
(5, 'ศึกษากลุ่ม 5', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2, '', NULL, ''),
(6, 'ศึกษากลุ่ม 1', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3, '', NULL, ''),
(7, 'ศึกษากลุ่ม 2', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3, '', NULL, ''),
(8, 'ศึกษากลุ่ม 3', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3, '', NULL, ''),
(9, 'ศึกษากลุ่ม 4', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3, '', NULL, ''),
(10, 'ศึกษากลุ่ม 5', 5, 2, 'ว่าง', 'Group study', 3, 'No', 3, '', NULL, ''),
(11, 'ศึกษากลุ่ม 1', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4, '', NULL, ''),
(12, 'ศึกษากลุ่ม 2', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4, '', NULL, ''),
(13, 'ศึกษากลุ่ม 3', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4, '', NULL, ''),
(14, 'ศึกษากลุ่ม 4', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4, '', NULL, ''),
(15, 'ศึกษากลุ่ม 5', 5, 2, 'ว่าง', 'Group study', 3, 'No', 4, '', NULL, ''),
(16, 'Lecture\'s room 1', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 4, '', '/uploads/rooms/room-1739243157769.png', ''),
(17, 'Lecture\'s room 2', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 4, '', '/uploads/rooms/room-1739243159477.png', ''),
(18, 'Lecture\'s room 3', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 4, '', '/uploads/rooms/room-1739243161187.png', ''),
(19, '640 Smart Board', 10, 2, 'ว่าง', 'Meeting', 8, 'No', 5, '', '/uploads/rooms/room-1739243173855.png', ''),
(20, 'LIBRA OKE I', 5, 2, 'ว่าง', 'Entertain', 3, 'No', 5, '', '/uploads/rooms/room-1739243140193.png', ''),
(21, 'LIBRA OKE II', 5, 2, 'ว่าง', 'Entertain', 3, 'No', 5, '', '/uploads/rooms/room-1739243142632.png', ''),
(22, 'Mini theater', 30, 2, 'ว่าง', 'Entertain', 10, 'No', 5, '', '/uploads/rooms/room-1739243187275.png', ''),
(23, 'STV-1', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', '/uploads/rooms/room-1739243055866.png', ''),
(24, 'STV-2', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(25, 'STV-3', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(26, 'STV-4', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(27, 'STV-5', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(28, 'STV-6', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(29, 'STV-7', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(30, 'STV-8', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(31, 'STV-9', 5, 3, 'ว่าง', 'Entertain', 3, 'No', 5, '', NULL, ''),
(32, 'Mini Studio', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 5, '', '/uploads/rooms/room-1739243212062.png', ''),
(35, 'CYBER ZONE I', 70, 24, 'ว่าง', 'Meeting', 1, 'Yes', 5, '', '/uploads/rooms/room-1739243230260.png', ''),
(36, 'CYBER ZONE II', 30, 24, 'ว่าง', 'Meeting', 1, 'Yes', 5, '', '/uploads/rooms/room-1739243237619.png', ''),
(37, 'ห้อง 201', 50, 24, 'ว่าง', 'Meeting', 20, 'Yes', 1, '', '/uploads/rooms/room-1739243121231.png', ''),
(38, 'ห้อง 706', 50, 24, 'ว่าง', 'Meeting', 1, 'Yes', 6, '', NULL, ''),
(39, 'ห้อง 707', 50, 24, 'ว่าง', 'Meeting', 1, 'Yes', 6, '', NULL, ''),
(40, 'Live for Life', 5, 2, 'ว่าง', 'Meeting', 3, 'No', 5, '', '/uploads/rooms/room-1739243198499.png', ''),
(41, 'ศึกษากลุ่ม 6', 5, 2, 'ว่าง', 'Group study', 3, 'No', 2, '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `special_room_booking`
--

CREATE TABLE `special_room_booking` (
  `srb_Id` int(11) NOT NULL,
  `people_Count` int(11) NOT NULL,
  `start_Date` date NOT NULL,
  `start_Time` time NOT NULL,
  `end_Date` date NOT NULL,
  `end_Time` time NOT NULL,
  `stage_Name` varchar(255) NOT NULL,
  `reseve_status` enum('รอ','อนุมัติ','ยกเลิก') DEFAULT 'รอ',
  `equip_Descript` text NOT NULL,
  `order_Description` text NOT NULL,
  `documentId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `contract_Number` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `cancelTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_room_booking`
--

INSERT INTO `special_room_booking` (`srb_Id`, `people_Count`, `start_Date`, `start_Time`, `end_Date`, `end_Time`, `stage_Name`, `reseve_status`, `equip_Descript`, `order_Description`, `documentId`, `userId`, `roomId`, `contract_Number`, `reason`, `cancelTime`) VALUES
(1, 10, '2024-12-23', '00:00:09', '2024-12-23', '00:00:12', 'No', 'รอ', 'ต้องการอยากละตัว', 'ขออาหารสำหรับอิสลาม', 1, 64160100, 36, '084123123', '', NULL);

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
(64160100, 'john_doe', 'pass123', 'John', 'Doe', 'john.doe@example.com'),
(64160101, 'jane_smith', 'secure456', 'Jane', 'Smith', 'jane.smith@example.com'),
(64160102, 'michael_brown', 'michael789', 'Michael', 'Brown', 'michael.brown@example.com'),
(64160103, 'emily_clark', 'emily123', 'Emily', 'Clark', 'emily.clark@example.com'),
(64160104, 'david_jones', 'david456', 'David', 'Jones', 'david.jones@example.com'),
(64160105, 'sarah_wilson', 'sarah789', 'Sarah', 'Wilson', 'sarah.wilson@example.com'),
(64160106, 'chris_moore', 'chris123', 'Chris', 'Moore', 'chris.moore@example.com'),
(64160107, 'lisa_white', 'lisa456', 'Lisa', 'White', 'lisa.white@example.com'),
(64160108, 'mark_taylor', 'mark789', 'Mark', 'Taylor', 'mark.taylor@example.com'),
(64160109, 'laura_green', 'laura123', 'Laura', 'Green', 'laura.green@example.com'),
(64160110, 'daniel_lee', 'daniel456', 'Daniel', 'Lee', 'daniel.lee@example.com'),
(64160111, 'olivia_king', 'olivia789', 'Olivia', 'King', 'olivia.king@example.com'),
(64160112, 'james_hill', 'james123', 'James', 'Hill', 'james.hill@example.com'),
(64160113, 'amanda_wright', 'amanda456', 'Amanda', 'Wright', 'amanda.wright@example.com'),
(64160114, 'william_scott', 'william789', 'William', 'Scott', 'william.scott@example.com'),
(64160115, 'emma_turner', 'emma123', 'Emma', 'Turner', 'emma.turner@example.com'),
(64160116, 'anthony_harris', 'anthony456', 'Anthony', 'Harris', 'anthony.harris@example.com'),
(64160117, 'charlotte_wood', 'charlotte789', 'Charlotte', 'Wood', 'charlotte.wood@example.com'),
(64160118, 'patrick_martin', 'patrick123', 'Patrick', 'Martin', 'patrick.martin@example.com'),
(64160119, 'natalie_adams', 'natalie456', 'Natalie', 'Adams', 'natalie.adams@example.com');

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
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_c46c5409bbe0938a0a5f55baab` (`holiday_date`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `eq_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `equipment_booking`
--
ALTER TABLE `equipment_booking`
  MODIFY `eqb_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `floorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `normal_room_booking`
--
ALTER TABLE `normal_room_booking`
  MODIFY `nrbId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `orders_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_assignment`
--
ALTER TABLE `role_assignment`
  MODIFY `roleAssId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_room_access`
--
ALTER TABLE `role_room_access`
  MODIFY `access_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `special_room_booking`
--
ALTER TABLE `special_room_booking`
  MODIFY `srb_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64160120;

--
-- AUTO_INCREMENT for table `user_booking`
--
ALTER TABLE `user_booking`
  MODIFY `userbooking_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `confirmation`
--
ALTER TABLE `confirmation`
  ADD CONSTRAINT `FK_0e4cebfabdbe9ac004bca866930` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_1d6c43d1d9f54a4ebe43298ef6c` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_74f1ebea7c18510697c0e2a6be4` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `equipment_booking`
--
ALTER TABLE `equipment_booking`
  ADD CONSTRAINT `FK_dd4f839733d740ee83be07f1eca` FOREIGN KEY (`srb_Id`) REFERENCES `special_room_booking` (`srb_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f6ca91688a66fa4250606fc135b` FOREIGN KEY (`eq_Id`) REFERENCES `equipment` (`eq_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `normal_room_booking`
--
ALTER TABLE `normal_room_booking`
  ADD CONSTRAINT `FK_3f245faeb2540f5cc68a1dc6b31` FOREIGN KEY (`roomBookingRoomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_cd58500313208b8e2d90cfbdf5d` FOREIGN KEY (`SpecialRoomBooking_Id`) REFERENCES `special_room_booking` (`srb_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_9889567b0352af2b42b32c16605` FOREIGN KEY (`userbookingUserbookingId`) REFERENCES `user_booking` (`userbooking_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD CONSTRAINT `FK_e380790fc3538ffc4ea83364af0` FOREIGN KEY (` userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f0de67fd09cd3cd0aabca79994d` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_room_access`
--
ALTER TABLE `role_room_access`
  ADD CONSTRAINT `FK_8a4caa8eca13637dcb5b5040f26` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_b03a43a6f1cdbbbc499391b5b03` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FK_8697484563e73b998d9129c4a3d` FOREIGN KEY (`floorFloorId`) REFERENCES `floor` (`floorId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `special_room_booking`
--
ALTER TABLE `special_room_booking`
  ADD CONSTRAINT `FK_07fab35fc40d3a36e529b8c14fb` FOREIGN KEY (`documentId`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_8f52b72c21db4ed794a7d7479d2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_a2698ea3ee59fb004363a9f3403` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_booking`
--
ALTER TABLE `user_booking`
  ADD CONSTRAINT `FK_7d6ab1e026437ee4ce83792b6b8` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b8da943e818b43ecba47899c8e9` FOREIGN KEY (`nrbId`) REFERENCES `normal_room_booking` (`nrbId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
