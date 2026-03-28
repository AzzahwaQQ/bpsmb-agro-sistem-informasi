-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2026 at 11:37 AM
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
-- Database: `bpsmb_agro`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `tipe` enum('info','warning','success','umum') NOT NULL DEFAULT 'info',
  `foto` varchar(255) DEFAULT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isi`, `tipe`, `foto`, `is_aktif`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Sistem Permohonan Online Tersedia', 'Pengajuan kalibrasi dan pengujian kini dapat dilakukan secara online melalui portal ini.', 'success', NULL, 1, '2026-03-08 09:44:52', '2026-03-09 14:05:20', NULL),
(2, 'Jam Operasional Kantor', 'Kantor BPSMB AGRO buka Senin–Jumat pukul 08.00–16.00 WIB.', 'info', NULL, 1, '2026-03-08 09:44:52', '2026-03-08 09:44:52', NULL),
(3, 'our family', 'my family my team', 'success', 'uploads/berita/berita_1773039867_857.webp', 1, '2026-03-09 14:04:27', '2026-03-09 14:04:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_alat_kalibrasi`
--

CREATE TABLE `detail_alat_kalibrasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `alat_id` smallint(5) UNSIGNED NOT NULL,
  `kelas_id` tinyint(3) UNSIGNED NOT NULL,
  `merk` varchar(100) DEFAULT NULL,
  `no_seri` varchar(100) DEFAULT NULL,
  `kapasitas` varchar(50) DEFAULT NULL,
  `tarif` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_alat_kalibrasi`
--

INSERT INTO `detail_alat_kalibrasi` (`id`, `permohonan_id`, `alat_id`, `kelas_id`, `merk`, `no_seri`, `kapasitas`, `tarif`) VALUES
(1, 1, 4, 2, 'hd', '11123', '2kg', 0.00),
(2, 3, 5, 2, 'g', '11123', '2kg', 0.00),
(3, 6, 5, 2, 'g', '11123', '5kg', 0.00),
(4, 7, 3, 4, 'B', '11123', '5kg', 0.00),
(5, 10, 4, 1, 'hd', '11123', '2kg', 750000.00),
(6, 11, 3, 5, 'B', '11123', '2kg', 500000.00),
(7, 13, 4, 1, 'ojs', 'at', '5kg', 750000.00),
(8, 15, 1, 4, 'OHAUS', 'AT-4382', '10KG', 425000.00),
(9, 15, 1, 4, 'B', '11123', '5kg', 425000.00),
(10, 18, 4, 1, 'eq', 'g', 'lk', 750000.00);

-- --------------------------------------------------------

--
-- Table structure for table `detail_parameter_pengujian`
--

CREATE TABLE `detail_parameter_pengujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `komoditas_id` smallint(5) UNSIGNED NOT NULL,
  `parameter_id` smallint(5) UNSIGNED NOT NULL,
  `berat_sampel` varchar(50) DEFAULT NULL,
  `metode_uji` varchar(150) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tarif` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_parameter_pengujian`
--

INSERT INTO `detail_parameter_pengujian` (`id`, `permohonan_id`, `komoditas_id`, `parameter_id`, `berat_sampel`, `metode_uji`, `keterangan`, `tarif`) VALUES
(1, 2, 2, 8, NULL, '', 'f', 350000.00),
(2, 4, 5, 18, NULL, '', 'h', 200000.00),
(3, 4, 5, 21, NULL, '', 'h', 250000.00),
(4, 5, 2, 6, NULL, '', 'gitu', 175000.00),
(5, 5, 2, 7, NULL, '', 'gitu', 200000.00),
(6, 5, 2, 8, NULL, '', 'gitu', 350000.00),
(7, 5, 2, 9, NULL, '', 'gitu', 250000.00),
(8, 8, 4, 13, NULL, '', '-', 175000.00),
(9, 8, 4, 14, NULL, '', '-', 150000.00),
(10, 8, 4, 15, NULL, '', '-', 275000.00),
(11, 8, 4, 16, NULL, '', '-', 125000.00),
(12, 9, 5, 17, NULL, '', '-', 175000.00),
(13, 9, 5, 18, NULL, '', '-', 200000.00),
(14, 9, 5, 19, NULL, '', '-', 300000.00),
(15, 9, 5, 20, NULL, '', '-', 275000.00),
(16, 9, 5, 21, NULL, '', '-', 250000.00),
(17, 12, 2, 6, '', '', '', 175000.00),
(18, 12, 2, 7, '', '', '', 200000.00),
(19, 12, 2, 8, '', '', '', 350000.00),
(20, 12, 2, 9, '', '', '', 250000.00),
(21, 14, 1, 1, '', '', 'gitu', 175000.00),
(22, 16, 4, 13, '', '', 'AHAAHAHHAHHAHAHAAHH', 175000.00),
(23, 16, 4, 14, '', '', 'AHAAHAHHAHHAHAHAAHH', 150000.00),
(24, 16, 4, 16, '', '', 'AHAAHAHHAHHAHAHAAHH', 125000.00),
(25, 17, 1, 5, '', '', 'AHAAHAHHAHHAHAHAAHH', 100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE `disposisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `dibuat_oleh` int(10) UNSIGNED NOT NULL,
  `no_order` varchar(100) NOT NULL,
  `instruksi` text DEFAULT NULL,
  `batas_waktu` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disposisi`
--

INSERT INTO `disposisi` (`id`, `permohonan_id`, `dibuat_oleh`, `no_order`, `instruksi`, `batas_waktu`, `created_at`) VALUES
(1, 1, 4, '189-KAL-II-26', '', '2026-03-10', '2026-03-03 06:55:00'),
(2, 4, 4, '190-KAL-II-26', '', '2026-03-10', '2026-03-03 08:06:29'),
(3, 6, 4, '200-KAL-II-26', 'kerjain', '2026-03-10', '2026-03-03 14:19:07'),
(4, 7, 4, '267=KAL-III-26', 'iu', '2026-03-10', '2026-03-03 19:47:20'),
(5, 8, 4, '200-UJI-II-26', 'KI', '2026-03-10', '2026-03-03 20:37:45'),
(6, 9, 4, '205-UJI-II-26', 'jesr', '2026-03-11', '2026-03-04 09:38:43'),
(7, 15, 4, '340-KAL-II-26', 'l', '2026-03-15', '2026-03-08 08:28:38'),
(8, 16, 4, '490-UJI-III-26', 'kocakk!', '2026-03-16', '2026-03-09 03:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_teknisi`
--

CREATE TABLE `disposisi_teknisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `disposisi_id` int(10) UNSIGNED NOT NULL,
  `teknisi_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','selesai') NOT NULL DEFAULT 'pending',
  `file_dokumen` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tgl_selesai` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disposisi_teknisi`
--

