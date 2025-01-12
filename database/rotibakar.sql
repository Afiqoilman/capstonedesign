-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Jan 2025 pada 08.50
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rotibakar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`) VALUES
(10, 'Roti Bakar Kecil'),
(11, 'Roti Bakar Besar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idpembayaran` int(11) NOT NULL,
  `idpembelian` int(11) NOT NULL,
  `nama` text NOT NULL,
  `tanggaltransfer` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `bukti` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`idpembayaran`, `idpembelian`, `nama`, `tanggaltransfer`, `tanggal`, `bukti`) VALUES
(13, 46, 'Sugeng', '2025-01-11', '2025-01-11 00:00:00', '2025011114481020824342_6343845.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `idpembelian` int(11) NOT NULL,
  `notransaksi` text NOT NULL,
  `id` int(11) NOT NULL,
  `tanggalbeli` date NOT NULL,
  `totalbeli` text NOT NULL DEFAULT '\'belum bayar\'',
  `alamatpengiriman` text NOT NULL,
  `totalberat` varchar(255) NOT NULL,
  `kota` text NOT NULL,
  `ongkir` text NOT NULL,
  `catatan` text NOT NULL,
  `statusbeli` text NOT NULL,
  `resipengiriman` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`idpembelian`, `notransaksi`, `id`, `tanggalbeli`, `totalbeli`, `alamatpengiriman`, `totalberat`, `kota`, `ongkir`, `catatan`, `statusbeli`, `resipengiriman`, `waktu`) VALUES
(46, '#INV-20250111024754', 13, '2025-01-11', '20000', 'Jl. Sudirman', '', 'Mojosari', '8000', 'topping kasih agak banyak', 'Barang Telah Sampai ke Pemesan', '123445', '2025-01-11 14:47:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelianproduk`
--

CREATE TABLE `pembelianproduk` (
  `idpembeliandetail` int(11) NOT NULL,
  `idpembelian` int(11) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `nama` text NOT NULL,
  `harga` text NOT NULL,
  `berat` text NOT NULL,
  `subberat` text NOT NULL,
  `subharga` text NOT NULL,
  `jumlah` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelianproduk`
--

INSERT INTO `pembelianproduk` (`idpembeliandetail`, `idpembelian`, `idproduk`, `nama`, `harga`, `berat`, `subberat`, `subharga`, `jumlah`) VALUES
(55, 46, 30, 'Roti Bakar Blueberry Cream', '20000', '', '', '20000', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `alamat` text NOT NULL,
  `fotoprofil` varchar(255) NOT NULL,
  `level` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `password`, `telepon`, `alamat`, `fotoprofil`, `level`) VALUES
(1, 'Administrator', 'admin@gmail.com', 'admin', '0812345678', 'Palembang', 'Untitled.png', 'Admin'),
(13, 'Sugeng', 'sugeng@gmail.com', 'sugeng', '08952815929', 'Jl. Palembang', 'Untitled.png', 'Pelanggan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` text NOT NULL,
  `hargaproduk` text NOT NULL,
  `stokproduk` text NOT NULL,
  `fotoproduk` text NOT NULL,
  `deskripsiproduk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `hargaproduk`, `stokproduk`, `fotoproduk`, `deskripsiproduk`) VALUES
(26, 10, 'Roti Bakar Cokelat Keju', '20000', '20', '1b506987-a743-4001-9c90-9911ef029584_Go-Biz_20210811_085656.jpeg', '<p>Kombinasi sempurna antara manisnya cokelat lumer dan gurihnya keju parut yang meleleh di atas roti bakar yang renyah. Setiap gigitan akan memanjakan lidah Anda dengan rasa klasik yang tak pernah salah.</p>\r\n'),
(27, 10, 'Roti Bakar Pisang Cokelat', '20000', '20', '13af2273-356c-4d53-b17f-7653e96bf6ac.jpg', '<p>Potongan pisang segar diselimuti dengan lelehan cokelat manis di atas roti bakar yang lembut dan hangat. Menu ini memberikan rasa manis alami dari pisang yang berpadu sempurna dengan cokelat.</p>\r\n'),
(28, 10, 'Roti Bakar Stroberi Keju', '20000', '10', '9806916e-ac9e-49a9-bdca-65b5e99740de_Go-Biz_20210213_210728.jpeg', '<p>Lelehan selai stroberi yang segar dipadukan dengan gurihnya keju parut, memberikan rasa manis dan asam yang seimbang. Menu ini cocok untuk Anda yang suka rasa yang menyegarkan.</p>\r\n'),
(29, 10, 'Roti Bakar Srikaya Pandan', '20000', '10', '3e8f3e63-38dc-4236-8133-8000f98f5e31_Go-Biz_20210811_104827.jpeg', '<p>Roti bakar lembut dengan selai srikaya pandan yang harum dan manis, memberikan cita rasa khas tradisional yang sulit dilupakan. Aroma pandannya yang khas akan memanjakan indera Anda.</p>\r\n'),
(30, 10, 'Roti Bakar Blueberry Cream', '20000', '10', '744c2b31d2e3afb29c8f6dfa2ef021ff.jpg', '<p>Selai blueberry yang manis-asam dikombinasikan dengan krim lembut di atas roti bakar yang renyah. Menu ini menghadirkan rasa buah yang segar dan memikat.</p>\r\n');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idpembayaran`),
  ADD KEY `idbeli` (`idpembelian`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`idpembelian`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `pembelianproduk`
--
ALTER TABLE `pembelianproduk`
  ADD PRIMARY KEY (`idpembeliandetail`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `id_kategori` (`idkategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `idpembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `pembelianproduk`
--
ALTER TABLE `pembelianproduk`
  MODIFY `idpembeliandetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`idpembelian`) REFERENCES `pembelian` (`idpembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
