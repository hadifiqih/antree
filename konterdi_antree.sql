-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2022 at 02:06 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konterdi_antree`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_antrian`
--

CREATE TABLE `data_antrian` (
  `tanggal_antrian` date NOT NULL,
  `no_antrian` int(3) NOT NULL,
  `nama_sales` varchar(255) NOT NULL,
  `keyword_stempel` text NOT NULL,
  `nama_pekerjaan` text NOT NULL,
  `mulai_kerja` datetime NOT NULL,
  `selesai_kerja` datetime NOT NULL,
  `tempat_workshop` varchar(255) NOT NULL,
  `nama_desainer` varchar(255) NOT NULL,
  `nama_operator` varchar(255) NOT NULL,
  `nama_finishing` varchar(255) NOT NULL,
  `nama_qc` varchar(255) NOT NULL,
  `file_desain` varchar(255) NOT NULL,
  `file_dokumentasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_antrian`
--

INSERT INTO `data_antrian` (`tanggal_antrian`, `no_antrian`, `nama_sales`, `keyword_stempel`, `nama_pekerjaan`, `mulai_kerja`, `selesai_kerja`, `tempat_workshop`, `nama_desainer`, `nama_operator`, `nama_finishing`, `nama_qc`, `file_desain`, `file_dokumentasi`) VALUES
('2022-07-06', 6, 'Pakar Stempel Surabaya', 'Mila Hijab', 'Label Hijab', '2022-07-06 21:50:00', '2022-07-07 21:51:00', 'Malang', 'Hadi', 'Hadi', 'Hadi,Taufik', 'Ghofar', '', ''),
('2022-07-09', 7, 'Stempel Kediri', 'Tempe Pak De', 'Neon Box', '2022-07-09 19:14:00', '2022-07-10 19:15:00', 'Malang', 'Anjar', 'Yoga', 'Yoga,Taufik,Riyan', 'Ghofar', '', ''),
('2022-07-12', 8, 'Pakar Stempel Surabaya', 'Dinas Kesehatan', 'Stempel Trodat P2F', '2022-07-12 12:29:00', '2022-07-13 12:30:00', 'Kediri', 'Iksan', 'Hadi', 'Yoga', 'Arvidi', '64d7328d8425d4efae8403ffbe8c990a-alisa khadijah.cdr', ''),
('2022-07-12', 9, 'Stempel Malang', 'Dinas Kesehatan', 'Stempel Trodat', '2022-07-12 12:47:00', '2022-07-13 12:47:00', 'Malang', 'Ghofar', 'Riyan', 'Fio', 'Arvidi', '64d7328d8425d4efae8403ffbe8c990a-Nurkhaya Tailor.cdr', '6512bd43d9caa6e02c990b0a82652dca-Logo Premiumly.png'),
('2022-07-17', 10, 'Burger Advertising Surabaya', 'Mama Muda', 'Plakat Penghargaan', '2022-07-17 22:20:00', '2022-07-18 22:21:00', 'Malang', 'Aziz', 'Riyan', 'Rendy', 'Arvidi', '47fa378c4effb792f00f47659aeabed9-emoticon.cdr', 'haha');

-- --------------------------------------------------------

--
-- Table structure for table `data_desainer`
--

CREATE TABLE `data_desainer` (
  `desainerCode` int(3) NOT NULL,
  `desainerName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_desainer`
--

INSERT INTO `data_desainer` (`desainerCode`, `desainerName`) VALUES
(1, 'Iksan'),
(2, 'Hadi'),
(3, 'Anjar'),
(4, 'Aziz'),
(5, 'Kholifa'),
(6, 'Ghofar'),
(7, 'Nova'),
(8, 'Taufik');

-- --------------------------------------------------------

--
-- Table structure for table `data_flash`
--

CREATE TABLE `data_flash` (
  `id` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `ukuran` varchar(100) NOT NULL,
  `desain` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_flash`
--

INSERT INTO `data_flash` (`id`, `jenis`, `ukuran`, `desain`, `harga`) VALUES
('sfd17', 'Stempel Flash Bulat D17', 'Diameter 17mm', 'Diameter 15mm', 75000),
('sfd23', 'Stempel Flash Bulat D23', 'Diameter 23mm', 'Diameter 21mm', 80000),
('sfd25', 'Stempel Flash Bulat D25', 'Diameter 25mm', 'Diameter 23mm', 80000),
('sfd28', 'Stempel Flash Bulat D28', 'Diameter 28mm', 'Diameter 26mm', 80000),
('sfd32', 'Stempel Flash Bulat D32', 'Diameter 32mm', 'Diameter 30mm', 80000),
('sfd35', 'Stempel Flash Bulat D35', 'Diameter 35mm', 'Diameter 33mm', 85000),
('sfd38', 'Stempel Flash Bulat D38', 'Diameter 38mm', 'Diameter 36mm', 85000),
('sfd40', 'Stempel Flash Bulat D40', 'Diameter 40mm', 'Diameter 38mm', 85000),
('sfd42', 'Stempel Flash Bulat D42', 'Diameter 42mm', 'Diameter 40mm', 85000),
('sfd45', 'Stempel Flash Bulat D45', 'Diameter 45mm', 'Diameter 43mm', 90000),
('sfd51', 'Stempel Flash Bulat D51', 'Diameter 51mm', 'Diameter 49mm', 95000),
('sfgc1028', 'Stempel Flash Gantungan Kunci 1028', '10 x 28 mm', '8 x 26 mm', 60000),
('sfgc1030', 'Stempel Flash Gantungan Kunci 1030', '10 x 30 mm', '8 x 28 mm', 65000),
('sfgc1335', 'Stempel Flash Gantungan Kunci 1335', '13 x 35 mm', '11 x 33 mm', 75000),
('sfgc1343', 'Stempel Flash Gantungan Kunci 1343', '13 x 43 mm', '11 x 41 mm', 70000),
('sfj13090', 'Stempel Flash Jumbo 13090', '130 x 90 mm', '128 x 90', 195000),
('sfk26', 'Stempel Flash Kotak 2626', '26 x 26 mm', '24 x 24 mm', 80000),
('sfk30', 'Stempel Flash Kotak 3030', '30 x 30 mm', '28 x 28 mm', 85000),
('sfk35', 'Stempel Flash Kotak 3535', '35 x 35 mm', '33 x 33 mm', 85000),
('sfk40', 'Stempel Flash Kotak 4040', '40 x 40 mm', '38 x 38 mm', 85000),
('sfk45', 'Stempel Flash Kotak 4545', '45 x 45 mm', '43 x 43 mm', 90000),
('sfov35', 'Stempel Flash Oval OV35', '35 x 25 mm', '33 x 23 mm', 80000),
('sfov45', 'Stempel Flash Oval OV45', '44 x 32 mm', '42 x 30 mm', 85000),
('sfov51', 'Stempel Flash Oval OV51', '51 x 36 mm', '49 x 34 mm', 90000),
('sfp1340', 'Stempel Flash Persegi Panjang 1340', '13 x 40 mm', '11 x 38 mm', 80000),
('sfp1355', 'Stempel Flash Persegi Panjang 1355', '13 x 55 mm', '11 x 53 mm', 85000),
('sfp1743', 'Stempel Flash Persegi Panjang 1743', '17 x 43 mm', '15 x 41 mm', 85000),
('sfp1755', 'Stempel Flash Persegi Panjang 1755', '17 x 55 mm', '15 x 53 mm', 85000),
('sfp1767', 'Stempel Flash Persegi Panjang 1767', '17 x 67 mm', '15 x 65 mm', 85000),
('sfp2243', 'Stempel Flash Persegi Panjang 2243', '22 x 43 mm', '20 x 41 mm', 85000),
('sfp2255', 'Stempel Flash Persegi Panjang 2255', '22 x 55 mm', '20 x 53 mm', 85000),
('sfp2267', 'Stempel Flash Persegi Panjang 2267', '22 x 67 mm', '20 x 65 mm', 85000),
('sfp2278', 'Stempel Flash Persegi Panjang 2278', '22 x 78 mm', '20 x 76 mm', 90000),
('sfp2743', 'Stempel Flash Persegi Panjang 2743', '27 x 43 mm', '25 x 43 mm', 85000),
('sfp2755', 'Stempel Flash Persegi Panjang 2755', '27 x 55 mm', '25 x 53 mm', 90000),
('sfp2767', 'Stempel Flash Persegi Panjang 2767', '27 x 67 mm', '25 x 65 mm', 90000),
('sfp2778', 'Stempel Flash Persegi Panjang 2778', '27 x 78 mm', '25 x 76 mm', 90000),
('sfp32103', 'Stempel Flash Persegi Panjang 32103', '32 x 103 mm', '30 x 101 mm', 110000),
('sfp3243', 'Stempel Flash Persegi Panjang 3243', '32 x 43 mm', '30 x 41 mm', 85000),
('sfp3255', 'Stempel Flash Persegi Panjang 3255', '32 x 55 mm', '30 x 53 mm', 85000),
('sfp3267', 'Stempel Flash Persegi Panjang 3267', '32 x 67 mm', '30 x 65 mm', 90000),
('sfp3278', 'Stempel Flash Persegi Panjang 3278', '32 x 78 mm', '30 x 76 mm', 95000),
('sfp4355', 'Stempel Flash Persegi Panjang 4355', '43 x 67 mm', '41 x 53 mm', 90000),
('sfp4367', 'Stempel Flash Persegi Panjang 4367', '43 x 67 mm', '41 x 65 mm', 95000),
('sfp4378', 'Stempel Flash Persegi Panjang 4378', '43 x 78 mm', '41 x 76 mm', 100000),
('sfp4393', 'Stempel Flash Persegi Panjang 4393', '43 x 93 mm', '41 x 91 mm', 105000),
('sfp53103', 'Stempel Flash Persegi Panjang 53103', '53 x 103 mm', '51 x 101 mm', 110000),
('sfp5378', 'Stempel Flash Persegi Panjang 5378', '53 x 78 mm', '51 x 76 mm', 95000),
('sfp78103', 'Stempel Flash Persegi Panjang 78103', '78 x 103 mm', '76 x 101 mm', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `data_operator`
--

CREATE TABLE `data_operator` (
  `operatorCode` int(3) NOT NULL,
  `operatorName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_operator`
--

INSERT INTO `data_operator` (`operatorCode`, `operatorName`) VALUES
(1, 'Hadi'),
(2, 'Yoga'),
(3, 'Taufik'),
(4, 'Riyan'),
(5, 'Rendy'),
(6, 'Ghofar'),
(7, 'Fio');

-- --------------------------------------------------------

--
-- Table structure for table `data_produk`
--

CREATE TABLE `data_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_produk`
--

INSERT INTO `data_produk` (`id_produk`, `nama_produk`) VALUES
(1, 'Stempel Kayu'),
(2, 'Stempel Flash'),
(3, 'Stempel Trodat'),
(4, 'Stempel Shiny'),
(5, 'Stempel Stempel Colop'),
(6, 'Stempel Trodat China'),
(7, 'Stempel Trodat P2F'),
(8, 'Stempel Cup Plastik'),
(9, 'Stempel Plastik'),
(10, 'Stempel Kardus'),
(11, 'Stempel Modif'),
(12, 'Label Hijab'),
(13, 'Neon Box'),
(14, 'Neon Flex'),
(15, 'Papan Nama'),
(16, 'Plakat Penghargaan');

-- --------------------------------------------------------

--
-- Table structure for table `data_qc`
--

CREATE TABLE `data_qc` (
  `code_qc` int(11) NOT NULL,
  `nama_qc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_sales`
--

CREATE TABLE `data_sales` (
  `salesCode` varchar(255) NOT NULL,
  `salesName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_sales`
--

INSERT INTO `data_sales` (`salesCode`, `salesName`) VALUES
('bam', 'Burger Advertising Malang'),
('bas', 'Burger Advertising Surabaya'),
('bsm', 'Bahan Stempel Malang'),
('bss', 'Bahan Stempel Surabaya'),
('kk', 'Kebutuhan Kantor Surabaya'),
('pk', 'Pakar Stempel Surabaya'),
('sf', 'Stempel Flash Surabaya'),
('sk', 'Stempel Kediri'),
('sm', 'Stempel Malang'),
('sns', 'Sinar Stempel Surabaya'),
('ss', 'Stempel Surabaya'),
('st', 'Stempel Trodat Surabaya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_antrian`
--
ALTER TABLE `data_antrian`
  ADD PRIMARY KEY (`no_antrian`);

--
-- Indexes for table `data_desainer`
--
ALTER TABLE `data_desainer`
  ADD PRIMARY KEY (`desainerCode`);

--
-- Indexes for table `data_flash`
--
ALTER TABLE `data_flash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_operator`
--
ALTER TABLE `data_operator`
  ADD PRIMARY KEY (`operatorCode`);

--
-- Indexes for table `data_produk`
--
ALTER TABLE `data_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `data_sales`
--
ALTER TABLE `data_sales`
  ADD PRIMARY KEY (`salesCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_antrian`
--
ALTER TABLE `data_antrian`
  MODIFY `no_antrian` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `data_desainer`
--
ALTER TABLE `data_desainer`
  MODIFY `desainerCode` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_operator`
--
ALTER TABLE `data_operator`
  MODIFY `operatorCode` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_produk`
--
ALTER TABLE `data_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
