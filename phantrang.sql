-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2020 at 09:21 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phantrang`
--

-- --------------------------------------------------------

--
-- Table structure for table `baohanh`
--

CREATE TABLE `baohanh` (
  `PK_SEQ` int(11) NOT NULL,
  `loaibaohanh` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mabaohanh` varchar(5) NOT NULL,
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `baohanh`
--

INSERT INTO `baohanh` (`PK_SEQ`, `loaibaohanh`, `mabaohanh`, `time`, `status`, `date_create`) VALUES
(600001, 'Kim Cương', 'KC', '5 năm', b'1', '2020-06-25 02:11:05'),
(600002, 'Vàng', 'VA', '3 năm', b'1', '2020-06-25 02:10:59'),
(600003, 'Bạc', 'BA', '2 năm', b'1', '2020-06-25 02:06:18'),
(600004, 'Đồng', 'DO', '1 năm', b'1', '2020-06-24 09:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `computer`
--

CREATE TABLE `computer` (
  `PK_SEQ` int(11) NOT NULL,
  `computername` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `computermodel` varchar(20) NOT NULL,
  `mabaohanh_fk` varchar(5) NOT NULL,
  `store_fk` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computer`
--

INSERT INTO `computer` (`PK_SEQ`, `computername`, `computermodel`, `mabaohanh_fk`, `store_fk`, `status`, `date_create`) VALUES
(600000, 'Dell Latitude E6510', 'E6510', 'DO', 600000, b'1', '2020-06-24 09:58:03'),
(600001, 'Acer Abc D34', 'D34', 'KC', 600001, b'1', '2020-06-24 09:58:38'),
(600002, 'Asus X409MA-BV034T', 'BV034T', 'VA', 600002, b'1', '2020-06-24 10:00:53'),
(600003, 'Máy tinh B', 'A123', 'KC', 600001, b'1', '2020-06-25 01:46:42'),
(600004, 'Máy tinh ThinkPad', 'A345', 'KC', 600002, b'1', '2020-06-25 01:54:21'),
(600005, 'Máy tinh Razer', 'Blade', 'VA', 600003, b'1', '2020-06-25 01:55:22'),
(600006, 'Máy tinh Microsoft', 'BanT', 'KC', 600001, b'1', '2020-06-25 01:56:20'),
(600007, 'Laptop Asus X409MA-B', 'BV034T', 'DO', 600003, b'1', '2020-06-25 01:59:51'),
(600008, 'Laptop Acer X349MA-D', 'X349MA', 'DO', 600002, b'1', '2020-06-25 02:00:52'),
(600009, 'Laptop Acer 123', '123', 'DO', 600001, b'1', '2020-06-25 02:01:08'),
(600010, 'Laptop Dell ixpre', 'ixpre', 'DO', 600001, b'1', '2020-06-25 02:01:27'),
(600011, 'Laptop Asus VivoBook', 'A512DA', 'VA', 600002, b'1', '2020-06-25 02:02:11'),
(600012, 'Lenovo ThinkPad X240', 'X240', 'BA', 600000, b'1', '2020-06-25 02:02:52'),
(600013, 'Lenovo ThinkPad X340', 'X340', 'VA', 600003, b'1', '2020-06-25 02:06:51'),
(600014, 'Laptop Asus VivoBook', 'S533FA', 'KC', 600001, b'1', '2020-06-25 02:07:21'),
(600015, 'Laptop Asus X409JA-E', 'EK014T', 'KC', 600001, b'1', '2020-06-25 02:08:25'),
(600016, 'Laptop thời thượng', 'LTT', 'KC', 600001, b'1', '2020-06-25 04:28:19'),
(600017, 'Dell Precision 6800', '6800', 'KC', 600002, b'1', '2020-06-25 04:30:02'),
(600019, 'Dell Alienware 17 R5', '6800', 'VA', 600003, b'1', '2020-06-25 04:30:52'),
(600020, 'Lenovo ThinkPad Yoga', 'X380', 'VA', 600003, b'1', '2020-06-25 04:31:25'),
(600021, 'DELL Latitude 5289 1', '5289', 'KC', 600000, b'1', '2020-06-25 04:32:14'),
(600022, 'Dell XPS 9380, Core ', '5289', 'KC', 600004, b'1', '2020-06-25 04:34:02'),
(600023, 'Dell Latitude 5501', '5501', 'VA', 600004, b'1', '2020-06-25 04:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `PK_SEQ` int(11) NOT NULL,
  `storename` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`PK_SEQ`, `storename`, `Address`, `status`, `date_create`) VALUES
(600000, 'Viễn Thông A', '234 Mạc Thị Bưởi, F9, Quận 3', b'1', '2020-06-24 09:52:05'),
(600001, 'Nguyễn Kim', '123 Trần Hưng Đạo, F1, Quận 1', b'1', '2020-06-24 04:55:26'),
(600002, 'Thế Giới Di Động', '50 Quang Trung, F8, Gò Vấp', b'1', '2020-06-24 04:56:51'),
(600003, 'Điện máy xanh', '345 Nguyễn Văn Cừ, F7, Quận 5', b'1', '2020-06-24 09:55:02'),
(600004, 'centerlap.com', '133/19B Hòa Hưng, Phường 12, Quận 10, TP. HCM', b'1', '2020-06-25 04:33:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baohanh`
--
ALTER TABLE `baohanh`
  ADD PRIMARY KEY (`PK_SEQ`),
  ADD UNIQUE KEY `loaibaohanh` (`loaibaohanh`),
  ADD UNIQUE KEY `mabaohanh` (`mabaohanh`);

--
-- Indexes for table `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`PK_SEQ`),
  ADD KEY `store_fk_ib` (`store_fk`),
  ADD KEY `baohanh_fk_ib` (`mabaohanh_fk`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`PK_SEQ`),
  ADD UNIQUE KEY `storename` (`storename`),
  ADD UNIQUE KEY `Address` (`Address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baohanh`
--
ALTER TABLE `baohanh`
  MODIFY `PK_SEQ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600005;

--
-- AUTO_INCREMENT for table `computer`
--
ALTER TABLE `computer`
  MODIFY `PK_SEQ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600024;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `PK_SEQ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600005;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `baohanh_fk_ib` FOREIGN KEY (`mabaohanh_fk`) REFERENCES `baohanh` (`mabaohanh`),
  ADD CONSTRAINT `store_fk_ib` FOREIGN KEY (`store_fk`) REFERENCES `store` (`PK_SEQ`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
