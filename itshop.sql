-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Nov 2020 pada 09.11
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itshop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(1, 'Wendy', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '+6285726336632', 'dywenbusiness@gmail.com', 'Jl. Raya Timur Terminal Wangon');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(9, 'Laptop'),
(10, 'Komputer'),
(11, 'Handphone'),
(12, 'Pc'),
(13, 'PlayStation');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_product`
--

CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_product`
--

INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`) VALUES
(7, 9, 'ASUS Laptop 14 X409JP', 8599000, '<p>Baik untuk bekerja atau bermain, ASUS VivoBook 14 A409 adalah laptop entry-level yang memberikan kinerja yang kuat dan visual yang mendalam. Di dalam, ia ditenagai oleh prosesor hingga Intel&reg; Core&trade; i5 Generasi ke-10 dengan RAM hingga 4GB 2666MHz, kartu grafis NVIDIA&reg;&nbsp;MX330, serta media penyimpanan 1TB HDD memberi Anda sangat pilihan yang cocok untuk menyimpan semua data Anda.</p>\r\n', 'produk1605416299.jpg', 1, '2020-11-15 04:58:19'),
(8, 9, 'ASUS Notebook A412FA-EK301T Transparent Silver', 7599000, '<p>Processor: Intel Core i3-8145U</p>\r\n\r\n<p>RAM: 4GB</p>\r\n\r\n<p>SSD: 512GB</p>\r\n\r\n<p>VGA: Intel Graphics</p>\r\n\r\n<p>Konektivitas: Wifi + Bluetooth</p>\r\n\r\n<p>Ukuran Layar: 14 Inch FHD</p>\r\n\r\n<p>Sistem Operasi: Windows 10 Home</p>\r\n', 'produk1605416432.jpg', 1, '2020-11-15 05:01:29'),
(9, 9, 'Lenovo Ideapad 330s 14IKB BRID', 7899000, '<p>Prosesor : Intel&reg; Core&trade; i5-8250U Processor (6M Cache, up to 3.40 GHz)</p>\r\n\r\n<p>Sistem Operasi : Windows 10 Home</p>\r\n\r\n<p>Grafis : AMD Radeon&trade; 535 GDDR5 2GB</p>\r\n\r\n<p>Display : 14&rdquo; HD (1366 x 768)</p>\r\n\r\n<p>Memori : 4 GB onboard DDR4</p>\r\n\r\n<p>Storage : 1 TB SATA HDD</p>\r\n\r\n<p>Audio : 2 x 2 W pengeras suara dengan Dolby Audio&trade;</p>\r\n\r\n<p>Baterai : Hingga 7 jam*; Mengisi dengan cepat (Mengisi 15 menit hingga 2 jam penggunaan**) * Berdasarkan pengujian dengan MobileMark 2014. Masa pakai baterai sangat bervariasi tergantung pengaturan, penggunaan, &amp; amp; faktor lain.** Mode Power-off; membutuhkan sumber daya 65W</p>\r\n\r\n<p>Keyboard : Backlit keyboard (opsional)</p>\r\n\r\n<p>Dimensi : 323.1 mm x 234.8 mm x 18.95 mm / 12.7&quot; x 9.2&quot; x 0.75&quot;</p>\r\n\r\n<p>Berat : 1.67 kg / 3.7 lbs</p>\r\n\r\n<p>WiFi/Bluetooth : 1 x 1 AC WiFi + Bluetooth 4.1</p>\r\n\r\n<p>Ports : USB Type-C 3.1 , 2 x USB 3.0 , HDMI , 4-in-1 card reader , Audio jack</p>\r\n\r\n<p>Warranty : 2 year warranty - Premium Care (Onsite)</p>\r\n', 'produk1605416793.jpg', 1, '2020-11-15 05:06:33'),
(10, 10, 'Acer Aspire 5 Slim Laptop', 5169000, '<p>Prosesor AMD Ryzen 3 3200U Dual Core (Hingga 3.5GHz);&nbsp;Memori DDR4 4GB;&nbsp;128 GB PCIe NVMe SSD</p>\r\n\r\n<p>Layar lebar IPS dengan lampu latar LED 15,6 inci full HD (1920 x 1080);&nbsp;Grafis Seluler AMD Radeon Vega 3</p>\r\n\r\n<p>1 port USB 3.1 Gen 1, 2 port USB 2.0 &amp; 1 port HDMI dengan dukungan HDCP</p>\r\n\r\n<p>802.11ac Wi-Fi;&nbsp;Keyboard Backlit;&nbsp;Masa pakai baterai hingga 7,5 jam</p>\r\n\r\n<p>Windows 10 dalam mode S.&nbsp;Watt catu daya maksimum: 65 Watt</p>\r\n', 'produk1605417054.jpg', 1, '2020-11-15 05:10:54'),
(11, 11, 'OPPO A92 (A72)', 3275000, '<p>OPPO A92 ini memiliki layar 6.5 inci dengan resolusi 1080 x 2400 pixels, Quad-Camera 48MP, RAM 8GB dengan prosesor Snapdragon 665, ROM 128GB dan baterai Li-Po 5.000 mAh.</p>\r\n', 'produk1605417231.jpg', 1, '2020-11-15 05:13:51'),
(12, 11, 'OPPO A92s', 3590000, '<p>OPPO A92s didukung oleh konektivitas 5G, menampilkan pengaturan quad-camera dengan penembak utama 48MP, baterai 4.000 mAh dan sensor sidik jari yang dipasang di samping.</p>\r\n', 'produk1605417305.jpg', 1, '2020-11-15 05:15:05'),
(13, 11, 'OPPO K3', 1990000, '<p>OPPO K3 berbekal layar AMOLED FHD+ 6.5&quot; dibenami Snapdragon 710 dipadukan RAM 6GB/8GB, baterai berkapasitas 3765 mAh dengan fast charge VOOC 3.0. Dual kamera belakang dan motorized pop-up untuk kamera selfienya.</p>\r\n', 'produk1605417446.jpg', 1, '2020-11-15 05:17:26'),
(14, 11, 'Xiaomi Mi 9 ', 2100000, '<p>Xiaomi Mi 9 konon akan berlayar Super AMOLED notch waterdrop 6.4&quot;, dengan Snapdragon 855, triple kamera belakang dan baterai 3300 mAh dengan fast charging.</p>\r\n', 'produk1605417522.jpg', 0, '2020-11-15 06:42:15');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
