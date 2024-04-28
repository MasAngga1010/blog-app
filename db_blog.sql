-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 28 Apr 2024 pada 08.20
-- Versi server: 5.7.39
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `author_id` int(6) NOT NULL,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `published_date` datetime NOT NULL,
  `status` varchar(200) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by` varchar(60) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `author_id`, `image`, `title`, `content`, `published_date`, `status`, `create_date`, `create_by`, `last_update`, `last_update_by`) VALUES
(55, 35, 'http://10.0.2.2:8000/images/makanan-yang-enak-yang-penting-bisa-di-makan_662e068945ce4.jpg', 'Makanan yang enak yang penting bisa di makan', 'nyam nyam nyam', '2024-04-28 08:19:21', 'published', '2024-04-28 08:19:21', NULL, '2024-04-28 01:19:21', NULL),
(56, 35, 'http://10.0.2.2:8000/images/jadilah-yang-paing-tertinggi-tanpa-menjatuhkan-orang-lain_662e06cbbb26d.jpg', 'Jadilah yang paing tertinggi tanpa menjatuhkan orang lain', 'kode 9 10', '2024-04-28 08:20:27', 'published', '2024-04-28 08:20:27', NULL, '2024-04-28 01:20:27', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_author`
--

CREATE TABLE `ms_author` (
  `author_id` varchar(30) NOT NULL,
  `username` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `author_name` varchar(60) NOT NULL,
  `pin` varchar(1000) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by` varchar(60) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `ms_author`
--

INSERT INTO `ms_author` (`author_id`, `username`, `email`, `author_name`, `pin`, `gender`, `create_date`, `create_by`, `last_update`, `last_update_by`) VALUES
('35', 'hamdan', 'hamdan@gmail.com', 'hamdan narso', '12345678', 'L', '2024-04-26 21:33:41', NULL, '2024-04-26 14:33:41', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_author_token`
--

CREATE TABLE `ms_author_token` (
  `author_id` varchar(30) NOT NULL,
  `token` varchar(1000) NOT NULL,
  `request_time` datetime NOT NULL,
  `expired_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `ms_author_token`
--

INSERT INTO `ms_author_token` (`author_id`, `token`, `request_time`, `expired_time`) VALUES
('35', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAuMC4yLjI6ODAwMC9hcGkvbG9naW4iLCJpYXQiOjE3MTQyOTIwMjIsImV4cCI6MTcxNDI5NTYyMiwibmJmIjoxNzE0MjkyMDIyLCJqdGkiOiJZU2psWTJadGg5Q1NPeGtQIiwic3ViIjoiMzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0._Uw9rpURilEIihP7NNw3IzWBwYnSULR6TInt53eIZzY', '2024-04-28 08:13:42', '2024-04-28 09:13:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_comments`
--

CREATE TABLE `ms_comments` (
  `author_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by` varchar(60) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aJftgQQTPHrIFsyMoBTQ59vCXLkoqC9FNSvfl1bP', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieEtzc0JDN09RbnRWdmRBSTJ3S1g3Nzc1YThJSHM5QzA0aTB5YTlnUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJqd3RfdG9rZW4iO3M6MzI1OiJleUowZVhBaU9pSktWMVFpTENKaGJHY2lPaUpJVXpJMU5pSjkuZXlKcGMzTWlPaUpvZEhSd09pOHZNVEkzTGpBdU1DNHhPamd3TURBdmJHbDJaWGRwY21VdmRYQmtZWFJsSWl3aWFXRjBJam94TnpFME1qa3dOek0zTENKbGVIQWlPakUzTVRReU9UUXpNemNzSW01aVppSTZNVGN4TkRJNU1EY3pOeXdpYW5ScElqb2lTR3BRWjNWb1dHRXpkV3BPTkVkUWNpSXNJbk4xWWlJNklqTTFJaXdpY0hKMklqb2lNak5pWkRWak9EazBPV1kyTURCaFpHSXpPV1UzTURGak5EQXdPRGN5WkdJM1lUVTVOelptTnlKOS4zZ2J4S2ZnQ2Rka0ZBVF9RaUZkM1NGbzNxY3VGNU1hbUdkbk0wdDBFanVZIjt9', 1714290793),
('UBSZyjX9jJOtRuFk9WndtrXo1jd7a6thqCP8VvJK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:125.0) Gecko/20100101 Firefox/125.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0NGd1lmRG1CVXNPd1A4UlRJOVhPc2xMQVNVMGZFbFBEd2xTRWYzdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1714283670),
('ZT17sibqamgQqthhNF79XKIuRPDSDy0gYYuH9Q1m', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:125.0) Gecko/20100101 Firefox/125.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVI2MXJWZU50SklkQkQ3T0Q0WTdvVkpodkxqRmFDM1FjczByR0twMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1714283819);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `create_date`, `last_update`) VALUES
(35, 'hamdan', 'hamdan@gmail.com', '$2y$12$KtIP2A43J0Rxi3ipM4F1YeaUmBzReiRpdivsQh2yAA1jZW6OGqh.W', '2024-04-26 21:33:41', '2024-04-26 14:33:41');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `ms_author`
--
ALTER TABLE `ms_author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indeks untuk tabel `ms_author_token`
--
ALTER TABLE `ms_author_token`
  ADD PRIMARY KEY (`author_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
