-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2023 pada 19.41
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reps_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agent_list`
--

CREATE TABLE `agent_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `agent_list`
--

INSERT INTO `agent_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Muhammad ', 'Rafli', 'Apriyanto', 'Male', '09123456789', 'This is my sample address only.', 'agent2@gmail.com', 'b1a4a6b01cc297d4677c4ca6656e14d7', 'uploads/agents/1.jpg?v=1645241414', 1, 0, '2022-02-19 11:30:14', NULL),
(2, 'muhammad', 'rifqi', 'juniawan', 'Male', '123', 'assdadss', 'jedexaf940@goflipa.com', '83a87fd756ab57199c0bb6d5e11168cb', NULL, 1, 0, '2023-05-22 19:37:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `amenity_list`
--

CREATE TABLE `amenity_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` tinyint(1) DEFAULT 1 COMMENT '1 = indoor, 2 = outdoor',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `amenity_list`
--

INSERT INTO `amenity_list` (`id`, `name`, `type`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Master Bed Room', 1, 1, 0, '2022-02-19 09:45:33'),
(2, 'Guest Room', 1, 1, 0, '2022-02-19 09:45:42'),
(3, 'Living Room', 1, 1, 0, '2022-02-19 09:45:48'),
(4, 'Chimnry', 1, 1, 0, '2022-02-19 09:45:56'),
(5, 'Kitchen', 1, 1, 0, '2022-02-19 09:46:17'),
(6, 'Garage', 2, 1, 0, '2022-02-19 09:47:08'),
(7, 'Balcony', 2, 1, 0, '2022-02-19 09:47:15'),
(8, 'Pool', 2, 1, 0, '2022-02-19 09:47:30'),
(9, 'Garden Space', 2, 1, 0, '2022-02-19 09:47:43'),
(10, 'Internet', 1, 1, 0, '2022-02-19 09:52:07'),
(11, 'Washing Machine', 1, 1, 0, '2022-02-19 09:52:15'),
(12, 'Kids Playing Area', 1, 1, 0, '2022-02-19 09:52:39'),
(13, 'Aquarium', 1, 1, 0, '2023-05-23 16:55:56'),
(14, 'Gaming room', 1, 1, 0, '2023-05-27 14:42:48'),
(15, 'Tenda', 2, 1, 0, '2023-06-03 17:44:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `real_estate_amenities`
--

CREATE TABLE `real_estate_amenities` (
  `real_estate_id` int(30) NOT NULL,
  `amenity_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `real_estate_amenities`
--

