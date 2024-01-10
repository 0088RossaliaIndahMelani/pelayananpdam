-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 06:02 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdamtirta`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_himbauan`
--

CREATE TABLE `tb_himbauan` (
  `id_himbauan` int(11) NOT NULL,
  `no_kontrol` varchar(50) DEFAULT NULL,
  `lama_tunggakan` int(3) DEFAULT NULL,
  `awal` int(3) DEFAULT NULL,
  `akhir` int(3) DEFAULT NULL,
  `total_tunggakan` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_keluhan`
--

CREATE TABLE `tb_keluhan` (
  `id_keluhan` int(5) NOT NULL,
  `nama_permohon` varchar(50) DEFAULT NULL,
  `alamat_permohon` varchar(200) DEFAULT NULL,
  `tanggal_permohon` date DEFAULT NULL,
  `no_agenda` varchar(50) DEFAULT NULL,
  `ukuran_meter` varchar(20) DEFAULT NULL,
  `merek_meter` varchar(50) DEFAULT NULL,
  `seri_meter` varchar(50) DEFAULT NULL,
  `tgl_pengaduan` date DEFAULT NULL,
  `tgl_pk` date DEFAULT NULL,
  `tgl_meter` date DEFAULT NULL,
  `tgl_pasang` date DEFAULT NULL,
  `jenis_keluhan` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `no_kontrol` varchar(50) DEFAULT NULL,
  `reply_keluhan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `no_kontrol` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(3) DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`no_kontrol`, `password`, `role_id`, `date_created`) VALUES
('001', 'ee11cbb19052e40b07aac0ca060c23ee', 2, '2023-10-18'),
('admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2023-10-23'),
('user', 'ee11cbb19052e40b07aac0ca060c23ee', 2, '2023-10-23');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(4) NOT NULL,
  `no_kontrol` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(30) DEFAULT NULL,
  `aktif` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `no_kontrol`, `name`, `alamat`, `no_telepon`, `aktif`) VALUES
(10, '001', 'user', '12', '12', 'Y'),
(11, 'admin', 'admin', 'pekalongan', '087821130478', 'Y'),
(12, 'user', 'user', 'pekalongan', '085956534511', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tagihan`
--

CREATE TABLE `tb_tagihan` (
  `id_tagihan` int(5) NOT NULL,
  `no_kontrol` varchar(50) DEFAULT NULL,
  `bulan` int(2) DEFAULT NULL,
  `tahun` int(6) DEFAULT NULL,
  `st_awal` int(4) DEFAULT NULL,
  `st_akhir` int(4) DEFAULT NULL,
  `pemakaian` int(4) DEFAULT NULL,
  `lunas` varchar(10) DEFAULT NULL,
  `aktif` varchar(10) DEFAULT NULL,
  `tarif` varchar(4) DEFAULT NULL,
  `biaya` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_himbauan`
--
ALTER TABLE `tb_himbauan`
  ADD PRIMARY KEY (`id_himbauan`),
  ADD KEY `no_kontrol` (`no_kontrol`);

--
-- Indexes for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  ADD PRIMARY KEY (`id_keluhan`),
  ADD KEY `no_kontrol` (`no_kontrol`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`no_kontrol`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `no_kontrol` (`no_kontrol`);

--
-- Indexes for table `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `no_kontrol` (`no_kontrol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_himbauan`
--
ALTER TABLE `tb_himbauan`
  MODIFY `id_himbauan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  MODIFY `id_keluhan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  MODIFY `id_tagihan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_himbauan`
--
ALTER TABLE `tb_himbauan`
  ADD CONSTRAINT `tb_himbauan_ibfk_1` FOREIGN KEY (`no_kontrol`) REFERENCES `tb_login` (`no_kontrol`);

--
-- Constraints for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  ADD CONSTRAINT `tb_keluhan_ibfk_1` FOREIGN KEY (`no_kontrol`) REFERENCES `tb_login` (`no_kontrol`);

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`no_kontrol`) REFERENCES `tb_login` (`no_kontrol`);

--
-- Constraints for table `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD CONSTRAINT `tb_tagihan_ibfk_1` FOREIGN KEY (`no_kontrol`) REFERENCES `tb_login` (`no_kontrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
