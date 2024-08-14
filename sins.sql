-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 14 Agu 2024 pada 03.42
-- Versi server: 10.11.8-MariaDB-0ubuntu0.24.04.1
-- Versi PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sins`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekskul_siswa`
--

CREATE TABLE `ekskul_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `semester` int(11) NOT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekstrakurikuler`
--

CREATE TABLE `ekstrakurikuler` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nip`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `jenis_kelamin`, `nohp`, `jabatan`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1', 'admin', 'Bima', '1987-09-04', 'Psr. Dago No. 474, Bandung 55060, PapBar', 'Laki-laki', '+5946350168042', NULL, 1, '2024-08-13 19:49:49', '2024-08-13 19:58:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_ekskul`
--

CREATE TABLE `hasil_ekskul` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ekskul_siswa_id` bigint(20) UNSIGNED NOT NULL,
  `ekstrakurikuler_id` bigint(20) UNSIGNED NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_pkl`
--

CREATE TABLE `hasil_pkl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pkl_siswa_id` bigint(20) UNSIGNED NOT NULL,
  `pkl_id` bigint(20) UNSIGNED NOT NULL,
  `lamanya` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode_jurusan` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama`, `kode_jurusan`, `created_at`, `updated_at`) VALUES
(7, 'MIPA', NULL, '2024-08-13 20:01:11', '2024-08-13 20:01:11'),
(8, 'IPS', NULL, '2024-08-13 20:01:15', '2024-08-13 20:01:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `jurusan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `nomor`, `jurusan_id`, `guru_id`, `created_at`, `updated_at`) VALUES
(7, 'X MIPA 1', '1', 7, 1, '2024-08-13 20:02:40', '2024-08-13 20:02:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepsek`
--

CREATE TABLE `kepsek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kepsek`
--

INSERT INTO `kepsek` (`id`, `nama`, `nip`, `created_at`, `updated_at`) VALUES
(1, 'HJ SITTI AISYAH, S.PD,SH,MM,MH', '196909121998022044', '2024-08-13 19:49:49', '2024-08-13 19:49:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matapelajaran`
--

CREATE TABLE `matapelajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `semester` int(11) NOT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `sub_jenis` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `matapelajaran`
--

INSERT INTO `matapelajaran` (`id`, `nama`, `semester`, `guru_id`, `jenis`, `sub_jenis`, `created_at`, `updated_at`) VALUES
(1, 'Pendidikan Agama Islam', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 19:59:56'),
(2, 'Pendidikan Pancasila dan Kewarganegaraan', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:03'),
(3, 'Bahasa Indonesia', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:07'),
(4, 'Matematika', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:12'),
(5, 'Sejarah Indonesia', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:18'),
(6, 'Bahasa Inggris dan Bahasa Asing Lainnya', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:22'),
(7, 'Seni Budaya', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:27'),
(8, 'Pendidikan Jasmani, Olah Raga, dan Kesehatan', 1, 1, 'A.', NULL, '2024-08-13 19:49:49', '2024-08-13 20:00:31'),
(10, 'Fisika', 1, 1, 'C.', 'C1.', '2024-08-13 19:49:49', '2024-08-13 20:00:50'),
(11, 'Kimia', 1, 1, 'C.', 'C1.', '2024-08-13 19:49:49', '2024-08-13 20:00:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_08_11_141440_create_gurus_table', 1),
(3, '2020_08_11_141658_create_jurusans_table', 1),
(4, '2020_08_11_141748_create_matapelajarans_table', 1),
(5, '2020_08_11_141760_create_kelas_table', 1),
(6, '2020_08_11_141810_create_siswas_table', 1),
(7, '2020_08_12_073820_pkl_table', 1),
(8, '2020_08_12_073950_ekstrakurikuler_table', 1),
(9, '2020_08_12_144319_create_nilaiakademiks_table', 1),
(10, '2020_08_12_145100_create_table_nilai_mapel', 1),
(11, '2020_08_20_081729_ekskul_siswa_table', 1),
(12, '2020_08_20_081743_pkl_siswa_table', 1),
(13, '2020_08_20_081756_hasil_ekskul_table', 1),
(14, '2020_08_20_081807_hasil_pkl_table', 1),
(15, '2020_08_20_091809_create_raports_table', 1),
(16, '2020_10_27_151459_create_kepseks_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilaiakademik`
--

CREATE TABLE `nilaiakademik` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun` varchar(255) NOT NULL,
  `angkatan` varchar(255) NOT NULL,
  `semester` int(11) NOT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_kelas` varchar(20) DEFAULT NULL,
  `nama_jurusan` varchar(50) DEFAULT NULL,
  `nomor_kelas` int(11) DEFAULT NULL,
  `sum_pengetahuan` double(8,2) DEFAULT NULL,
  `sum_keterampilan` double(8,2) DEFAULT NULL,
  `sum_nilai_akhir` double(8,2) DEFAULT NULL,
  `avg_pengetahuan` double(8,2) DEFAULT NULL,
  `avg_keterampilan` double(8,2) DEFAULT NULL,
  `avg_nilai_akhir` double(8,2) DEFAULT NULL,
  `avg_predikat` varchar(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `nilaiakademik`
--

INSERT INTO `nilaiakademik` (`id`, `tahun`, `angkatan`, `semester`, `siswa_id`, `nama_kelas`, `nama_jurusan`, `nomor_kelas`, `sum_pengetahuan`, `sum_keterampilan`, `sum_nilai_akhir`, `avg_pengetahuan`, `avg_keterampilan`, `avg_nilai_akhir`, `avg_predikat`, `created_at`, `updated_at`) VALUES
(1, '2024', '2024', 1, 1, 'X MIPA 1', 'MIPA', 1, 320.00, 320.00, 320.00, 32.00, 32.00, 32.00, 'D', '2024-08-13 20:04:12', '2024-08-13 20:06:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_mapel`
--

CREATE TABLE `nilai_mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilaiakademik_id` bigint(20) UNSIGNED NOT NULL,
  `matapelajaran_id` bigint(20) UNSIGNED NOT NULL,
  `pengetahuan` double(8,2) DEFAULT NULL,
  `keterampilan` double(8,2) DEFAULT NULL,
  `nilai_akhir` double(8,2) DEFAULT NULL,
  `predikat` varchar(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `nilai_mapel`
--

INSERT INTO `nilai_mapel` (`id`, `nilaiakademik_id`, `matapelajaran_id`, `pengetahuan`, `keterampilan`, `nilai_akhir`, `predikat`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 80.00, 80.00, 80.00, 'B+', '2024-08-13 20:05:49', '2024-08-13 20:05:49'),
(2, 1, 2, 80.00, 80.00, 80.00, 'B+', '2024-08-13 20:06:03', '2024-08-13 20:06:03'),
(3, 1, 2, 80.00, 80.00, 80.00, 'B+', '2024-08-13 20:06:11', '2024-08-13 20:06:11'),
(4, 1, 3, 80.00, 80.00, 80.00, 'B+', '2024-08-13 20:06:26', '2024-08-13 20:06:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pkl`
--

CREATE TABLE `pkl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mitra` varchar(50) NOT NULL,
  `lokasi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pkl_siswa`
--

CREATE TABLE `pkl_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `semester` int(11) NOT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `raport`
--

CREATE TABLE `raport` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilaiakademik_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pkl_siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ekskul_siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `peringkat` int(11) DEFAULT NULL,
  `cat_akademik` varchar(255) DEFAULT NULL,
  `sakit` int(11) DEFAULT NULL,
  `izin` int(11) DEFAULT NULL,
  `tanpa_ket` int(11) DEFAULT NULL,
  `keterangan_kenaikan` varchar(150) DEFAULT NULL,
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `raport`
--

INSERT INTO `raport` (`id`, `nilaiakademik_id`, `pkl_siswa_id`, `ekskul_siswa_id`, `peringkat`, `cat_akademik`, `sakit`, `izin`, `tanpa_ket`, `keterangan_kenaikan`, `kelas_id`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-08-13 20:05:06', '2024-08-13 20:05:06'),
(2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-08-13 20:05:28', '2024-08-13 20:05:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nis` varchar(255) NOT NULL,
  `nisn` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jurusan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_masuk` date NOT NULL,
  `angkatan_thn` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nisn`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `jenis_kelamin`, `nohp`, `user_id`, `kelas_id`, `jurusan_id`, `tanggal_masuk`, `angkatan_thn`, `created_at`, `updated_at`) VALUES
(1, '1000001', '1000001', 'Siswa 1', 'Ciamis', '2012-12-12', 'Alamat Siswa 1', 'Laki-laki', '080000000001', 12, 7, 7, '2024-06-15', '2024', '2024-08-13 20:03:49', '2024-08-13 20:03:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(150) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', NULL, '$2y$10$WyUK6gJq80x2LnfY.cAsbu2.Em8cqXADxH4bdRkiQ/c3L9kT3VKEu', 0, NULL, '2024-08-13 19:49:49', '2024-08-13 19:55:03'),
(12, 'siswa1', NULL, '$2y$10$A7Ejs.Jpue/JbmNwkxqjje667Ut7SkPEOxxp7SJ7cJ6EB8ZXp7sNO', 0, NULL, '2024-08-13 20:03:49', '2024-08-13 20:03:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ekskul_siswa`
--
ALTER TABLE `ekskul_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ekskul_siswa_siswa_id_foreign` (`siswa_id`);

--
-- Indeks untuk tabel `ekstrakurikuler`
--
ALTER TABLE `ekstrakurikuler`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guru_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `hasil_ekskul`
--
ALTER TABLE `hasil_ekskul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hasil_ekskul_ekskul_siswa_id_foreign` (`ekskul_siswa_id`),
  ADD KEY `hasil_ekskul_ekstrakurikuler_id_foreign` (`ekstrakurikuler_id`);

--
-- Indeks untuk tabel `hasil_pkl`
--
ALTER TABLE `hasil_pkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hasil_pkl_pkl_siswa_id_foreign` (`pkl_siswa_id`),
  ADD KEY `hasil_pkl_pkl_id_foreign` (`pkl_id`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_jurusan_id_foreign` (`jurusan_id`),
  ADD KEY `kelas_guru_id_foreign` (`guru_id`);

--
-- Indeks untuk tabel `kepsek`
--
ALTER TABLE `kepsek`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `matapelajaran`
--
ALTER TABLE `matapelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matapelajaran_guru_id_foreign` (`guru_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilaiakademik`
--
ALTER TABLE `nilaiakademik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nilaiakademik_siswa_id_foreign` (`siswa_id`);

--
-- Indeks untuk tabel `nilai_mapel`
--
ALTER TABLE `nilai_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nilai_mapel_nilaiakademik_id_foreign` (`nilaiakademik_id`),
  ADD KEY `nilai_mapel_matapelajaran_id_foreign` (`matapelajaran_id`);

--
-- Indeks untuk tabel `pkl`
--
ALTER TABLE `pkl`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pkl_siswa`
--
ALTER TABLE `pkl_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pkl_siswa_siswa_id_foreign` (`siswa_id`);

--
-- Indeks untuk tabel `raport`
--
ALTER TABLE `raport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raport_nilaiakademik_id_foreign` (`nilaiakademik_id`),
  ADD KEY `raport_pkl_siswa_id_foreign` (`pkl_siswa_id`),
  ADD KEY `raport_ekskul_siswa_id_foreign` (`ekskul_siswa_id`),
  ADD KEY `raport_kelas_id_foreign` (`kelas_id`),
  ADD KEY `raport_guru_id_foreign` (`guru_id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_user_id_foreign` (`user_id`),
  ADD KEY `siswa_kelas_id_foreign` (`kelas_id`),
  ADD KEY `siswa_jurusan_id_foreign` (`jurusan_id`);

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
-- AUTO_INCREMENT untuk tabel `ekskul_siswa`
--
ALTER TABLE `ekskul_siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ekstrakurikuler`
--
ALTER TABLE `ekstrakurikuler`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `hasil_ekskul`
--
ALTER TABLE `hasil_ekskul`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hasil_pkl`
--
ALTER TABLE `hasil_pkl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kepsek`
--
ALTER TABLE `kepsek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `matapelajaran`
--
ALTER TABLE `matapelajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `nilaiakademik`
--
ALTER TABLE `nilaiakademik`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `nilai_mapel`
--
ALTER TABLE `nilai_mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pkl`
--
ALTER TABLE `pkl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pkl_siswa`
--
ALTER TABLE `pkl_siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `raport`
--
ALTER TABLE `raport`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ekskul_siswa`
--
ALTER TABLE `ekskul_siswa`
  ADD CONSTRAINT `ekskul_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `hasil_ekskul`
--
ALTER TABLE `hasil_ekskul`
  ADD CONSTRAINT `hasil_ekskul_ekskul_siswa_id_foreign` FOREIGN KEY (`ekskul_siswa_id`) REFERENCES `ekskul_siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_ekskul_ekstrakurikuler_id_foreign` FOREIGN KEY (`ekstrakurikuler_id`) REFERENCES `ekstrakurikuler` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil_pkl`
--
ALTER TABLE `hasil_pkl`
  ADD CONSTRAINT `hasil_pkl_pkl_id_foreign` FOREIGN KEY (`pkl_id`) REFERENCES `pkl` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_pkl_pkl_siswa_id_foreign` FOREIGN KEY (`pkl_siswa_id`) REFERENCES `pkl_siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kelas_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `matapelajaran`
--
ALTER TABLE `matapelajaran`
  ADD CONSTRAINT `matapelajaran_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `nilaiakademik`
--
ALTER TABLE `nilaiakademik`
  ADD CONSTRAINT `nilaiakademik_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_mapel`
--
ALTER TABLE `nilai_mapel`
  ADD CONSTRAINT `nilai_mapel_matapelajaran_id_foreign` FOREIGN KEY (`matapelajaran_id`) REFERENCES `matapelajaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_mapel_nilaiakademik_id_foreign` FOREIGN KEY (`nilaiakademik_id`) REFERENCES `nilaiakademik` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pkl_siswa`
--
ALTER TABLE `pkl_siswa`
  ADD CONSTRAINT `pkl_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `raport`
--
ALTER TABLE `raport`
  ADD CONSTRAINT `raport_ekskul_siswa_id_foreign` FOREIGN KEY (`ekskul_siswa_id`) REFERENCES `ekskul_siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `raport_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `raport_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `raport_nilaiakademik_id_foreign` FOREIGN KEY (`nilaiakademik_id`) REFERENCES `nilaiakademik` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `raport_pkl_siswa_id_foreign` FOREIGN KEY (`pkl_siswa_id`) REFERENCES `pkl_siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `siswa_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `siswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
