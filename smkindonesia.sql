-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2023 pada 16.19
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smkindonesia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `level` int(1) NOT NULL,
  `nik` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `username`, `password`, `level`, `nik`) VALUES
(1, 'admin', '1234', 1, 1234567);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `nik_guru` int(16) NOT NULL,
  `nama_guru` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`nik_guru`, `nama_guru`) VALUES
(9877654, 'Saefi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` varchar(30) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`) VALUES
('K01', '10 RPL 1'),
('K02', '10 RPL 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_log`
--

CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL,
  `nama_siswa` varchar(30) NOT NULL,
  `keterangan_1` text NOT NULL,
  `waktu` datetime NOT NULL,
  `keterangan_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_log`
--

INSERT INTO `tb_log` (`id`, `nama_siswa`, `keterangan_1`, `waktu`, `keterangan_2`) VALUES
(2, 'angga', 'ubah data lama', '2021-03-02 21:14:07', 'ke data baru'),
(3, 'wolles', 'tambah data baru', '2021-03-02 21:15:37', ''),
(4, 'wolles', 'ubah data lama', '2021-03-02 21:15:52', 'ke data baru'),
(5, 'wolles', 'ubah data lama', '2021-03-02 21:16:01', 'ke data baru'),
(6, 'angga', 'ubah data lama', '2021-03-02 21:19:51', 'ke data baru'),
(7, 'kambing', 'tambah data baru', '2021-03-02 21:20:26', ''),
(8, 'kambing', 'hapus data', '2021-03-02 21:21:31', ''),
(9, 'hasan', 'ubah data lama', '2021-03-02 21:28:11', 'wolles'),
(10, 'wolles', 'ubah data lama', '2021-03-02 21:28:51', 'angga'),
(11, 'hasan', 'hapus data', '2021-03-02 21:31:11', ''),
(12, 'angga', 'ubah data lama', '2021-03-02 21:31:49', 'asdf'),
(13, 'asdf', 'ubah data lama', '2021-03-02 21:32:17', 'vbbbbb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` varchar(30) NOT NULL,
  `nama_mapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `nama_mapel`) VALUES
('K03', 'Bahasa Jawa'),
('mapel_01', 'Bahasa Sunda'),
('mapel_02', 'Bahasa indonesia'),
('mapel_03', 'Bahasa inggris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` varchar(30) NOT NULL,
  `nik_guru` int(16) NOT NULL,
  `nik_siswa` int(16) NOT NULL,
  `id_mapel` varchar(30) NOT NULL,
  `id_prodi` varchar(30) NOT NULL,
  `id_kelas` varchar(30) NOT NULL,
  `uts` double NOT NULL,
  `uas` double NOT NULL,
  `uh` double NOT NULL,
  `nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_nilai`
--

INSERT INTO `tb_nilai` (`id_nilai`, `nik_guru`, `nik_siswa`, `id_mapel`, `id_prodi`, `id_kelas`, `uts`, `uas`, `uh`, `nilai`) VALUES
('KN01', 0, 1234567, 'K01', 'K03', 'prodi_01', 50, 100, 89, 79.666666666667);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_prodi`
--

CREATE TABLE `tb_prodi` (
  `id_prodi` varchar(30) NOT NULL,
  `nama_prodi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_prodi`
--

INSERT INTO `tb_prodi` (`id_prodi`, `nama_prodi`) VALUES
('prodi_01', 'Rekayasa Perangkat Lunak'),
('prodi_02', 'Akuntansi'),
('prodi_03', 'Perhotelan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nik_siswa` int(16) NOT NULL,
  `nama_siswa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`nik_siswa`, `nama_siswa`) VALUES
(1234567, 'vbbbbb');

--
-- Trigger `tb_siswa`
--
DELIMITER $$
CREATE TRIGGER `tambah` BEFORE INSERT ON `tb_siswa` FOR EACH ROW INSERT INTO tb_log VALUES (null, NEW.nama_siswa,'tambah data baru',NOW(),'')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_delete_siswa` AFTER DELETE ON `tb_siswa` FOR EACH ROW INSERT INTO tb_log VALUES (null, OLD.nama_siswa,'hapus data',NOW(),'')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update_siswa` AFTER UPDATE ON `tb_siswa` FOR EACH ROW INSERT INTO tb_log VALUES (null, OLD.nama_siswa,'ubah data lama',NOW(),new.nama_siswa)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`nik_guru`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD UNIQUE KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD UNIQUE KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_guru` (`nik_guru`),
  ADD KEY `id_siswa` (`nik_siswa`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_prodi` (`id_prodi`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tb_prodi`
--
ALTER TABLE `tb_prodi`
  ADD UNIQUE KEY `id_prodi` (`id_prodi`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nik_siswa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD CONSTRAINT `tb_siswa` FOREIGN KEY (`nik_siswa`) REFERENCES `tb_siswa` (`nik_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