INSERT INTO `disposisi_teknisi` (`id`, `disposisi_id`, `teknisi_id`, `status`, `file_dokumen`, `keterangan`, `tgl_selesai`) VALUES
(1, 1, 6, 'pending', NULL, NULL, NULL),
(2, 1, 5, 'selesai', 'uploads/dokumen_lab/dok_1772520999_5.pdf', '', '2026-03-03 13:56:39'),
(3, 2, 6, 'pending', NULL, NULL, NULL),
(4, 2, 5, 'selesai', 'uploads/dokumen_lab/dok_1772525233_5.pdf', '', '2026-03-03 15:07:13'),
(5, 3, 5, 'selesai', 'uploads/dokumen_lab/dok_1772547789_5.pdf', '', '2026-03-03 21:23:09'),
(6, 4, 5, 'selesai', 'uploads/dokumen_lab/dok_1772567353_5.pdf', '', '2026-03-04 02:49:13'),
(7, 5, 5, 'selesai', 'uploads/dokumen_lab/dok_1772570328_5.png', '', '2026-03-04 03:38:48'),
(8, 5, 6, 'selesai', 'uploads/dokumen_lab/dok_1772570430_6.pdf', '', '2026-03-04 03:40:30'),
(9, 6, 5, 'selesai', 'uploads/dokumen_lab/dok_1772617193_5.png', '', '2026-03-04 16:39:53'),
(10, 7, 5, 'selesai', 'uploads/dokumen_lab/dok_1772958650_5.png', '', '2026-03-08 15:30:50'),
(11, 8, 5, 'selesai', 'uploads/dokumen_lab/dok_1773027087_5.pdf', 'mantap', '2026-03-09 10:31:27'),
(12, 8, 6, 'selesai', 'uploads/dokumen_lab/dok_1773027251_6.jpg', 'keren ga', '2026-03-09 10:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_lab`
--

CREATE TABLE `dokumen_lab` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `upload_oleh` int(10) UNSIGNED NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `tipe` enum('cerapan','data_kalibrasi','data_pengujian') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `verified_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokumen_lab`
--

INSERT INTO `dokumen_lab` (`id`, `permohonan_id`, `upload_oleh`, `nama_file`, `file_path`, `tipe`, `keterangan`, `verified_at`, `verified_by`, `created_at`) VALUES
(1, 1, 5, 'Welcome to FigJam (1).pdf', 'uploads/dokumen_lab/dok_1772520999_5.pdf', 'cerapan', '', NULL, NULL, '2026-03-03 06:56:39'),
(2, 4, 5, 'Welcome to FigJam (1).pdf', 'uploads/dokumen_lab/dok_1772525233_5.pdf', 'data_pengujian', '', NULL, NULL, '2026-03-03 08:07:13'),
(3, 6, 5, 'Welcome to FigJam (1).pdf', 'uploads/dokumen_lab/dok_1772547789_5.pdf', 'data_kalibrasi', '', NULL, NULL, '2026-03-03 14:23:09'),
(4, 7, 5, 'Welcome to FigJam (1).pdf', 'uploads/dokumen_lab/dok_1772567353_5.pdf', 'data_kalibrasi', '', NULL, NULL, '2026-03-03 19:49:13'),
(5, 8, 5, 'Screenshot 2026-03-03 154039.png', 'uploads/dokumen_lab/dok_1772570328_5.png', 'data_pengujian', '', NULL, NULL, '2026-03-03 20:38:48'),
(6, 8, 6, 'Welcome to FigJam (1).pdf', 'uploads/dokumen_lab/dok_1772570430_6.pdf', 'data_pengujian', '', NULL, NULL, '2026-03-03 20:40:30'),
(7, 8, 4, 'Welcome to FigJam (1).pdf', 'uploads/dokumen_lab/keptek_8_1772570513.pdf', 'data_pengujian', 'Dokumen TTD Kepala Teknisi', NULL, NULL, '2026-03-03 20:41:53'),
(8, 9, 5, 'Screenshot 2025-11-19 081208.png', 'uploads/dokumen_lab/dok_1772617193_5.png', 'data_pengujian', '', NULL, NULL, '2026-03-04 09:39:53'),
(9, 15, 5, 'Screenshot (7).png', 'uploads/dokumen_lab/dok_1772958650_5.png', 'data_kalibrasi', '', NULL, NULL, '2026-03-08 08:30:50'),
(10, 16, 5, 'doc (1).pdf', 'uploads/dokumen_lab/dok_1773027087_5.pdf', 'data_pengujian', 'mantap', NULL, NULL, '2026-03-09 03:31:27'),
(11, 16, 6, 'Profil-Mayor-Teddy.jpg', 'uploads/dokumen_lab/dok_1773027251_6.jpg', 'data_pengujian', 'keren ga', NULL, NULL, '2026-03-09 03:34:11'),
(12, 16, 4, 'logo.png.png', 'uploads/dokumen_lab/keptek_16_1773027329.png', 'data_pengujian', 'Dokumen TTD Kepala Teknisi: anjay', NULL, NULL, '2026-03-09 03:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_layanan`
--

CREATE TABLE `jenis_layanan` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_layanan`
--

INSERT INTO `jenis_layanan` (`id`, `kode`, `nama`, `is_active`) VALUES
(1, 'KAL', 'Kalibrasi', 1),
(2, 'UJI', 'Pengujian', 1),
(3, 'SER', 'Sertifikasi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kaji_ulang`
--

CREATE TABLE `kaji_ulang` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `dibuat_oleh` int(10) UNSIGNED NOT NULL,
  `fo_user_id` int(10) UNSIGNED DEFAULT NULL,
  `keptek_user_id` int(10) UNSIGNED DEFAULT NULL,
  `catatan` text NOT NULL,
  `file_dokumen` varchar(255) DEFAULT NULL,
  `file_ttd_konsumen` varchar(255) DEFAULT NULL,
  `tgl_ttd_konsumen` datetime DEFAULT NULL,
  `tgl_kirim_keptek` datetime DEFAULT NULL COMMENT 'Waktu FO klik Kirim ke Keptek',
  `file_ttd_keptek` varchar(255) DEFAULT NULL,
  `tgl_ttd_keptek` datetime DEFAULT NULL,
  `file_ttd_fo` varchar(255) DEFAULT NULL,
  `tgl_ttd_fo` datetime DEFAULT NULL,
  `status` enum('menunggu_konsumen','menunggu_keptek','menunggu_fo','diterima','ditolak') NOT NULL DEFAULT 'menunggu_konsumen',
  `alasan_tolak` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `metoda_ok` tinyint(1) DEFAULT NULL,
  `sumber_daya_ok` tinyint(1) DEFAULT NULL,
  `aspek_tarif` varchar(255) DEFAULT NULL,
  `aspek_waktu` varchar(255) DEFAULT NULL,
  `kesimpulan` enum('dapat','tidak') DEFAULT NULL,
  `alasan_tidak` text DEFAULT NULL,
  `metoda_ket` text DEFAULT NULL,
  `sumber_daya_ket` text DEFAULT NULL,
  `aspek_titik_ukur` varchar(255) DEFAULT NULL,
  `aspek_lainnya` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kaji_ulang`
--

INSERT INTO `kaji_ulang` (`id`, `permohonan_id`, `dibuat_oleh`, `fo_user_id`, `keptek_user_id`, `catatan`, `file_dokumen`, `file_ttd_konsumen`, `tgl_ttd_konsumen`, `tgl_kirim_keptek`, `file_ttd_keptek`, `tgl_ttd_keptek`, `file_ttd_fo`, `tgl_ttd_fo`, `status`, `alasan_tolak`, `created_at`, `updated_at`, `metoda_ok`, `sumber_daya_ok`, `aspek_tarif`, `aspek_waktu`, `kesimpulan`, `alasan_tidak`, `metoda_ket`, `sumber_daya_ket`, `aspek_titik_ukur`, `aspek_lainnya`) VALUES
(1, 1, 2, 2, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772501379.png', '2026-03-03 08:29:39', '2026-03-03 08:30:24', 'uploads/ttd/ttd_keptek_4_1772502188.png', '2026-03-03 08:43:08', 'uploads/ttd/ttd_fo_2_1772502330.png', '2026-03-03 08:45:30', 'diterima', NULL, '2026-03-03 01:20:01', '2026-03-03 01:45:30', 1, 1, '-', '-', 'dapat', '', '', '', '-', '-'),
(2, 4, 2, 2, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772522246.png', '2026-03-03 14:17:26', '2026-03-03 14:18:06', 'uploads/ttd/ttd_keptek_4_1772522326.png', '2026-03-03 14:18:46', 'uploads/ttd/ttd_fo_2_1772522370.png', '2026-03-03 14:19:30', 'diterima', NULL, '2026-03-03 07:16:49', '2026-03-03 07:19:30', 1, 1, '-', '-', 'dapat', '', '', '', '-', '-'),
(3, 5, 3, NULL, NULL, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772546791.png', '2026-03-03 21:06:31', NULL, NULL, NULL, NULL, NULL, 'menunggu_keptek', NULL, '2026-03-03 13:59:37', '2026-03-03 14:06:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 6, 2, 2, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772547108.png', '2026-03-03 21:11:48', '2026-03-03 21:13:04', 'uploads/ttd/ttd_keptek_4_1772547351.png', '2026-03-03 21:15:51', 'uploads/ttd/ttd_fo_2_1772547492.png', '2026-03-03 21:18:12', 'diterima', NULL, '2026-03-03 14:11:38', '2026-03-03 14:18:12', 1, 1, '-', 'e', 'dapat', '', '', '', '-', '-'),
(5, 7, 3, NULL, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772567043.png', '2026-03-04 02:44:03', '2026-03-04 02:44:30', 'uploads/ttd/ttd_keptek_4_1772567112.png', '2026-03-04 02:45:12', 'uploads/ttd/ttd_fo_3_1772567186.png', '2026-03-04 02:46:26', 'diterima', NULL, '2026-03-03 19:43:42', '2026-03-03 19:46:26', 1, 1, '-', '-', 'dapat', '', '', '', '-', '-'),
(6, 8, 2, 2, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772570094.png', '2026-03-04 03:34:54', '2026-03-04 03:35:10', 'uploads/ttd/ttd_keptek_4_1772570166.png', '2026-03-04 03:36:06', 'uploads/ttd/ttd_fo_2_1772570217.png', '2026-03-04 03:36:57', 'diterima', NULL, '2026-03-03 20:20:17', '2026-03-03 20:36:57', 1, 1, '-', '-', 'dapat', '', '', '', '-', '-'),
(7, 9, 2, 2, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772616776.png', '2026-03-04 16:32:56', '2026-03-04 16:33:59', 'uploads/ttd/ttd_keptek_4_1772616938.png', '2026-03-04 16:35:38', 'uploads/ttd/ttd_fo_2_1772617040.png', '2026-03-04 16:37:20', 'diterima', NULL, '2026-03-04 09:31:53', '2026-03-04 09:37:20', 1, 1, '-', '-', 'dapat', '', '', '', '-', '-'),
(8, 3, 3, NULL, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772669897.png', '2026-03-05 07:18:17', '2026-03-05 07:18:26', 'uploads/ttd/ttd_keptek_4_1772669951.png', '2026-03-05 07:19:11', NULL, NULL, 'menunggu_fo', NULL, '2026-03-05 00:17:42', '2026-03-05 00:19:11', 1, 1, 'g', 'r', 'dapat', '', '', '', 'g', 'u'),
(9, 15, 2, 2, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1772956337.png', '2026-03-08 14:52:17', '2026-03-08 15:25:13', 'uploads/ttd/ttd_keptek_4_1772958391.png', '2026-03-08 15:26:31', 'uploads/ttd/ttd_fo_2_1772958453.png', '2026-03-08 15:27:33', 'diterima', NULL, '2026-03-08 07:36:10', '2026-03-08 08:27:33', 1, 1, '-', '-', 'dapat', '', '', '', '-', 'u'),
(10, 16, 3, NULL, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1773026408.png', '2026-03-09 10:20:08', '2026-03-09 10:21:16', 'uploads/ttd/ttd_keptek_4_1773026828.png', '2026-03-09 10:27:08', 'uploads/ttd/ttd_fo_3_1773026916.png', '2026-03-09 10:28:36', 'diterima', NULL, '2026-03-09 03:19:45', '2026-03-09 03:28:36', 1, 1, '20650218', '1 menit', 'dapat', '', '', '', '0,000000', 'wleeee'),
(11, 17, 1, NULL, 4, '', NULL, 'uploads/ttd/ttd_kon_ku_8_1773051204.png', '2026-03-09 17:13:24', '2026-03-09 17:13:36', 'uploads/ttd/ttd_keptek_4_1773051286.png', '2026-03-09 17:14:46', 'uploads/ttd/ttd_fo_1_1773051333.png', '2026-03-09 17:15:33', 'diterima', NULL, '2026-03-09 10:12:55', '2026-03-09 10:15:33', 1, 1, '-', '-', 'dapat', '', '', '', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `permohonan_id` int(10) UNSIGNED DEFAULT NULL,
  `aksi` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `user_id`, `permohonan_id`, `aksi`, `deskripsi`, `ip_address`, `created_at`) VALUES
(1, NULL, NULL, 'register', 'Konsumen baru daftar: azzahwaqq@gmail.com', '::1', '2026-03-01 01:26:38'),
(2, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-01 01:27:13'),
(3, 8, NULL, 'logout', 'User za logout', '::1', '2026-03-01 01:31:00'),
(4, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-01 01:35:09'),
(5, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-03 00:28:45'),
(6, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-03 00:32:26'),
(7, 8, 1, 'submit_kalibrasi', 'Permohonan kalibrasi: DJV-AGROBDG-KAL', '::1', '2026-03-03 00:42:58'),
(8, 8, 2, 'submit_pengujian', 'Permohonan pengujian: MMT-AGROBDG-UJI', '::1', '2026-03-03 01:06:48'),
(9, 2, 1, 'verifikasi_fo', 'FO verifikasi: DJV-AGROBDG-KAL', '::1', '2026-03-03 01:20:01'),
(10, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-03 01:29:19'),
(11, 2, 1, 'kirim_keptek', 'FO kirim ke keptek: DJV-AGROBDG-KAL', '::1', '2026-03-03 01:30:24'),
(12, 8, 3, 'submit_kalibrasi', 'Permohonan kalibrasi: CMN-AGROBDG-KAL', '::1', '2026-03-03 01:35:46'),
(13, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-03 01:36:20'),
(14, 4, 1, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: DJV-AGROBDG-KAL — dapat', '::1', '2026-03-03 01:43:08'),
(15, 2, 1, 'ttd_fo_final', 'FO TTD final + no order 189-KAL-II-26 untuk DJV-AGROBDG-KAL', '::1', '2026-03-03 01:45:30'),
(16, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-03 02:26:00'),
(17, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-03 06:20:51'),
(18, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-03 06:50:35'),
(19, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-03 06:53:08'),
(20, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-03 06:54:10'),
(21, 4, 1, 'disposisi', 'Keptek disposisi DJV-AGROBDG-KAL ke 2 teknisi', '::1', '2026-03-03 06:55:00'),
(22, 6, NULL, 'login', 'User Teknisi Dua (teknisi) login', '::1', '2026-03-03 06:55:48'),
(23, 5, 1, 'upload_dokumen', 'Teknisi upload dokumen cerapan untuk permohonan #1', '::1', '2026-03-03 06:56:39'),
(24, 8, 4, 'submit_pengujian', 'Permohonan pengujian: VWS-AGROBDG-UJI', '::1', '2026-03-03 07:15:23'),
(25, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-03 07:16:29'),
(26, 2, 4, 'verifikasi_fo', 'FO verifikasi: VWS-AGROBDG-UJI', '::1', '2026-03-03 07:16:49'),
(27, 2, 4, 'kirim_keptek', 'FO kirim ke keptek: VWS-AGROBDG-UJI', '::1', '2026-03-03 07:18:06'),
(28, 4, 4, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: VWS-AGROBDG-UJI — dapat', '::1', '2026-03-03 07:18:46'),
(29, 2, 4, 'ttd_fo_final', 'FO TTD final + no order 190-KAL-II-26 untuk VWS-AGROBDG-UJI', '::1', '2026-03-03 07:19:30'),
(30, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-03 07:52:16'),
(31, 4, 4, 'disposisi', 'Keptek disposisi VWS-AGROBDG-UJI ke 2 teknisi', '::1', '2026-03-03 08:06:29'),
(32, 5, 4, 'upload_dokumen', 'Teknisi upload dokumen data_pengujian untuk permohonan #4', '::1', '2026-03-03 08:07:13'),
(33, 4, 4, 'verifikasi_approve', 'Keptek approve dokumen VWS-AGROBDG-UJI', '::1', '2026-03-03 08:08:05'),
(34, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-03 08:11:28'),
(35, 3, 1, 'verifikasi_dokumen_tu', 'TU verifikasi dokumen permohonan #1', '::1', '2026-03-03 08:12:22'),
(36, 3, 1, 'upload_sertifikat', 'TU upload sertifikat/LHU #1', '::1', '2026-03-03 09:14:31'),
(37, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-03 11:26:28'),
(38, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-03 11:27:28'),
(39, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-03 13:48:57'),
(40, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-03 13:49:32'),
(41, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-03 13:50:22'),
(42, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-03 13:51:47'),
(43, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-03 13:52:27'),
(44, 8, 5, 'submit_pengujian', 'Permohonan pengujian: VCS-AGROBDG-UJI', '::1', '2026-03-03 13:55:18'),
(45, 3, 5, 'verifikasi_tu', 'TU verifikasi: VCS-AGROBDG-UJI', '::1', '2026-03-03 13:59:37'),
(46, 8, 6, 'submit_kalibrasi', 'Permohonan kalibrasi: XHA-AGROBDG-KAL', '::1', '2026-03-03 14:11:06'),
(47, 2, 6, 'verifikasi_fo', 'FO verifikasi: XHA-AGROBDG-KAL', '::1', '2026-03-03 14:11:38'),
(48, 2, 6, 'kirim_keptek', 'FO kirim ke keptek: XHA-AGROBDG-KAL', '::1', '2026-03-03 14:13:04'),
(49, 4, 6, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: XHA-AGROBDG-KAL — dapat', '::1', '2026-03-03 14:15:51'),
(50, 2, 6, 'ttd_fo_final', 'FO TTD final + no order 200-KAL-II-26 untuk XHA-AGROBDG-KAL', '::1', '2026-03-03 14:18:12'),
(51, 4, 6, 'disposisi', 'Keptek disposisi XHA-AGROBDG-KAL ke 1 teknisi', '::1', '2026-03-03 14:19:07'),
(52, 5, 6, 'upload_dokumen', 'Teknisi upload dokumen data_kalibrasi untuk permohonan #6', '::1', '2026-03-03 14:23:09'),
(53, 4, 6, 'verifikasi_approve', 'Keptek approve dokumen XHA-AGROBDG-KAL', '::1', '2026-03-03 14:24:42'),
(54, 3, 6, 'upload_sertifikat', 'TU upload sertifikat/LHU #6', '::1', '2026-03-03 14:31:12'),
(55, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-03 19:37:47'),
(56, 8, 7, 'submit_kalibrasi', 'Permohonan kalibrasi: VZW-AGROBDG-KAL', '::1', '2026-03-03 19:39:17'),
(57, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-03 19:40:01'),
(58, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-03 19:40:50'),
(59, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-03 19:42:43'),
(60, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-03 19:43:22'),
(61, 3, 7, 'verifikasi_tu', 'TU verifikasi: VZW-AGROBDG-KAL', '::1', '2026-03-03 19:43:42'),
(62, 3, 7, 'kirim_keptek_tu', 'TU kirim ke keptek: VZW-AGROBDG-KAL', '::1', '2026-03-03 19:44:30'),
(63, 4, 7, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: VZW-AGROBDG-KAL — dapat', '::1', '2026-03-03 19:45:12'),
(64, 3, 7, 'ttd_fo_final', 'FO TTD final + no order 267=KAL-III-26 untuk VZW-AGROBDG-KAL', '::1', '2026-03-03 19:46:26'),
(65, 4, 7, 'disposisi', 'Keptek disposisi VZW-AGROBDG-KAL ke 1 teknisi', '::1', '2026-03-03 19:47:20'),
(66, 5, 7, 'upload_dokumen', 'Teknisi upload dokumen data_kalibrasi untuk permohonan #7', '::1', '2026-03-03 19:49:13'),
(67, 4, 7, 'verifikasi_approve', 'Keptek approve dokumen VZW-AGROBDG-KAL', '::1', '2026-03-03 19:51:18'),
(68, 3, 7, 'upload_sertifikat', 'TU upload sertifikat/LHU #7', '::1', '2026-03-03 19:53:55'),
(69, 8, 8, 'submit_pengujian', 'Permohonan pengujian: VKD-AGROBDG-UJI', '::1', '2026-03-03 20:18:07'),
(70, 2, 8, 'verifikasi_fo', 'FO verifikasi: VKD-AGROBDG-UJI', '::1', '2026-03-03 20:20:17'),
(71, 2, 8, 'kirim_keptek', 'FO kirim ke keptek: VKD-AGROBDG-UJI', '::1', '2026-03-03 20:35:10'),
(72, 4, 8, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: VKD-AGROBDG-UJI — dapat', '::1', '2026-03-03 20:36:06'),
(73, 2, 8, 'ttd_fo_final', 'FO TTD final + no order 200-UJI-II-26 untuk VKD-AGROBDG-UJI', '::1', '2026-03-03 20:36:57'),
(74, 4, 8, 'disposisi', 'Keptek disposisi VKD-AGROBDG-UJI ke 2 teknisi', '::1', '2026-03-03 20:37:45'),
(75, 5, 8, 'upload_dokumen', 'Teknisi upload dokumen data_pengujian untuk permohonan #8', '::1', '2026-03-03 20:38:48'),
(76, 6, NULL, 'login', 'User Teknisi Dua (teknisi) login', '::1', '2026-03-03 20:39:23'),
(77, 6, 8, 'upload_dokumen', 'Teknisi upload dokumen data_pengujian untuk permohonan #8', '::1', '2026-03-03 20:40:30'),
(78, 4, 8, 'verifikasi_approve', 'Keptek approve dokumen VKD-AGROBDG-UJI', '::1', '2026-03-03 20:41:53'),
(79, 3, 8, 'upload_sertifikat', 'TU upload sertifikat/LHU #8', '::1', '2026-03-03 20:48:00'),
(80, 2, 8, 'pengembalian_alat', 'FO input pengembalian alat untuk VKD-AGROBDG-UJI', '::1', '2026-03-03 21:05:47'),
(81, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-04 04:26:52'),
(82, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-04 04:27:39'),
(83, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-04 04:27:59'),
(84, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-04 04:28:29'),
(85, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-04 06:08:00'),
(86, 8, 9, 'submit_pengujian', 'Permohonan pengujian: GRJ-AGROBDG-UJI', '::1', '2026-03-04 09:27:14'),
(87, 2, 9, 'verifikasi_fo', 'FO verifikasi: GRJ-AGROBDG-UJI', '::1', '2026-03-04 09:31:53'),
(88, 2, 9, 'kirim_keptek', 'FO kirim ke keptek: GRJ-AGROBDG-UJI', '::1', '2026-03-04 09:33:59'),
(89, 4, 9, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: GRJ-AGROBDG-UJI — dapat', '::1', '2026-03-04 09:35:38'),
(90, 2, 9, 'ttd_fo_final', 'FO TTD final + no order 205-UJI-II-26 untuk GRJ-AGROBDG-UJI', '::1', '2026-03-04 09:37:20'),
(91, 4, 9, 'disposisi', 'Keptek disposisi GRJ-AGROBDG-UJI ke 1 teknisi', '::1', '2026-03-04 09:38:43'),
(92, 5, 9, 'upload_dokumen', 'Teknisi upload dokumen data_pengujian untuk permohonan #9', '::1', '2026-03-04 09:39:53'),
(93, 4, 9, 'verifikasi_approve', 'Keptek approve dokumen GRJ-AGROBDG-UJI', '::1', '2026-03-04 09:40:48'),
(94, 3, 9, 'upload_sertifikat', 'TU upload sertifikat/LHU #9', '::1', '2026-03-04 09:43:51'),
(95, 2, 9, 'pengembalian_alat', 'FO input pengembalian alat untuk GRJ-AGROBDG-UJI', '::1', '2026-03-04 09:46:59'),
(96, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-04 11:05:18'),
(97, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-04 23:49:47'),
(98, 1, NULL, 'login', 'User Super Admin (superadmin) login', '::1', '2026-03-04 23:54:00'),
(99, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-05 00:17:21'),
(100, 3, 3, 'verifikasi_tu', 'TU verifikasi: CMN-AGROBDG-KAL', '::1', '2026-03-05 00:17:42'),
(101, 3, 3, 'kirim_keptek_tu', 'TU kirim ke keptek: CMN-AGROBDG-KAL', '::1', '2026-03-05 00:18:26'),
(102, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-05 00:18:47'),
(103, 4, 3, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: CMN-AGROBDG-KAL — dapat', '::1', '2026-03-05 00:19:11'),
(104, 1, NULL, 'HAPUS_USER', 'Superadmin menghapus user #7', '::1', '2026-03-05 00:32:47'),
(105, 1, NULL, 'TAMBAH_USER', 'Superadmin menambah user: nata (konsumen)', '::1', '2026-03-05 00:33:50'),
(106, 1, NULL, 'EDIT_USER', 'Superadmin mengedit user #9: nata (konsumen)', '::1', '2026-03-05 00:47:22'),
(107, 9, NULL, 'login', 'User nata (konsumen) login', '::1', '2026-03-05 00:57:50'),
(108, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-05 04:00:58'),
(109, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-05 04:26:11'),
(110, 8, NULL, 'logout', 'User za logout', '::1', '2026-03-05 04:55:15'),
(111, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-05 04:55:29'),
(112, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-05 04:56:41'),
(113, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-06 00:51:16'),
(114, 2, NULL, 'login', 'User Front Office (fo) login', '::1', '2026-03-06 00:51:52'),
(115, 2, NULL, 'update_profile', 'User Front Office update profil', '::1', '2026-03-06 02:14:59'),
(116, 2, NULL, 'update_profile', 'User Bapak A update profil', '::1', '2026-03-06 02:15:42'),
(117, 8, 10, 'submit_kalibrasi', 'Permohonan kalibrasi: PSG-AGROBDG-KAL', '::1', '2026-03-06 02:54:57'),
(118, 2, NULL, 'logout', 'User Bapak A logout', '::1', '2026-03-06 03:00:26'),
(119, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-06 03:03:59'),
(120, 2, NULL, 'login', 'User Bapak A (fo) login', '::1', '2026-03-06 03:33:25'),
(121, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-08 01:16:07'),
(122, 8, 11, 'submit_kalibrasi', 'Permohonan kalibrasi: QUB-AGROBDG-KAL', '::1', '2026-03-08 01:28:22'),
(123, 8, 12, 'submit_pengujian', 'Permohonan pengujian: HBV-AGROBDG-UJI', '::1', '2026-03-08 02:04:51'),
(124, 8, 13, 'submit_kalibrasi', 'Permohonan kalibrasi: HQX-AGROBDG-KAL', '::1', '2026-03-08 02:11:26'),
(125, 8, 14, 'submit_pengujian', 'Permohonan pengujian: WZQ-AGROBDG-UJI', '::1', '2026-03-08 02:14:58'),
(126, 2, NULL, 'login', 'User Bapak A (fo) login', '::1', '2026-03-08 03:19:00'),
(127, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-08 05:15:56'),
(128, 8, 15, 'submit_kalibrasi', 'Permohonan kalibrasi: CVK-AGROBDG-KAL', '::1', '2026-03-08 07:14:48'),
(129, 2, 15, 'verifikasi_fo', 'FO verifikasi: CVK-AGROBDG-KAL', '::1', '2026-03-08 07:36:10'),
(130, 2, 15, 'kirim_keptek', 'FO kirim ke keptek: CVK-AGROBDG-KAL', '::1', '2026-03-08 08:25:13'),
(131, 4, 15, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: CVK-AGROBDG-KAL — dapat', '::1', '2026-03-08 08:26:31'),
(132, 2, 15, 'ttd_fo_final', 'FO TTD final + no order 340-KAL-II-26 untuk CVK-AGROBDG-KAL', '::1', '2026-03-08 08:27:33'),
(133, 4, 15, 'disposisi', 'Keptek disposisi CVK-AGROBDG-KAL ke 1 teknisi', '::1', '2026-03-08 08:28:38'),
(134, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-08 08:29:22'),
(135, 5, 15, 'upload_dokumen', 'Teknisi upload dokumen data_kalibrasi untuk permohonan #15', '::1', '2026-03-08 08:30:50'),
(136, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-08 23:56:07'),
(137, 2, NULL, 'login', 'User Bapak A (fo) login', '::1', '2026-03-08 23:56:55'),
(138, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-08 23:58:12'),
(139, 1, NULL, 'login', 'User Super Admin (superadmin) login', '::1', '2026-03-09 00:15:26'),
(140, 3, NULL, 'login', 'User Tata Usaha (tata_usaha) login', '::1', '2026-03-09 00:20:40'),
(141, 5, NULL, 'login', 'User Teknisi Satu (teknisi) login', '::1', '2026-03-09 00:21:16'),
(142, 2, NULL, 'update_profile', 'User Bapak A update profil', '::1', '2026-03-09 02:49:50'),
(143, 5, NULL, 'update_profile', 'Teknisi Teknisi Satu update profil', '::1', '2026-03-09 03:03:01'),
(144, 5, NULL, 'update_profile', 'Teknisi Teknisi Satu update profil', '::1', '2026-03-09 03:03:35'),
(145, 5, NULL, 'update_profile', 'Teknisi Teknisi Satu update profil', '::1', '2026-03-09 03:06:16'),
(146, 8, 16, 'submit_pengujian', 'Permohonan pengujian: SKF-AGROBDG-UJI', '::1', '2026-03-09 03:18:36'),
(147, 3, 16, 'verifikasi_tu', 'TU verifikasi: SKF-AGROBDG-UJI', '::1', '2026-03-09 03:19:45'),
(148, 3, 16, 'kirim_keptek_tu', 'TU kirim ke keptek: SKF-AGROBDG-UJI', '::1', '2026-03-09 03:21:16'),
(149, 4, 16, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: SKF-AGROBDG-UJI — dapat', '::1', '2026-03-09 03:27:08'),
(150, 3, 16, 'ttd_fo_final', 'FO TTD final + no order 490-UJI-III-26 untuk SKF-AGROBDG-UJI', '::1', '2026-03-09 03:28:36'),
(151, 4, 16, 'disposisi', 'Keptek disposisi SKF-AGROBDG-UJI ke 2 teknisi', '::1', '2026-03-09 03:29:38'),
(152, 5, 16, 'upload_dokumen', 'Teknisi upload dokumen data_pengujian untuk permohonan #16', '::1', '2026-03-09 03:31:27'),
(153, 5, NULL, 'logout', 'User Teknisi Satu logout', '::1', '2026-03-09 03:33:02'),
(154, 6, NULL, 'login', 'User Teknisi Dua (teknisi) login', '::1', '2026-03-09 03:33:18'),
(155, 6, 16, 'upload_dokumen', 'Teknisi upload dokumen data_pengujian untuk permohonan #16', '::1', '2026-03-09 03:34:11'),
(156, 4, 16, 'verifikasi_approve', 'Keptek approve dokumen SKF-AGROBDG-UJI', '::1', '2026-03-09 03:35:29'),
(157, 3, 16, 'upload_sertifikat', 'TU upload sertifikat/LHU #16', '::1', '2026-03-09 03:37:26'),
(158, 2, 16, 'pengembalian_alat', 'FO input pengembalian alat untuk SKF-AGROBDG-UJI', '::1', '2026-03-09 03:39:57'),
(159, 1, NULL, 'TAMBAH_BERITA', 'Superadmin menambahkan berita: our family', '::1', '2026-03-09 07:04:27'),
(160, 1, NULL, 'login', 'User Super Admin (superadmin) login', '::1', '2026-03-09 08:49:03'),
(161, 8, NULL, 'login', 'User za (konsumen) login', '::1', '2026-03-09 08:56:08'),
(162, 8, 17, 'submit_pengujian', 'Permohonan pengujian: HYR-AGROBDG-UJI', '::1', '2026-03-09 09:22:05'),
(163, 1, 17, 'verifikasi_superadmin', 'Superadmin verifikasi: HYR-AGROBDG-UJI', '::1', '2026-03-09 10:12:55'),
(164, 1, 17, 'kirim_keptek_superadmin', 'Superadmin kirim ke keptek: HYR-AGROBDG-UJI', '::1', '2026-03-09 10:13:36'),
(165, 4, NULL, 'login', 'User Kepala Teknisi (kepala_teknisi) login', '::1', '2026-03-09 10:14:18'),
(166, 4, 17, 'isi_kaji_ulang', 'Keptek mengisi kaji ulang: HYR-AGROBDG-UJI — dapat', '::1', '2026-03-09 10:14:46'),
(167, 1, 17, 'ttd_fo_final', 'FO TTD final + no order 491-UJI-III-26 untuk HYR-AGROBDG-UJI', '::1', '2026-03-09 10:15:33'),
(168, 8, 18, 'submit_kalibrasi', 'Permohonan kalibrasi: VYW-AGROBDG-KAL', '::1', '2026-03-09 10:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `master_alat`
--

CREATE TABLE `master_alat` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nama` varchar(150) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_alat`
--

INSERT INTO `master_alat` (`id`, `nama`, `satuan`, `is_active`) VALUES
(1, 'Anak Timbangan', 'kg', 1),
(2, 'Timbangan Digital', 'kg', 1),
(3, 'Timbangan Platform', 'kg', 1),
(4, 'Neraca Analitik', 'gram', 1),
(5, 'Timbangan Meja', 'kg', 1),
(6, 'Timbangan Gantung', 'kg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_kelas_alat`
--

CREATE TABLE `master_kelas_alat` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_kelas_alat`
--

INSERT INTO `master_kelas_alat` (`id`, `kelas`) VALUES
(1, 'E1'),
(2, 'E2'),
(3, 'F1'),
(4, 'F2'),
(5, 'M1'),
(6, 'M2');

-- --------------------------------------------------------

--
-- Table structure for table `master_komoditas`
--

CREATE TABLE `master_komoditas` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_komoditas`
--

INSERT INTO `master_komoditas` (`id`, `kode`, `nama`, `is_active`) VALUES
(1, 'KOPI_BIJI', 'Biji Kopi', 1),
(2, 'KOPI_BUBUK', 'Kopi Bubuk', 1),
(3, 'TEH_HITAM', 'Teh Hitam', 1),
(4, 'BIJI_KAKAO', 'Biji Kakao', 1),
(5, 'MAKANAN_OLAHAN', 'Pengujian Makanan Olahan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_nominal`
--

CREATE TABLE `master_nominal` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL COMMENT 'Contoh: 0 – 1, 1 – 5, 5 – 20',
  `satuan` varchar(20) DEFAULT NULL COMMENT 'Contoh: kg, gram, liter',
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Nominal kapasitas alat kalibrasi';

--
-- Dumping data for table `master_nominal`
--

INSERT INTO `master_nominal` (`id`, `label`, `satuan`, `is_active`) VALUES
(1, '0 – 1', 'kg', 1),
(2, '1 – 5', 'kg', 1),
(3, '5 – 20', 'kg', 1),
(4, '20 – 100', 'kg', 1),
(5, '100 – 300', 'kg', 1),
(6, '300 – 1000', 'kg', 1),
(7, '0 – 100', 'gram', 1),
(8, '100 – 500', 'gram', 1),
(9, '0 – 0.001', 'gram', 1),
(10, '0.001 – 0.2', 'gram', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_parameter_uji`
--

CREATE TABLE `master_parameter_uji` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `komoditas_id` smallint(5) UNSIGNED NOT NULL,
  `nama_parameter` varchar(150) NOT NULL,
  `metode_sni` varchar(100) DEFAULT NULL,
  `tarif` decimal(12,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_parameter_uji`
--

INSERT INTO `master_parameter_uji` (`id`, `komoditas_id`, `nama_parameter`, `metode_sni`, `tarif`, `is_active`) VALUES
(1, 1, 'Kadar Air', 'SNI 01-3932-1995', 175000.00, 1),
(2, 1, 'Biji Cacat', 'SNI 01-3932-1995', 150000.00, 1),
(3, 1, 'Nilai Cacat', 'SNI 01-3932-1995', 150000.00, 1),
(4, 1, 'Kotoran & Benda Asing', 'SNI 01-3932-1995', 125000.00, 1),
(5, 1, 'Serangga Hidup', 'SNI 01-3932-1995', 100000.00, 1),
(6, 2, 'Kadar Air', 'SNI 01-3542-2004', 175000.00, 1),
(7, 2, 'Kadar Abu', 'SNI 01-3542-2004', 200000.00, 1),
(8, 2, 'Kafein', 'SNI 01-3542-2004', 350000.00, 1),
(9, 2, 'Kadar Lemak', 'SNI 01-3542-2004', 250000.00, 1),
(10, 3, 'Kadar Air', 'SNI 01-3836-2000', 175000.00, 1),
(11, 3, 'Kadar Abu Total', 'SNI 01-3836-2000', 200000.00, 1),
(12, 3, 'Serat Kasar', 'SNI 01-3836-2000', 225000.00, 1),
(13, 4, 'Kadar Air', 'SNI 01-2323-2008', 175000.00, 1),
(14, 4, 'Biji Cacat', 'SNI 01-2323-2008', 150000.00, 1),
(15, 4, 'Lemak', 'SNI 01-2323-2008', 275000.00, 1),
(16, 4, 'Kotoran', 'SNI 01-2323-2008', 125000.00, 1),
(17, 5, 'Kadar Air', 'SNI', 175000.00, 1),
(18, 5, 'Kadar Abu', 'SNI', 200000.00, 1),
(19, 5, 'Protein', 'SNI', 300000.00, 1),
(20, 5, 'Lemak', 'SNI', 275000.00, 1),
(21, 5, 'Karbohidrat', 'SNI', 250000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_tarif_kalibrasi`
--

CREATE TABLE `master_tarif_kalibrasi` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `alat_id` smallint(5) UNSIGNED NOT NULL,
  `kelas_id` tinyint(3) UNSIGNED NOT NULL,
  `nominal_id` smallint(5) UNSIGNED DEFAULT NULL,
  `kapasitas_min` decimal(10,3) DEFAULT NULL,
  `kapasitas_max` decimal(10,3) DEFAULT NULL,
  `satuan` varchar(20) NOT NULL DEFAULT 'kg',
  `tarif` decimal(12,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_tarif_kalibrasi`
--

INSERT INTO `master_tarif_kalibrasi` (`id`, `alat_id`, `kelas_id`, `nominal_id`, `kapasitas_min`, `kapasitas_max`, `satuan`, `tarif`, `is_active`) VALUES
(1, 1, 5, NULL, 0.001, 1.000, 'kg', 350000.00, 1),
(2, 1, 5, NULL, 1.001, 5.000, 'kg', 450000.00, 1),
(3, 1, 5, NULL, 5.001, 20.000, 'kg', 550000.00, 1),
(4, 1, 3, NULL, 0.001, 1.000, 'kg', 500000.00, 1),
(5, 1, 3, NULL, 1.001, 5.000, 'kg', 650000.00, 1),
(6, 1, 4, NULL, 0.001, 1.000, 'kg', 425000.00, 1),
(7, 1, 4, NULL, 1.001, 5.000, 'kg', 575000.00, 1),
(8, 2, 5, NULL, 0.001, 30.000, 'kg', 400000.00, 1),
(9, 2, 5, NULL, 30.001, 150.000, 'kg', 600000.00, 1),
(10, 3, 5, NULL, 0.001, 300.000, 'kg', 500000.00, 1),
(11, 3, 5, NULL, 300.001, 1000.000, 'kg', 750000.00, 1),
(12, 4, 1, NULL, 0.000, 0.200, 'kg', 750000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED DEFAULT NULL,
  `judul` varchar(200) NOT NULL,
  `pesan` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `user_id`, `permohonan_id`, `judul`, `pesan`, `is_read`, `created_at`) VALUES
(1, 8, 1, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: DJV-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-03 00:42:58'),
(2, 8, 2, 'Permohonan Pengujian Terkirim', 'Kode lacak: MMT-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-03 01:06:48'),
(3, 8, 1, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan DJV-AGROBDG-KAL sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-03 01:20:01'),
(4, 1, 1, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 01:29:39'),
(5, 2, 1, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 01:29:39'),
(6, 3, 1, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 01:29:39'),
(7, 4, 1, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan DJV-AGROBDG-KAL sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-03 01:30:24'),
(8, 8, 3, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: CMN-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-03 01:35:46'),
(9, 1, 1, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang DJV-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 01:43:08'),
(10, 2, 1, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang DJV-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 01:43:08'),
(11, 3, 1, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang DJV-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 01:43:08'),
(12, 8, 1, 'Update Kaji Ulang', 'Kaji ulang permohonan DJV-AGROBDG-KAL sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-03 01:43:08'),
(13, 8, 1, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan DJV-AGROBDG-KAL telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 189-KAL-II-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-03 01:45:30'),
(14, 4, 1, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan DJV-AGROBDG-KAL No. Order 189-KAL-II-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-03 01:45:30'),
(15, 6, 1, 'Disposisi Baru: 189-KAL-II-26', 'Anda mendapat disposisi untuk permohonan DJV-AGROBDG-KAL (No. Order: 189-KAL-II-26). Segera diproses.', 0, '2026-03-03 06:55:00'),
(16, 5, 1, 'Disposisi Baru: 189-KAL-II-26', 'Anda mendapat disposisi untuk permohonan DJV-AGROBDG-KAL (No. Order: 189-KAL-II-26). Segera diproses.', 0, '2026-03-03 06:55:00'),
(17, 4, 1, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (cerapan). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-03 06:56:39'),
(18, 8, 4, 'Permohonan Pengujian Terkirim', 'Kode lacak: VWS-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-03 07:15:23'),
(19, 8, 4, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan VWS-AGROBDG-UJI sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-03 07:16:49'),
(20, 1, 4, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 07:17:26'),
(21, 2, 4, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 07:17:26'),
(22, 3, 4, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 07:17:26'),
(23, 4, 4, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan VWS-AGROBDG-UJI sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-03 07:18:06'),
(24, 1, 4, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VWS-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 07:18:46'),
(25, 2, 4, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VWS-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 07:18:46'),
(26, 3, 4, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VWS-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 07:18:46'),
(27, 8, 4, 'Update Kaji Ulang', 'Kaji ulang permohonan VWS-AGROBDG-UJI sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-03 07:18:46'),
(28, 8, 4, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan VWS-AGROBDG-UJI telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 190-KAL-II-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-03 07:19:30'),
(29, 4, 4, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan VWS-AGROBDG-UJI No. Order 190-KAL-II-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-03 07:19:30'),
(30, 6, 4, 'Disposisi Baru: 190-KAL-II-26', 'Anda mendapat disposisi untuk VWS-AGROBDG-UJI (No. Order: 190-KAL-II-26). Segera diproses.', 0, '2026-03-03 08:06:29'),
(31, 5, 4, 'Disposisi Baru: 190-KAL-II-26', 'Anda mendapat disposisi untuk VWS-AGROBDG-UJI (No. Order: 190-KAL-II-26). Segera diproses.', 0, '2026-03-03 08:06:29'),
(32, 4, 4, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_pengujian). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-03 08:07:13'),
(33, 3, 4, 'Dokumen Terverifikasi — Input Sertifikat/LHU', 'Dokumen pengujian VWS-AGROBDG-UJI sudah diverifikasi Kepala Teknisi. Silakan input Sertifikat atau LHU.', 0, '2026-03-03 08:08:05'),
(34, 8, 4, 'Proses Lab Selesai — Menunggu Sertifikat', 'Proses pengujian VWS-AGROBDG-UJI sudah selesai. Sertifikat/LHU sedang disiapkan.', 1, '2026-03-03 08:08:05'),
(35, 8, 1, 'Sertifikat/LHU Siap Diunduh', 'Sertifikat/LHU untuk permohonan DJV-AGROBDG-KAL sudah siap. Silakan cek di halaman Lacak Status.', 1, '2026-03-03 09:14:31'),
(36, 8, 5, 'Permohonan Pengujian Terkirim', 'Kode lacak: VCS-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-03 13:55:18'),
(37, 8, 5, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan VCS-AGROBDG-UJI sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-03 13:59:37'),
(38, 1, 5, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 14:06:31'),
(39, 2, 5, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 14:06:31'),
(40, 3, 5, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 14:06:31'),
(41, 8, 6, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: XHA-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-03 14:11:06'),
(42, 8, 6, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan XHA-AGROBDG-KAL sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-03 14:11:38'),
(43, 1, 6, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 14:11:48'),
(44, 2, 6, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 14:11:48'),
(45, 3, 6, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 14:11:48'),
(46, 4, 6, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan XHA-AGROBDG-KAL sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-03 14:13:04'),
(47, 1, 6, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang XHA-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 14:15:51'),
(48, 2, 6, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang XHA-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 14:15:51'),
(49, 3, 6, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang XHA-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 14:15:51'),
(50, 8, 6, 'Update Kaji Ulang', 'Kaji ulang permohonan XHA-AGROBDG-KAL sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-03 14:15:51'),
(51, 8, 6, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan XHA-AGROBDG-KAL telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 200-KAL-II-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-03 14:18:12'),
(52, 4, 6, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan XHA-AGROBDG-KAL No. Order 200-KAL-II-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-03 14:18:12'),
(53, 5, 6, 'Disposisi Baru: 200-KAL-II-26', 'Anda mendapat disposisi untuk XHA-AGROBDG-KAL (No. Order: 200-KAL-II-26). kerjain', 0, '2026-03-03 14:19:07'),
(54, 4, 6, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_kalibrasi). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-03 14:23:09'),
(55, 3, 6, 'Dokumen Terverifikasi — Input Sertifikat/LHU', 'Dokumen kalibrasi XHA-AGROBDG-KAL sudah diverifikasi Kepala Teknisi. Silakan input Sertifikat atau LHU.', 0, '2026-03-03 14:24:42'),
(56, 8, 6, 'Proses Lab Selesai — Menunggu Sertifikat', 'Proses kalibrasi XHA-AGROBDG-KAL sudah selesai. Sertifikat/LHU sedang disiapkan.', 1, '2026-03-03 14:24:42'),
(57, 8, 6, 'Sertifikat/LHU Siap Diunduh', 'Sertifikat/LHU untuk permohonan XHA-AGROBDG-KAL sudah siap. Silakan cek di halaman Lacak Status.', 1, '2026-03-03 14:31:12'),
(58, 8, 7, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: VZW-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-03 19:39:17'),
(59, 8, 7, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan VZW-AGROBDG-KAL sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-03 19:43:42'),
(60, 1, 7, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 19:44:03'),
(61, 2, 7, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 19:44:03'),
(62, 3, 7, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 19:44:03'),
(63, 4, 7, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan VZW-AGROBDG-KAL sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-03 19:44:30'),
(64, 1, 7, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VZW-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 19:45:12'),
(65, 2, 7, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VZW-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 19:45:12'),
(66, 3, 7, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VZW-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 19:45:12'),
(67, 8, 7, 'Update Kaji Ulang', 'Kaji ulang permohonan VZW-AGROBDG-KAL sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-03 19:45:12'),
(68, 8, 7, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan VZW-AGROBDG-KAL telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 267=KAL-III-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-03 19:46:26'),
(69, 4, 7, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan VZW-AGROBDG-KAL No. Order 267=KAL-III-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-03 19:46:26'),
(70, 5, 7, 'Disposisi Baru: 267=KAL-III-26', 'Anda mendapat disposisi untuk VZW-AGROBDG-KAL (No. Order: 267=KAL-III-26). iu', 0, '2026-03-03 19:47:20'),
(71, 4, 7, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_kalibrasi). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-03 19:49:13'),
(72, 3, 7, 'Dokumen Terverifikasi — Input Sertifikat/LHU', 'Dokumen kalibrasi VZW-AGROBDG-KAL sudah diverifikasi Kepala Teknisi. Silakan input Sertifikat atau LHU.', 0, '2026-03-03 19:51:18'),
(73, 8, 7, 'Proses Lab Selesai — Menunggu Sertifikat', 'Proses kalibrasi VZW-AGROBDG-KAL sudah selesai. Sertifikat/LHU sedang disiapkan.', 1, '2026-03-03 19:51:18'),
(74, 8, 7, 'Sertifikat/LHU Siap Diunduh', 'Sertifikat/LHU untuk permohonan VZW-AGROBDG-KAL sudah siap. Silakan cek di halaman Lacak Status.', 1, '2026-03-03 19:53:55'),
(75, 8, 8, 'Permohonan Pengujian Terkirim', 'Kode lacak: VKD-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-03 20:18:07'),
(76, 8, 8, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan VKD-AGROBDG-UJI sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-03 20:20:17'),
(77, 1, 8, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 20:34:54'),
(78, 2, 8, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 20:34:54'),
(79, 3, 8, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-03 20:34:54'),
(80, 4, 8, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan VKD-AGROBDG-UJI sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-03 20:35:10'),
(81, 1, 8, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VKD-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 20:36:06'),
(82, 2, 8, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VKD-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 20:36:06'),
(83, 3, 8, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang VKD-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-03 20:36:06'),
(84, 8, 8, 'Update Kaji Ulang', 'Kaji ulang permohonan VKD-AGROBDG-UJI sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-03 20:36:06'),
(85, 8, 8, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan VKD-AGROBDG-UJI telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 200-UJI-II-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-03 20:36:57'),
(86, 4, 8, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan VKD-AGROBDG-UJI No. Order 200-UJI-II-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-03 20:36:57'),
(87, 5, 8, 'Disposisi Baru: 200-UJI-II-26', 'Anda mendapat disposisi untuk VKD-AGROBDG-UJI (No. Order: 200-UJI-II-26). KI', 0, '2026-03-03 20:37:45'),
(88, 6, 8, 'Disposisi Baru: 200-UJI-II-26', 'Anda mendapat disposisi untuk VKD-AGROBDG-UJI (No. Order: 200-UJI-II-26). KI', 0, '2026-03-03 20:37:45'),
(89, 4, 8, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_pengujian). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-03 20:38:48'),
(90, 4, 8, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Dua telah upload dokumen (data_pengujian). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-03 20:40:30'),
(91, 3, 8, 'Dokumen Terverifikasi — Input Sertifikat/LHU', 'Dokumen pengujian VKD-AGROBDG-UJI sudah diverifikasi Kepala Teknisi. Silakan input Sertifikat atau LHU.', 0, '2026-03-03 20:41:53'),
(92, 8, 8, 'Proses Lab Selesai — Menunggu Sertifikat', 'Proses pengujian VKD-AGROBDG-UJI sudah selesai. Sertifikat/LHU sedang disiapkan.', 1, '2026-03-03 20:41:53'),
(93, 8, 8, 'Sertifikat/LHU Siap Diunduh', 'Sertifikat/LHU untuk permohonan VKD-AGROBDG-UJI sudah siap. Silakan cek di halaman Lacak Status.', 1, '2026-03-03 20:48:00'),
(94, 8, 8, 'Alat/Sampel Siap Diambil — Layanan Selesai', 'Alat/sampel permohonan VKD-AGROBDG-UJI sudah siap diambil di kantor BPSMB AGRO Kota Bandung. Silakan datang ke kantor untuk pengambilan.', 1, '2026-03-03 21:05:47'),
(95, 8, 9, 'Permohonan Pengujian Terkirim', 'Kode lacak: GRJ-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-04 09:27:14'),
(96, 8, 9, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan GRJ-AGROBDG-UJI sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-04 09:31:53'),
(97, 1, 9, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-04 09:32:56'),
(98, 2, 9, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-04 09:32:56'),
(99, 3, 9, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-04 09:32:56'),
(100, 4, 9, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan GRJ-AGROBDG-UJI sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-04 09:33:59'),
(101, 1, 9, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang GRJ-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-04 09:35:38'),
(102, 2, 9, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang GRJ-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-04 09:35:38'),
(103, 3, 9, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang GRJ-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-04 09:35:38'),
(104, 8, 9, 'Update Kaji Ulang', 'Kaji ulang permohonan GRJ-AGROBDG-UJI sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-04 09:35:38'),
(105, 8, 9, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan GRJ-AGROBDG-UJI telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 205-UJI-II-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-04 09:37:20'),
(106, 4, 9, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan GRJ-AGROBDG-UJI No. Order 205-UJI-II-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-04 09:37:20'),
(107, 5, 9, 'Disposisi Baru: 205-UJI-II-26', 'Anda mendapat disposisi untuk GRJ-AGROBDG-UJI (No. Order: 205-UJI-II-26). jesr', 0, '2026-03-04 09:38:43'),
(108, 4, 9, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_pengujian). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-04 09:39:53'),
(109, 3, 9, 'Dokumen Terverifikasi — Input Sertifikat/LHU', 'Dokumen pengujian GRJ-AGROBDG-UJI sudah diverifikasi Kepala Teknisi. Silakan input Sertifikat atau LHU.', 0, '2026-03-04 09:40:48'),
(110, 8, 9, 'Proses Lab Selesai — Menunggu Sertifikat', 'Proses pengujian GRJ-AGROBDG-UJI sudah selesai. Sertifikat/LHU sedang disiapkan.', 1, '2026-03-04 09:40:48'),
(111, 8, 9, 'Sertifikat/LHU Siap Diunduh', 'Sertifikat/LHU untuk permohonan GRJ-AGROBDG-UJI sudah siap. Silakan cek di halaman Lacak Status.', 1, '2026-03-04 09:43:51'),
(112, 8, 9, 'Alat/Sampel Siap Diambil — Layanan Selesai', 'Alat/sampel permohonan GRJ-AGROBDG-UJI sudah siap diambil di kantor BPSMB AGRO Kota Bandung. Silakan datang ke kantor untuk pengambilan.', 1, '2026-03-04 09:46:59'),
(113, 8, 3, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan CMN-AGROBDG-KAL sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-05 00:17:42'),
(114, 1, 3, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-05 00:18:17'),
(115, 2, 3, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-05 00:18:17'),
(116, 3, 3, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-05 00:18:17'),
(117, 4, 3, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan CMN-AGROBDG-KAL sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-05 00:18:26'),
(118, 1, 3, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang CMN-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-05 00:19:11'),
(119, 2, 3, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang CMN-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-05 00:19:11'),
(120, 3, 3, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang CMN-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-05 00:19:11'),
(121, 8, 3, 'Update Kaji Ulang', 'Kaji ulang permohonan CMN-AGROBDG-KAL sedang diproses FO. Segera diberitahu hasilnya.', 1, '2026-03-05 00:19:11'),
(122, 8, 10, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: PSG-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-06 02:54:57'),
(123, 8, 11, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: QUB-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-08 01:28:22'),
(124, 8, 12, 'Permohonan Pengujian Terkirim', 'Kode lacak: HBV-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-08 02:04:51'),
(125, 8, 13, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: HQX-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-08 02:11:26'),
(126, 8, 14, 'Permohonan Pengujian Terkirim', 'Kode lacak: WZQ-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-08 02:14:59'),
(127, 8, 15, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: CVK-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 1, '2026-03-08 07:14:48'),
(128, 8, 15, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan CVK-AGROBDG-KAL sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-08 07:36:10'),
(129, 1, 15, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-08 07:52:17'),
(130, 2, 15, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-08 07:52:17'),
(131, 3, 15, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-08 07:52:17'),
(132, 4, 15, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan CVK-AGROBDG-KAL sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-08 08:25:13'),
(133, 1, 15, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang CVK-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-08 08:26:31'),
(134, 2, 15, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang CVK-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-08 08:26:31'),
(135, 3, 15, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang CVK-AGROBDG-KAL. Silakan TTD FO dan input No. Order.', 0, '2026-03-08 08:26:31'),
(136, 8, 15, 'Update Kaji Ulang', 'Kaji ulang permohonan CVK-AGROBDG-KAL sedang diproses FO.', 1, '2026-03-08 08:26:31'),
(137, 8, 15, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan CVK-AGROBDG-KAL telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 340-KAL-II-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-08 08:27:33'),
(138, 4, 15, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan CVK-AGROBDG-KAL No. Order 340-KAL-II-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-08 08:27:33'),
(139, 5, 15, 'Disposisi Baru: 340-KAL-II-26', 'Anda mendapat disposisi untuk CVK-AGROBDG-KAL (No. Order: 340-KAL-II-26). l', 0, '2026-03-08 08:28:38'),
(140, 4, 15, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_kalibrasi). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-08 08:30:50'),
(141, 8, 16, 'Permohonan Pengujian Terkirim', 'Kode lacak: SKF-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 1, '2026-03-09 03:18:36'),
(142, 8, 16, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan SKF-AGROBDG-UJI sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 1, '2026-03-09 03:19:45'),
(143, 1, 16, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-09 03:20:08'),
(144, 2, 16, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-09 03:20:08'),
(145, 3, 16, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-09 03:20:08'),
(146, 4, 16, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan SKF-AGROBDG-UJI sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-09 03:21:16'),
(147, 1, 16, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang SKF-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-09 03:27:08'),
(148, 2, 16, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang SKF-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-09 03:27:08'),
(149, 3, 16, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang SKF-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-09 03:27:08'),
(150, 8, 16, 'Update Kaji Ulang', 'Kaji ulang permohonan SKF-AGROBDG-UJI sedang diproses FO.', 1, '2026-03-09 03:27:08'),
(151, 8, 16, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan SKF-AGROBDG-UJI telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 490-UJI-III-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 1, '2026-03-09 03:28:36'),
(152, 4, 16, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan SKF-AGROBDG-UJI No. Order 490-UJI-III-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-09 03:28:36'),
(153, 5, 16, 'Disposisi Baru: 490-UJI-III-26', 'Anda mendapat disposisi untuk SKF-AGROBDG-UJI (No. Order: 490-UJI-III-26). kocakk!', 0, '2026-03-09 03:29:38'),
(154, 6, 16, 'Disposisi Baru: 490-UJI-III-26', 'Anda mendapat disposisi untuk SKF-AGROBDG-UJI (No. Order: 490-UJI-III-26). kocakk!', 0, '2026-03-09 03:29:38'),
(155, 4, 16, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Satu telah upload dokumen (data_pengujian). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-09 03:31:27'),
(156, 4, 16, 'Dokumen Upload Teknisi', 'Teknisi Teknisi Dua telah upload dokumen (data_pengujian). Silakan verifikasi dan kirim ke TU.', 0, '2026-03-09 03:34:11'),
(157, 3, 16, 'Dokumen Terverifikasi — Input Sertifikat/LHU', 'Dokumen pengujian SKF-AGROBDG-UJI sudah diverifikasi Kepala Teknisi. Silakan input Sertifikat atau LHU. Catatan: anjay', 0, '2026-03-09 03:35:29'),
(158, 8, 16, 'Proses Lab Selesai — Menunggu Sertifikat', 'Proses pengujian SKF-AGROBDG-UJI sudah selesai. Sertifikat/LHU sedang disiapkan.', 1, '2026-03-09 03:35:29'),
(159, 8, 16, 'Sertifikat/LHU Siap Diunduh', 'Sertifikat/LHU untuk permohonan SKF-AGROBDG-UJI sudah siap. Silakan cek di halaman Lacak Status.', 1, '2026-03-09 03:37:26'),
(160, 8, 16, 'Alat/Sampel Siap Diambil — Layanan Selesai', 'Alat/sampel permohonan SKF-AGROBDG-UJI sudah siap diambil di kantor BPSMB AGRO Kota Bandung. Silakan datang ke kantor untuk pengambilan.', 1, '2026-03-09 03:39:57'),
(161, 8, 17, 'Permohonan Pengujian Terkirim', 'Kode lacak: HYR-AGROBDG-UJI. Permohonan sedang diverifikasi petugas.', 0, '2026-03-09 09:22:05'),
(162, 8, 17, 'Permohonan Diverifikasi — Perlu Tanda Tangan', 'Permohonan HYR-AGROBDG-UJI sudah diverifikasi. Buka halaman Lacak Status untuk tanda tangan kaji ulang.', 0, '2026-03-09 10:12:55'),
(163, 1, 17, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-09 10:13:24'),
(164, 2, 17, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-09 10:13:24'),
(165, 3, 17, 'Kaji Ulang: Konsumen Sudah TTD', 'Konsumen sudah menandatangani form kaji ulang. Silakan buka Detail Permohonan untuk kirim ke Kepala Teknisi.', 0, '2026-03-09 10:13:25'),
(166, 4, 17, 'Form Kaji Ulang: Perlu Diisi dan Ditandatangani', 'Permohonan HYR-AGROBDG-UJI sudah ditandatangani konsumen. Silakan isi form kaji ulang dan tanda tangan.', 0, '2026-03-09 10:13:36'),
(167, 1, 17, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang HYR-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-09 10:14:46'),
(168, 2, 17, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang HYR-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-09 10:14:46'),
(169, 3, 17, 'Kaji Ulang Siap TTD FO', 'Kepala Teknisi sudah TTD kaji ulang HYR-AGROBDG-UJI. Silakan TTD FO dan input No. Order.', 0, '2026-03-09 10:14:46'),
(170, 8, 17, 'Update Kaji Ulang', 'Kaji ulang permohonan HYR-AGROBDG-UJI sedang diproses FO.', 0, '2026-03-09 10:14:46'),
(171, 8, 17, 'Berkas Permohonan Selesai — Alat/Sampel Masuk Lab', 'Permohonan HYR-AGROBDG-UJI telah melalui proses kaji ulang dan semua berkas sudah ditandatangani. No. Order Anda: 491-UJI-III-26. Status layanan: ALAT/SAMPEL MASUK LAB. Kepala Teknisi akan segera mengeluarkan disposisi.', 0, '2026-03-09 10:15:33'),
(172, 4, 17, 'Permohonan Masuk Lab — Buat Disposisi', 'Permohonan HYR-AGROBDG-UJI No. Order 491-UJI-III-26 sudah masuk lab. Silakan buat disposisi ke teknisi.', 0, '2026-03-09 10:15:33'),
(173, 8, 18, 'Permohonan Kalibrasi Terkirim', 'Kode lacak Anda: VYW-AGROBDG-KAL. Permohonan sedang diverifikasi oleh petugas.', 0, '2026-03-09 10:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian_alat`
--

CREATE TABLE `pengembalian_alat` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `foto_alat` varchar(255) NOT NULL,
  `foto_orang_mengambil` varchar(255) DEFAULT NULL COMMENT 'Foto orang yang mengambil alat/sampel',
  `nama_penerima` varchar(150) DEFAULT NULL,
  `catatan` text DEFAULT NULL COMMENT 'Catatan tambahan pengembalian',
  `tgl_pengembalian` datetime DEFAULT NULL,
  `input_oleh` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian_alat`
--

INSERT INTO `pengembalian_alat` (`id`, `permohonan_id`, `foto_alat`, `foto_orang_mengambil`, `nama_penerima`, `catatan`, `tgl_pengembalian`, `input_oleh`, `created_at`) VALUES
(1, 8, 'uploads/pengembalian/alat_8_1772571947.png', 'uploads/pengembalian/orang_8_1772571947.png', 'za', '', '2026-03-04 04:05:47', 2, '2026-03-03 21:05:47'),
(2, 9, 'uploads/pengembalian/alat_9_1772617619.png', 'uploads/pengembalian/orang_9_1772617619.png', 'ga kenal', '', '2026-03-04 16:46:59', 2, '2026-03-04 09:46:59'),
(3, 16, 'uploads/pengembalian/alat_16_1773027597.png', 'uploads/pengembalian/orang_16_1773027597.png', 'ga kenal', '', '2026-03-09 10:39:57', 2, '2026-03-09 03:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `permohonan`
--

CREATE TABLE `permohonan` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_lacak` varchar(25) NOT NULL,
  `no_order` varchar(25) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `jenis_layanan_id` tinyint(3) UNSIGNED NOT NULL,
  `nama_pemohon` varchar(150) NOT NULL,
  `no_wa_pemohon` varchar(20) NOT NULL,
  `email_pemohon` varchar(180) NOT NULL,
  `instansi` varchar(200) DEFAULT NULL,
  `alamat_pemohon` text DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `nama_dokumen` varchar(200) DEFAULT NULL,
  `alamat_dokumen` text DEFAULT NULL,
  `file_ttd_konsumen` varchar(255) DEFAULT NULL,
  `file_surat_permohonan` varchar(255) DEFAULT NULL,
  `status` enum('draft','terkirim','verifikasi_fo','kaji_ulang','diterima','masuk_lab','proses_lab','verifikasi_kptek','input_dokumen','siap_ambil','cetak_sertifikat','selesai','ditolak') NOT NULL DEFAULT 'draft',
  `teknisi_id` int(10) UNSIGNED DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `tgl_terkirim` datetime DEFAULT NULL,
  `tgl_diterima` datetime DEFAULT NULL,
  `tgl_masuk_lab` datetime DEFAULT NULL,
  `tgl_selesai_lab` datetime DEFAULT NULL,
  `tgl_siap_ambil` datetime DEFAULT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kemasan_sampel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permohonan`
--

INSERT INTO `permohonan` (`id`, `kode_lacak`, `no_order`, `user_id`, `jenis_layanan_id`, `nama_pemohon`, `no_wa_pemohon`, `email_pemohon`, `instansi`, `alamat_pemohon`, `kota`, `provinsi`, `kode_pos`, `nama_dokumen`, `alamat_dokumen`, `file_ttd_konsumen`, `file_surat_permohonan`, `status`, `teknisi_id`, `catatan`, `alasan_tolak`, `tgl_terkirim`, `tgl_diterima`, `tgl_masuk_lab`, `tgl_selesai_lab`, `tgl_siap_ambil`, `tgl_selesai`, `created_at`, `updated_at`, `kelurahan`, `kecamatan`, `kemasan_sampel`) VALUES
(1, 'DJV-AGROBDG-KAL', '189-KAL-II-26', 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', ',', 'uy', 'KABUPATEN INDRAGIRI HILIR', 'RIAU', '', 'za', 'jk', 'uploads/ttd/ttd_kal_8_1772498578.png', NULL, 'siap_ambil', 6, NULL, NULL, '2026-03-03 07:42:58', '2026-03-03 08:45:30', '2026-03-03 08:45:30', NULL, '2026-03-03 16:14:31', NULL, '2026-03-03 00:42:58', '2026-03-03 09:14:31', 'SUNGAI SALAK', 'TEMPULING', NULL),
(2, 'MMT-AGROBDG-UJI', NULL, 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'f', '4', 'KABUPATEN GUNUNG KIDUL', 'DI YOGYAKARTA', NULL, 'za', 'd', 'uploads/ttd/ttd_uji_8_1772500008.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-03 08:06:48', NULL, NULL, NULL, NULL, NULL, '2026-03-03 01:06:48', '2026-03-03 01:06:48', 'LOGANDENG', 'PLAYEN', 'karung'),
(3, 'CMN-AGROBDG-KAL', NULL, 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'j', 'yi', 'KABUPATEN MERANGIN', 'JAMBI', '', 'za', 'jk', 'uploads/ttd/ttd_kal_8_1772501746.png', NULL, 'diterima', NULL, NULL, NULL, '2026-03-03 08:35:46', '2026-03-05 07:17:42', NULL, NULL, NULL, NULL, '2026-03-03 01:35:46', '2026-03-05 00:17:42', 'BUKIT BERINGIN', 'BANGKO BARAT', NULL),
(4, 'VWS-AGROBDG-UJI', '190-KAL-II-26', 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 't', 'u', 'KABUPATEN TAPANULI UTARA', 'SUMATERA UTARA', NULL, 'za', 'a', 'uploads/ttd/ttd_uji_8_1772522123.png', NULL, 'input_dokumen', 6, NULL, NULL, '2026-03-03 14:15:23', '2026-03-03 14:19:30', '2026-03-03 14:19:30', NULL, NULL, NULL, '2026-03-03 07:15:23', '2026-03-03 08:08:05', 'PAGARAN LAMBUNG IV', 'ADIANKOTING', 'karung'),
(5, 'VCS-AGROBDG-UJI', NULL, 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'PT LYANG', 'JALAN JALAN', 'KABUPATEN JEMBER', 'JAWA TIMUR', NULL, 'za', 'JALKEN', 'uploads/ttd/ttd_uji_8_1772546118.png', NULL, 'diterima', NULL, NULL, NULL, '2026-03-03 20:55:18', '2026-03-03 20:59:37', NULL, NULL, NULL, NULL, '2026-03-03 13:55:18', '2026-03-03 13:59:37', 'PALERAN', 'UMBULSARI', 'karung'),
(6, 'XHA-AGROBDG-KAL', '200-KAL-II-26', 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'g', 'yrewy', 'KABUPATEN BANYUMAS', 'JAWA TENGAH', '', 'za', 'fsdg', 'uploads/ttd/ttd_kal_8_1772547066.png', NULL, 'siap_ambil', 5, NULL, NULL, '2026-03-03 21:11:06', '2026-03-03 21:18:12', '2026-03-03 21:18:12', NULL, '2026-03-03 21:31:12', NULL, '2026-03-03 14:11:06', '2026-03-03 14:31:12', 'PANGADEGAN', 'WANGON', NULL),
(7, 'VZW-AGROBDG-KAL', '267=KAL-III-26', 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'PT DM', 'JL', 'KABUPATEN BINTAN', 'KEPULAUAN RIAU', '', 'za', 'GT', 'uploads/ttd/ttd_kal_8_1772566757.png', NULL, 'siap_ambil', 5, NULL, NULL, '2026-03-04 02:39:17', '2026-03-04 02:46:26', '2026-03-04 02:46:26', NULL, '2026-03-04 02:53:55', NULL, '2026-03-03 19:39:17', '2026-03-03 19:53:55', 'MAPUR', 'BINTAN PESISIR', NULL),
(8, 'VKD-AGROBDG-UJI', '200-UJI-II-26', 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'm', 'kl', 'KABUPATEN NATUNA', 'KEPULAUAN RIAU', NULL, 'za', 'dh', 'uploads/ttd/ttd_uji_8_1772569087.png', NULL, 'selesai', 5, NULL, NULL, '2026-03-04 03:18:07', '2026-03-04 03:36:57', '2026-03-04 03:36:57', NULL, '2026-03-04 03:48:00', '2026-03-04 04:05:47', '2026-03-03 20:18:07', '2026-03-03 21:05:47', 'TAPAU', 'BUNGURAN TENGAH', 'plastik'),
(9, 'GRJ-AGROBDG-UJI', '205-UJI-II-26', 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'PT Jsnl', 'JaOan', 'KABUPATEN BANDUNG', 'JAWA BARAT', NULL, 'za', 'BJEEU', 'uploads/ttd/ttd_uji_8_1772616434.png', NULL, 'selesai', 5, NULL, NULL, '2026-03-04 16:27:14', '2026-03-04 16:37:20', '2026-03-04 16:37:20', NULL, '2026-03-04 16:43:51', '2026-03-04 16:46:59', '2026-03-04 09:27:14', '2026-03-04 09:46:59', 'CINUNUK', 'CILEUNYI', 'karung'),
(10, 'PSG-AGROBDG-KAL', NULL, 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', '', '', 'KABUPATEN KUNINGAN', 'JAWA BARAT', '', 'za', '', 'uploads/ttd/ttd_kal_8_1772765697.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-06 09:54:57', NULL, NULL, NULL, NULL, NULL, '2026-03-06 02:54:57', '2026-03-06 02:54:57', 'CIKANDANG', 'LURAGUNG', NULL),
(11, 'QUB-AGROBDG-KAL', NULL, 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'j', 'k', 'KOTA BANDUNG', 'JAWA BARAT', '', 'za', 'k', 'uploads/ttd/ttd_kal_8_1772933302.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-08 08:28:22', NULL, NULL, NULL, NULL, NULL, '2026-03-08 01:28:22', '2026-03-08 01:28:22', 'PAKEMITAN', 'CINAMBO', NULL),
(12, 'HBV-AGROBDG-UJI', NULL, 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'py', 'k', 'KOTA BANDUNG', 'JAWA BARAT', NULL, 'za', 'k', 'uploads/ttd/ttd_uji_8_1772935491.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-08 09:04:51', NULL, NULL, NULL, NULL, NULL, '2026-03-08 02:04:51', '2026-03-08 02:04:51', 'CIPADUNG KIDUL', 'PANYILEUKAN', 'karung'),
(13, 'HQX-AGROBDG-KAL', NULL, 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'f', '', 'KOTA BANDUNG', 'JAWA BARAT', '', 'za', 'k', 'uploads/ttd/ttd_kal_8_1772935886.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-08 09:11:26', NULL, NULL, NULL, NULL, NULL, '2026-03-08 02:11:26', '2026-03-08 02:11:26', 'CISARANTEN WETAN', 'CINAMBO', NULL),
(14, 'WZQ-AGROBDG-UJI', NULL, 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'f', 'k', 'KABUPATEN GARUT', 'JAWA BARAT', NULL, 'za', 'k', 'uploads/ttd/ttd_uji_8_1772936098.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-08 09:14:58', NULL, NULL, NULL, NULL, NULL, '2026-03-08 02:14:58', '2026-03-08 02:14:58', 'PANGRUMASAN', 'PEUNDEUY', 'plastik'),
(15, 'CVK-AGROBDG-KAL', '340-KAL-II-26', 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'PT LYNS', '', 'KOTA BANDUNG', 'JAWA BARAT', '', 'zazaa', 'JALAN VENUS', 'uploads/ttd/ttd_kal_8_1772954088.png', NULL, 'verifikasi_kptek', 5, NULL, NULL, '2026-03-08 14:14:48', '2026-03-08 15:27:33', '2026-03-08 15:27:33', NULL, NULL, NULL, '2026-03-08 07:14:48', '2026-03-08 08:30:50', 'MANJAHLEGA', 'RANCASARI', NULL),
(16, 'SKF-AGROBDG-UJI', '490-UJI-III-26', 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'PT JMA', 'JALAN TAMAN MERKURI TIMUR VI NO 22', 'KABUPATEN KARIMUN', 'KEPULAUAN RIAU', NULL, 'zazaaaa', 'JALKEN', 'uploads/ttd/ttd_uji_8_1773026316.png', NULL, 'selesai', 5, NULL, NULL, '2026-03-09 10:18:36', '2026-03-09 10:28:36', '2026-03-09 10:28:36', NULL, '2026-03-09 10:37:26', '2026-03-09 10:39:57', '2026-03-09 03:18:36', '2026-03-09 03:39:57', 'TANJUNG HUTAN', 'BURU', 'karung'),
(17, 'HYR-AGROBDG-UJI', '491-UJI-III-26', 8, 2, 'za', '085871095178', 'azzahwaqq@gmail.com', 'PT ALYNS', 'LOCATION UNKNOW', 'KABUPATEN NATUNA', 'KEPULAUAN RIAU', NULL, 'za', 'LOCATION UNKNOW???', 'uploads/ttd/ttd_uji_8_1773048125.png', NULL, 'masuk_lab', NULL, NULL, NULL, '2026-03-09 16:22:05', '2026-03-09 17:15:33', '2026-03-09 17:15:33', NULL, NULL, NULL, '2026-03-09 09:22:05', '2026-03-09 10:15:33', 'HARAPAN JAYA', 'BUNGURAN TENGAH', 'karung'),
(18, 'VYW-AGROBDG-KAL', NULL, 8, 1, 'za', '085871095178', 'azzahwaqq@gmail.com', 'f', 't', 'KABUPATEN GROBOGAN', 'JAWA TENGAH', '', 'za', 'e', 'uploads/ttd/ttd_kal_8_1773051700.png', NULL, 'terkirim', NULL, NULL, NULL, '2026-03-09 17:21:40', NULL, NULL, NULL, NULL, NULL, '2026-03-09 10:21:40', '2026-03-09 10:21:40', 'TERKESI', 'KLAMBU', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id` int(10) UNSIGNED NOT NULL,
  `permohonan_id` int(10) UNSIGNED NOT NULL,
  `no_sertifikat` varchar(60) DEFAULT NULL,
  `tipe` enum('sertifikat','lhu') NOT NULL,
  `nama_sertifikat` varchar(200) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `upload_oleh` int(10) UNSIGNED NOT NULL,
  `tgl_terbit` date DEFAULT NULL,
  `tgl_berlaku` date DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT current_timestamp(),
  `download_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sertifikat`
--

INSERT INTO `sertifikat` (`id`, `permohonan_id`, `no_sertifikat`, `tipe`, `nama_sertifikat`, `file_path`, `upload_oleh`, `tgl_terbit`, `tgl_berlaku`, `catatan`, `tgl_upload`, `download_count`, `created_at`, `updated_at`) VALUES
(1, 1, '', 'sertifikat', NULL, 'uploads/sertifikat/sert_1_1772529271.png', 3, NULL, NULL, '', '2026-03-03 09:14:31', 0, '2026-03-03 09:14:31', '2026-03-03 09:14:31'),
(2, 6, '', 'sertifikat', NULL, 'uploads/sertifikat/sert_6_1772548272.pdf', 3, NULL, NULL, '', '2026-03-03 14:31:12', 0, '2026-03-03 14:31:12', '2026-03-03 14:31:12'),
(3, 7, '', 'sertifikat', NULL, 'uploads/sertifikat/sert_7_1772567635.png', 3, NULL, NULL, '', '2026-03-03 19:53:55', 0, '2026-03-03 19:53:55', '2026-03-03 19:53:55'),
(4, 8, '', 'sertifikat', NULL, 'uploads/sertifikat/sert_8_1772570880.png', 3, NULL, NULL, '', '2026-03-03 20:48:00', 0, '2026-03-03 20:48:00', '2026-03-03 20:48:00'),
(5, 9, '', 'sertifikat', NULL, 'uploads/sertifikat/sert_9_1772617431.png', 3, NULL, NULL, '', '2026-03-04 09:43:51', 0, '2026-03-04 09:43:51', '2026-03-04 09:43:51'),
(6, 16, '', 'sertifikat', NULL, 'uploads/sertifikat/sert_16_1773027446.jpg', 3, NULL, NULL, 'done ya', '2026-03-09 03:37:26', 0, '2026-03-09 03:37:26', '2026-03-09 03:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_wa` varchar(20) NOT NULL,
  `instansi` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `role` enum('konsumen','fo','tata_usaha','kepala_teknisi','teknisi','superadmin') NOT NULL DEFAULT 'konsumen',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `no_wa`, `instansi`, `alamat`, `role`, `is_active`, `avatar`, `created_at`, `updated_at`, `foto`) VALUES
(1, 'Super Admin', 'superadmin', 'superadmin@bpsmb.go.id', '$2y$10$fJOdXZKVvf4Lrf5o1GRiAuFWXrRlS85QHfnmXRQFuTwq/YrcucxR.', '081200000001', NULL, NULL, 'superadmin', 1, NULL, '2026-03-01 00:41:50', '2026-03-01 01:02:57', NULL),
(2, 'Bapak A', 'fo_bpsmb', 'fo@bpsmb.go.id', '$2y$10$fJOdXZKVvf4Lrf5o1GRiAuFWXrRlS85QHfnmXRQFuTwq/YrcucxR.', '081200000001', NULL, NULL, 'fo', 1, NULL, '2026-03-01 00:41:50', '2026-03-09 02:49:50', 'user_2_1772763299.jpg'),
(3, 'Tata Usaha', 'tu_bpsmb', 'tu@bpsmb.go.id', '$2y$10$fJOdXZKVvf4Lrf5o1GRiAuFWXrRlS85QHfnmXRQFuTwq/YrcucxR.', '081200000003', NULL, NULL, 'tata_usaha', 1, NULL, '2026-03-01 00:41:50', '2026-03-01 01:02:57', NULL),
(4, 'Kepala Teknisi', 'keptek', 'keptek@bpsmb.go.id', '$2y$10$fJOdXZKVvf4Lrf5o1GRiAuFWXrRlS85QHfnmXRQFuTwq/YrcucxR.', '081200000004', NULL, NULL, 'kepala_teknisi', 1, NULL, '2026-03-01 00:41:50', '2026-03-01 01:02:57', NULL),
(5, 'Teknisi Satu', 'teknisi_01', 'teknisi1@bpsmb.go.id', '$2y$10$fJOdXZKVvf4Lrf5o1GRiAuFWXrRlS85QHfnmXRQFuTwq/YrcucxR.', '081200000008', NULL, NULL, 'teknisi', 1, NULL, '2026-03-01 00:41:50', '2026-03-09 03:06:16', 'user_5_1773025576.png'),
(6, 'Teknisi Dua', 'teknisi_02', 'teknisi2@bpsmb.go.id', '$2y$10$fJOdXZKVvf4Lrf5o1GRiAuFWXrRlS85QHfnmXRQFuTwq/YrcucxR.', '081200000006', NULL, NULL, 'teknisi', 1, NULL, '2026-03-01 00:41:50', '2026-03-01 01:02:57', NULL),
(8, 'za', 'zaza', 'azzahwaqq@gmail.com', '$2y$10$YwxOt.JPazwKl4Y0wVb8mOyEMWhxAIxB6VTjwdRjcOZv6nLl7MGia', '085871095178', NULL, NULL, 'konsumen', 1, NULL, '2026-03-01 01:26:38', '2026-03-01 01:26:38', NULL),
(9, 'nata', 'nata@bpsmb.go.id', 'nata@gmail.com', '$2y$10$CQKXmGKhPEA3.Uaj55QFCOFkAIjOsPTc.rbSPSlcMW8TGUhZE.Aqm', '087897526760', NULL, NULL, 'konsumen', 1, NULL, '2026-03-05 00:33:50', '2026-03-05 00:47:22', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_alat_kalibrasi`
--
ALTER TABLE `detail_alat_kalibrasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dak_p` (`permohonan_id`);

--
-- Indexes for table `detail_parameter_pengujian`
--
ALTER TABLE `detail_parameter_pengujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dpj_p` (`permohonan_id`);

--
-- Indexes for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_disp_p` (`permohonan_id`),
  ADD KEY `fk_disp_u` (`dibuat_oleh`);

--
-- Indexes for table `disposisi_teknisi`
--
ALTER TABLE `disposisi_teknisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dt_d` (`disposisi_id`),
  ADD KEY `fk_dt_t` (`teknisi_id`);

--
-- Indexes for table `dokumen_lab`
--
ALTER TABLE `dokumen_lab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dl_p` (`permohonan_id`);

--
-- Indexes for table `jenis_layanan`
--
ALTER TABLE `jenis_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kaji_ulang`
--
ALTER TABLE `kaji_ulang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ku_p` (`permohonan_id`),
  ADD KEY `fk_ku_u` (`dibuat_oleh`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_user` (`user_id`),
  ADD KEY `idx_log_perm` (`permohonan_id`);

--
-- Indexes for table `master_alat`
--
ALTER TABLE `master_alat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_kelas_alat`
--
ALTER TABLE `master_kelas_alat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_komoditas`
--
ALTER TABLE `master_komoditas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_nominal`
--
ALTER TABLE `master_nominal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_parameter_uji`
--
ALTER TABLE `master_parameter_uji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pu_kom` (`komoditas_id`);

--
-- Indexes for table `master_tarif_kalibrasi`
--
ALTER TABLE `master_tarif_kalibrasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tk_alat` (`alat_id`),
  ADD KEY `fk_tk_kelas` (`kelas_id`),
  ADD KEY `fk_tk_nominal` (`nominal_id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notif_u` (`user_id`);

--
-- Indexes for table `pengembalian_alat`
--
ALTER TABLE `pengembalian_alat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pa_p` (`permohonan_id`);

--
-- Indexes for table `permohonan`
--
ALTER TABLE `permohonan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_kode_lacak` (`kode_lacak`),
  ADD UNIQUE KEY `uq_no_order` (`no_order`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `fk_p_layanan` (`jenis_layanan_id`),
  ADD KEY `fk_p_teknisi` (`teknisi_id`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_sert_perm` (`permohonan_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_alat_kalibrasi`
--
ALTER TABLE `detail_alat_kalibrasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detail_parameter_pengujian`
--
ALTER TABLE `detail_parameter_pengujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `disposisi`
--
ALTER TABLE `disposisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `disposisi_teknisi`
--
ALTER TABLE `disposisi_teknisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dokumen_lab`
--
ALTER TABLE `dokumen_lab`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jenis_layanan`
--
ALTER TABLE `jenis_layanan`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kaji_ulang`
--
ALTER TABLE `kaji_ulang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `master_alat`
--
ALTER TABLE `master_alat`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_kelas_alat`
--
ALTER TABLE `master_kelas_alat`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_komoditas`
--
ALTER TABLE `master_komoditas`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_nominal`
--
ALTER TABLE `master_nominal`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `master_parameter_uji`
--
ALTER TABLE `master_parameter_uji`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `master_tarif_kalibrasi`
--
ALTER TABLE `master_tarif_kalibrasi`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `pengembalian_alat`
--
ALTER TABLE `pengembalian_alat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permohonan`
--
ALTER TABLE `permohonan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_alat_kalibrasi`
--
ALTER TABLE `detail_alat_kalibrasi`
  ADD CONSTRAINT `fk_dak_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_parameter_pengujian`
--
ALTER TABLE `detail_parameter_pengujian`
  ADD CONSTRAINT `fk_dpj_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD CONSTRAINT `fk_disp_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_disp_u` FOREIGN KEY (`dibuat_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `disposisi_teknisi`
--
ALTER TABLE `disposisi_teknisi`
  ADD CONSTRAINT `fk_dt_d` FOREIGN KEY (`disposisi_id`) REFERENCES `disposisi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dt_t` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dokumen_lab`
--
ALTER TABLE `dokumen_lab`
  ADD CONSTRAINT `fk_dl_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kaji_ulang`
--
ALTER TABLE `kaji_ulang`
  ADD CONSTRAINT `fk_ku_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ku_u` FOREIGN KEY (`dibuat_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `master_parameter_uji`
--
ALTER TABLE `master_parameter_uji`
  ADD CONSTRAINT `fk_pu_kom` FOREIGN KEY (`komoditas_id`) REFERENCES `master_komoditas` (`id`);

--
-- Constraints for table `master_tarif_kalibrasi`
--
ALTER TABLE `master_tarif_kalibrasi`
  ADD CONSTRAINT `fk_tk_alat` FOREIGN KEY (`alat_id`) REFERENCES `master_alat` (`id`),
  ADD CONSTRAINT `fk_tk_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `master_kelas_alat` (`id`),
  ADD CONSTRAINT `fk_tk_nominal` FOREIGN KEY (`nominal_id`) REFERENCES `master_nominal` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `fk_notif_u` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengembalian_alat`
--
ALTER TABLE `pengembalian_alat`
  ADD CONSTRAINT `fk_pa_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`);

--
-- Constraints for table `permohonan`
--
ALTER TABLE `permohonan`
  ADD CONSTRAINT `fk_p_layanan` FOREIGN KEY (`jenis_layanan_id`) REFERENCES `jenis_layanan` (`id`),
  ADD CONSTRAINT `fk_p_teknisi` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_p_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD CONSTRAINT `fk_sert_p` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
