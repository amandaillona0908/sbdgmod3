
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 02:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pendahuluan3`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` char(6) NOT NULL,
  `nama_customer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`) VALUES
('CTR001', 'Budi Santoso'),
('CTR002', 'Sisil Triana'),
('CTR003', 'Davi Liam'),
('CTR004', 'Sutris Ten An'),
('CTR005', 'Hendra Asto');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id_membership` char(6) NOT NULL,
  `no_telp_customer` varchar(15) NOT NULL,
  `alamat_customer` varchar(150) DEFAULT NULL,
  `tanggal_pembuatan` date DEFAULT NULL,
  `tanggal_kedaluwarsa` date DEFAULT NULL,
  `total_poin` int(11) NOT NULL,
  `m_id_customer` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id_membership`, `no_telp_customer`, `alamat_customer`, `tanggal_pembuatan`, `tanggal_kedaluwarsa`, `total_poin`, `m_id_customer`) VALUES
('MBR001', '08123456789', 'Jl. Imam Bonjol', '2023-10-24', '2023-11-30', 0, 'CTR001'),
('MBR002', '0812345678', 'Jl. Kelinci', '2023-10-24', '2023-11-30', 0, 'CTR002'),
('MBR003', '081234567890', 'Jl. Abah Ojak', '2023-10-25', '2023-12-01', 2, 'CTR003'),
('MBR004', '08987654321', 'Jl. Kenangan', '2023-10-26', '2023-12-02', 6, 'CTR005');

-- --------------------------------------------------------

--
-- Table structure for table `menu_minuman`
--

CREATE TABLE `menu_minuman` (
  `id_minuman` char(6) NOT NULL,
  `nama_minuman` varchar(50) NOT NULL,
  `harga_minuman` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_minuman`
--

INSERT INTO `menu_minuman` (`id_minuman`, `nama_minuman`, `harga_minuman`) VALUES
('MNM001', 'Expresso', 18000),
('MNM002', 'Cappucino', 20000),
('MNM003', 'Latte', 21000),
('MNM004', 'Americano', 19000),
('MNM005', 'Mocha', 22000),
('MNM006', 'Macchiato', 23000),
('MNM007', 'Cold Brew', 21000),
('MNM008', 'Iced Coffe', 18000),
('MNM009', 'Affogato', 23000),
('MNM010', 'Coffe Frappe', 22000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nik` char(16) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `umur` int(11) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nik`, `nama_pegawai`, `jenis_kelamin`, `email`, `umur`, `telepon`) VALUES
('1111222233334444', 'Maimunah', 'P', 'maimunah@gmail.com', 25, '621234567'),
('1234567890123456', 'Naufal Raf', 'L', 'naufal@gmail.com', 19, '62123456789'),
('2345678901234561', 'Surinala', 'P', 'surinala@gmail.com', 24, '621234567890'),
('3456789012345612', 'Ben John', 'L', 'benjohn@gmail.com', 22, '6212345678');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `metode_pembayaran` varchar(15) NOT NULL,
  `customer_id_customer` char(6) NOT NULL,
  `pegawai_nik` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal_transaksi`, `metode_pembayaran`, `customer_id_customer`, `pegawai_nik`) VALUES
('TRX0000001', '2023-10-01', 'Kartu kredit', 'CTR002', '2345678901234561'),
('TRX0000002', '2023-10-03', 'Transfer bank', 'CTR004', '3456789012345612'),
('TRX0000003', '2023-10-05', 'Tunai', 'CTR001', '3456789012345612'),
('TRX0000004', '2023-10-15', 'Kartu debit', 'CTR003', '1234567890123456'),
('TRX0000005', '2023-10-15', 'E-wallet', 'CTR004', '1234567890123456'),
('TRX0000006', '2023-10-21', 'Tunai', 'CTR001', '2345678901234561'),
('TRX0000007', '2023-10-03', 'Transfer bank', 'CTR004', '2345678901234561');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_minuman`
--

CREATE TABLE `transaksi_minuman` (
  `tm_menu_minuman_id` char(6) NOT NULL,
  `tm_transaksi_id` char(10) NOT NULL,
  `jumlah_minuman` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_minuman`
--

