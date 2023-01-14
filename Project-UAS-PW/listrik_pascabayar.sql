-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jan 2023 pada 17.30
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `listrik_pascabayar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login`
--

CREATE TABLE `tb_login` (
  `KodeLogin` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `NamaLengkap` varchar(50) NOT NULL,
  `Level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_login`
--

INSERT INTO `tb_login` (`KodeLogin`, `Username`, `Password`, `NamaLengkap`, `Level`) VALUES
(1, 'admin', 'admin', 'Fastabiqul', 'Admin'),
(2, 'PLG0', 'khatami', 'Muhammad Khatami', 'Pelanggan'),
(4, 'PLG1', 'lauren', 'Lauren Valentina', 'Pelanggan'),
(5, 'PLG2', '123456', 'muhammad khatami', 'Pelanggan'),
(6, 'PLG3', '123', 'Muhammad fastabiqul', 'Pelanggan'),
(7, 'PLG4', '12345', 'Lauren Valentina', 'Pelanggan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `KodePelanggan` int(11) NOT NULL,
  `NoPelanggan` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `NoMeter` varchar(50) NOT NULL,
  `KodeTarif` int(11) NOT NULL,
  `NamaLengkap` varchar(50) NOT NULL,
  `Telp` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`KodePelanggan`, `NoPelanggan`, `Password`, `NoMeter`, `KodeTarif`, `NamaLengkap`, `Telp`, `Alamat`) VALUES
(1, 'PLG0', 'khatami', '0876898', 2, 'Muhammad Khatami', '3453422', 'Pondok Randu'),
(2, 'PLG1', 'lauren', '65789987', 1, 'Lauren Valentina', '3245655', 'Padang'),
(3, 'PLG2', '123456', '1234567890', 3, 'muhammad khatami', '08291312192', 'jakarta barat'),
(4, 'PLG3', '123', '32132123', 3, 'Muhammad fastabiqul', '08213182901', 'jakarta barat'),
(5, 'PLG4', '12345', '123421531', 2, 'Lauren Valentina', '08213231471', 'Jakarta Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `KodePembayaran` int(11) NOT NULL,
  `KodeTagihan` int(11) NOT NULL,
  `TglBayar` date NOT NULL,
  `JumlahTagihan` double(50,0) NOT NULL,
  `BuktiPembayaran` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`KodePembayaran`, `KodeTagihan`, `TglBayar`, `JumlahTagihan`, `BuktiPembayaran`, `Status`) VALUES
(2, 4, '2023-01-14', 135000, 'TGH2_TXQCMONH_1673707282.png', '2'),
(3, 5, '2023-01-14', 126400, 'TGH3_3LIQHYMW_1673708379.png', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tagihan`
--

CREATE TABLE `tb_tagihan` (
  `KodeTagihan` int(11) NOT NULL,
  `NoTagihan` varchar(50) NOT NULL,
  `NoPelanggan` varchar(50) NOT NULL,
  `TahunTagih` int(50) NOT NULL,
  `BulanTagih` varchar(50) NOT NULL,
  `JumlahPemakaian` varchar(50) NOT NULL,
  `TotalBayar` double(50,0) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_tagihan`
--

INSERT INTO `tb_tagihan` (`KodeTagihan`, `NoTagihan`, `NoPelanggan`, `TahunTagih`, `BulanTagih`, `JumlahPemakaian`, `TotalBayar`, `Status`) VALUES
(1, 'TGH0', 'PLG0', 2023, '3', '40', 102800, '2'),
(3, 'TGH1', 'PLG3', 2023, '6', '60', 150000, '0'),
(4, 'TGH2', 'PLG2', 2023, '1', '50', 135000, '2'),
(5, 'TGH3', 'PLG1', 2023, '2', '75', 126400, '2'),
(6, 'TGH4', 'PLG2', 2023, '2', '75', 172500, '0'),
(7, 'TGH5', 'PLG4', 2023, '4', '75', 153375, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tarif`
--

CREATE TABLE `tb_tarif` (
  `KodeTarif` int(11) NOT NULL,
  `Daya` varchar(50) NOT NULL,
  `TarifPerKwh` double(50,0) NOT NULL,
  `Beban` double(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_tarif`
--

INSERT INTO `tb_tarif` (`KodeTarif`, `Daya`, `TarifPerKwh`, `Beban`) VALUES
(1, '900', 1352, 25000),
(2, '1300', 1445, 45000),
(3, '2200', 1500, 60000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`KodeLogin`),
  ADD KEY `Username` (`Username`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`KodePelanggan`),
  ADD KEY `KodeTarif` (`KodeTarif`),
  ADD KEY `NoPelanggan` (`NoPelanggan`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`KodePembayaran`),
  ADD KEY `KodeTagihan` (`KodeTagihan`);

--
-- Indeks untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD PRIMARY KEY (`KodeTagihan`),
  ADD KEY `NoPelangggan` (`NoPelanggan`);

--
-- Indeks untuk tabel `tb_tarif`
--
ALTER TABLE `tb_tarif`
  ADD PRIMARY KEY (`KodeTarif`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `KodeLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `KodePelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `KodePembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  MODIFY `KodeTagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_tarif`
--
ALTER TABLE `tb_tarif`
  MODIFY `KodeTarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`KodeTarif`) REFERENCES `tb_tarif` (`KodeTarif`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pelanggan_ibfk_2` FOREIGN KEY (`NoPelanggan`) REFERENCES `tb_login` (`Username`);

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`KodeTagihan`) REFERENCES `tb_tagihan` (`KodeTagihan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD CONSTRAINT `tb_tagihan_ibfk_1` FOREIGN KEY (`NoPelanggan`) REFERENCES `tb_pelanggan` (`NoPelanggan`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
