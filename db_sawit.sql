-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2020 at 04:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sawit`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `kode_cust` varchar(10) DEFAULT NULL,
  `nama_pt` varchar(100) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `sppkp` varchar(100) DEFAULT NULL,
  `tgl_bergabung` date DEFAULT NULL,
  `tgl_habis_kontrak` date DEFAULT NULL,
  `no_hp` varchar(100) DEFAULT NULL,
  `no_telp` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `kode_cust`, `nama_pt`, `npwp`, `sppkp`, `tgl_bergabung`, `tgl_habis_kontrak`, `no_hp`, `no_telp`, `alamat`) VALUES
(1, 'CST01', 'PT. SAWIT MAJU MUNDUR AJA', '9999', '9999', '2019-12-22', '2022-12-31', '0511', '0813', 'JL. BANJARMASIN'),
(4, 'CST02', 'PT BINUS SAWIT', '8920388746688', '6738930', '2020-05-08', '2021-05-08', '0876542637', '02156789', 'JL KEMANGGISAN JAKARTA BARAT');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenkel` enum('l','p') DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `status_aktif` enum('1','0') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `tgl_lahir`, `jenkel`, `no_hp`, `alamat`, `jabatan`, `status_aktif`) VALUES
(1, 'Ratih Syabrina', '2016-12-06', 'p', '081324444555', 'jl. banjarmasin kalimantan selatan', 'MANAGER', '0'),
(3, 'Khumaeni', '2004-07-06', 'l', '081267890234', 'Jl. Kebun Jeruk', 'PENGAWAS', '1'),
(4, 'Siska Elymia ', '2013-05-16', 'p', '08121212678', 'Jl Cirendeu', 'MANAGER', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kebun`
--

CREATE TABLE `kebun` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `lahan_id` int(11) DEFAULT NULL,
  `varietas` varchar(250) DEFAULT NULL,
  `total_pohon` int(11) DEFAULT NULL,
  `tgl_tanam` date DEFAULT NULL,
  `tgl_perkiraan_panen` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kebun`
--

INSERT INTO `kebun` (`id`, `nama`, `lahan_id`, `varietas`, `total_pohon`, `tgl_tanam`, `tgl_perkiraan_panen`) VALUES
(1, 'KEBUN SAWIT', 1, 'UNGGUL', 400, '2020-01-01', '2021-12-31'),
(2, 'KEBUN PERTAMA', 3, 'Pisifera', 100, '2020-05-01', '2021-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `kebun_detail`
--

CREATE TABLE `kebun_detail` (
  `id` int(11) NOT NULL,
  `kebun_id` int(11) DEFAULT NULL,
  `progress_kebun` enum('proses_tanam','perawatan','siap_panen','panen_gagal','penanaman_kembali','proses_panen','selesai_panen') DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL,
  `ket` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kebun_detail`
--

INSERT INTO `kebun_detail` (`id`, `kebun_id`, `progress_kebun`, `tgl_update`, `ket`) VALUES
(1, 1, 'proses_tanam', '2020-02-02 00:00:00', 'AMAN');

-- --------------------------------------------------------

--
-- Table structure for table `lahan`
--

CREATE TABLE `lahan` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `koordinat` varchar(100) DEFAULT NULL,
  `luas` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lahan`
--

INSERT INTO `lahan` (`id`, `lokasi`, `koordinat`, `luas`) VALUES
(1, 'JL. BANJARMASIN', '90-22.12.244.555', '800'),
(3, 'JAKARTA SELATAN', '6.09367-101.83773', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan`
--

CREATE TABLE `pendapatan` (
  `id` int(11) NOT NULL,
  `kebun_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `jumlah_panen` int(11) DEFAULT NULL,
  `harga_kg` int(11) DEFAULT NULL,
  `total_pendapatan` int(11) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendapatan`
--

INSERT INTO `pendapatan` (`id`, `kebun_id`, `customer_id`, `jumlah_panen`, `harga_kg`, `total_pendapatan`, `ket`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4000, 200, 800000, 'ok', '2020-04-01 13:34:04', '2020-04-30 05:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL,
  `kebun_id` int(11) DEFAULT NULL,
  `biaya_tanaman` int(11) DEFAULT NULL,
  `biaya_panen` int(11) DEFAULT NULL,
  `biaya_lain` int(11) DEFAULT NULL,
  `total_pengeluaran` int(11) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `kebun_id`, `biaya_tanaman`, `biaya_panen`, `biaya_lain`, `total_pengeluaran`, `ket`, `created_at`, `updated_at`) VALUES
(1, 1, 50000, 10000, 0, 60000, '', '2020-05-01 05:54:18', '2020-05-02 05:54:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kebun`
--
ALTER TABLE `kebun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lahan_id` (`lahan_id`);

--
-- Indexes for table `kebun_detail`
--
ALTER TABLE `kebun_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lahan`
--
ALTER TABLE `lahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `kebun_id` (`kebun_id`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kebun_id` (`kebun_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kebun`
--
ALTER TABLE `kebun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kebun_detail`
--
ALTER TABLE `kebun_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lahan`
--
ALTER TABLE `lahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pendapatan`
--
ALTER TABLE `pendapatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kebun`
--
ALTER TABLE `kebun`
  ADD CONSTRAINT `kebun_ibfk_1` FOREIGN KEY (`lahan_id`) REFERENCES `lahan` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD CONSTRAINT `pendapatan_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pendapatan_ibfk_2` FOREIGN KEY (`kebun_id`) REFERENCES `kebun` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_ibfk_1` FOREIGN KEY (`kebun_id`) REFERENCES `kebun` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
