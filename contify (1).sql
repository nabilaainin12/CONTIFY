-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 28, 2026 at 02:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contify`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_21_084846_create_service_packages_table', 1),
(5, '2026_06_21_084937_create_orders_table', 1),
(6, '2026_06_21_085005_create_payments_table', 1),
(7, '2026_06_21_085025_create_production_quotas_table', 1),
(8, '2026_06_21_085038_create_vouchers_table', 1),
(9, '2026_06_21_085046_create_production_teams_table', 1),
(10, '2026_06_21_085055_create_order_results_table', 1),
(11, '2026_06_21_085109_add_role_to_users_table', 1),
(12, '2026_06_21_144805_add_user_order_fields_to_orders_table', 1),
(13, '2026_06_22_062925_add_is_active_to_users_table', 1),
(14, '2026_06_22_084107_add_production_team_id_to_orders_table', 1),
(15, '2026_06_22_105851_add_includes_to_packages_table', 1),
(16, '2026_06_22_105927_drop_manual_order_counts_from_production_teams_table', 1),
(17, '2026_06_22_114131_add_service_type_to_packages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `production_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `reference_file` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `content_size` varchar(255) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `deadline_type` varchar(255) NOT NULL DEFAULT 'regular',
  `base_price` int(11) NOT NULL,
  `additional_price` int(11) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `total_price` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `priority` varchar(255) NOT NULL DEFAULT 'Reguler',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `production_team_id`, `package_id`, `voucher_id`, `title`, `notes`, `reference_file`, `platform`, `content_size`, `booking_date`, `deadline_type`, `base_price`, `additional_price`, `discount`, `total_price`, `status`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'CTF-DEMO-001', 2, NULL, 1, NULL, 'Edit Foto Produk Kopi', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-24', 'regular', 150000, 0, 0, 150000, 'pending', 'Reguler', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(2, 'CTF-DEMO-002', 3, NULL, 2, 1, 'Video Reels Promo Skincare', 'Video vertikal dengan teks promosi, musik, dan penyuntingan dasar.', NULL, 'TikTok', 'Story 9:16', '2026-06-24', 'express', 350000, 87500, 43750, 393750, 'pending', 'Cepat', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(3, 'CTF-DEMO-003', 4, NULL, 3, NULL, 'Caption Launching Produk Baru', 'Penulisan caption promosi dengan headline dan call to action.', NULL, 'Instagram', 'Caption', '2026-06-23', 'regular', 200000, 0, 0, 200000, 'pending', 'Reguler', '2026-06-21 07:56:23', '2026-06-21 07:56:23'),
