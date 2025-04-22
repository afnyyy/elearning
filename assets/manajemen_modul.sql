-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Apr 2025 pada 09.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajemen_modul`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `instructors`
--

CREATE TABLE `instructors` (
  `id` int(11) NOT NULL,
  `majors_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `address` text NOT NULL,
  `phone` varchar(13) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `instructors`
--

INSERT INTO `instructors` (`id`, `majors_id`, `user_id`, `title`, `gender`, `address`, `phone`, `photo`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 1, 1, 'S.Kom', 0, 'Jakarta', '0812345678912', '680629b518bbb_67e0cda2131f5_young-woman-white-shirt-pointing-up.jpg', 0, '2025-04-21 08:00:05', '2025-04-21 11:19:17'),
(8, 4, 6, 'S.Kom', 0, 'Jakarta', '081456987456', '680702790f28a_78d6182f608c14df730fa7c2956346e4.jpg', 0, '2025-04-22 02:44:09', '2025-04-22 05:11:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_moduls`
--

CREATE TABLE `learning_moduls` (
  `id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `learning_moduls`
--

INSERT INTO `learning_moduls` (`id`, `instructor_id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 7, 'Pertemuan 1-2', 'Penjelasan html', 1, '2025-04-22 02:32:38', '2025-04-22 03:03:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_modul_details`
--

CREATE TABLE `learning_modul_details` (
  `id` int(11) NOT NULL,
  `learning_modul_id` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file` varchar(100) NOT NULL,
  `reference_link` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `learning_modul_details`
--

INSERT INTO `learning_modul_details` (`id`, `learning_modul_id`, `file_name`, `file`, `reference_link`, `created_at`, `updated_at`) VALUES
(5, 1, 'Soal Web', 'Array', 'https://github.com/', '2025-04-22 03:53:22', '2025-04-22 04:35:55'),
(7, 1, 'Soal Ujikom', 'Array', 'https://youtube.com/', '2025-04-22 03:55:08', '2025-04-22 04:36:27'),
(8, 1, 'Soal Web', '68071af2086ef_Sistem Informasi Manajemen Modul Pelatihan.docx.pdf', 'https://github.com/', '2025-04-22 04:28:34', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Web Programing', 0, '2025-04-21 05:35:34', NULL),
(2, 'Bahasa Inggris', 1, '2025-04-21 05:35:50', NULL),
(3, 'Bahasa Korea', 1, '2025-04-21 05:35:58', NULL),
(4, 'Android Developer', 1, '2025-04-21 05:36:12', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors_detail`
--

CREATE TABLE `majors_detail` (
  `id` int(11) NOT NULL,
  `majors_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `majors_detail`
--

INSERT INTO `majors_detail` (`id`, `majors_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-21 15:27:11', NULL),
(2, 2, 3, '2025-04-21 15:29:27', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Adminstrator', 1, '2025-04-21 04:15:02', '0000-00-00 00:00:00'),
(2, 'Admin', 1, '2025-04-21 13:29:32', '0000-00-00 00:00:00'),
(3, 'PIC', 1, '2025-04-21 13:29:43', '0000-00-00 00:00:00'),
(4, 'Siswa', 1, '2025-04-21 13:30:03', '0000-00-00 00:00:00'),
(5, 'Instruktur', 1, '2025-04-21 13:30:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `majors_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `majors_id`, `user_id`, `gender`, `date_of_birth`, `place_of_birth`, `photo`, `is_active`, `created_at`, `updated_at`) VALUES
(0, 3, 4, 0, '2000-06-06', 'Jakarta', '68066fcf2501a_67e0cd850d4f3_handsome-smiling-man-looking-with-disbelief.jpg', 0, '2025-04-21 16:18:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'afni', 'afni@gmail.com', '12345678', 1, '2025-04-21 02:05:08', NULL),
(3, 'Fani', 'fani@gmail.com', '12345678', 1, '2025-04-21 04:14:49', NULL),
(4, 'Vino', 'vino@gmail.com', '11223345', 1, '2025-04-21 16:17:05', NULL),
(5, 'Ria', 'ria@gmail.com', '12345678', 1, '2025-04-22 02:41:59', NULL),
(6, 'Bani', 'bani@gmail.com', '12345678', 0, '2025-04-22 02:42:52', '2025-04-22 05:04:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-21 13:38:17', NULL),
(2, 1, 3, '2025-04-21 14:31:58', NULL),
(3, 3, 5, '2025-04-21 14:32:30', NULL),
(4, 4, 4, '2025-04-21 16:17:27', NULL),
(5, 5, 3, '2025-04-22 02:42:23', NULL),
(6, 6, 5, '2025-04-22 02:42:59', NULL),
(7, 6, 4, '2025-04-22 05:04:42', NULL),
(8, 6, 5, '2025-04-22 05:13:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `majors_id` (`majors_id`);

--
-- Indeks untuk tabel `learning_moduls`
--
ALTER TABLE `learning_moduls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructur_id` (`instructor_id`);

--
-- Indeks untuk tabel `learning_modul_details`
--
ALTER TABLE `learning_modul_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learning_modul_id` (`learning_modul_id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors_detail`
--
ALTER TABLE `majors_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_id` (`user_id`),
  ADD KEY `majors_id` (`majors_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `majors_id` (`majors_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `learning_moduls`
--
ALTER TABLE `learning_moduls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `learning_modul_details`
--
ALTER TABLE `learning_modul_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `majors_detail`
--
ALTER TABLE `majors_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `instructors_ibfk_2` FOREIGN KEY (`majors_id`) REFERENCES `majors` (`id`);

--
-- Ketidakleluasaan untuk tabel `learning_moduls`
--
ALTER TABLE `learning_moduls`
  ADD CONSTRAINT `learning_moduls_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`);

--
-- Ketidakleluasaan untuk tabel `learning_modul_details`
--
ALTER TABLE `learning_modul_details`
  ADD CONSTRAINT `learning_modul_details_ibfk_1` FOREIGN KEY (`learning_modul_id`) REFERENCES `learning_moduls` (`id`);

--
-- Ketidakleluasaan untuk tabel `majors_detail`
--
ALTER TABLE `majors_detail`
  ADD CONSTRAINT `majors_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `majors_detail_ibfk_2` FOREIGN KEY (`majors_id`) REFERENCES `majors` (`id`);

--
-- Ketidakleluasaan untuk tabel `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`majors_id`) REFERENCES `majors` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
