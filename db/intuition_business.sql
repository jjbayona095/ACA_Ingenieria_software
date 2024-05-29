-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 28-05-2024 a las 11:39:13
-- Versión del servidor: 10.10.2-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intuition_business`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `collection_account`
--

DROP TABLE IF EXISTS `collection_account`;
CREATE TABLE IF NOT EXISTS `collection_account` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `execution_period` date NOT NULL,
  `end_of_execution_period` date NOT NULL,
  `number_collection_account` varchar(191) NOT NULL,
  `url_file` varchar(100) NOT NULL,
  `send_to_email` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concept_description`
--

DROP TABLE IF EXISTS `concept_description`;
CREATE TABLE IF NOT EXISTS `concept_description` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(191) NOT NULL,
  `state` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `concept_description`
--

INSERT INTO `concept_description` (`id`, `description`, `state`, `created_at`, `updated_at`) VALUES
(4, 'Pago por prestación de servicio como project manager', 1, '2023-09-07 22:33:14', '2023-09-07 22:33:14'),
(3, 'Pago por prestación de los servicios como desarrollador full stack', 1, '2023-09-07 21:38:15', '2023-09-07 21:38:15'),
(6, 'Esto es un cambio', 1, '2023-12-15 00:37:38', '2023-12-15 00:51:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `employment` varchar(191) NOT NULL,
  `identification_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `concept` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `bonus` varchar(191) NOT NULL,
  `discount` varchar(191) NOT NULL,
  `total` varchar(191) NOT NULL,
  `bank` varchar(25) NOT NULL,
  `type_account_bank` varchar(25) NOT NULL,
  `number_account` varchar(25) NOT NULL,
  `consecutive` int(255) DEFAULT NULL,
  `upload_signature` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history_change`
--

DROP TABLE IF EXISTS `history_change`;
CREATE TABLE IF NOT EXISTS `history_change` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL,
  `action` varchar(191) NOT NULL,
  `description_action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `history_change`
--

INSERT INTO `history_change` (`id`, `username`, `action`, `description_action`, `created_at`, `updated_at`) VALUES
(3, 'brillith', 'created', 'The administrator added a new employee Jhonatan López', '2023-04-25 00:31:47', '2023-04-25 00:31:47'),
(116, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 22:37:02', '2023-05-02 22:37:02'),
(115, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 22:35:00', '2023-05-02 22:35:00'),
(114, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 22:33:03', '2023-05-02 22:33:03'),
(113, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 22:30:06', '2023-05-02 22:30:06'),
(112, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 21:10:33', '2023-05-02 21:10:33'),
(111, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:46:16', '2023-05-02 20:46:16'),
(110, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:40:39', '2023-05-02 20:40:39'),
(108, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:37:00', '2023-05-02 20:37:00'),
(109, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:38:09', '2023-05-02 20:38:09'),
(107, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:28:55', '2023-05-02 20:28:55'),
(106, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:26:19', '2023-05-02 20:26:19'),
(105, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:22:30', '2023-05-02 20:22:30'),
(104, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:19:09', '2023-05-02 20:19:09'),
(103, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:18:42', '2023-05-02 20:18:42'),
(102, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:18:23', '2023-05-02 20:18:23'),
(101, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:18:01', '2023-05-02 20:18:01'),
(100, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:11:16', '2023-05-02 20:11:16'),
(99, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:10:09', '2023-05-02 20:10:09'),
(98, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:08:40', '2023-05-02 20:08:40'),
(97, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 20:07:34', '2023-05-02 20:07:34'),
(96, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 19:15:29', '2023-05-02 19:15:29'),
(95, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 18:50:47', '2023-05-02 18:50:47'),
(94, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 20:05:50', '2023-04-28 20:05:50'),
(93, 'brillith', 'created', 'The administrator added a new employee Pepito', '2023-04-28 20:04:36', '2023-04-28 20:04:36'),
(92, 'brillith', 'delete', 'The administrator delete a employee sdfsdf', '2023-04-28 20:03:07', '2023-04-28 20:03:07'),
(91, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 20:02:21', '2023-04-28 20:02:21'),
(90, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 19:56:35', '2023-04-28 19:56:35'),
(89, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 19:54:59', '2023-04-28 19:54:59'),
(88, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 19:52:24', '2023-04-28 19:52:24'),
(87, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 19:51:49', '2023-04-28 19:51:49'),
(86, 'brillith', 'created', 'The administrator added a new employee sdfsdf', '2023-04-28 19:51:24', '2023-04-28 19:51:24'),
(85, 'brillith', 'delete', 'The administrator delete a employee Andrea Fuentes', '2023-04-28 19:50:38', '2023-04-28 19:50:38'),
(84, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 18:44:51', '2023-04-28 18:44:51'),
(83, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 18:40:29', '2023-04-28 18:40:29'),
(82, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 18:39:46', '2023-04-28 18:39:46'),
(81, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 18:39:06', '2023-04-28 18:39:06'),
(80, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 18:35:28', '2023-04-28 18:35:28'),
(79, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 18:34:41', '2023-04-28 18:34:41'),
(77, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 04:32:15', '2023-04-28 04:32:15'),
(78, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-04-28 04:32:17', '2023-04-28 04:32:17'),
(117, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 22:43:47', '2023-05-02 22:43:47'),
(118, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 22:46:19', '2023-05-02 22:46:19'),
(119, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 23:14:00', '2023-05-02 23:14:00'),
(120, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-02 23:22:48', '2023-05-02 23:22:48'),
(121, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-11 21:00:52', '2023-05-11 21:00:52'),
(122, 'brillith', 'created', 'The administrator added a new employee dfsfds', '2023-05-15 18:29:09', '2023-05-15 18:29:09'),
(123, 'brillith', 'delete', 'The administrator delete a employee dfsfds', '2023-05-15 18:29:15', '2023-05-15 18:29:15'),
(124, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-05-15 19:52:17', '2023-05-15 19:52:17'),
(125, 'brillith', 'updated', 'The administrator updated an employee Pepita', '2023-05-15 19:52:51', '2023-05-15 19:52:51'),
(126, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-05-15 19:53:01', '2023-05-15 19:53:01'),
(127, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-05-15 19:57:05', '2023-05-15 19:57:05'),
(128, 'brillith', 'updated', 'The administrator updated an employee Didu', '2023-05-15 19:57:16', '2023-05-15 19:57:16'),
(129, 'brillith', 'updated', 'The administrator updated an employee Didu', '2023-05-15 19:57:23', '2023-05-15 19:57:23'),
(130, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:13:15', '2023-05-15 20:13:15'),
(131, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:13:40', '2023-05-15 20:13:40'),
(132, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:28:16', '2023-05-15 20:28:16'),
(133, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:28:51', '2023-05-15 20:28:51'),
(134, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:30:04', '2023-05-15 20:30:04'),
(135, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:31:08', '2023-05-15 20:31:08'),
(136, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:31:47', '2023-05-15 20:31:47'),
(137, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:36:28', '2023-05-15 20:36:28'),
(138, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:37:22', '2023-05-15 20:37:22'),
(139, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:37:55', '2023-05-15 20:37:55'),
(140, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:38:41', '2023-05-15 20:38:41'),
(141, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:39:54', '2023-05-15 20:39:54'),
(142, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 20:43:14', '2023-05-15 20:43:14'),
(143, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-15 21:31:46', '2023-05-15 21:31:46'),
(144, 'brillith', 'updated', 'The administrator updated an employee Didu', '2023-05-15 21:57:24', '2023-05-15 21:57:24'),
(145, 'brillith', 'updated', 'The administrator updated an employee Jhonatan López', '2023-05-15 22:30:23', '2023-05-15 22:30:23'),
(146, 'brillith', 'updated', 'The administrator updated an employee Fernando', '2023-05-15 22:47:40', '2023-05-15 22:47:40'),
(147, 'brillith', 'updated', 'The administrator updated an employee Jhonatan López', '2023-05-31 20:59:15', '2023-05-31 20:59:15'),
(148, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-05-31 20:59:28', '2023-05-31 20:59:28'),
(149, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 20:55:18', '2023-07-19 20:55:18'),
(150, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 20:56:20', '2023-07-19 20:56:20'),
(151, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 20:58:16', '2023-07-19 20:58:16'),
(152, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 20:59:20', '2023-07-19 20:59:20'),
(153, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 21:00:02', '2023-07-19 21:00:02'),
(154, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 21:00:02', '2023-07-19 21:00:02'),
(155, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-19 21:01:23', '2023-07-19 21:01:23'),
(156, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:23:01', '2023-07-21 18:23:01'),
(157, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:25:37', '2023-07-21 18:25:37'),
(158, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:28:18', '2023-07-21 18:28:18'),
(159, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:32:27', '2023-07-21 18:32:27'),
(160, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:33:09', '2023-07-21 18:33:09'),
(161, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:35:23', '2023-07-21 18:35:23'),
(162, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:36:03', '2023-07-21 18:36:03'),
(163, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:36:30', '2023-07-21 18:36:30'),
(164, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:37:43', '2023-07-21 18:37:43'),
(165, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:38:30', '2023-07-21 18:38:30'),
(166, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:38:58', '2023-07-21 18:38:58'),
(167, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:40:46', '2023-07-21 18:40:46'),
(168, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:41:53', '2023-07-21 18:41:53'),
(169, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:44:38', '2023-07-21 18:44:38'),
(170, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:45:46', '2023-07-21 18:45:46'),
(171, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:51:22', '2023-07-21 18:51:22'),
(172, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:54:15', '2023-07-21 18:54:15'),
(173, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-07-21 18:55:38', '2023-07-21 18:55:38'),
(174, 'brillith', 'updated', 'The administrator updated an employee Jhonatan López', '2023-07-21 19:17:24', '2023-07-21 19:17:24'),
(175, 'brillith', 'delete', 'The administrator delete a employee Fernando', '2023-07-21 19:21:10', '2023-07-21 19:21:10'),
(176, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 07:43:20', '2023-08-09 07:43:20'),
(177, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 07:43:24', '2023-08-09 07:43:24'),
(178, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 07:43:35', '2023-08-09 07:43:35'),
(179, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 07:46:50', '2023-08-09 07:46:50'),
(180, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 07:48:11', '2023-08-09 07:48:11'),
(181, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 07:50:07', '2023-08-09 07:50:07'),
(182, 'brillith', 'created', 'The administrator added a new employee Lirio', '2023-08-09 08:01:07', '2023-08-09 08:01:07'),
(183, 'brillith', 'delete', 'The administrator delete a employee Lirio', '2023-08-09 08:09:06', '2023-08-09 08:09:06'),
(184, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-09 08:11:02', '2023-08-09 08:11:02'),
(185, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-09 08:11:43', '2023-08-09 08:11:43'),
(186, 'brillith', 'delete', 'The administrator delete a employee Lirio', '2023-08-11 19:32:56', '2023-08-11 19:32:56'),
(187, 'brillith', 'updated', 'The administrator updated an employee Jhonatan López', '2023-08-11 19:33:51', '2023-08-11 19:33:51'),
(188, 'brillith', 'updated', 'The administrator updated an employee Jhonatan López', '2023-08-11 19:34:16', '2023-08-11 19:34:16'),
(189, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-11 19:34:44', '2023-08-11 19:34:44'),
(190, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-11 20:33:51', '2023-08-11 20:33:51'),
(191, 'brillith', 'created', 'The administrator added a new employee Pepito', '2023-08-11 20:43:02', '2023-08-11 20:43:02'),
(192, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-11 20:48:11', '2023-08-11 20:48:11'),
(193, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-11 20:48:12', '2023-08-11 20:48:12'),
(194, 'brillith', 'delete', 'The administrator delete a employee Pepito', '2023-08-14 04:59:18', '2023-08-14 04:59:18'),
(195, 'brillith', 'delete', 'The administrator delete a employee Pepito', '2023-08-14 04:59:50', '2023-08-14 04:59:50'),
(196, 'brillith', 'updated', 'The administrator updated an employee Jhonatan López', '2023-08-14 05:02:39', '2023-08-14 05:02:39'),
(197, 'brillith', 'updated', 'The administrator added a bonus to an employee Pepito', '2023-08-14 05:15:48', '2023-08-14 05:15:48'),
(198, 'brillith', 'updated', 'The administrator added a bonus to an employee Pepito', '2023-08-14 05:16:13', '2023-08-14 05:16:13'),
(199, 'brillith', 'updated', 'The administrator added a bonus to an employee Jhonatan López', '2023-08-14 05:17:19', '2023-08-14 05:17:19'),
(200, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-14 20:20:37', '2023-08-14 20:20:37'),
(201, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-14 20:20:45', '2023-08-14 20:20:45'),
(202, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-15 18:46:04', '2023-08-15 18:46:04'),
(203, 'brillith', 'generated', 'The administrator generates a collection account from the employees', '2023-08-15 18:46:10', '2023-08-15 18:46:10'),
(204, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan López', '2023-08-15 18:46:58', '2023-08-15 18:46:58'),
(205, 'brillith', 'generated', 'The administrator generates a collection account Pepito', '2023-08-15 18:46:58', '2023-08-15 18:46:58'),
(206, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-08-15 19:00:56', '2023-08-15 19:00:56'),
(207, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:01:12', '2023-08-15 19:01:12'),
(208, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:02:52', '2023-08-15 19:02:52'),
(209, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:02:58', '2023-08-15 19:02:58'),
(210, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:03:15', '2023-08-15 19:03:15'),
(211, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:03:25', '2023-08-15 19:03:25'),
(212, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:04:04', '2023-08-15 19:04:04'),
(213, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:05:45', '2023-08-15 19:05:45'),
(214, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:06:06', '2023-08-15 19:06:06'),
(215, 'brillith', 'delete', 'The administrator delete a employee Jhonatan López', '2023-08-15 19:10:26', '2023-08-15 19:10:26'),
(216, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:12:31', '2023-08-15 19:12:31'),
(217, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:14:12', '2023-08-15 19:14:12'),
(218, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:14:19', '2023-08-15 19:14:19'),
(219, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:14:30', '2023-08-15 19:14:30'),
(220, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-15 19:23:10', '2023-08-15 19:23:10'),
(221, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:23:54', '2023-08-15 19:23:54'),
(222, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:24:07', '2023-08-15 19:24:07'),
(223, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:24:34', '2023-08-15 19:24:34'),
(224, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-15 19:25:05', '2023-08-15 19:25:05'),
(225, 'brillith', 'updated', 'The administrator added a bonus to an employee Jhonatan Lopez', '2023-08-15 19:30:56', '2023-08-15 19:30:56'),
(226, 'brillith', 'updated', 'The administrator added a bonus to an employee Jhonatan Lopez', '2023-08-15 19:31:11', '2023-08-15 19:31:11'),
(227, 'brillith', 'updated', 'The administrator added a bonus to an employee Jhonatan Lopez', '2023-08-16 02:15:11', '2023-08-16 02:15:11'),
(228, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-16 02:15:49', '2023-08-16 02:15:49'),
(229, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-16 02:16:50', '2023-08-16 02:16:50'),
(230, 'brillith', 'generated', 'The administrator generates a collection account Pepito', '2023-08-16 20:49:43', '2023-08-16 20:49:43'),
(231, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-16 20:49:52', '2023-08-16 20:49:52'),
(232, 'brillith', 'updated', 'The administrator added a bonus to an employee Jhonatan Lopez', '2023-08-29 00:41:09', '2023-08-29 00:41:09'),
(233, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 01:07:02', '2023-08-29 01:07:02'),
(234, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 01:08:22', '2023-08-29 01:08:22'),
(235, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-29 01:09:33', '2023-08-29 01:09:33'),
(236, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-29 01:09:57', '2023-08-29 01:09:57'),
(237, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-29 01:10:05', '2023-08-29 01:10:05'),
(238, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-29 01:10:11', '2023-08-29 01:10:11'),
(239, 'brillith', 'updated', 'The administrator updated an employee Pepito', '2023-08-29 01:11:22', '2023-08-29 01:11:22'),
(240, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 01:11:29', '2023-08-29 01:11:29'),
(241, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 01:11:57', '2023-08-29 01:11:57'),
(242, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 01:12:09', '2023-08-29 01:12:09'),
(243, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 01:12:14', '2023-08-29 01:12:14'),
(244, 'brillith', 'created', 'The administrator added a new employee Jhonatanasdasd', '2023-08-29 01:14:23', '2023-08-29 01:14:23'),
(245, 'brillith', 'updated', 'The administrator updated an employee Jhonatanasdasd', '2023-08-29 01:15:04', '2023-08-29 01:15:04'),
(246, 'brillith', 'updated', 'The administrator updated an employee Jhonatanasdasd', '2023-08-29 01:15:10', '2023-08-29 01:15:10'),
(247, 'brillith', 'updated', 'The administrator updated an employee Jhonatanasdasd', '2023-08-29 01:17:47', '2023-08-29 01:17:47'),
(248, 'brillith', 'updated', 'The administrator updated an employee Jhonatanasdasd', '2023-08-29 01:17:54', '2023-08-29 01:17:54'),
(249, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 01:50:43', '2023-08-29 01:50:43'),
(250, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 01:54:45', '2023-08-29 01:54:45'),
(251, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:14:37', '2023-08-29 02:14:37'),
(252, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:15:56', '2023-08-29 02:15:56'),
(253, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:16:32', '2023-08-29 02:16:32'),
(254, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:17:55', '2023-08-29 02:17:55'),
(255, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:18:21', '2023-08-29 02:18:21'),
(256, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:19:28', '2023-08-29 02:19:28'),
(257, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:19:40', '2023-08-29 02:19:40'),
(258, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:20:04', '2023-08-29 02:20:04'),
(259, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:21:09', '2023-08-29 02:21:09'),
(260, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:22:58', '2023-08-29 02:22:58'),
(261, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:24:32', '2023-08-29 02:24:32'),
(262, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:26:02', '2023-08-29 02:26:02'),
(263, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:27:48', '2023-08-29 02:27:48'),
(264, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:28:48', '2023-08-29 02:28:48'),
(265, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:29:41', '2023-08-29 02:29:41'),
(266, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:32:15', '2023-08-29 02:32:15'),
(267, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:32:57', '2023-08-29 02:32:57'),
(268, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:33:58', '2023-08-29 02:33:58'),
(269, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:34:52', '2023-08-29 02:34:52'),
(270, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:35:31', '2023-08-29 02:35:31'),
(271, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:37:46', '2023-08-29 02:37:46'),
(272, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:38:14', '2023-08-29 02:38:14'),
(273, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:42:10', '2023-08-29 02:42:10'),
(274, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:43:30', '2023-08-29 02:43:30'),
(275, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:44:14', '2023-08-29 02:44:14'),
(276, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:45:23', '2023-08-29 02:45:23'),
(277, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:45:50', '2023-08-29 02:45:50'),
(278, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:47:03', '2023-08-29 02:47:03'),
(279, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:47:36', '2023-08-29 02:47:36'),
(280, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:47:51', '2023-08-29 02:47:51'),
(281, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:48:13', '2023-08-29 02:48:13'),
(282, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-08-29 02:49:15', '2023-08-29 02:49:15'),
(283, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:49:32', '2023-08-29 02:49:32'),
(284, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:50:56', '2023-08-29 02:50:56'),
(285, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-08-29 02:53:13', '2023-08-29 02:53:13'),
(286, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-04 20:51:27', '2023-09-04 20:51:27'),
(287, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-04 20:53:43', '2023-09-04 20:53:43'),
(288, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-09-04 20:54:20', '2023-09-04 20:54:20'),
(289, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-09-04 20:58:08', '2023-09-04 20:58:08'),
(290, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-09-04 21:08:32', '2023-09-04 21:08:32'),
(291, 'brillith', 'delete', 'The administrator delete a employee Jhonatanasdasd', '2023-09-04 21:09:18', '2023-09-04 21:09:18'),
(292, 'brillith', 'delete', 'The administrator delete a employee Jhonatan Lopez', '2023-09-04 21:12:43', '2023-09-04 21:12:43'),
(293, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-07 22:34:04', '2023-09-07 22:34:04'),
(294, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-07 22:35:41', '2023-09-07 22:35:41'),
(295, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-07 22:39:32', '2023-09-07 22:39:32'),
(296, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-07 22:40:14', '2023-09-07 22:40:14'),
(297, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-08 01:30:36', '2023-09-08 01:30:36'),
(298, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-08 01:33:19', '2023-09-08 01:33:19'),
(299, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-09-08 01:33:37', '2023-09-08 01:33:37'),
(300, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 19:39:41', '2023-09-12 19:39:41'),
(301, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 19:41:24', '2023-09-12 19:41:24'),
(302, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 19:41:39', '2023-09-12 19:41:39'),
(303, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 19:44:57', '2023-09-12 19:44:57'),
(304, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 19:46:18', '2023-09-12 19:46:18'),
(305, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 19:47:45', '2023-09-12 19:47:45'),
(306, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 20:29:17', '2023-09-12 20:29:17'),
(307, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 20:37:25', '2023-09-12 20:37:25'),
(308, 'brillith', 'created', 'The administrator added a new employee Jhonatan Lopez', '2023-09-12 20:39:11', '2023-09-12 20:39:11'),
(309, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2023-09-22 01:10:36', '2023-09-22 01:10:36'),
(310, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-12-19 00:47:58', '2023-12-19 00:47:58'),
(311, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-12-19 00:48:16', '2023-12-19 00:48:16'),
(312, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-12-19 00:49:19', '2023-12-19 00:49:19'),
(313, 'brillith', 'updated', 'The administrator updated an employee Jhonatan Lopez', '2023-12-19 00:50:04', '2023-12-19 00:50:04'),
(314, 'brillith', 'generated', 'The administrator generates a collection account Jhonatan Lopez', '2024-05-17 19:28:46', '2024-05-17 19:28:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_position`
--

DROP TABLE IF EXISTS `job_position`;
CREATE TABLE IF NOT EXISTS `job_position` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(191) NOT NULL,
  `state` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `job_position`
--

INSERT INTO `job_position` (`id`, `description`, `state`, `created_at`, `updated_at`) VALUES
(2, 'Programador', 1, '2023-09-07 22:43:21', '2023-09-07 22:43:21'),
(3, 'Manager', 1, '2023-09-07 23:24:55', '2023-09-07 23:24:55'),
(9, 'Test1', 1, '2023-12-14 23:31:22', '2023-12-14 23:31:22'),
(10, 'test2', 1, '2023-12-14 23:31:31', '2023-12-14 23:31:31'),
(11, 'test3', 1, '2023-12-14 23:31:38', '2023-12-14 23:31:38'),
(12, 'test4', 1, '2023-12-14 23:31:44', '2023-12-14 23:31:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_17_141914_create_employees_table', 1),
(6, '2023_04_24_164824_create_history_change_table', 2),
(7, '2023_04_27_153018_create_collection_account_table', 3),
(8, '2023_09_07_154350_concept_description', 4),
(9, '2023_09_07_154941_job_positions', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `api_token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'brillith', 'brillithsaenz@intuitionbusiness.co', NULL, '$2y$10$wSXOIxrc9LhsdJg5.MNTau.2TUyOk/IPizSKkd5UhSuHxKVPWADYm', 'admin', '42|9ugUNCEZvQyYpBiKBUNTBGvsJMNnqSJp6uN4Hrh8', NULL, '2023-04-18 19:41:15', '2024-05-17 20:05:17');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `collection_account`
--
ALTER TABLE `collection_account`
  ADD CONSTRAINT `collection_account_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
