-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 17, 2023 at 09:45 PM
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
  `user_id` bigint(20) NOT NULL,
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
  `gakin` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bidan`
--

CREATE TABLE `bidan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
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
-- Table structure for table `kapus`
--

CREATE TABLE `kapus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
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
(1, 'Kelobuk Wetan', 'Kemban Village, Pasrepan District, Malang Regency, East Javas', 'Pos Kelobuk Wetan', '2023-04-18 02:43:16', '2023-04-18 02:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `posyandu_balita`
--

CREATE TABLE `posyandu_balita` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posyandu_id` bigint(20) NOT NULL,
  `balita_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posyandu_bidan`
--

CREATE TABLE `posyandu_bidan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posyandu_id` bigint(20) NOT NULL,
  `bidan_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posyandu_hasil`
--

CREATE TABLE `posyandu_hasil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posyandu_id` bigint(20) NOT NULL,
  `balita_id` bigint(20) NOT NULL,
  `bidan_id` bigint(20) NOT NULL,
  `tb` int(2) NOT NULL,
  `bb` int(2) NOT NULL,
  `status_gizi` varchar(50) NOT NULL,
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balita`
--
ALTER TABLE `balita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidan`
--
ALTER TABLE `bidan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kapus`
--
ALTER TABLE `kapus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posyandu`
--
ALTER TABLE `posyandu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posyandu_balita`
--
ALTER TABLE `posyandu_balita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posyandu_bidan`
--
ALTER TABLE `posyandu_bidan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posyandu_hasil`
--
ALTER TABLE `posyandu_hasil`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bidan`
--
ALTER TABLE `bidan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kapus`
--
ALTER TABLE `kapus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posyandu`
--
ALTER TABLE `posyandu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posyandu_balita`
--
ALTER TABLE `posyandu_balita`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posyandu_bidan`
--
ALTER TABLE `posyandu_bidan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posyandu_hasil`
--
ALTER TABLE `posyandu_hasil`
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
