-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2019 at 04:05 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_user` int(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_user`, `nama_user`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-02-21 04:14:16', '2017-03-06 13:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_mahasiswa` varchar(20) DEFAULT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `nama_mahasiswa` varchar(20) DEFAULT NULL,
  `no_hp_lama` varchar(20) DEFAULT NULL,
  `no_hp_baru` varchar(20) DEFAULT NULL,
  `tgl_diubah` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `id_mahasiswa`, `nim`, `nama_mahasiswa`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(1, '13', '1', '1', '99', '5', '2019-11-09 09:36:07'),
(2, '1', '161240000590', 'Muhammad Azhar Salim', '00', '69', '2019-11-09 09:49:45'),
(3, '5', '161240000594', 'Muhammad Sakti', '00', '99', '2019-11-09 10:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_mahasiswa` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nomer_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nim`, `nama_mahasiswa`, `jenis_kelamin`, `alamat`, `nomer_hp`) VALUES
(1, '161240000590', 'Muhammad Azhar Salim', 'L', 'Jepara', '69'),
(2, '161240000591', 'Muhammad', 'L', 'Jepara', '00'),
(3, '161240000592', 'Azhar', 'L', 'Jepara', '00'),
(4, '161240000593', 'Salim', 'L', 'Jepara', '00'),
(5, '161240000594', 'Muhammad Sakti', 'L', 'Jepara', '99'),
(15, '0', '0', '0', '0', '0');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `before_update` BEFORE UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
    INSERT INTO log
    set id_mahasiswa = OLD.id_mahasiswa,
	nim = OLD.nim,
	nama_mahasiswa = OLD.nama_mahasiswa,
	no_hp_lama=old.nomer_hp,
    	no_hp_baru=new.nomer_hp,
	tgl_diubah = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil`
-- (See below for the actual view)
--
CREATE TABLE `tampil` (
`id_mahasiswa` int(11)
,`nim` varchar(20)
,`nama_mahasiswa` varchar(20)
,`jenis_kelamin` varchar(1)
,`alamat` varchar(50)
,`nomer_hp` varchar(12)
);

-- --------------------------------------------------------

--
-- Structure for view `tampil`
--
DROP TABLE IF EXISTS `tampil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil`  AS  (select `mahasiswa`.`id_mahasiswa` AS `id_mahasiswa`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`,`mahasiswa`.`jenis_kelamin` AS `jenis_kelamin`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`nomer_hp` AS `nomer_hp` from `mahasiswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_user` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
