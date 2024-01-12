-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 04, 2023 at 12:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pkm_kejayan`
--

-- --------------------------------------------------------

--
-- Table structure for table `ahli_gizi`
--

CREATE TABLE `ahli_gizi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(200) NOT NULL,
  `jabatan_fungsional` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ahli_gizi`
--

INSERT INTO `ahli_gizi` (`id`, `user_id`, `nama`, `jabatan_fungsional`, `alamat`, `no_tlp`, `updated_at`, `created_at`) VALUES
(1, 1, 'Arinda Restyowati', 'Nutrisionist', 'Jalan Raya Lembu Suro No.1, Krajan, Kejayan, Kec. Kejayan, Pasuruan, Jawa Timur 67172', '085898765262', '2022-09-12 08:19:37', '2022-09-12 08:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `balita`
--

CREATE TABLE `balita` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(200) NOT NULL,
  `nama_ortu` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_lahir` date NOT NULL,
  `bb_lahir` int(2) NOT NULL,
  `pjg_lahir` int(2) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `anak_ke` int(2) NOT NULL,
  `gakin` enum('1','2') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `balita`
--

INSERT INTO `balita` (`id`, `nama`, `nama_ortu`, `alamat`, `tgl_lahir`, `bb_lahir`, `pjg_lahir`, `jenis_kelamin`, `anak_ke`, `gakin`, `created_at`, `updated_at`) VALUES
(2, 'Ahmad Antony', 'Bakar', 'Kemban Village, Pasrepan District, Malang Regency, East Java', '2023-05-04', 7, 5, 'P', 1, '1', '2023-06-04 15:09:18', '2023-06-04 15:10:21'),
(3, 'Abdul Sairy', 'Sairy', 'Pohgading Village, Pasrepan District, Pasuruan Regency, East Jav', '2023-04-05', 5, 5, 'P', 1, '1', '2023-06-04 15:10:04', NULL),
(4, 'Hilman Nafis', 'Nafis', 'Pohgading Village, Pasrepan District, Pasuruan', '2023-03-06', 5, 5, 'P', 1, '2', '2023-06-04 15:10:52', NULL),
(5, 'Abd Hafis', 'taok', 'Kemban Village, Pasrepan District, Malang Regency, East Java', '2023-05-02', 5, 5, 'P', 1, '1', '2023-06-04 15:45:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bidan`
--

CREATE TABLE `bidan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(200) NOT NULL,
  `jabatan_fungsional` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `polindes` text NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bidan`
--

INSERT INTO `bidan` (`id`, `user_id`, `nama`, `jabatan_fungsional`, `alamat`, `polindes`, `no_tlp`, `created_at`, `updated_at`) VALUES
(1, 2, 'Alifvionita Chairunnisa', 'Ahli', 'Jalan Raya Lembu Suro No.1, Krajan, Kejayan, Kec. Kejayan, Pasuruan, Jawa Timur 67172', 'Jalan Raya Lembu Suro No.1, Krajan, Kejayan, Kec. Kejayan, Pasuruan, Jawa Timur 67172', '085123555152123', '2022-02-06 19:54:27', '2021-06-02 20:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `kader`
--

CREATE TABLE `kader` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kader`
--

INSERT INTO `kader` (`id`, `nama`, `no_tlp`, `alamat`, `created_at`, `updated_at`) VALUES
(2, 'Pamin', '085608014111', 'Pohgading Village, Pasrepan District, Pasuruan', '2023-04-29 20:25:51', NULL),
(3, 'Piman', '085608014111', 'Pohgading Village, Pasrepan District, Pasuruan', '2023-04-29 20:26:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kapus`
--

CREATE TABLE `kapus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(200) NOT NULL,
  `jabatan_fungsional` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kapus`
--

INSERT INTO `kapus` (`id`, `user_id`, `nama`, `jabatan_fungsional`, `alamat`, `no_tlp`, `created_at`, `updated_at`) VALUES
(1, 3, 'Arya Putra Sena', 'Kepala Puskesmas', 'Jalan Raya Lembu Suro No.1, Krajan, Kejayan, Kec. Kejayan, Pasuruan, Jawa Timur 67172', '085123555152123', '2022-02-06 19:54:27', '2021-06-02 20:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `posyandu`
--

CREATE TABLE `posyandu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desa` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `nama_pos` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posyandu`
--

INSERT INTO `posyandu` (`id`, `desa`, `alamat`, `nama_pos`, `created_at`, `updated_at`) VALUES
(2, 'Kelobuk Wetan', 'Pohgading Village, Pasrepan District, Pasuruan Regency, East Java', 'Plunggaan', '2023-04-29 18:58:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posyandu_hasil`
--

CREATE TABLE `posyandu_hasil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `balita_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bidan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `umur` int(5) NOT NULL,
  `tb` int(2) DEFAULT NULL,
  `bb` int(2) DEFAULT NULL,
  `status_gizi` enum('gizi_buruk','gizi_baik','gizi_lebih','gizi_sedang','menunggu') NOT NULL DEFAULT 'menunggu',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posyandu_hasil`
--

INSERT INTO `posyandu_hasil` (`id`, `jadwal_id`, `balita_id`, `bidan_id`, `umur`, `tb`, `bb`, `status_gizi`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 10, 10, 'menunggu', '2023-06-04 16:17:32', '2023-06-04 17:54:46'),
(2, 1, 3, 1, 2, 10, 9, 'menunggu', '2023-06-04 16:17:32', '2023-06-04 17:54:46'),
(3, 1, 4, 1, 3, 7, 6, 'menunggu', '2023-06-04 16:17:32', '2023-06-04 17:54:46'),
(4, 1, 5, 1, 1, 8, 9, 'menunggu', '2023-06-04 16:17:32', '2023-06-04 17:54:46'),
(9, 3, 2, 1, 3, NULL, NULL, 'menunggu', '2023-06-04 17:46:48', '2023-06-04 17:54:46'),
(10, 3, 3, 1, 4, NULL, NULL, 'menunggu', '2023-06-04 17:46:48', '2023-06-04 17:54:46'),
(11, 3, 4, 1, 5, NULL, NULL, 'menunggu', '2023-06-04 17:46:48', '2023-06-04 17:54:46'),
(12, 3, 5, 1, 3, NULL, NULL, 'menunggu', '2023-06-04 17:46:48', '2023-06-04 17:54:46'),
(13, 2, 2, 1, 2, NULL, NULL, 'menunggu', '2023-06-04 17:52:28', '2023-06-04 17:54:46'),
(14, 2, 3, 1, 3, NULL, NULL, 'menunggu', '2023-06-04 17:52:28', '2023-06-04 17:54:46'),
(15, 2, 4, 1, 4, NULL, NULL, 'menunggu', '2023-06-04 17:52:28', '2023-06-04 17:54:46'),
(16, 2, 5, 1, 2, NULL, NULL, 'menunggu', '2023-06-04 17:52:28', '2023-06-04 17:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `posyandu_jadwal`
--

CREATE TABLE `posyandu_jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posyandu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bidan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_bidan` varchar(100) DEFAULT NULL,
  `nama_pos` varchar(100) DEFAULT NULL,
  `jenis` enum('posyandu','vitamin') NOT NULL,
  `tanggal` date NOT NULL,
  `vitamin` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posyandu_jadwal`
--

INSERT INTO `posyandu_jadwal` (`id`, `posyandu_id`, `bidan_id`, `nama_bidan`, `nama_pos`, `jenis`, `tanggal`, `vitamin`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL, 'posyandu', '2023-06-10', NULL, '2023-06-04 15:06:53', NULL),
(2, 2, 1, NULL, NULL, 'posyandu', '2023-07-10', NULL, '2023-06-04 15:07:07', NULL),
(3, 2, 1, NULL, NULL, 'posyandu', '2023-08-10', NULL, '2023-06-04 15:07:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posyandu_kader`
--

CREATE TABLE `posyandu_kader` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posyandu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hide` enum('yes','no') NOT NULL,
  `kader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_pos` varchar(100) DEFAULT NULL,
  `nama_kader` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standart_bb_umur_laki_laki`
--

CREATE TABLE `standart_bb_umur_laki_laki` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umur` int(2) NOT NULL COMMENT '60 bulan masuk tab umur 60 bulan',
  `bb_char` enum('-3 SD','-2 SD','-1 SD','Median','+1 SD','+2 SD','+3 SD') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standart_bb_umur_perempuan`
--

CREATE TABLE `standart_bb_umur_perempuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umur` int(2) NOT NULL COMMENT '60 bulan masuk tab umur 60 bulan',
  `bb_char` enum('-3 SD','-2 SD','-1 SD','Median','+1 SD','+2 SD','+3 SD') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standart_bobot`
--

CREATE TABLE `standart_bobot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `char` varchar(100) NOT NULL,
  `nilai` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standart_index_char`
--

CREATE TABLE `standart_index_char` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `char` varchar(200) NOT NULL,
  `z_score` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standart_tb_umur_laki_laki`
--

CREATE TABLE `standart_tb_umur_laki_laki` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umur` int(2) NOT NULL COMMENT '60 bulan masuk tab umur 60 bulan',
  `tb_char` enum('-3 SD','-2 SD','-1 SD','Median','+1 SD','+2 SD','+3 SD') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standart_tb_umur_perempuan`
--

CREATE TABLE `standart_tb_umur_perempuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umur` int(2) NOT NULL COMMENT '60 bulan masuk tab umur 60 bulan',
  `bb_char` enum('-3 SD','-2 SD','-1 SD','Median','+1 SD','+2 SD','+3 SD') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('ahli_gizi','bidan','kapus') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'ahli_gizi', 'ahli_gizi@pkmkejayan.com', '$2y$10$vn5ADAks5XDtX/7B1yTUiugDT.5IssGphumfyGZFetODi98QRXksS', '2022-02-06 12:54:27', '2022-01-09 05:40:28'),
(2, 'bidan', 'bidan@pkmkejayan.com', '$2y$10$vn5ADAks5XDtX/7B1yTUiugDT.5IssGphumfyGZFetODi98QRXksS', '2022-02-06 12:54:27', '2022-01-09 05:40:28'),
(3, 'kapus', 'kapus@pkmkejayan.com', '$2y$10$vn5ADAks5XDtX/7B1yTUiugDT.5IssGphumfyGZFetODi98QRXksS', '2022-02-06 12:54:27', '2022-01-09 05:40:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ahli_gizi`
--
ALTER TABLE `ahli_gizi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_gizi` (`user_id`);

--
-- Indexes for table `balita`
--
ALTER TABLE `balita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidan`
--
ALTER TABLE `bidan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_bidan` (`user_id`);

--
-- Indexes for table `kader`
--
ALTER TABLE `kader`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kapus`
--
ALTER TABLE `kapus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kaps` (`user_id`);

--
-- Indexes for table `posyandu`
--
ALTER TABLE `posyandu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posyandu_hasil`
--
ALTER TABLE `posyandu_hasil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_balita` (`balita_id`),
  ADD KEY `pos_bidan` (`bidan_id`),
  ADD KEY `pos_jadwa` (`jadwal_id`);

--
-- Indexes for table `posyandu_jadwal`
--
ALTER TABLE `posyandu_jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_id` (`posyandu_id`),
  ADD KEY `bidan_id` (`bidan_id`);

--
-- Indexes for table `posyandu_kader`
--
ALTER TABLE `posyandu_kader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kader_id` (`kader_id`),
  ADD KEY `pos_pos` (`posyandu_id`);

--
-- Indexes for table `standart_bb_umur_laki_laki`
--
ALTER TABLE `standart_bb_umur_laki_laki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standart_bb_umur_perempuan`
--
ALTER TABLE `standart_bb_umur_perempuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standart_bobot`
--
ALTER TABLE `standart_bobot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standart_index_char`
--
ALTER TABLE `standart_index_char`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standart_tb_umur_laki_laki`
--
ALTER TABLE `standart_tb_umur_laki_laki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standart_tb_umur_perempuan`
--
ALTER TABLE `standart_tb_umur_perempuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ahli_gizi`
--
ALTER TABLE `ahli_gizi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `balita`
--
ALTER TABLE `balita`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bidan`
--
ALTER TABLE `bidan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kader`
--
ALTER TABLE `kader`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kapus`
--
ALTER TABLE `kapus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posyandu`
--
ALTER TABLE `posyandu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posyandu_hasil`
--
ALTER TABLE `posyandu_hasil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posyandu_jadwal`
--
ALTER TABLE `posyandu_jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posyandu_kader`
--
ALTER TABLE `posyandu_kader`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standart_bb_umur_laki_laki`
--
ALTER TABLE `standart_bb_umur_laki_laki`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standart_bb_umur_perempuan`
--
ALTER TABLE `standart_bb_umur_perempuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standart_bobot`
--
ALTER TABLE `standart_bobot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standart_index_char`
--
ALTER TABLE `standart_index_char`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standart_tb_umur_laki_laki`
--
ALTER TABLE `standart_tb_umur_laki_laki`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standart_tb_umur_perempuan`
--
ALTER TABLE `standart_tb_umur_perempuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ahli_gizi`
--
ALTER TABLE `ahli_gizi`
  ADD CONSTRAINT `user_gizi` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bidan`
--
ALTER TABLE `bidan`
  ADD CONSTRAINT `user_bidan` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kapus`
--
ALTER TABLE `kapus`
  ADD CONSTRAINT `user_kaps` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posyandu_hasil`
--
ALTER TABLE `posyandu_hasil`
  ADD CONSTRAINT `pos_balita` FOREIGN KEY (`balita_id`) REFERENCES `balita` (`id`),
  ADD CONSTRAINT `pos_bidan` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`id`),
  ADD CONSTRAINT `pos_jadwa` FOREIGN KEY (`jadwal_id`) REFERENCES `posyandu_jadwal` (`id`);

--
-- Constraints for table `posyandu_jadwal`
--
ALTER TABLE `posyandu_jadwal`
  ADD CONSTRAINT `bidan_id` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pos_id` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandu` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `posyandu_kader`
--
ALTER TABLE `posyandu_kader`
  ADD CONSTRAINT `kader_id` FOREIGN KEY (`kader_id`) REFERENCES `kader` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pos_pos` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandu` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
