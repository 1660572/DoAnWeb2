-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2019 at 09:33 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webphim`
--

-- --------------------------------------------------------

--
-- Table structure for table `cumrap`
--

CREATE TABLE `cumrap` (
  `ID` int(50) NOT NULL,
  `Ten` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datcho`
--

CREATE TABLE `datcho` (
  `ID` int(50) NOT NULL,
  `IDNguoiDung` int(50) NOT NULL,
  `IDSuatChieu` int(50) NOT NULL,
  `TGDatVe` datetime(6) NOT NULL,
  `TongTien` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `HoTen` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `VaiTro` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phim`
--

CREATE TABLE `phim` (
  `ID` int(50) NOT NULL,
  `Ten` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `NgayCongChieu` datetime(6) NOT NULL,
  `Poster` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ThoiLuong` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rap`
--

CREATE TABLE `rap` (
  `ID` int(50) NOT NULL,
  `Ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IDCumRap` int(50) NOT NULL,
  `LoaiRap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `KTChieuNgang` int(50) NOT NULL,
  `KTChieuDoc` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suatchieu`
--

CREATE TABLE `suatchieu` (
  `IDSuatChieu` int(50) NOT NULL,
  `IDphim` int(50) NOT NULL,
  `IDrap` int(50) NOT NULL,
  `TGBD` datetime(6) NOT NULL,
  `TGKT` datetime(6) NOT NULL,
  `GiaVe` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ve`
--

CREATE TABLE `ve` (
  `ID` int(50) NOT NULL,
  `IDDatCho` int(50) NOT NULL,
  `MaGhe` int(50) NOT NULL,
  `DCNgang` int(50) NOT NULL,
  `DCDoc` int(50) NOT NULL,
  `GiaTien` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cumrap`
--
ALTER TABLE `cumrap`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `datcho`
--
ALTER TABLE `datcho`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDNguoiDung` (`IDNguoiDung`),
  ADD KEY `IDSuatChieu` (`IDSuatChieu`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phim`
--
ALTER TABLE `phim`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rap`
--
ALTER TABLE `rap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDCumRap` (`IDCumRap`);

--
-- Indexes for table `suatchieu`
--
ALTER TABLE `suatchieu`
  ADD PRIMARY KEY (`IDSuatChieu`),
  ADD KEY `IDphim` (`IDphim`),
  ADD KEY `suatchieu_ibfk_1` (`IDrap`);

--
-- Indexes for table `ve`
--
ALTER TABLE `ve`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDDatCho` (`IDDatCho`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datcho`
--
ALTER TABLE `datcho`
  ADD CONSTRAINT `datcho_ibfk_1` FOREIGN KEY (`IDNguoiDung`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `datcho_ibfk_2` FOREIGN KEY (`IDSuatChieu`) REFERENCES `suatchieu` (`IDSuatChieu`);

--
-- Constraints for table `rap`
--
ALTER TABLE `rap`
  ADD CONSTRAINT `rap_ibfk_1` FOREIGN KEY (`IDCumRap`) REFERENCES `cumrap` (`ID`);

--
-- Constraints for table `suatchieu`
--
ALTER TABLE `suatchieu`
  ADD CONSTRAINT `suatchieu_ibfk_1` FOREIGN KEY (`IDrap`) REFERENCES `rap` (`ID`),
  ADD CONSTRAINT `suatchieu_ibfk_2` FOREIGN KEY (`IDphim`) REFERENCES `phim` (`ID`);

--
-- Constraints for table `ve`
--
ALTER TABLE `ve`
  ADD CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`IDDatCho`) REFERENCES `datcho` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