INSERT INTO `real_estate_amenities` (`real_estate_id`, `amenity_id`) VALUES
(8, 7),
(8, 4),
(8, 14),
(8, 6),
(8, 9),
(8, 2),
(8, 10),
(8, 12),
(8, 5),
(7, 13),
(7, 7),
(7, 4),
(7, 14),
(7, 6),
(7, 9),
(7, 2),
(7, 10),
(7, 12),
(7, 5),
(7, 3),
(7, 1),
(7, 8),
(7, 15),
(7, 11),
(5, 13),
(5, 7),
(5, 4),
(5, 14),
(5, 6),
(5, 9),
(5, 2),
(5, 10),
(5, 12),
(5, 5),
(5, 3),
(5, 1),
(5, 8),
(5, 15),
(5, 11),
(2, 14),
(3, 13),
(3, 7),
(3, 4),
(3, 14),
(3, 6),
(3, 9),
(3, 2),
(3, 10),
(3, 12),
(3, 5),
(3, 3),
(3, 1),
(3, 8),
(3, 15),
(3, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `real_estate_list`
--

CREATE TABLE `real_estate_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `type_id` int(30) NOT NULL,
  `agent_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Available, 2 = not Available',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `real_estate_list`
--

INSERT INTO `real_estate_list` (`id`, `code`, `name`, `type_id`, `agent_id`, `status`, `date_created`, `date_updated`) VALUES
(2, '20230600001', 'Sample 102', 2, 1, 0, '2022-02-19 14:12:49', '2023-06-11 23:42:51'),
(3, '20230600005', 'Sample Only 101', 3, 1, 0, '2022-02-19 16:00:19', '2023-06-11 23:43:06'),
(5, '20230600004', 'Althia Commercial', 2, 2, 1, '2023-05-24 23:13:47', '2023-06-11 23:42:15'),
(7, '20230600003', 'Samara Residental House', 1, 2, 1, '2023-06-03 13:34:07', '2023-06-11 23:34:37'),
(8, '20230600002', 'Alicante Residental House', 1, 2, 1, '2023-06-03 17:39:16', '2023-06-11 23:30:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `real_estate_meta`
--

CREATE TABLE `real_estate_meta` (
  `real_estate_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `real_estate_meta`
--

INSERT INTO `real_estate_meta` (`real_estate_id`, `meta_field`, `meta_value`) VALUES
(8, 'type', 'Residental house'),
(8, 'purpose', 'Rent'),
(8, 'area', '150 sq. m'),
(8, 'location', 'Alicante Boulevart no 3'),
(8, 'sale_price', '1000000'),
(8, 'coordinates', 'PJGF+RM3, Jl. Jenderal Gatot Subroto, Medang, Kec. Pagedangan, Kabupaten Tangerang, Banten 15334'),
(8, 'description', '&lt;p&gt;&lt;span style=&quot;font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;&lt;font color=&quot;#000000&quot; style=&quot;&quot;&gt;Alicante Cluster are comfortable and beautiful residences located in a peaceful residential neighborhood. Each house is designed with an attractive modern architectural style, with attention to perfect aesthetic details.&lt;/font&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(8, 'thumbnail_path', 'uploads/thumbnails/8.jpg?v=1686499772'),
(7, 'type', 'Residental House'),
(7, 'purpose', 'Rent'),
(7, 'area', '200 sq. m'),
(7, 'location', 'Cluster Samara 30 nomor 7 Tangerang,Banten.'),
(7, 'sale_price', '1500000'),
(7, 'coordinates', 'PJGF+RM3, Jl. Jenderal Gatot Subroto, Medang, Kec. Pagedangan, Kabupaten Tangerang, Banten 15334'),
(7, 'description', '&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;&lt;font color=&quot;#000000&quot; style=&quot;&quot;&gt;Houses in Samara Cluster are charming and cozy residences located in a serene housing community. Each house boasts a unique blend of modern design and inviting aesthetics, making it an ideal place to call home.&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;&lt;font color=&quot;#000000&quot; style=&quot;&quot;&gt;Upon entering Samara Cluster, you\'ll be greeted by well-maintained streets and a tranquil atmosphere. The houses showcase beautiful exteriors, with well-manicured gardens and spacious front yards that create an inviting curb appeal.&lt;/font&gt;&lt;/p&gt;'),
(7, 'thumbnail_path', 'uploads/thumbnails/7.jpg?v=1685774047'),
(5, 'type', 'Commercial House'),
(5, 'purpose', 'Rent'),
(5, 'area', '250 sq. m'),
(5, 'location', 'Ruko Althia nomor 2'),
(5, 'sale_price', '2000000'),
(5, 'coordinates', 'Ruko Althia Boulevard, Jl. Graha Raya Bintaro No.26, Parigi Baru, Kec. Pd. Aren, Kota Tangerang Selatan, Banten 15226'),
(5, 'description', '&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px;&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;The shop houses in the Bintaro area are commercial properties located in a bustling and vibrant neighborhood. These shop houses offer convenient spaces for businesses, creating a dynamic and lively atmosphere.&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px;&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Situated in Bintaro, these shop houses provide prime locations for various types of businesses. Each unit is designed to accommodate commercial activities, with spacious interiors and versatile layouts. The shop houses are typically well-maintained and offer ample display windows, allowing businesses to showcase their products or services effectively.&lt;/font&gt;&lt;/p&gt;'),
(5, 'thumbnail_path', 'uploads/thumbnails/5.jpeg?v=1684944827'),
(2, 'type', 'Retail or Office'),
(2, 'purpose', 'For Rent'),
(2, 'area', '150 sq. m'),
(2, 'location', 'Over here Street, Here City, Anywhere, 2306'),
(2, 'sale_price', '10000'),
(2, 'coordinates', '66.75804, 128.59442'),
(2, 'description', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Integer id sodales elit. Integer rutrum egestas mauris, sit amet volutpat enim egestas at. Vestibulum sit amet placerat leo. Donec accumsan, orci eget scelerisque facilisis, risus nunc rhoncus lorem, nec porttitor ligula massa eget leo. Nulla eget quam id diam rhoncus gravida in eu nunc. Nullam felis enim, lacinia sed turpis sed, pretium blandit libero. Cras ante risus, facilisis quis lobortis ac, imperdiet id nisl.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Quisque orci leo, pellentesque a metus sit amet, sagittis ultricies lectus. Vestibulum eros felis, fringilla tincidunt sagittis egestas, tempus ac eros. Donec ullamcorper scelerisque nisi, ac venenatis leo rhoncus ac. Aliquam sed ex a nisl scelerisque commodo. Donec massa dolor, maximus sit amet tellus at, dictum fringilla neque. Praesent est elit, malesuada quis semper eget, viverra at leo. Morbi sed lectus consequat, congue augue eget, rutrum quam. Quisque fermentum id tortor a iaculis. Aliquam erat volutpat. Proin eget ipsum facilisis, placerat velit quis, ultrices urna.&lt;/p&gt;'),
(2, 'thumbnail_path', 'uploads/thumbnails/2.jpg?v=1645251171'),
(3, 'type', 'Single-Family (Detached)'),
(3, 'purpose', 'For Sale'),
(3, 'area', '350 sq. m.'),
(3, 'location', 'Sample'),
(3, 'sale_price', '300000'),
(3, 'coordinates', '10.686511407672004, 122.96388112114987'),
(3, 'description', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Sed ac pellentesque arcu, in facilisis neque. Aliquam erat volutpat. Suspendisse imperdiet odio ut neque condimentum, sed hendrerit lectus eleifend. Ut tempor molestie dui, laoreet tristique quam scelerisque at. Nulla elementum viverra ipsum, pharetra congue erat malesuada non. Nam commodo nisl vel sapien tincidunt tempor. Fusce vitae mi at enim convallis efficitur sed in justo.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Aliquam nisi quam, interdum at aliquet vel, vehicula vitae justo. Vestibulum lobortis purus a urna condimentum auctor. Nulla venenatis pellentesque tortor nec viverra. Duis aliquet convallis tellus accumsan egestas. Integer maximus vitae magna a interdum. Nunc laoreet justo fermentum dui iaculis tristique. Nam consectetur vel elit id convallis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Vivamus vestibulum id arcu non pulvinar. Donec ut metus sollicitudin, volutpat dui ut, faucibus turpis. Pellentesque rhoncus, eros sed suscipit dictum, dui risus elementum nisi, ut tempor erat libero a sapien. Nunc diam nibh, lobortis eget eros sit amet, vulputate tristique ipsum. Donec in augue massa. Nam pretium nisi in aliquam vehicula. Nam ligula est, accumsan sagittis sem at, vulputate volutpat nulla.&lt;/p&gt;'),
(3, 'thumbnail_path', 'uploads/thumbnails/3.jpg?v=1645258133');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Edwin Bright Management System'),
(6, 'short_name', 'EDWIN BRIGHT PROPERTY'),
(11, 'logo', 'uploads/logo-1686502261.jpg?v=1686502261'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1684942838.jpeg?v=1684942838');

-- --------------------------------------------------------

--
-- Struktur dari tabel `type_list`
--

CREATE TABLE `type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `type_list`
--

INSERT INTO `type_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Residential', 'Residential real estate refers to any property used for housing. These include family homes, cooperatives, duplexes, and condos where the investor or a party renting the property lives in. This type is ideal if you are looking to start building your dream home or begin a family. ', 1, 0, '2022-02-19 10:02:11', NULL),
(2, 'Commercial', 'Commercial real estate refers to any property where the main purpose is to host business operations and services. These properties typically include apartment complexes, stores, gas stations, hotels, hospitals, parking facilities, etc. ', 1, 0, '2022-02-19 10:02:33', NULL),
(3, 'Industrial', 'Industrial real estate refers to all lands, buildings, and other properties that accommodate industrial-sized activities. These activities include production, assembly, warehousing, manufacturing, research, and distribution of goods and products. ', 1, 0, '2022-02-19 10:02:48', NULL),
(4, 'Raw land', 'Raw land typically refers to undeveloped or agricultural land such as farms, ranches, and timberlands. Many investors look at these properties as a good investment because they are tangible and finite resources. Additionally, these properties save you from the trouble of running renovations and worrying over stolen or damaged goods. ', 1, 0, '2022-02-19 10:03:35', NULL),
(5, 'Rumah Pohon', 'Ayunan, Tenda', 1, 1, '2023-06-03 17:43:52', '2023-06-03 17:46:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '202cb962ac59075b964b07152d234b70', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2023-05-24 17:31:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agent_list`
--
ALTER TABLE `agent_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `amenity_list`
--
ALTER TABLE `amenity_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `real_estate_amenities`
--
ALTER TABLE `real_estate_amenities`
  ADD KEY `real_estate_id` (`real_estate_id`),
  ADD KEY `amenity_id` (`amenity_id`);

--
-- Indeks untuk tabel `real_estate_list`
--
ALTER TABLE `real_estate_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indeks untuk tabel `real_estate_meta`
--
ALTER TABLE `real_estate_meta`
  ADD KEY `real_estate_id` (`real_estate_id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `type_list`
--
ALTER TABLE `type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agent_list`
--
ALTER TABLE `agent_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `amenity_list`
--
ALTER TABLE `amenity_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `real_estate_list`
--
ALTER TABLE `real_estate_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `type_list`
--
ALTER TABLE `type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `real_estate_amenities`
--
ALTER TABLE `real_estate_amenities`
  ADD CONSTRAINT `real_estate_amenities_ibfk_1` FOREIGN KEY (`real_estate_id`) REFERENCES `real_estate_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `real_estate_amenities_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenity_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `real_estate_list`
--
ALTER TABLE `real_estate_list`
  ADD CONSTRAINT `real_estate_list_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `real_estate_list_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent_list` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `real_estate_meta`
--
ALTER TABLE `real_estate_meta`
  ADD CONSTRAINT `real_estate_meta_ibfk_1` FOREIGN KEY (`real_estate_id`) REFERENCES `real_estate_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
