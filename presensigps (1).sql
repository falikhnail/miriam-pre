-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 03, 2024 at 02:58 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensigps`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

DROP TABLE IF EXISTS `cabang`;
CREATE TABLE IF NOT EXISTS `cabang` (
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_cabang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_cabang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `radius_cabang` int NOT NULL,
  PRIMARY KEY (`kode_cabang`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`kode_cabang`, `nama_cabang`, `lokasi_cabang`, `radius_cabang`) VALUES
('DIR', 'Direktur', '-6.81257423766664, 110.84045824054482', 100),
('HR', 'HRD', '-6.81257423766664, 110.84045824054482', 100),
('IT', 'IT', '-6.812762830787347, 110.84051969853655', 30);

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
CREATE TABLE IF NOT EXISTS `departemen` (
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_dept` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_dept`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`kode_dept`, `nama_dept`) VALUES
('DIR', 'Direktur'),
('HRD', 'Human Resource Development '),
('IT', 'Information Technology'),
('KEU', 'Keuangan'),
('MKT', 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `jam_kerja`
--

DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE IF NOT EXISTS `jam_kerja` (
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jam_kerja` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `awal_jam_masuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL,
  `lintashari` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kode_jam_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jam_kerja`
--

INSERT INTO `jam_kerja` (`kode_jam_kerja`, `nama_jam_kerja`, `awal_jam_masuk`, `jam_masuk`, `akhir_jam_masuk`, `jam_pulang`, `lintashari`) VALUES
('JK01', 'NON SHIFT', '06:00:00', '08:00:00', '15:29:00', '15:30:00', '0'),
('JK02', 'NON SHIFT SABTU', '06:00:00', '08:00:00', '12:59:00', '13:00:00', '0'),
('JK03', 'SHIFT PAGI', '05:00:00', '07:00:00', '14:29:00', '14:30:00', '0'),
('JK04', 'SHIFT SIANG', '12:00:00', '14:00:00', '21:29:00', '21:30:00', '0'),
('JK05', 'SHIFT MALAM', '19:00:00', '21:00:00', '06:59:00', '07:00:00', '1'),
('JK06', 'R/L/J MIDDLE', '07:00:00', '09:30:00', '16:29:00', '16:30:00', '0'),
('JK07', 'L/J SIANG', '09:00:00', '11:00:00', '18:29:00', '18:30:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE IF NOT EXISTS `karyawan` (
  `nik` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_hp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  KEY `fk_karyawan_cabang` (`kode_cabang`) USING BTREE,
  KEY `fk_karyawan_dept` (`kode_dept`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `foto`, `kode_dept`, `kode_cabang`, `password`, `remember_token`) VALUES
('DIR.2018-1000019', 'dr. Billie Sancho Thea', 'Direktur', '081221900366', NULL, 'DIR', 'DIR', '$2y$10$3LGy8LWEXJQFzNQlP7FtB.lhsqH6KVKWQuHettPPVqGsxkMLrTPyi', NULL),
('HR.2019-0500047', 'Mela Rizki Widowati', 'HR Legal', '085641509393', NULL, 'HRD', 'HR', '$2y$10$Y5W6W6ufGFkrXSUHh/CIFueKWgEKB32r7VNJ4a5GTX.5K.wAXSzRW', NULL),
('IT.2023-1000166', 'Falikh Rifqi Nail', 'Staff IT', '085156796373', 'IT.2023-1000166.jpeg', 'IT', 'IT', '$2y$10$gGWTd56OvX6UospFrFSozu2dRdn.LS7E/cgJo6h6fSv03dI/uhKdi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jamkerja`
--

DROP TABLE IF EXISTS `konfigurasi_jamkerja`;
CREATE TABLE IF NOT EXISTS `konfigurasi_jamkerja` (
  `nik` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hari` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  KEY `fk_kj_karyawan` (`nik`) USING BTREE,
  KEY `fk_kj_jk` (`kode_jam_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jamkerja`
--

INSERT INTO `konfigurasi_jamkerja` (`nik`, `hari`, `kode_jam_kerja`) VALUES
('22-01', 'Senin', NULL),
('22-01', 'Selasa', NULL),
('22-01', 'Rabu', NULL),
('22-01', 'Kamis', NULL),
('22-01', 'Jumat', NULL),
('22-01', 'Sabtu', NULL),
('22-01', 'Minggu', NULL),
('3636', 'Senin', 'JK01'),
('3636', 'Selasa', 'JK01'),
('3636', 'Rabu', 'JK03'),
('3636', 'Kamis', 'JK02'),
('3636', 'Jumat', 'JK01'),
('3636', 'Sabtu', 'JK01'),
('3636', 'Minggu', 'JK01'),
('12345', 'Senin', 'JK01'),
('12345', 'Selasa', 'JK01'),
('12345', 'Rabu', 'JK01'),
('12345', 'Kamis', 'JK01'),
('12345', 'Jumat', NULL),
('12345', 'Sabtu', NULL),
('12345', 'Minggu', 'JK01');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jamkerja_by_date`
--

DROP TABLE IF EXISTS `konfigurasi_jamkerja_by_date`;
CREATE TABLE IF NOT EXISTS `konfigurasi_jamkerja_by_date` (
  `nik` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  KEY `fk_kjbydate_karyawan` (`nik`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jamkerja_by_date`
--

INSERT INTO `konfigurasi_jamkerja_by_date` (`nik`, `tanggal`, `kode_jam_kerja`) VALUES
('22-01', '2024-01-01', 'JK01'),
('22-01', '2024-02-01', 'JK03'),
('3636', '2024-01-12', 'JK03'),
('3636', '2024-01-15', 'JK04'),
('2501', '2024-01-12', 'JK01'),
('3636', '2024-01-16', 'JK01'),
('12345', '2024-01-13', 'JK04');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jk_dept`
--

DROP TABLE IF EXISTS `konfigurasi_jk_dept`;
CREATE TABLE IF NOT EXISTS `konfigurasi_jk_dept` (
  `kode_jk_dept` char(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kode_jk_dept`) USING BTREE,
  KEY `fk_kjd_cabang` (`kode_cabang`) USING BTREE,
  KEY `fk_kjd_dept` (`kode_dept`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jk_dept`
--

INSERT INTO `konfigurasi_jk_dept` (`kode_jk_dept`, `kode_cabang`, `kode_dept`) VALUES
('JBDGIT', 'BDG', 'IT'),
('JBDGKEU', 'BDG', 'KEU'),
('JITIT', 'IT', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jk_dept_detail`
--

DROP TABLE IF EXISTS `konfigurasi_jk_dept_detail`;
CREATE TABLE IF NOT EXISTS `konfigurasi_jk_dept_detail` (
  `kode_jk_dept` char(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hari` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  KEY `fk_jkdept` (`kode_jk_dept`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jk_dept_detail`
--

INSERT INTO `konfigurasi_jk_dept_detail` (`kode_jk_dept`, `hari`, `kode_jam_kerja`) VALUES
('JBDGKEU', 'Senin', 'JK01'),
('JBDGKEU', 'Selasa', 'JK01'),
('JBDGKEU', 'Rabu', 'JK01'),
('JBDGKEU', 'Kamis', 'JK01'),
('JBDGKEU', 'Jumat', 'JK01'),
('JBDGKEU', 'Sabtu', 'JK02'),
('JBDGIT', 'Senin', 'JK01'),
('JBDGIT', 'Selasa', 'JK01'),
('JBDGIT', 'Rabu', 'JK01'),
('JBDGIT', 'Kamis', 'JK01'),
('JBDGIT', 'Jumat', 'JK01'),
('JBDGIT', 'Sabtu', 'JK02'),
('JITIT', 'Senin', 'JK01'),
('JITIT', 'Selasa', 'JK01'),
('JITIT', 'Rabu', 'JK01'),
('JITIT', 'Kamis', 'JK01'),
('JITIT', 'Jumat', 'JK01'),
('JITIT', 'Sabtu', 'JK02');

-- --------------------------------------------------------

--
-- Table structure for table `master_cuti`
--

DROP TABLE IF EXISTS `master_cuti`;
CREATE TABLE IF NOT EXISTS `master_cuti` (
  `kode_cuti` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_cuti` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jml_hari` smallint DEFAULT NULL,
  PRIMARY KEY (`kode_cuti`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `master_cuti`
--

INSERT INTO `master_cuti` (`kode_cuti`, `nama_cuti`, `jml_hari`) VALUES
('C01', 'Tahunan', 12),
('C02', 'Cuti Melahirkan', 90),
('C04', 'Cuti Menikah', 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_12_14_233749_create_permission_tables', 1),
(5, '2023_12_15_002819_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 13),
(1, 'App\\Models\\User', 14);

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_izin`
--

DROP TABLE IF EXISTS `pengajuan_izin`;
CREATE TABLE IF NOT EXISTS `pengajuan_izin` (
  `kode_izin` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_izin_dari` date DEFAULT NULL,
  `tgl_izin_sampai` date DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'i : izin s : sakit',
  `kode_cuti` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_sid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_approved` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak',
  PRIMARY KEY (`kode_izin`) USING BTREE,
  KEY `fk_pengajuan_karyawan` (`nik`) USING BTREE,
  KEY `fk_pengajuan_cuti` (`kode_cuti`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-karyawan', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28'),
(2, 'view-departemen', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
CREATE TABLE IF NOT EXISTS `presensi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nik` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time DEFAULT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `foto_out` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lokasi_in` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `lokasi_out` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_izin` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_presensi_karyawan` (`nik`) USING BTREE,
  KEY `fk_prensesi_pengajuan_izin` (`kode_izin`) USING BTREE,
  KEY `fk_presensi_jk` (`kode_jam_kerja`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Stand-in structure for view `q_rekappresensi`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `q_rekappresensi`;
CREATE TABLE IF NOT EXISTS `q_rekappresensi` (
`jabatan` varchar(20)
,`nama_lengkap` varchar(100)
,`nik` char(20)
,`tgl_1` varchar(329)
,`tgl_10` varchar(329)
,`tgl_11` varchar(329)
,`tgl_12` varchar(329)
,`tgl_13` varchar(329)
,`tgl_14` varchar(329)
,`tgl_15` varchar(329)
,`tgl_16` varchar(329)
,`tgl_17` varchar(329)
,`tgl_18` varchar(329)
,`tgl_19` varchar(329)
,`tgl_2` varchar(329)
,`tgl_20` varchar(329)
,`tgl_21` varchar(329)
,`tgl_22` varchar(329)
,`tgl_23` varchar(329)
,`tgl_24` varchar(329)
,`tgl_25` varchar(329)
,`tgl_26` varchar(329)
,`tgl_27` varchar(329)
,`tgl_28` varchar(329)
,`tgl_29` varchar(329)
,`tgl_3` varchar(329)
,`tgl_30` varchar(329)
,`tgl_31` varchar(329)
,`tgl_4` varchar(329)
,`tgl_5` varchar(329)
,`tgl_6` varchar(329)
,`tgl_7` varchar(329)
,`tgl_8` varchar(329)
,`tgl_9` varchar(329)
);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28'),
(2, 'admin departemen', 'web', '2023-12-17 17:22:14', '2023-12-17 17:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_dept` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `kode_dept`, `kode_cabang`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Adam Adifa', 'adam@gmail.com', NULL, '$2y$10$QyRg7XiipzUiFQjwLD/aFOYqimZNNwi65yH76hRybocmt0N0Cjbye', 'IT', 'PST', NULL, '2023-12-18 15:45:36', '2023-12-18 15:45:36'),
(13, 'Falikh Rifqi Nail', 'falikh@gmail.com', NULL, '$2y$10$8bNWh2J3GSnJmgzCwgvk6OCWKlnj05H/k9D5tdOHu3S2oMD3.Sflq', 'IT', 'IT', NULL, '2024-02-12 01:19:34', '2024-02-12 01:19:34'),
(14, 'Arief Ersan', 'ersan@gmail.com', NULL, '$2y$10$P2oaUSXgOq1KmwCtbRiln.VLowdOqmsmmLpzK5IIkrhFsBdPk73A.', 'HRD', 'HR', NULL, '2024-02-12 01:27:25', '2024-02-12 01:27:25');

-- --------------------------------------------------------

--
-- Structure for view `q_rekappresensi`
--
DROP TABLE IF EXISTS `q_rekappresensi`;

DROP VIEW IF EXISTS `q_rekappresensi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_rekappresensi`  AS SELECT `karyawan`.`nik` AS `nik`, `karyawan`.`nama_lengkap` AS `nama_lengkap`, `karyawan`.`jabatan` AS `jabatan`, `presensi`.`tgl_1` AS `tgl_1`, `presensi`.`tgl_2` AS `tgl_2`, `presensi`.`tgl_3` AS `tgl_3`, `presensi`.`tgl_4` AS `tgl_4`, `presensi`.`tgl_5` AS `tgl_5`, `presensi`.`tgl_6` AS `tgl_6`, `presensi`.`tgl_7` AS `tgl_7`, `presensi`.`tgl_8` AS `tgl_8`, `presensi`.`tgl_9` AS `tgl_9`, `presensi`.`tgl_10` AS `tgl_10`, `presensi`.`tgl_11` AS `tgl_11`, `presensi`.`tgl_12` AS `tgl_12`, `presensi`.`tgl_13` AS `tgl_13`, `presensi`.`tgl_14` AS `tgl_14`, `presensi`.`tgl_15` AS `tgl_15`, `presensi`.`tgl_16` AS `tgl_16`, `presensi`.`tgl_17` AS `tgl_17`, `presensi`.`tgl_18` AS `tgl_18`, `presensi`.`tgl_19` AS `tgl_19`, `presensi`.`tgl_20` AS `tgl_20`, `presensi`.`tgl_21` AS `tgl_21`, `presensi`.`tgl_22` AS `tgl_22`, `presensi`.`tgl_23` AS `tgl_23`, `presensi`.`tgl_24` AS `tgl_24`, `presensi`.`tgl_25` AS `tgl_25`, `presensi`.`tgl_26` AS `tgl_26`, `presensi`.`tgl_27` AS `tgl_27`, `presensi`.`tgl_28` AS `tgl_28`, `presensi`.`tgl_29` AS `tgl_29`, `presensi`.`tgl_30` AS `tgl_30`, `presensi`.`tgl_31` AS `tgl_31` FROM (`karyawan` left join (select `presensi`.`nik` AS `nik`,max(if((`presensi`.`tgl_presensi` = '2023-11-01'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_1`,max(if((`presensi`.`tgl_presensi` = '2023-11-02'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_2`,max(if((`presensi`.`tgl_presensi` = '2023-11-03'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_3`,max(if((`presensi`.`tgl_presensi` = '2023-11-04'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_4`,max(if((`presensi`.`tgl_presensi` = '2023-11-05'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_5`,max(if((`presensi`.`tgl_presensi` = '2023-11-06'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_6`,max(if((`presensi`.`tgl_presensi` = '2023-11-07'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_7`,max(if((`presensi`.`tgl_presensi` = '2023-11-08'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_8`,max(if((`presensi`.`tgl_presensi` = '2023-11-09'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_9`,max(if((`presensi`.`tgl_presensi` = '2023-11-10'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_10`,max(if((`presensi`.`tgl_presensi` = '2023-11-11'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_11`,max(if((`presensi`.`tgl_presensi` = '2023-11-12'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_12`,max(if((`presensi`.`tgl_presensi` = '2023-11-13'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_13`,max(if((`presensi`.`tgl_presensi` = '2023-11-14'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_14`,max(if((`presensi`.`tgl_presensi` = '2023-11-15'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_15`,max(if((`presensi`.`tgl_presensi` = '2023-11-16'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_16`,max(if((`presensi`.`tgl_presensi` = '2023-11-17'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_17`,max(if((`presensi`.`tgl_presensi` = '2023-11-18'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_18`,max(if((`presensi`.`tgl_presensi` = '2023-11-19'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_19`,max(if((`presensi`.`tgl_presensi` = '2023-11-20'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_20`,max(if((`presensi`.`tgl_presensi` = '2023-11-21'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_21`,max(if((`presensi`.`tgl_presensi` = '2023-11-22'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_22`,max(if((`presensi`.`tgl_presensi` = '2023-11-23'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_23`,max(if((`presensi`.`tgl_presensi` = '2023-11-24'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_24`,max(if((`presensi`.`tgl_presensi` = '2023-11-25'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_25`,max(if((`presensi`.`tgl_presensi` = '2023-11-26'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_26`,max(if((`presensi`.`tgl_presensi` = '2023-11-27'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_27`,max(if((`presensi`.`tgl_presensi` = '2023-11-28'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_28`,max(if((`presensi`.`tgl_presensi` = '2023-11-29'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_29`,max(if((`presensi`.`tgl_presensi` = '2023-11-30'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_30`,max(if((`presensi`.`tgl_presensi` = '2023-11-31'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_31` from ((`presensi` left join `jam_kerja` on((`presensi`.`kode_jam_kerja` = `jam_kerja`.`kode_jam_kerja`))) left join `pengajuan_izin` on((`presensi`.`kode_izin` = `pengajuan_izin`.`kode_izin`))) group by `presensi`.`nik`) `presensi` on((`karyawan`.`nik` = `presensi`.`nik`)))  ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_karyawan_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD CONSTRAINT `fk_kj_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kj_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD CONSTRAINT `fk_kjbydate_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD CONSTRAINT `fk_kjd_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kjd_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD CONSTRAINT `fk_jkdept` FOREIGN KEY (`kode_jk_dept`) REFERENCES `konfigurasi_jk_dept` (`kode_jk_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`model_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD CONSTRAINT `fk_pengajuan_cuti` FOREIGN KEY (`kode_cuti`) REFERENCES `master_cuti` (`kode_cuti`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pengajuan_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `fk_prensesi_pengajuan_izin` FOREIGN KEY (`kode_izin`) REFERENCES `pengajuan_izin` (`kode_izin`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_presensi_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_presensi_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