(4, 'CTF-DEMO-004', 5, NULL, 4, 2, 'Strategi Konten Kedai Makanan', 'Penyusunan target audiens, content pillar, dan rencana publikasi.', NULL, 'Instagram', 'Content Plan', '2026-06-23', 'kilat', 500000, 250000, 150000, 600000, 'pending', 'Kilat', '2026-06-21 07:56:23', '2026-06-21 07:56:23'),
(5, 'CTF-DEMO-005', 6, NULL, 1, NULL, 'Edit Foto Menu Digital', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-22', 'regular', 150000, 0, 0, 150000, 'pending', 'Reguler', '2026-06-20 07:56:23', '2026-06-20 07:56:23'),
(6, 'CTF-DEMO-006', 7, NULL, 2, NULL, 'Video TikTok Promo Laundry', 'Video vertikal dengan teks promosi, musik, dan penyuntingan dasar.', NULL, 'TikTok', 'Story 9:16', '2026-06-21', 'regular', 350000, 0, 0, 350000, 'pending', 'Reguler', '2026-06-19 07:56:23', '2026-06-19 07:56:23'),
(7, 'CTF-DEMO-007', 2, 1, 1, NULL, 'Edit Foto Katalog Kopi', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-18', 'regular', 150000, 0, 0, 150000, 'queue', 'Reguler', '2026-06-16 07:56:23', '2026-06-20 07:56:23'),
(8, 'CTF-DEMO-008', 3, 1, 4, NULL, 'Content Plan Toko Skincare', 'Penyusunan target audiens, content pillar, dan rencana publikasi.', NULL, 'Instagram', 'Content Plan', '2026-06-17', 'regular', 500000, 0, 0, 500000, 'queue', 'Reguler', '2026-06-15 07:56:23', '2026-06-20 07:56:23'),
(9, 'CTF-DEMO-009', 4, 1, 1, NULL, 'Retouch Foto Fashion', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-16', 'express', 150000, 37500, 0, 187500, 'process', 'Cepat', '2026-06-14 07:56:23', '2026-06-21 07:56:23'),
(10, 'CTF-DEMO-010', 5, 1, 4, NULL, 'Strategi Konten Restoran', 'Penyusunan target audiens, content pillar, dan rencana publikasi.', NULL, 'Instagram', 'Content Plan', '2026-06-15', 'express', 500000, 125000, 0, 625000, 'process', 'Cepat', '2026-06-13 07:56:23', '2026-06-21 07:56:23'),
(11, 'CTF-DEMO-011', 6, 1, 1, NULL, 'Poster Promo Akhir Bulan', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-14', 'kilat', 150000, 75000, 0, 225000, 'review', 'Kilat', '2026-06-12 07:56:23', '2026-06-22 07:56:23'),
(12, 'CTF-DEMO-012', 7, 1, 1, NULL, 'Edit Foto Promo Ramadan', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-05-30', 'regular', 150000, 0, 0, 150000, 'done', 'Reguler', '2026-05-28 07:56:23', '2026-06-02 07:56:23'),
(13, 'CTF-DEMO-013', 2, 1, 4, NULL, 'Strategi Konten Toko Makanan', 'Penyusunan target audiens, content pillar, dan rencana publikasi.', NULL, 'Instagram', 'Content Plan', '2026-06-04', 'regular', 500000, 0, 0, 500000, 'done', 'Reguler', '2026-06-02 07:56:23', '2026-06-07 07:56:23'),
(14, 'CTF-DEMO-014', 3, 1, 1, NULL, 'Edit Foto Katalog Bunga', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-08', 'express', 150000, 37500, 0, 187500, 'done', 'Cepat', '2026-06-06 07:56:23', '2026-06-22 07:56:23'),
(15, 'CTF-DEMO-015', 4, 2, 2, NULL, 'Video Reels Profil Bisnis', 'Video vertikal dengan teks promosi, musik, dan penyuntingan dasar.', NULL, 'TikTok', 'Story 9:16', '2026-06-24', 'regular', 350000, 0, 0, 350000, 'queue', 'Reguler', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(16, 'CTF-DEMO-016', 5, 2, 1, NULL, 'Edit Foto Produk Minuman', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-18', 'express', 150000, 37500, 0, 187500, 'process', 'Cepat', '2026-06-16 07:56:23', '2026-06-22 07:56:23'),
(17, 'CTF-DEMO-017', 6, 2, 2, NULL, 'Video Testimoni Pelanggan', 'Video vertikal dengan teks promosi, musik, dan penyuntingan dasar.', NULL, 'TikTok', 'Story 9:16', '2026-06-06', 'regular', 350000, 0, 0, 350000, 'done', 'Reguler', '2026-06-04 07:56:23', '2026-06-10 07:56:23'),
(18, 'CTF-DEMO-018', 7, 2, 1, NULL, 'Edit Foto Launching Kedai', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-09', 'kilat', 150000, 75000, 0, 225000, 'done', 'Kilat', '2026-06-07 07:56:23', '2026-06-13 07:56:23'),
(19, 'CTF-DEMO-019', 2, 3, 3, NULL, 'Caption Kampanye Produk', 'Penulisan caption promosi dengan headline dan call to action.', NULL, 'Instagram', 'Caption', '2026-06-17', 'regular', 200000, 0, 0, 200000, 'review', 'Reguler', '2026-06-15 07:56:23', '2026-06-22 07:56:23'),
(20, 'CTF-DEMO-020', 3, 3, 3, NULL, 'Caption Promo Mingguan', 'Penulisan caption promosi dengan headline dan call to action.', NULL, 'Instagram', 'Caption', '2026-06-10', 'regular', 200000, 0, 0, 200000, 'done', 'Reguler', '2026-06-08 07:56:23', '2026-06-12 07:56:23'),
(21, 'CTF-DEMO-021', 4, 3, 4, NULL, 'Rencana Konten Produk Fashion', 'Penyusunan target audiens, content pillar, dan rencana publikasi.', NULL, 'Instagram', 'Content Plan', '2026-06-11', 'express', 500000, 125000, 0, 625000, 'done', 'Cepat', '2026-06-09 07:56:23', '2026-06-14 07:56:23'),
(22, 'CTF-DEMO-022', 5, 3, 3, NULL, 'Caption Menu Baru', 'Penulisan caption promosi dengan headline dan call to action.', NULL, 'Instagram', 'Caption', '2026-06-12', 'regular', 200000, 0, 0, 200000, 'done', 'Reguler', '2026-06-10 07:56:23', '2026-06-15 07:56:23'),
(23, 'CTF-DEMO-023', 6, 3, 4, NULL, 'Strategi Konten Satu Bulan', 'Penyusunan target audiens, content pillar, dan rencana publikasi.', NULL, 'Instagram', 'Content Plan', '2026-06-13', 'regular', 500000, 0, 0, 500000, 'done', 'Reguler', '2026-06-11 07:56:23', '2026-06-17 07:56:23'),
(24, 'CTF-DEMO-024', 7, 4, 1, NULL, 'Edit Foto Identitas Brand', 'Koreksi warna, pencahayaan, dan retouching ringan untuk foto produk.', NULL, 'Instagram', 'Feed 1:1', '2026-06-14', 'regular', 150000, 0, 0, 150000, 'done', 'Reguler', '2026-06-12 07:56:23', '2026-06-18 07:56:23'),
(25, 'CTF-DEMO-025', 2, 4, 3, NULL, 'Copy Writing Promo Kedai', 'Penulisan caption promosi dengan headline dan call to action.', NULL, 'Instagram', 'Caption', '2026-06-15', 'regular', 200000, 0, 0, 200000, 'done', 'Reguler', '2026-06-13 07:56:23', '2026-06-19 07:56:23'),
(26, 'CTF-DEMO-026', 3, 5, 2, NULL, 'Video Dokumentasi Produk', 'Video vertikal dengan teks promosi, musik, dan penyuntingan dasar.', NULL, 'TikTok', 'Story 9:16', '2026-06-16', 'regular', 350000, 0, 0, 350000, 'done', 'Reguler', '2026-06-14 07:56:23', '2026-06-20 07:56:23'),
(27, 'ORD-1782406650', 1, NULL, 1, NULL, 'Pembuatan Konten Instagram', 'Konten edukasi AI', NULL, '-', '-', '2026-06-26', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-25 09:57:30', '2026-06-25 09:57:30'),
(28, 'ORD-1782477250', 1, NULL, 1, NULL, 'Pembuatan Konten Instagram', 'Konten edukasi AI', NULL, '-', '-', '2026-06-26', 'normal', 150000, 0, 0, 150000, 'cancelled', '1', '2026-06-26 05:34:10', '2026-06-26 06:10:37'),
(29, 'ORD-1782479402', 1, NULL, 1, NULL, 'Pembuatan Konten Instagram', 'Konten edukasi AI', NULL, '-', '-', '2026-06-26', 'normal', 150000, 0, 0, 150000, 'cancelled', '1', '2026-06-26 06:10:02', '2026-06-26 06:31:30'),
(30, 'ORD-1782480190', 1, NULL, 1, NULL, 'Konten TikTok', 'Konten promosi terbaru', NULL, '-', '-', '2026-06-30', 'normal', 150000, 0, 0, 150000, 'cancelled', '1', '2026-06-26 06:23:10', '2026-06-26 06:45:58'),
(31, 'ORD-1782480449', 1, NULL, 1, NULL, 'Pembuatan Konten Instagram', 'Konten edukasi AI', NULL, '-', '-', '2026-06-26', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:27:29', '2026-06-26 06:27:29'),
(32, 'ORD-1782480613', 1, NULL, 1, NULL, 'Pembuatan Konten Instagram', 'Konten edukasi AI', NULL, '-', '-', '2026-06-26', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:30:13', '2026-06-26 06:30:13'),
(33, 'ORD-1782481247', 1, NULL, 1, NULL, 'Pembuatan Konten Instagram', 'Konten edukasi AI', NULL, '-', '-', '2026-06-26', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:40:47', '2026-06-26 06:40:47'),
(34, 'ORD-1782481361', 1, NULL, 1, NULL, 'Konten Baru', 'Testing edit', NULL, '-', '-', '2026-06-27', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:42:41', '2026-06-26 06:42:41'),
(35, 'ORD-1782481444', 1, NULL, 1, NULL, 'Konten Baru', 'Testing edit', NULL, '-', '-', '2026-06-27', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:44:04', '2026-06-26 06:44:04'),
(36, 'ORD-1782482282', 1, NULL, 1, NULL, 'Konten Baru', 'Testing edit', NULL, '-', '-', '2026-06-27', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:58:02', '2026-06-26 06:58:02'),
(37, 'ORD-1782482389', 1, NULL, 1, NULL, 'Konten TikTok', 'Konten promosi terbaru', NULL, '-', '-', '2026-06-30', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-26 06:59:49', '2026-06-26 07:00:45'),
(38, 'ORD-1782563014', 1, NULL, 1, NULL, 'Konten TikTok', 'Konten promosi terbaru', NULL, '-', '-', '2026-06-30', 'normal', 150000, 0, 0, 150000, 'done', '1', '2026-06-27 05:23:34', '2026-06-28 03:07:46'),
(39, 'ORD-1782644085', 1, NULL, 1, NULL, 'Konten Instagram', 'Membutuhkan desain feed', NULL, '-', '-', '2026-07-01', 'normal', 150000, 0, 0, 150000, 'pending', '1', '2026-06-28 03:54:45', '2026-06-28 03:54:45'),
(40, 'ORD-1782646531', 1, NULL, 1, NULL, 'Konten TikTok', 'Konten promosi terbaru', NULL, '-', '-', '2026-07-02', 'normal', 150000, 0, 0, 150000, 'done', '1', '2026-06-28 04:35:31', '2026-06-28 04:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_results`
--

CREATE TABLE `order_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_results`
--

INSERT INTO `order_results` (`id`, `order_id`, `file_name`, `file_path`, `notes`, `created_at`, `updated_at`) VALUES
(1, 12, 'hasil-ctf-demo-012.txt', 'demo/order-results/hasil-ctf-demo-012.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-02 07:56:23', '2026-06-02 07:56:23'),
(2, 13, 'hasil-ctf-demo-013.txt', 'demo/order-results/hasil-ctf-demo-013.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-07 07:56:23', '2026-06-07 07:56:23'),
(3, 14, 'hasil-ctf-demo-014.txt', 'demo/order-results/hasil-ctf-demo-014.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(4, 17, 'hasil-ctf-demo-017.txt', 'demo/order-results/hasil-ctf-demo-017.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-10 07:56:23', '2026-06-10 07:56:23'),
(5, 18, 'hasil-ctf-demo-018.txt', 'demo/order-results/hasil-ctf-demo-018.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-13 07:56:23', '2026-06-13 07:56:23'),
(6, 20, 'hasil-ctf-demo-020.txt', 'demo/order-results/hasil-ctf-demo-020.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-12 07:56:23', '2026-06-12 07:56:23'),
(7, 21, 'hasil-ctf-demo-021.txt', 'demo/order-results/hasil-ctf-demo-021.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-14 07:56:23', '2026-06-14 07:56:23'),
(8, 22, 'hasil-ctf-demo-022.txt', 'demo/order-results/hasil-ctf-demo-022.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-15 07:56:23', '2026-06-15 07:56:23'),
(9, 23, 'hasil-ctf-demo-023.txt', 'demo/order-results/hasil-ctf-demo-023.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-17 07:56:23', '2026-06-17 07:56:23'),
(10, 24, 'hasil-ctf-demo-024.txt', 'demo/order-results/hasil-ctf-demo-024.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-18 07:56:23', '2026-06-18 07:56:23'),
(11, 25, 'hasil-ctf-demo-025.txt', 'demo/order-results/hasil-ctf-demo-025.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-19 07:56:23', '2026-06-19 07:56:23'),
(12, 26, 'hasil-ctf-demo-026.txt', 'demo/order-results/hasil-ctf-demo-026.txt', 'File hasil demo pesanan yang sudah selesai.', '2026-06-20 07:56:23', '2026-06-20 07:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `includes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`includes`)),
  `price` int(11) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `revision_limit` int(11) NOT NULL DEFAULT 1,
  `total_slot` int(11) NOT NULL DEFAULT 10,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `service_type`, `description`, `includes`, `price`, `duration`, `revision_limit`, `total_slot`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Edit Foto', NULL, 'Layanan pengeditan foto produk atau promosi agar terlihat lebih bersih, menarik, dan siap digunakan di media sosial maupun marketplace.', '[\"Pengeditan maksimal 5 foto\",\"Koreksi warna dan pencahayaan\",\"Retouching ringan\",\"Penyesuaian atau penghapusan background\",\"Penyesuaian ukuran untuk satu platform\",\"File hasil JPG atau PNG\",\"Maksimal 2 kali revisi\"]', 150000, '2-3 hari', 2, 10, 1, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(2, 'Video / Reels', NULL, 'Layanan pengeditan video vertikal untuk TikTok, Instagram Reels, dan promosi singkat dengan tampilan yang lebih menarik.', '[\"Satu video vertikal maksimal 60 detik\",\"Pemotongan dan penyusunan video\",\"Transisi dasar\",\"Penambahan teks pada video\",\"Musik atau sound effect\",\"Koreksi warna dasar\",\"Format 1080 x 1920\",\"Maksimal 2 kali revisi\"]', 350000, '4-5 hari', 2, 8, 1, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(3, 'Copy Writing', NULL, 'Layanan penulisan teks promosi yang disesuaikan dengan karakter bisnis, target audiens, dan tujuan konten.', '[\"Penulisan maksimal 5 caption\",\"Headline atau kalimat pembuka\",\"Isi caption promosi\",\"Call to action\",\"Rekomendasi hashtag\",\"Penyesuaian tone komunikasi\",\"Maksimal 2 kali revisi\"]', 200000, '2-3 hari', 2, 12, 1, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(4, 'Strategi Konten', NULL, 'Layanan penyusunan arah dan rencana konten agar bisnis memiliki topik, jadwal, dan tujuan publikasi yang lebih terstruktur.', '[\"Analisis singkat akun atau bisnis\",\"Penentuan target audiens\",\"Penentuan content pillar\",\"Rencana konten selama 30 hari\",\"Minimal 12 ide konten\",\"Rekomendasi jadwal publikasi\",\"Rekomendasi format konten\",\"Rekomendasi indikator evaluasi konten\",\"Maksimal 2 kali revisi\"]', 500000, '5-7 hari', 2, 6, 1, '2026-06-22 07:56:23', '2026-06-22 07:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(255) NOT NULL DEFAULT 'Transfer Bank',
  `amount` int(11) NOT NULL,
  `proof_image` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `method`, `amount`, `proof_image`, `status`, `verified_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Transfer Bank', 150000, 'demo/payment-proofs/ctf-demo-001.png', 'pending', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(2, 2, 'QRIS', 393750, 'demo/payment-proofs/ctf-demo-002.png', 'pending', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(3, 3, 'E-Wallet', 200000, 'demo/payment-proofs/ctf-demo-003.png', 'pending', NULL, '2026-06-21 07:56:23', '2026-06-21 07:56:23'),
(4, 4, 'Transfer Bank', 600000, 'demo/payment-proofs/ctf-demo-004.png', 'pending', NULL, '2026-06-21 07:56:23', '2026-06-21 07:56:23'),
(5, 5, 'QRIS', 150000, NULL, 'pending', NULL, '2026-06-20 07:56:23', '2026-06-20 07:56:23'),
(6, 6, 'E-Wallet', 350000, 'demo/payment-proofs/ctf-demo-006.png', 'rejected', NULL, '2026-06-19 07:56:23', '2026-06-19 07:56:23'),
(7, 7, 'Transfer Bank', 150000, 'demo/payment-proofs/ctf-demo-007.png', 'verified', '2026-06-16 11:56:23', '2026-06-16 07:56:23', '2026-06-20 07:56:23'),
(8, 8, 'QRIS', 500000, 'demo/payment-proofs/ctf-demo-008.png', 'verified', '2026-06-15 11:56:23', '2026-06-15 07:56:23', '2026-06-20 07:56:23'),
(9, 9, 'E-Wallet', 187500, 'demo/payment-proofs/ctf-demo-009.png', 'verified', '2026-06-14 11:56:23', '2026-06-14 07:56:23', '2026-06-21 07:56:23'),
(10, 10, 'Transfer Bank', 625000, 'demo/payment-proofs/ctf-demo-010.png', 'verified', '2026-06-13 11:56:23', '2026-06-13 07:56:23', '2026-06-21 07:56:23'),
(11, 11, 'QRIS', 225000, 'demo/payment-proofs/ctf-demo-011.png', 'verified', '2026-06-12 11:56:23', '2026-06-12 07:56:23', '2026-06-22 07:56:23'),
(12, 12, 'E-Wallet', 150000, 'demo/payment-proofs/ctf-demo-012.png', 'verified', '2026-05-28 11:56:23', '2026-05-28 07:56:23', '2026-06-02 07:56:23'),
(13, 13, 'Transfer Bank', 500000, 'demo/payment-proofs/ctf-demo-013.png', 'verified', '2026-06-02 11:56:23', '2026-06-02 07:56:23', '2026-06-07 07:56:23'),
(14, 14, 'QRIS', 187500, 'demo/payment-proofs/ctf-demo-014.png', 'verified', '2026-06-06 11:56:23', '2026-06-06 07:56:23', '2026-06-22 07:56:23'),
(15, 15, 'E-Wallet', 350000, 'demo/payment-proofs/ctf-demo-015.png', 'verified', '2026-06-22 07:56:23', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(16, 16, 'Transfer Bank', 187500, 'demo/payment-proofs/ctf-demo-016.png', 'verified', '2026-06-16 11:56:23', '2026-06-16 07:56:23', '2026-06-22 07:56:23'),
(17, 17, 'QRIS', 350000, 'demo/payment-proofs/ctf-demo-017.png', 'verified', '2026-06-04 11:56:23', '2026-06-04 07:56:23', '2026-06-10 07:56:23'),
(18, 18, 'E-Wallet', 225000, 'demo/payment-proofs/ctf-demo-018.png', 'verified', '2026-06-07 11:56:23', '2026-06-07 07:56:23', '2026-06-13 07:56:23'),
(19, 19, 'Transfer Bank', 200000, 'demo/payment-proofs/ctf-demo-019.png', 'verified', '2026-06-15 11:56:23', '2026-06-15 07:56:23', '2026-06-22 07:56:23'),
(20, 20, 'QRIS', 200000, 'demo/payment-proofs/ctf-demo-020.png', 'verified', '2026-06-08 11:56:23', '2026-06-08 07:56:23', '2026-06-12 07:56:23'),
(21, 21, 'E-Wallet', 625000, 'demo/payment-proofs/ctf-demo-021.png', 'verified', '2026-06-09 11:56:23', '2026-06-09 07:56:23', '2026-06-14 07:56:23'),
(22, 22, 'Transfer Bank', 200000, 'demo/payment-proofs/ctf-demo-022.png', 'verified', '2026-06-10 11:56:23', '2026-06-10 07:56:23', '2026-06-15 07:56:23'),
(23, 23, 'QRIS', 500000, 'demo/payment-proofs/ctf-demo-023.png', 'verified', '2026-06-11 11:56:23', '2026-06-11 07:56:23', '2026-06-17 07:56:23'),
(24, 24, 'E-Wallet', 150000, 'demo/payment-proofs/ctf-demo-024.png', 'verified', '2026-06-12 11:56:23', '2026-06-12 07:56:23', '2026-06-18 07:56:23'),
(25, 25, 'Transfer Bank', 200000, 'payment_proofs/bukti_transfer.jpg', 'verified', '2026-06-13 11:56:23', '2026-06-13 07:56:23', '2026-06-19 07:56:23'),
(26, 26, 'QRIS', 350000, 'demo/payment-proofs/ctf-demo-026.png', 'verified', '2026-06-14 11:56:23', '2026-06-14 07:56:23', '2026-06-20 07:56:23'),
(27, 37, 'Transfer BCA', 150000, NULL, 'pending', NULL, '2026-06-27 04:41:52', '2026-06-27 04:41:52'),
(28, 38, 'Transfer BCA', 150000, NULL, 'pending', NULL, '2026-06-27 05:24:44', '2026-06-27 05:24:44'),
(29, 39, 'Transfer BCA', 150000, NULL, 'pending', NULL, '2026-06-28 04:03:53', '2026-06-28 04:03:53'),
(30, 40, 'Transfer BCA', 150000, NULL, 'pending', NULL, '2026-06-28 04:37:24', '2026-06-28 04:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `production_quotas`
--

CREATE TABLE `production_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `max_quota` int(11) NOT NULL DEFAULT 5,
  `used_quota` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_quotas`
--

INSERT INTO `production_quotas` (`id`, `date`, `max_quota`, `used_quota`, `status`, `created_at`, `updated_at`) VALUES
(1, '2026-06-22', 8, 5, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(2, '2026-06-23', 8, 3, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(3, '2026-06-24', 5, 5, 'full', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(4, '2026-06-25', 0, 0, 'closed', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(5, '2026-06-26', 10, 2, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(6, '2026-06-27', 10, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(7, '2026-06-28', 8, 1, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(8, '2026-06-29', 8, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(9, '2026-06-30', 10, 4, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(10, '2026-07-01', 10, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(11, '2026-07-02', 6, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(12, '2026-07-03', 6, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(13, '2026-07-04', 6, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(14, '2026-07-05', 6, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(15, '2026-07-06', 6, 0, 'open', '2026-06-22 07:56:23', '2026-06-22 07:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `production_teams`
--

CREATE TABLE `production_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_teams`
--

INSERT INTO `production_teams` (`id`, `name`, `role`, `skills`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sari Rahayu', 'Visual Editor & Content Planner', '[\"Edit Foto\",\"Strategi Konten\"]', 'available', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(2, 'Nila Agustina', 'Video Editor', '[\"Video \\/ Reels\",\"Edit Foto\"]', 'available', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(3, 'Dewi Lestari', 'Copywriter & Content Strategist', '[\"Copy Writing\",\"Strategi Konten\"]', 'available', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(4, 'Fajar Pratama', 'Content Specialist', '[\"Edit Foto\",\"Copy Writing\"]', 'available', '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(5, 'Raka Putra', 'Video Specialist & Content Planner', '[\"Video \\/ Reels\",\"Strategi Konten\"]', 'offline', '2026-06-22 07:56:23', '2026-06-22 07:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6FAiqXj5g9PfdDwW2R8b2HcMcC4TJGSyUEXNT0rG', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDZiS1R1a1JxbjZIMUxoSzNmNHpFblNva2VhSjdZUDdRS21EMkxJcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1782143799);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `phone` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `phone`, `is_active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Contify', 'admin@contify.test', 'admin', '081200000001', 1, NULL, '$2y$12$hJz1iOhmllm8gMoz2kSeLehN8thCHLb0k/Z8hKB/daq/E3UzhaLLW', NULL, '2026-06-22 07:56:22', '2026-06-22 07:56:22'),
(2, 'Andi Pratama', 'andi@contify.test', 'user', '081211110001', 1, NULL, '$2y$12$B/U6axtS8049drKm7W4t9OIP.H4U7XTUt3Iu44RFb/q2YXmbX4HmS', NULL, '2026-06-22 07:56:22', '2026-06-22 07:56:22'),
(3, 'Bunga Lestari', 'bunga@contify.test', 'user', '081211110002', 1, NULL, '$2y$12$aDhc.QhT.cElbWEQElTlTup.lj7C2lgKEXFWop/vOprDWt/VnMPc2', NULL, '2026-06-22 07:56:22', '2026-06-22 07:56:22'),
(4, 'Citra Maharani', 'citra@contify.test', 'user', '081211110003', 1, NULL, '$2y$12$S4UWhhlO56RiEGs5cxnucuiINThOqIU2A/CSpnXx1yedGWFW9Jbda', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(5, 'Annisa nisa', 'annisa@contify.test', 'user', '081211110004', 1, NULL, '$2y$12$qewguo0mxKtLd6J7oWPGXeXgdN4phP5TPEDTuGU31jV/t359IKt52', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(6, 'Eka Putri', 'eka@contify.test', 'user', '081211110005', 1, NULL, '$2y$12$S/Y9yzw44MjojfnkRuTz1ePqKDkZ.4AKJ3FdJDAbQ57aRYQK.ESvC', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(7, 'Farhan Akbar', 'farhan@contify.test', 'user', '081211110006', 1, NULL, '$2y$12$hyXh95oQM8NygnWLtejC4eKu.Fju62bWYabXK4tXzZYXLegg3t0GS', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(8, 'Gina Ramadhani', 'gina@contify.test', 'user', '081211110007', 0, NULL, '$2y$12$Kd9x7RxcdVYCtXkfmSN51utgmaGmTfA6X83mr4GcffAuca44cT902', NULL, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(10, 'Nabila', 'nabila@gmail.com', 'user', '08123456789', 1, NULL, '$2y$12$fa2XDJyAH5W5IMfrnqxq3ewtNT74e2VFy0WcKnKnADJ.72oJqe5sK', NULL, '2026-06-23 09:10:12', '2026-06-23 09:10:12'),
(11, 'Nabila', 'nabila2@gmail.com', 'user', '08123456789', 1, NULL, '$2y$12$7jAmADc/vaKAOVjw09VPf.GUVspNVYq2Ma.NF9GnpT5OQwjN1bnBm', NULL, '2026-06-24 08:46:40', '2026-06-24 08:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT 0,
  `usage_limit` int(11) NOT NULL DEFAULT 100,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `code`, `discount_percent`, `usage_limit`, `usage_count`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME10', 10, 100, 1, 1, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(2, 'UMKM20', 20, 50, 1, 1, '2026-06-22 07:56:23', '2026-06-22 07:56:23'),
(3, 'HEMAT15', 15, 30, 0, 0, '2026-06-22 07:56:23', '2026-06-22 07:56:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_package_id_foreign` (`package_id`),
  ADD KEY `orders_voucher_id_foreign` (`voucher_id`),
  ADD KEY `orders_production_team_id_foreign` (`production_team_id`);

--
-- Indexes for table `order_results`
--
ALTER TABLE `order_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_results_order_id_foreign` (`order_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `production_quotas`
--
ALTER TABLE `production_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `production_quotas_date_unique` (`date`);

--
-- Indexes for table `production_teams`
--
ALTER TABLE `production_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vouchers_code_unique` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `order_results`
--
ALTER TABLE `order_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `production_quotas`
--
ALTER TABLE `production_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `production_teams`
--
ALTER TABLE `production_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_production_team_id_foreign` FOREIGN KEY (`production_team_id`) REFERENCES `production_teams` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_results`
--
ALTER TABLE `order_results`
  ADD CONSTRAINT `order_results_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