INSERT INTO `transaksi_minuman` (`tm_menu_minuman_id`, `tm_transaksi_id`, `jumlah_minuman`) VALUES
('MNM001', 'TRX0000003', 3),
('MNM001', 'TRX0000005', 1),
('MNM003', 'TRX0000002', 2),
('MNM003', 'TRX0000003', 1),
('MNM003', 'TRX0000006', 2),
('MNM004', 'TRX0000004', 2),
('MNM005', 'TRX0000002', 1),
('MNM005', 'TRX0000007', 1),
('MNM006', 'TRX0000005', 2),
('MNM007', 'TRX0000001', 1),
('MNM009', 'TRX0000005', 1),
('MNM010', 'TRX0000001', 1),
('MNM010', 'TRX0000004', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id_membership`),
  ADD KEY `FK_customer_membership` (`m_id_customer`);

--
-- Indexes for table `menu_minuman`
--
ALTER TABLE `menu_minuman`
  ADD PRIMARY KEY (`id_minuman`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `FK_pegawai_transaksi` (`pegawai_nik`),
  ADD KEY `FK_customer_transaksi` (`customer_id_customer`);

--
-- Indexes for table `transaksi_minuman`
--
ALTER TABLE `transaksi_minuman`
  ADD PRIMARY KEY (`tm_menu_minuman_id`,`tm_transaksi_id`),
  ADD KEY `FK_transaksi_tm` (`tm_transaksi_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `FK_customer_membership` FOREIGN KEY (`m_id_customer`) REFERENCES `customer` (`id_customer`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_customer_transaksi` FOREIGN KEY (`customer_id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pegawai_transaksi` FOREIGN KEY (`pegawai_nik`) REFERENCES `pegawai` (`nik`);

--
-- Constraints for table `transaksi_minuman`
--
ALTER TABLE `transaksi_minuman`
  ADD CONSTRAINT `FK_minuman_tm` FOREIGN KEY (`tm_menu_minuman_id`) REFERENCES `menu_minuman` (`id_minuman`),
  ADD CONSTRAINT `FK_transaksi_tm` FOREIGN KEY (`tm_transaksi_id`) REFERENCES `transaksi` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- Amanda Illona Farrel
-- 5025221056
-- Modul Pendahuluan 3

-- 1 
#transaksi tanggal 10-20 Oktober 2023 (seluruh kolom dari tabel transaksi)
SELECT * FROM transaksi
WHERE tanggal_transaksi BETWEEN '2023-10-10' AND '2023-10-20'

-- 2
#total harga tiap transaksi (id transaksi dan total harga)
#Ubah tampilkan total harga dengan nama ‘TOTAL_HARGA’
SELECT tm.tm_transaksi_id, SUM(tm.jumlah_minuman * mm.harga_minuman) AS TOTAL_HARGA
FROM transaksi_minuman tm
JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
GROUP BY tm.tm_transaksi_id

-- 3
#total biaya cutsomer 3-22 Oktober 2023 (semua kolom dari tabel customer dan total biaya)
#tampilan nama kolom "Total_Belanja
#urutkan berdasarkan nama customer dari A ke Z
SELECT cus.*, SUM(tm.jumlah_minuman * mm.harga_minuman) AS Total_Belanja
FROM customer cus
JOIN transaksi ts ON ts.customer_id_customer = cus.id_customer
JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
WHERE ts.tanggal_transaksi BETWEEN '2023-10-03' AND '2023-10-22'
GROUP BY cus.id_customer
ORDER BY cus.nama_customer ASC

-- 4
#data pegawai yang melayani Davi Liam, Sisil Triana, atau Hendra Asto
SELECT cus.nama_customer, pg.*
FROM transaksi ts
JOIN pegawai pg ON pg.nik = ts.pegawai_nik
JOIN customer cus ON cus.id_customer = ts.customer_id_customer
WHERE cus.nama_customer IN ('Davi Liam', 'Sisil Triana', 'Hendra Asto')
GROUP BY cus.id_customer
ORDER BY pg.nama_pegawai

#data customer yang tidak transaksi tapi diyalani juga ikut ditampilkan
SELECT cus.nama_customer, pg.*
FROM customer cus
LEFT JOIN transaksi ts ON cus.id_customer = ts.customer_id_customer
LEFT JOIN pegawai pg ON pg.nik = ts.pegawai_nik
WHERE cus.nama_customer IN ('Davi Liam', 'Sisil Triana', 'Hendra Asto') OR
ts.id_transaksi IS NULL
GROUP BY cus.id_customer
ORDER BY pg.nama_pegawai

-- 5
#jumlah cup terjual tiap bulan
#tampilkan kolom bulan, tahun, dan jumlah cup dengan nama ‘BULAN’, ‘TAHUN’, ‘JUMLAH_CUP’
#urutkan berdasarkan tahun dari yang terbesar dan bulan yang terkecil.
SELECT MONTH(ts.tanggal_transaksi) AS BULAN,
DATE_FORMAT(ts.tanggal_transaksi, '%Y') AS TAHUN, SUM(tm.jumlah_minuman) AS JUMLAH_CUP
FROM transaksi ts
JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
GROUP BY MONTH(ts.tanggal_transaksi), YEAR(ts.tanggal_transaksi)
ORDER BY TAHUN ASC, BULAN DESC

-- 6
#rata-rata total belanja transaksi seluruh customer 
SELECT AVG(tb) rata_rata_transaksi_customer
FROM(
	SELECT cus.*, SUM(tm.jumlah_minuman*mm.harga_minuman) tb
	FROM customer cus
	JOIN transaksi ts ON ts.customer_id_customer = cus.id_customer
	JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
	JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
	GROUP BY ts.id_transaksi
) TotalBelanjaCustomer

-- 7
#data customer dengan rata-rata total belanja lebih dari rata-rata
#tampilkan kolom id customer, nama customer, dan total belanja
SELECT tbcus.id_customer, tbcus.nama_customer, tbcus.avg_tb rataRata_customer
FROM (
	SELECT *, AVG(tb) avg_tb
	FROM (
		SELECT cus.*, SUM(tm.jumlah_minuman*mm.harga_minuman) tb, ts.*
		FROM customer cus
		JOIN transaksi ts ON ts.customer_id_customer = cus.id_customer
		JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
		JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
		GROUP BY ts.id_transaksi
		ORDER BY cus.id_customer
	) xyz
	GROUP BY xyz.id_customer
) tbcus

JOIN (
	SELECT AVG(tbcus2) rata_rata_transaksi_customer
	FROM (
		SELECT cus.*, SUM(tm.jumlah_minuman*mm.harga_minuman) tbcus2
		FROM customer cus
		JOIN transaksi ts ON ts.customer_id_customer = cus.id_customer
		JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
		JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
		GROUP BY ts.id_transaksi
		) TotalBelanjaCustomer
	)tbcus2
WHERE tbcus.avg_tb > tbcus2.rata_rata_transaksi_customer

-- 8
#data customer yang tidak membership
SELECT cus.*
FROM customer cus
LEFT JOIN membership mb ON mb.m_id_customer = cus.id_customer
WHERE mb.m_id_customer IS NULL

#atau
SELECT cus.*
FROM customer cus
WHERE cus.id_customer NOT IN (SELECT mb.m_id_customer FROM membership mb)

-- 9
#jumlah customer pesan minuman Latte (jika transaksi bisa lebih dr 1)
SELECT COUNT(DISTINCT ts.customer_id_customer) AS customer_latte
FROM transaksi ts
JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
WHERE mm.nama_minuman = 'Latte';

-- 10
#nama customer, menu minuman, dan total jumlah cup dari customer awalan huruf S
SELECT cus.nama_customer, mm.nama_minuman, SUM(tm.jumlah_minuman) AS total_cup
FROM transaksi ts 
JOIN customer cus ON cus.id_customer = ts.customer_id_customer
JOIN transaksi_minuman tm ON tm.tm_transaksi_id = ts.id_transaksi
JOIN menu_minuman mm ON mm.id_minuman = tm.tm_menu_minuman_id
WHERE cus.nama_customer LIKE 'S%'
GROUP BY cus.nama_customer, mm.nama_minuman
ORDER BY cus.nama_customer DESC , mm.nama_minuman ASC










