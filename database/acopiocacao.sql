-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-03-2022 a las 23:07:17
-- Versión del servidor: 8.0.27
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acopiocacao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE IF NOT EXISTS `almacen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empresa_id` int NOT NULL,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `tipo_almacen_id` int NOT NULL,
  `ubicacion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D5B2D250D17F50A6` (`uuid`),
  KEY `IDX_D5B2D250521E1991` (`empresa_id`),
  KEY `IDX_D5B2D25053C8D32C` (`propietario_id`),
  KEY `IDX_D5B2D25024DB0683` (`config_id`),
  KEY `IDX_D5B2D250D1A9C40` (`tipo_almacen_id`),
  KEY `IDX_D5B2D25057E759E8` (`ubicacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id`, `empresa_id`, `propietario_id`, `config_id`, `nombre`, `direccion`, `created_at`, `updated_at`, `activo`, `uuid`, `tipo_almacen_id`, `ubicacion_id`) VALUES
(1, 1, 2, 2, 'Sol y Cafe', 'Urb G20', '2022-02-25 05:13:43', '2022-03-01 21:08:40', 1, 0xd514eed4a5f84c9c8948180a8b94f635, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_parcela`
--

DROP TABLE IF EXISTS `area_parcela`;
CREATE TABLE IF NOT EXISTS `area_parcela` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` decimal(5,2) NOT NULL,
  `produccion` decimal(5,2) DEFAULT NULL,
  `crecimiento` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `area_parcela`
--

INSERT INTO `area_parcela` (`id`, `total`, `produccion`, `crecimiento`) VALUES
(1, '12.00', '5.00', '7.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_social`
--

DROP TABLE IF EXISTS `base_social`;
CREATE TABLE IF NOT EXISTS `base_social` (
  `id` int NOT NULL AUTO_INCREMENT,
  `localidad_id` int NOT NULL,
  `almacen_acopio_id` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_190179EED17F50A6` (`uuid`),
  KEY `IDX_190179EE67707C89` (`localidad_id`),
  KEY `IDX_190179EE489F4A45` (`almacen_acopio_id`),
  KEY `IDX_190179EE53C8D32C` (`propietario_id`),
  KEY `IDX_190179EE24DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `base_social`
--

INSERT INTO `base_social` (`id`, `localidad_id`, `almacen_acopio_id`, `nombre`, `descripcion`, `propietario_id`, `config_id`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(1, 1, 1, 'Mi Base', NULL, 2, 2, '2022-02-25 08:20:31', '2022-02-25 08:20:31', 1, 0xc41b2d31945d432ba65688e2af5fafca);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificacion`
--

DROP TABLE IF EXISTS `certificacion`;
CREATE TABLE IF NOT EXISTS `certificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `padre_id` int DEFAULT NULL,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A1F20253D17F50A6` (`uuid`),
  KEY `IDX_A1F20253613CEC58` (`padre_id`),
  KEY `IDX_A1F2025353C8D32C` (`propietario_id`),
  KEY `IDX_A1F2025324DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `certificacion`
--

INSERT INTO `certificacion` (`id`, `padre_id`, `propietario_id`, `config_id`, `nombre`, `alias`, `descripcion`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(1, NULL, 2, 2, 'Orgánico', 'Orgánico', NULL, '2022-02-23 17:04:42', '2022-02-23 17:04:42', 1, 0x3cb113c847a747178d02ee589120276b),
(2, NULL, 2, 2, 'Transición', 'TR', NULL, '2022-02-23 17:06:48', '2022-02-23 17:06:48', 1, 0x71713f7ddfc0476f98a3e4a7bd48d12c),
(3, 2, 2, 2, 'Transición 1', 'T1', NULL, '2022-02-23 17:07:04', '2022-02-23 17:07:04', 1, 0x6427fe23e4bc4b5783db7895ded6c5a5),
(4, 2, 2, 2, 'Transicion 2', 'TR2', NULL, '2022-02-24 05:52:13', '2022-02-24 05:52:13', 1, 0xdc833a23bc9c4f26b4d2d38b2d2b2f9e),
(5, 2, 2, 2, 'Transición 3', 'TR3', NULL, '2022-02-25 03:27:21', '2022-02-25 03:27:21', 1, 0x6389cdb1810c468a9e1ef70fbf0655fa);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `alias` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_corto` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D48A2F7CD17F50A6` (`uuid`),
  KEY `IDX_D48A2F7C53C8D32C` (`propietario_id`),
  KEY `IDX_D48A2F7C24DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`id`, `propietario_id`, `config_id`, `alias`, `nombre`, `nombre_corto`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(2, NULL, NULL, 'Cacao', 'Acopio Cacao', 'Cacao', '2022-02-21 05:13:50', '2022-02-25 10:10:34', 1, 0xa5efa1d74bec4c8894c52c21ae4f5342);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_config_menu_menus`
--

DROP TABLE IF EXISTS `config_config_menu_menus`;
CREATE TABLE IF NOT EXISTS `config_config_menu_menus` (
  `config_id` int NOT NULL,
  `config_menu_id` int NOT NULL,
  PRIMARY KEY (`config_id`,`config_menu_id`),
  KEY `IDX_A8E9CD3124DB0683` (`config_id`),
  KEY `IDX_A8E9CD31B9CB2BE2` (`config_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `config_config_menu_menus`
--

INSERT INTO `config_config_menu_menus` (`config_id`, `config_menu_id`) VALUES
(2, 4),
(2, 5),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_menu`
--

DROP TABLE IF EXISTS `config_menu`;
CREATE TABLE IF NOT EXISTS `config_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `config_menu`
--

INSERT INTO `config_menu` (`id`, `name`, `route`, `activo`) VALUES
(4, 'Usuarios Listado', 'usuario_index', 1),
(5, 'Configuración Menu', 'config_menu_index', 1),
(7, 'Roles usuario', 'usuario_rol_index', 1),
(8, 'Menu Listado', 'menu_index', 1),
(9, 'Socios Listado', 'socio_index', 1),
(10, 'Lotes Listado', 'lote_index', 1),
(11, 'Empresa Listado', 'empresa_index', 1),
(12, 'Productos Listado', 'producto_index', 1),
(13, 'Periodos Listado', 'periodo_index', 1),
(14, 'Certificación Listado', 'certificacion_index', 1),
(15, 'Almacen Listado', 'almacen_index', 1),
(16, 'Localidad Listado', 'localidad_index', 1),
(17, 'Bases Listado', 'base_social_index', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenadas`
--

DROP TABLE IF EXISTS `coordenadas`;
CREATE TABLE IF NOT EXISTS `coordenadas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitud` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitud` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitud` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcela_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_979E70791491307D` (`parcela_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220221045355', '2022-02-21 04:54:03', 1677),
('DoctrineMigrations\\Version20220221061225', '2022-02-21 06:12:54', 263),
('DoctrineMigrations\\Version20220221064857', '2022-02-21 06:49:03', 412),
('DoctrineMigrations\\Version20220221205828', '2022-02-21 20:58:33', 767),
('DoctrineMigrations\\Version20220222232713', '2022-02-23 19:20:30', 166),
('DoctrineMigrations\\Version20220222233325', '2022-02-23 19:20:30', 488),
('DoctrineMigrations\\Version20220223010532', '2022-02-23 01:05:49', 914),
('DoctrineMigrations\\Version20220223084452', '2022-02-23 08:44:56', 218),
('DoctrineMigrations\\Version20220223165740', '2022-02-23 16:57:48', 609),
('DoctrineMigrations\\Version20220223192118', '2022-02-23 19:21:22', 580),
('DoctrineMigrations\\Version20220223225703', '2022-02-23 22:57:15', 351),
('DoctrineMigrations\\Version20220223230001', '2022-02-23 23:00:05', 83),
('DoctrineMigrations\\Version20220223233735', '2022-02-23 23:37:39', 567),
('DoctrineMigrations\\Version20220224233558', '2022-02-24 23:36:11', 1248),
('DoctrineMigrations\\Version20220224235857', '2022-02-24 23:59:00', 294),
('DoctrineMigrations\\Version20220225000111', '2022-02-25 00:01:17', 248),
('DoctrineMigrations\\Version20220225030150', '2022-02-25 03:24:45', 117),
('DoctrineMigrations\\Version20220225032535', '2022-02-25 03:25:44', 333),
('DoctrineMigrations\\Version20220225034238', '2022-02-25 03:42:43', 362),
('DoctrineMigrations\\Version20220225040330', '2022-02-25 04:03:33', 567),
('DoctrineMigrations\\Version20220225041224', '2022-02-25 04:12:28', 152),
('DoctrineMigrations\\Version20220225051057', '2022-02-25 05:11:02', 656),
('DoctrineMigrations\\Version20220225073025', '2022-02-25 07:30:38', 562),
('DoctrineMigrations\\Version20220225082021', '2022-02-25 08:20:25', 576),
('DoctrineMigrations\\Version20220225101109', '2022-02-25 10:11:26', 534),
('DoctrineMigrations\\Version20220228203432', '2022-02-28 20:34:43', 145),
('DoctrineMigrations\\Version20220301234346', '2022-03-01 23:44:11', 906),
('DoctrineMigrations\\Version20220303163005', '2022-03-03 16:30:17', 915);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8D75A50D17F50A6` (`uuid`),
  KEY `IDX_B8D75A5053C8D32C` (`propietario_id`),
  KEY `IDX_B8D75A5024DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `propietario_id`, `config_id`, `nombre`, `ruc`, `direccion`, `email`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(1, 2, 2, 'ACUSTICA PROYECTOS EIRL', '20602760945', 'Urb. Popular G - 20', 'info@acusticaproyectos.com', '2022-02-25 03:29:33', '2022-02-25 03:29:33', 1, 0xb12e534efe5249ca84cd208403a57afd);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_periodo`
--

DROP TABLE IF EXISTS `estado_periodo`;
CREATE TABLE IF NOT EXISTS `estado_periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_periodo`
--

INSERT INTO `estado_periodo` (`id`, `estado`) VALUES
(1, 'Abierto'),
(2, 'Cerrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_ruc`
--

DROP TABLE IF EXISTS `estado_ruc`;
CREATE TABLE IF NOT EXISTS `estado_ruc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado_ruc` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_ruc`
--

INSERT INTO `estado_ruc` (`id`, `estado_ruc`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_socio`
--

DROP TABLE IF EXISTS `estado_socio`;
CREATE TABLE IF NOT EXISTS `estado_socio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado_socio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_socio`
--

INSERT INTO `estado_socio` (`id`, `estado_socio`) VALUES
(1, 'Habilitado'),
(2, 'Sancionado'),
(3, 'Retirado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estimacion`
--

DROP TABLE IF EXISTS `estimacion`;
CREATE TABLE IF NOT EXISTS `estimacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `certificacion_id` int NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `socio_periodos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D9C1F02693EA4CA` (`certificacion_id`),
  KEY `IDX_1D9C1F0292A0549A` (`socio_periodos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estimacion`
--

INSERT INTO `estimacion` (`id`, `certificacion_id`, `cantidad`, `socio_periodos_id`) VALUES
(7, 1, '23.00', 10),
(8, 1, '15.00', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `padre_id` int DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propietario_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `config_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4F68E010D17F50A6` (`uuid`),
  KEY `IDX_4F68E010613CEC58` (`padre_id`),
  KEY `IDX_4F68E01053C8D32C` (`propietario_id`),
  KEY `IDX_4F68E01024DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2680 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(1, 2055, 'Amazonas', '010000', 2, '2022-02-25 04:03:57', '2022-02-25 04:03:57', 1, 0xa55979bb27fc4a97a9cbe684a23fdbe6, 2),
(2, 1, 'Chachapoyas', '010100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x00000000000000000000000000000000, 2),
(3, 2, 'Chachapoyas', '010101', 2, '2022-02-28 18:13:35', '2022-02-28 18:13:35', 1, 0x31280e8cda9448d1b70bf74541b6146b, 2),
(4, 2, 'Asuncion', '010102', 2, '2022-02-28 18:30:10', '2022-02-28 18:30:10', 1, 0x757806c621fa49fba2fd21a5e3817dd5, 2),
(5, 2, 'Balsas', '010103', 2, '2022-02-28 18:32:02', '2022-02-28 18:32:02', 1, 0xe96f6771d6894be38601681714274dca, 2),
(6, 2, 'Cheto', '010104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35646364653661642d393863352d3131, 2),
(7, 2, 'Chiliquin', '010105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653730376334362d393863352d3131, 2),
(8, 2, 'Chuquibamba', '010106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653731363461662d393863352d3131, 2),
(9, 2, 'Granada', '010107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653731613032332d393863352d3131, 2),
(10, 2, 'Huancas', '010108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653731643465612d393863352d3131, 2),
(11, 2, 'La Jalca', '010109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653732303935652d393863352d3131, 2),
(12, 2, 'Leimebamba', '010110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653732336662312d393863352d3131, 2),
(13, 2, 'Levanto', '010111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653732373034382d393863352d3131, 2),
(14, 2, 'Magdalena', '010112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653732613362652d393863352d3131, 2),
(15, 2, 'Mariscal Castilla', '010113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653732646364362d393863352d3131, 2),
(16, 2, 'Molinopampa', '010114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653733313932302d393863352d3131, 2),
(17, 2, 'Montevideo', '010115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653733333834622d393863352d3131, 2),
(18, 2, 'Olleros', '010116', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653733363634622d393863352d3131, 2),
(19, 2, 'Quinjalca', '010117', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653733393462652d393863352d3131, 2),
(20, 2, 'San Francisco De Daguas', '010118', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653733623230312d393863352d3131, 2),
(21, 2, 'San Isidro De Maino', '010119', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653733643665322d393863352d3131, 2),
(22, 2, 'Soloco', '010120', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734303631632d393863352d3131, 2),
(23, 2, 'Sonche', '010121', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734323731332d393863352d3131, 2),
(24, 1, 'Bagua', '010200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734353233662d393863352d3131, 2),
(25, 24, 'Bagua', '010201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734373232362d393863352d3131, 2),
(26, 24, 'Aramango', '010202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734396634322d393863352d3131, 2),
(27, 24, 'Copallin', '010203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734636565372d393863352d3131, 2),
(28, 24, 'El Parco', '010204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653734656363622d393863352d3131, 2),
(29, 24, 'Imaza', '010205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735306635302d393863352d3131, 2),
(30, 24, 'La Peca', '010206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735326663342d393863352d3131, 2),
(31, 1, 'Bongara', '010300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735356566332d393863352d3131, 2),
(32, 31, 'Jumbilla', '010301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735386237382d393863352d3131, 2),
(33, 31, 'Chisquilla', '010302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735616338632d393863352d3131, 2),
(34, 31, 'Churuja', '010303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735643862392d393863352d3131, 2),
(35, 31, 'Corosha', '010304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653735666139322d393863352d3131, 2),
(36, 31, 'Cuispes', '010305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653736316237322d393863352d3131, 2),
(37, 31, 'Florida', '010306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653736343935652d393863352d3131, 2),
(38, 31, 'Jazan', '010307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653736363839652d393863352d3131, 2),
(39, 31, 'Recta', '010308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653736393634652d393863352d3131, 2),
(40, 31, 'San Carlos', '010309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653736633735342d393863352d3131, 2),
(41, 31, 'Shipasbamba', '010310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653736653430352d393863352d3131, 2),
(42, 31, 'Valera', '010311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653737313436362d393863352d3131, 2),
(43, 31, 'Yambrasbamba', '010312', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653737333236372d393863352d3131, 2),
(44, 1, 'Condorcanqui', '010400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653737363236632d393863352d3131, 2),
(45, 44, 'Nieva', '010401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653737386633652d393863352d3131, 2),
(46, 44, 'El Cenepa', '010402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653737616439332d393863352d3131, 2),
(47, 44, 'Rio Santiago', '010403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653737646266302d393863352d3131, 2),
(48, 1, 'Luya', '010500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653738303739312d393863352d3131, 2),
(49, 48, 'Lamud', '010501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653738323837392d393863352d3131, 2),
(50, 48, 'Camporredondo', '010502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653738353461392d393863352d3131, 2),
(51, 48, 'Cocabamba', '010503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653738383235642d393863352d3131, 2),
(52, 48, 'Colcamar', '010504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653738613133352d393863352d3131, 2),
(53, 48, 'Conila', '010505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653738646139312d393863352d3131, 2),
(54, 48, 'Inguilpata', '010506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653739303539392d393863352d3131, 2),
(55, 48, 'Longuita', '010507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653739336331392d393863352d3131, 2),
(56, 48, 'Lonya Chico', '010508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653739373835662d393863352d3131, 2),
(57, 48, 'Luya', '010509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653739393939642d393863352d3131, 2),
(58, 48, 'Luya Viejo', '010510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653739636161622d393863352d3131, 2),
(59, 48, 'Maria', '010511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761303563612d393863352d3131, 2),
(60, 48, 'Ocalli', '010512', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761323437362d393863352d3131, 2),
(61, 48, 'Ocumal', '010513', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761353739322d393863352d3131, 2),
(62, 48, 'Pisuquia', '010514', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761373765342d393863352d3131, 2),
(63, 48, 'Providencia', '010515', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761623536362d393863352d3131, 2),
(64, 48, 'San Cristobal', '010516', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761643830312d393863352d3131, 2),
(65, 48, 'San Francisco Del Yeso', '010517', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653761663561322d393863352d3131, 2),
(66, 48, 'San Jeronimo', '010518', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653762323734362d393863352d3131, 2),
(67, 48, 'San Juan De Lopecancha', '010519', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653762353531612d393863352d3131, 2),
(68, 48, 'Santa Catalina', '010520', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653762373533352d393863352d3131, 2),
(69, 48, 'Santo Tomas', '010521', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653762613238352d393863352d3131, 2),
(70, 48, 'Tingo', '010522', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653762643065372d393863352d3131, 2),
(71, 48, 'Trita', '010523', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653762663063382d393863352d3131, 2),
(72, 1, 'Rodriguez De Mendoza', '010600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653763333362312d393863352d3131, 2),
(73, 72, 'San Nicolas', '010601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653763353261632d393863352d3131, 2),
(74, 72, 'Chirimoto', '010602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653763383164652d393863352d3131, 2),
(75, 72, 'Cochamal', '010603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653763633235652d393863352d3131, 2),
(76, 72, 'Huambo', '010604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653763646634652d393863352d3131, 2),
(77, 72, 'Limabamba', '010605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653764306664662d393863352d3131, 2),
(78, 72, 'Longar', '010606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653764336363352d393863352d3131, 2),
(79, 72, 'Mariscal Benavides', '010607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653764356365312d393863352d3131, 2),
(80, 72, 'Milpuc', '010608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653764393930632d393863352d3131, 2),
(81, 72, 'Omia', '010609', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653764623637642d393863352d3131, 2),
(82, 72, 'Santa Rosa', '010610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653764653731642d393863352d3131, 2),
(83, 72, 'Totora', '010611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653765313732342d393863352d3131, 2),
(84, 72, 'Vista Alegre', '010612', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653765343463372d393863352d3131, 2),
(85, 1, 'Utcubamba', '010700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653765376338342d393863352d3131, 2),
(86, 85, 'Bagua Grande', '010701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653765623565362d393863352d3131, 2),
(87, 85, 'Cajaruro', '010702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653765653036392d393863352d3131, 2),
(88, 85, 'Cumba', '010703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653766313930332d393863352d3131, 2),
(89, 85, 'El Milagro', '010704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653766356361632d393863352d3131, 2),
(90, 85, 'Jamalca', '010705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653766383939612d393863352d3131, 2),
(91, 85, 'Lonya Grande', '010706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653766623934332d393863352d3131, 2),
(92, 85, 'Yamon', '010707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38653766643737332d393863352d3131, 2),
(93, 2055, 'Ancash', '020000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653836373135652d393863362d3131, 2),
(94, 93, 'Huaraz', '020100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653837323634312d393863362d3131, 2),
(95, 94, 'Huaraz', '020101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653837376162622d393863362d3131, 2),
(96, 94, 'Cochabamba', '020102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653837626163382d393863362d3131, 2),
(97, 94, 'Colcabamba', '020103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653837666131382d393863362d3131, 2),
(98, 94, 'Huanchay', '020104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653838323661312d393863362d3131, 2),
(99, 94, 'Independencia', '020105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653838363039302d393863362d3131, 2),
(100, 94, 'Jangas', '020106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653838396162362d393863362d3131, 2),
(101, 94, 'La Libertad', '020107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653838643164322d393863362d3131, 2),
(102, 94, 'Olleros', '020108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653839303332302d393863362d3131, 2),
(103, 94, 'Pampas', '020109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653839333834352d393863362d3131, 2),
(104, 94, 'Pariacoto', '020110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653839363963352d393863362d3131, 2),
(105, 94, 'Pira', '020111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653839613833612d393863362d3131, 2),
(106, 94, 'Tarica', '020112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653839656562662d393863362d3131, 2),
(107, 93, 'Aija', '020200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653861306562642d393863362d3131, 2),
(108, 107, 'Aija', '020201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653861326630612d393863362d3131, 2),
(109, 107, 'Coris', '020202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653861356630382d393863362d3131, 2),
(110, 107, 'Huacllan', '020203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653861393530632d393863362d3131, 2),
(111, 107, 'La Merced', '020204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653861626336392d393863362d3131, 2),
(112, 107, 'Succha', '020205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653861663861342d393863362d3131, 2),
(113, 93, 'Antonio Raymondi', '020300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653862316562392d393863362d3131, 2),
(114, 113, 'Llamellin', '020301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653862343039322d393863362d3131, 2),
(115, 113, 'Aczo', '020302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653862373034322d393863362d3131, 2),
(116, 113, 'Chaccho', '020303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653862386664652d393863362d3131, 2),
(117, 113, 'Chingas', '020304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653862626636632d393863362d3131, 2),
(118, 113, 'Mirgas', '020305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653862646562632d393863362d3131, 2),
(119, 113, 'San Juan De Rontoy', '020306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653863306534362d393863362d3131, 2),
(120, 93, 'Asuncion', '020400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653863336363372d393863362d3131, 2),
(121, 120, 'Chacas', '020401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653863356437312d393863362d3131, 2),
(122, 120, 'Acochaca', '020402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653863386339652d393863362d3131, 2),
(123, 93, 'Bolognesi', '020500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653863623961352d393863362d3131, 2),
(124, 123, 'Chiquian', '020501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653863643866662d393863362d3131, 2),
(125, 123, 'Abelardo Pardo Lezameta', '020502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864303733312d393863362d3131, 2),
(126, 123, 'Antonio Raymondi', '020503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864323735392d393863362d3131, 2),
(127, 123, 'Aquia', '020504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864353732362d393863362d3131, 2),
(128, 123, 'Cajacay', '020505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864383332362d393863362d3131, 2),
(129, 123, 'Canis', '020506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864613131662d393863362d3131, 2),
(130, 123, 'Colquioc', '020507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864636664342d393863362d3131, 2),
(131, 123, 'Huallanca', '020508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653864666339322d393863362d3131, 2),
(132, 123, 'Huasta', '020509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653865313965342d393863362d3131, 2),
(133, 123, 'Huayllacayan', '020510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653865346130372d393863362d3131, 2),
(134, 123, 'La Primavera', '020511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653865363337342d393863362d3131, 2),
(135, 123, 'Mangas', '020512', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653865393537642d393863362d3131, 2),
(136, 123, 'Pacllon', '020513', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653865633533372d393863362d3131, 2),
(137, 123, 'San Miguel De Corpanqui', '020514', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653865646634342d393863362d3131, 2),
(138, 123, 'Ticllos', '020515', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653866313139302d393863362d3131, 2),
(139, 93, 'Carhuaz', '020600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653866326565372d393863362d3131, 2),
(140, 139, 'Carhuaz', '020601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653866356564662d393863362d3131, 2),
(141, 139, 'Acopampa', '020602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653866386439642d393863362d3131, 2),
(142, 139, 'Amashca', '020603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653866616161632d393863362d3131, 2),
(143, 139, 'Anta', '020604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653866653166312d393863362d3131, 2),
(144, 139, 'Ataquero', '020605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653930323432392d393863362d3131, 2),
(145, 139, 'Marcara', '020606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653930353166372d393863362d3131, 2),
(146, 139, 'Pariahuanca', '020607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653930383261322d393863362d3131, 2),
(147, 139, 'San Miguel De Aco', '020608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653930623065352d393863362d3131, 2),
(148, 139, 'Shilla', '020609', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653930653166632d393863362d3131, 2),
(149, 139, 'Tinco', '020610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653931323033302d393863362d3131, 2),
(150, 139, 'Yungar', '020611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653931336639362d393863362d3131, 2),
(151, 93, 'Carlos Fermin Fitzcarrald', '020700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653931366434392d393863362d3131, 2),
(152, 151, 'San Luis', '020701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653931396233642d393863362d3131, 2),
(153, 151, 'San Nicolas', '020702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653931626339302d393863362d3131, 2),
(154, 151, 'Yauya', '020703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653931656439662d393863362d3131, 2),
(155, 93, 'Casma', '020800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653932316636652d393863362d3131, 2),
(156, 155, 'Casma', '020801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653932363439322d393863362d3131, 2),
(157, 155, 'Buena Vista Alta', '020802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653932613266662d393863362d3131, 2),
(158, 155, 'Comandante Noel', '020803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653932643138612d393863362d3131, 2),
(159, 155, 'Yautan', '020804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653933313939352d393863362d3131, 2),
(160, 93, 'Corongo', '020900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653933363363662d393863362d3131, 2),
(161, 160, 'Corongo', '020901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653933383337392d393863362d3131, 2),
(162, 160, 'Aco', '020902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653933633463352d393863362d3131, 2),
(163, 160, 'Bambas', '020903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653933653231642d393863362d3131, 2),
(164, 160, 'Cusca', '020904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653934303566622d393863362d3131, 2),
(165, 160, 'La Pampa', '020905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653934333362332d393863362d3131, 2),
(166, 160, 'Yanac', '020906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653934353563392d393863362d3131, 2),
(167, 160, 'Yupan', '020907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653934393261612d393863362d3131, 2),
(168, 93, 'Huari', '021000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653934643034362d393863362d3131, 2),
(169, 168, 'Huari', '021001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653934663035652d393863362d3131, 2),
(170, 168, 'Anra', '021002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653935333365652d393863362d3131, 2),
(171, 168, 'Cajay', '021003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653935363561332d393863362d3131, 2),
(172, 168, 'Chavin De Huantar', '021004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653935613166632d393863362d3131, 2),
(173, 168, 'Huacachi', '021005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653935643230632d393863362d3131, 2),
(174, 168, 'Huacchis', '021006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653935656539382d393863362d3131, 2),
(175, 168, 'Huachis', '021007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653936323037652d393863362d3131, 2),
(176, 168, 'Huantar', '021008', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653936353231302d393863362d3131, 2),
(177, 168, 'Masin', '021009', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653936376462322d393863362d3131, 2),
(178, 168, 'Paucas', '021010', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653936616563302d393863362d3131, 2),
(179, 168, 'Ponto', '021011', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653936643933622d393863362d3131, 2),
(180, 168, 'Rahuapampa', '021012', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653937303634332d393863362d3131, 2),
(181, 168, 'Rapayan', '021013', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653937333332342d393863362d3131, 2),
(182, 168, 'San Marcos', '021014', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653937353234652d393863362d3131, 2),
(183, 168, 'San Pedro De Chana', '021015', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653937393165392d393863362d3131, 2),
(184, 168, 'Uco', '021016', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653937636434322d393863362d3131, 2),
(185, 93, 'Huarmey', '021100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653937656432622d393863362d3131, 2),
(186, 185, 'Huarmey', '021101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653938323662392d393863362d3131, 2),
(187, 185, 'Cochapeti', '021102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653938353435382d393863362d3131, 2),
(188, 185, 'Culebras', '021103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653938373234382d393863362d3131, 2),
(189, 185, 'Huayan', '021104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653938613038632d393863362d3131, 2),
(190, 185, 'Malvas', '021105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653938626639632d393863362d3131, 2),
(191, 93, 'Huaylas', '021200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653938656437342d393863362d3131, 2),
(192, 191, 'Caraz', '021201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653939333335612d393863362d3131, 2),
(193, 191, 'Huallanca', '021202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653939353834372d393863362d3131, 2),
(194, 191, 'Huata', '021203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653939633734352d393863362d3131, 2),
(195, 191, 'Huaylas', '021204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653961306331342d393863362d3131, 2),
(196, 191, 'Mato', '021205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653961346539392d393863362d3131, 2),
(197, 191, 'Pamparomas', '021206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653961376433612d393863362d3131, 2),
(198, 191, 'Pueblo Libre', '021207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653961626334302d393863362d3131, 2),
(199, 191, 'Santa Cruz', '021208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653961656264362d393863362d3131, 2),
(200, 191, 'Santo Toribio', '021209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653962323031632d393863362d3131, 2),
(201, 191, 'Yuracmarca', '021210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653962363539612d393863362d3131, 2),
(202, 93, 'Mariscal Luzuriaga', '021300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653962613066392d393863362d3131, 2),
(203, 202, 'Piscobamba', '021301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653963616539612d393863362d3131, 2),
(204, 202, 'Casca', '021302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653963656464372d393863362d3131, 2),
(205, 202, 'Eleazar Guzman Barron', '021303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653964316363642d393863362d3131, 2),
(206, 202, 'Fidel Olivas Escudero', '021304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653964373161622d393863362d3131, 2),
(207, 202, 'Llama', '021305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653964623765372d393863362d3131, 2),
(208, 202, 'Llumpa', '021306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653964653034612d393863362d3131, 2),
(209, 202, 'Lucma', '021307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653965323966312d393863362d3131, 2),
(210, 202, 'Musga', '021308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x35653965363765652d393863362d3131, 2),
(211, 93, 'Ocros', '021400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373162343666352d393863362d3131, 2),
(212, 211, 'Ocros', '021401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373162653730382d393863362d3131, 2),
(213, 211, 'Acas', '021402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373163313139382d393863362d3131, 2),
(214, 211, 'Cajamarquilla', '021403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373163343938632d393863362d3131, 2),
(215, 211, 'Carhuapampa', '021404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373163393036302d393863362d3131, 2),
(216, 211, 'Cochas', '021405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373163643563612d393863362d3131, 2),
(217, 211, 'Congas', '021406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373164326537392d393863362d3131, 2),
(218, 211, 'Llipa', '021407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373164376239342d393863362d3131, 2),
(219, 211, 'San Cristobal De Rajan', '021408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373164613537312d393863362d3131, 2),
(220, 211, 'San Pedro', '021409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373164653537342d393863362d3131, 2),
(221, 211, 'Santiago De Chilcas', '021410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373165323564302d393863362d3131, 2),
(222, 93, 'Pallasca', '021500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373165353861642d393863362d3131, 2),
(223, 222, 'Cabana', '021501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373165393662332d393863362d3131, 2),
(224, 222, 'Bolognesi', '021502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373165633262612d393863362d3131, 2),
(225, 222, 'Conchucos', '021503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166303237342d393863362d3131, 2),
(226, 222, 'Huacaschuque', '021504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166336264312d393863362d3131, 2),
(227, 222, 'Huandoval', '021505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166356230622d393863362d3131, 2),
(228, 222, 'Lacabamba', '021506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166383832372d393863362d3131, 2),
(229, 222, 'Llapo', '021507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166613930342d393863362d3131, 2),
(230, 222, 'Pallasca', '021508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166633663312d393863362d3131, 2),
(231, 222, 'Pampas', '021509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373166663539342d393863362d3131, 2),
(232, 222, 'Santa Rosa', '021510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373230313537392d393863362d3131, 2),
(233, 222, 'Tauca', '021511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373230353465312d393863362d3131, 2),
(234, 93, 'Pomabamba', '021600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373230383136652d393863362d3131, 2),
(235, 234, 'Pomabamba', '021601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373230613138382d393863362d3131, 2),
(236, 234, 'Huayllan', '021602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373230636536342d393863362d3131, 2),
(237, 234, 'Parobamba', '021603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373230666232662d393863362d3131, 2),
(238, 234, 'Quinuabamba', '021604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373231313961362d393863362d3131, 2),
(239, 93, 'Recuay', '021700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373231353139662d393863362d3131, 2),
(240, 239, 'Recuay', '021701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373231383766332d393863362d3131, 2),
(241, 239, 'Catac', '021702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373231616637302d393863362d3131, 2),
(242, 239, 'Cotaparaco', '021703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373231653832322d393863362d3131, 2),
(243, 239, 'Huayllapampa', '021704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232303562312d393863362d3131, 2),
(244, 239, 'Llacllin', '021705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232333366322d393863362d3131, 2),
(245, 239, 'Marca', '021706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232363264302d393863362d3131, 2),
(246, 239, 'Pampas Chico', '021707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232383064342d393863362d3131, 2),
(247, 239, 'Pararin', '021708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232616638332d393863362d3131, 2),
(248, 239, 'Tapacocha', '021709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232646432622d393863362d3131, 2),
(249, 239, 'Ticapampa', '021710', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373232666264312d393863362d3131, 2),
(250, 93, 'Santa', '021800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373233326231642d393863362d3131, 2),
(251, 250, 'Chimbote', '021801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373233343934342d393863362d3131, 2),
(252, 250, 'Caceres Del Peru', '021802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373233373763382d393863362d3131, 2),
(253, 250, 'Coishco', '021803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373233613465642d393863362d3131, 2),
(254, 250, 'Macate', '021804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373233633361342d393863362d3131, 2),
(255, 250, 'Moro', '021805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373233663137372d393863362d3131, 2),
(256, 250, 'Nepeña', '021806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373234316333302d393863362d3131, 2),
(257, 250, 'Samanco', '021807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373234353964312d393863362d3131, 2),
(258, 250, 'Santa', '021808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373234383439302d393863362d3131, 2),
(259, 250, 'Nuevo Chimbote', '021809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373234613236382d393863362d3131, 2),
(260, 93, 'Sihuas', '021900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373235333964372d393863362d3131, 2),
(261, 260, 'Sihuas', '021901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373235366162352d393863362d3131, 2),
(262, 260, 'Acobamba', '021902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373235393662322d393863362d3131, 2),
(263, 260, 'Alfonso Ugarte', '021903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373235643235642d393863362d3131, 2),
(264, 260, 'Cashapampa', '021904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373235666639652d393863362d3131, 2),
(265, 260, 'Chingalpo', '021905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373236326631392d393863362d3131, 2),
(266, 260, 'Huayllabamba', '021906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373236363030612d393863362d3131, 2),
(267, 260, 'Quiches', '021907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373236386637322d393863362d3131, 2),
(268, 260, 'Ragash', '021908', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373236616539392d393863362d3131, 2),
(269, 260, 'San Juan', '021909', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373236646536632d393863362d3131, 2),
(270, 260, 'Sicsibamba', '021910', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373237306438622d393863362d3131, 2),
(271, 93, 'Yungay', '022000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373237346434382d393863362d3131, 2),
(272, 271, 'Yungay', '022001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373237383335632d393863362d3131, 2),
(273, 271, 'Cascapara', '022002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373237616236662d393863362d3131, 2),
(274, 271, 'Mancos', '022003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373237653631302d393863362d3131, 2),
(275, 271, 'Matacoto', '022004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373238323265372d393863362d3131, 2),
(276, 271, 'Quillo', '022005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373238343038382d393863362d3131, 2),
(277, 271, 'Ranrahirca', '022006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373238373231372d393863362d3131, 2),
(278, 271, 'Shupluy', '022007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373238613163642d393863362d3131, 2),
(279, 271, 'Yanama', '022008', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373238653362312d393863362d3131, 2),
(280, 2055, 'Apurimac', '030000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373239313533382d393863362d3131, 2),
(281, 280, 'Abancay', '030100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373239333333632d393863362d3131, 2),
(282, 281, 'Abancay', '030101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373239363663362d393863362d3131, 2),
(283, 281, 'Chacoche', '030102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373239613663662d393863362d3131, 2),
(284, 281, 'Circa', '030103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373239633438622d393863362d3131, 2),
(285, 281, 'Curahuasi', '030104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373239663665352d393863362d3131, 2),
(286, 281, 'Huanipaca', '030105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373261323736372d393863362d3131, 2),
(287, 281, 'Lambrama', '030106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373261363235302d393863362d3131, 2),
(288, 281, 'Pichirhua', '030107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373261616335622d393863362d3131, 2),
(289, 281, 'San Pedro De Cachora', '030108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373261643763372d393863362d3131, 2),
(290, 281, 'Tamburco', '030109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373262343135632d393863362d3131, 2),
(291, 280, 'Andahuaylas', '030200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373262376430632d393863362d3131, 2),
(292, 291, 'Andahuaylas', '030201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373262616462622d393863362d3131, 2),
(293, 291, 'Andarapa', '030202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373262636437352d393863362d3131, 2),
(294, 291, 'Chiara', '030203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373263313061622d393863362d3131, 2),
(295, 291, 'Huancarama', '030204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373263343036622d393863362d3131, 2),
(296, 291, 'Huancaray', '030205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373263363335652d393863362d3131, 2),
(297, 291, 'Huayana', '030206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373263393161302d393863362d3131, 2),
(298, 291, 'Kishuara', '030207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373263623264382d393863362d3131, 2),
(299, 291, 'Pacobamba', '030208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373263663039392d393863362d3131, 2),
(300, 291, 'Pacucha', '030209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373264333430612d393863362d3131, 2),
(301, 291, 'Pampachiri', '030210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373264363134612d393863362d3131, 2),
(302, 291, 'Pomacocha', '030211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373264396665612d393863362d3131, 2),
(303, 291, 'San Antonio De Cachi', '030212', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373264626631302d393863362d3131, 2),
(304, 291, 'San Jeronimo', '030213', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373264663335302d393863362d3131, 2),
(305, 291, 'San Miguel De Chaccrampa', '030214', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373265323461302d393863362d3131, 2),
(306, 291, 'Santa Maria De Chicmo', '030215', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373265353137342d393863362d3131, 2),
(307, 291, 'Talavera', '030216', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373265383230382d393863362d3131, 2),
(308, 291, 'Tumay Huaraca', '030217', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373265633565392d393863362d3131, 2),
(309, 291, 'Turpo', '030218', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373265653463612d393863362d3131, 2),
(310, 291, 'Kaquiabamba', '030219', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373266313438632d393863362d3131, 2),
(311, 280, 'Antabamba', '030300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373266343337362d393863362d3131, 2),
(312, 311, 'Antabamba', '030301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373266363263382d393863362d3131, 2),
(313, 311, 'El Oro', '030302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373266613662372d393863362d3131, 2),
(314, 311, 'Huaquirca', '030303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373266633437322d393863362d3131, 2),
(315, 311, 'Juan Espinoza Medrano', '030304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373266663063382d393863362d3131, 2),
(316, 311, 'Oropesa', '030305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373330323230322d393863362d3131, 2),
(317, 311, 'Pachaconas', '030306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373330353261372d393863362d3131, 2),
(318, 311, 'Sabaino', '030307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373330383432352d393863362d3131, 2),
(319, 280, 'Aymaraes', '030400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373330626531382d393863362d3131, 2),
(320, 319, 'Chalhuanca', '030401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373330646537652d393863362d3131, 2),
(321, 319, 'Capaya', '030402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373331323237332d393863362d3131, 2),
(322, 319, 'Caraybamba', '030403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373331356564642d393863362d3131, 2),
(323, 319, 'Chapimarca', '030404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373331393139312d393863362d3131, 2),
(324, 319, 'Colcabamba', '030405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373331643032362d393863362d3131, 2),
(325, 319, 'Cotaruse', '030406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373332303062382d393863362d3131, 2),
(326, 319, 'Huayllo', '030407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373332333230332d393863362d3131, 2),
(327, 319, 'Justo Apu Sahuaraura', '030408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373332366165342d393863362d3131, 2),
(328, 319, 'Lucre', '030409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373332393061642d393863362d3131, 2),
(329, 319, 'Pocohuanca', '030410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373332633961352d393863362d3131, 2),
(330, 319, 'San Juan De Chacña', '030411', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373333303961352d393863362d3131, 2),
(331, 319, 'Sañayca', '030412', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373333323966352d393863362d3131, 2),
(332, 319, 'Soraya', '030413', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373333363664652d393863362d3131, 2),
(333, 319, 'Tapairihua', '030414', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373333613039352d393863362d3131, 2),
(334, 319, 'Tintay', '030415', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373333636461392d393863362d3131, 2),
(335, 319, 'Toraya', '030416', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373334313332392d393863362d3131, 2),
(336, 319, 'Yanaca', '030417', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373334343132662d393863362d3131, 2),
(337, 280, 'Cotabambas', '030500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373334366463332d393863362d3131, 2),
(338, 337, 'Tambobamba', '030501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373334623233392d393863362d3131, 2),
(339, 337, 'Cotabambas', '030502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373334653330392d393863362d3131, 2),
(340, 337, 'Coyllurqui', '030503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373335316636322d393863362d3131, 2),
(341, 337, 'Haquira', '030504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373335336536352d393863362d3131, 2),
(342, 337, 'Mara', '030505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373335366232342d393863362d3131, 2),
(343, 337, 'Challhuahuacho', '030506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373335396263322d393863362d3131, 2),
(344, 280, 'Chincheros', '030600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373335636631632d393863362d3131, 2),
(345, 344, 'Chincheros', '030601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373336303031352d393863362d3131, 2),
(346, 344, 'Anco_Huallo', '030602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373336336331322d393863362d3131, 2),
(347, 344, 'Cocharcas', '030603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373336356437632d393863362d3131, 2),
(348, 344, 'Huaccana', '030604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373336396464652d393863362d3131, 2),
(349, 344, 'Ocobamba', '030605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373336646230612d393863362d3131, 2),
(350, 344, 'Ongoy', '030606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373336666133622d393863362d3131, 2),
(351, 344, 'Uranmarca', '030607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373337336363632d393863362d3131, 2),
(352, 344, 'Ranracancha', '030608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373337373437652d393863362d3131, 2),
(353, 280, 'Grau', '030700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373337623736332d393863362d3131, 2),
(354, 353, 'Chuquibambilla', '030701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373337663330322d393863362d3131, 2),
(355, 353, 'Curpahuasi', '030702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373338316462322d393863362d3131, 2),
(356, 353, 'Gamarra', '030703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373338353063622d393863362d3131, 2),
(357, 353, 'Huayllati', '030704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373338393230662d393863362d3131, 2),
(358, 353, 'Mamara', '030705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373338626462302d393863362d3131, 2),
(359, 353, 'Micaela Bastidas', '030706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373338656631392d393863362d3131, 2),
(360, 353, 'Pataypampa', '030707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373339316534632d393863362d3131, 2),
(361, 353, 'Progreso', '030708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373339356566322d393863362d3131, 2),
(362, 353, 'San Antonio', '030709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373339396635392d393863362d3131, 2),
(363, 353, 'Santa Rosa', '030710', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373339633033362d393863362d3131, 2),
(364, 353, 'Turpay', '030711', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373361303062662d393863362d3131, 2),
(365, 353, 'Vilcabamba', '030712', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373361343066332d393863362d3131, 2),
(366, 353, 'Virundo', '030713', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373361366635322d393863362d3131, 2),
(367, 353, 'Curasco', '030714', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373361616535342d393863362d3131, 2),
(368, 2055, 'Arequipa', '040000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373361646135652d393863362d3131, 2),
(369, 368, 'Arequipa', '040100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373362316266322d393863362d3131, 2),
(370, 369, 'Arequipa', '040101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373362353164312d393863362d3131, 2),
(371, 369, 'Alto Selva Alegre', '040102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373362376564312d393863362d3131, 2),
(372, 369, 'Cayma', '040103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373362616661652d393863362d3131, 2),
(373, 369, 'Cerro Colorado', '040104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373362653138392d393863362d3131, 2),
(374, 369, 'Characato', '040105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373363303166392d393863362d3131, 2),
(375, 369, 'Chiguata', '040106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373363336138322d393863362d3131, 2),
(376, 369, 'Jacobo Hunter', '040107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373363363763342d393863362d3131, 2),
(377, 369, 'La Joya', '040108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373363393732612d393863362d3131, 2),
(378, 369, 'Mariano Melgar', '040109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373363643363382d393863362d3131, 2),
(379, 369, 'Miraflores', '040110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373363666563372d393863362d3131, 2),
(380, 369, 'Mollebaya', '040111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373364326462332d393863362d3131, 2),
(381, 369, 'Paucarpata', '040112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373364363438322d393863362d3131, 2),
(382, 369, 'Pocsi', '040113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373364386638642d393863362d3131, 2),
(383, 369, 'Polobaya', '040114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373364643338342d393863362d3131, 2),
(384, 369, 'Quequeña', '040115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373365313039332d393863362d3131, 2),
(385, 369, 'Sabandia', '040116', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373365326665362d393863362d3131, 2),
(386, 369, 'Sachaca', '040117', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373365356664352d393863362d3131, 2),
(387, 369, 'San Juan De Siguas', '040118', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373365396130342d393863362d3131, 2),
(388, 369, 'San Juan De Tarucani', '040119', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373365626139632d393863362d3131, 2),
(389, 369, 'Santa Isabel De Siguas', '040120', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373365653738302d393863362d3131, 2),
(390, 369, 'Santa Rita De Siguas', '040121', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373366303931332d393863362d3131, 2),
(391, 369, 'Socabaya', '040122', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373366336335332d393863362d3131, 2),
(392, 369, 'Tiabaya', '040123', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373366366432332d393863362d3131, 2),
(393, 369, 'Uchumayo', '040124', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373366386439392d393863362d3131, 2),
(394, 369, 'Vitor', '040125', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373366643062352d393863362d3131, 2),
(395, 369, 'Yanahuara', '040126', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373430303865642d393863362d3131, 2),
(396, 369, 'Yarabamba', '040127', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373430326565372d393863362d3131, 2),
(397, 369, 'Yura', '040128', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373430366434652d393863362d3131, 2),
(398, 369, 'Jose Luis Bustamante Y Rivero', '040129', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373430396562382d393863362d3131, 2),
(399, 368, 'Camana', '040200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373430636466312d393863362d3131, 2),
(400, 399, 'Camana', '040201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373431303264332d393863362d3131, 2),
(401, 399, 'Jose Maria Quimper', '040202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373431326666302d393863362d3131, 2),
(402, 399, 'Mariano Nicolas Valcarcel', '040203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373431366162652d393863362d3131, 2),
(403, 399, 'Mariscal Caceres', '040204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373431396234382d393863362d3131, 2);
INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(404, 399, 'Nicolas De Pierola', '040205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373431636138352d393863362d3131, 2),
(405, 399, 'Ocoña', '040206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373432303630362d393863362d3131, 2),
(406, 399, 'Quilca', '040207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373432343735632d393863362d3131, 2),
(407, 399, 'Samuel Pastor', '040208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373432366134302d393863362d3131, 2),
(408, 368, 'Caraveli', '040300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373432616432322d393863362d3131, 2),
(409, 408, 'Caraveli', '040301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373432653063372d393863362d3131, 2),
(410, 408, 'Acari', '040302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373433313133342d393863362d3131, 2),
(411, 408, 'Atico', '040303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373433346561662d393863362d3131, 2),
(412, 408, 'Atiquipa', '040304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373433376131612d393863362d3131, 2),
(413, 408, 'Bella Union', '040305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373433623765332d393863362d3131, 2),
(414, 408, 'Cahuacho', '040306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373433653937662d393863362d3131, 2),
(415, 408, 'Chala', '040307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373434313937342d393863362d3131, 2),
(416, 408, 'Chaparra', '040308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373434353435652d393863362d3131, 2),
(417, 408, 'Huanuhuanu', '040309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373434393031622d393863362d3131, 2),
(418, 408, 'Jaqui', '040310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373434633166352d393863362d3131, 2),
(419, 408, 'Lomas', '040311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373435303165612d393863362d3131, 2),
(420, 408, 'Quicacha', '040312', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373435323361622d393863362d3131, 2),
(421, 408, 'Yauca', '040313', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373435363337312d393863362d3131, 2),
(422, 368, 'Castilla', '040400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373435613030302d393863362d3131, 2),
(423, 422, 'Aplao', '040401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373435633863332d393863362d3131, 2),
(424, 422, 'Andagua', '040402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373435663565612d393863362d3131, 2),
(425, 422, 'Ayo', '040403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373436323431342d393863362d3131, 2),
(426, 422, 'Chachas', '040404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373436343237322d393863362d3131, 2),
(427, 422, 'Chilcaymarca', '040405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373436373164642d393863362d3131, 2),
(428, 422, 'Choco', '040406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373436616266642d393863362d3131, 2),
(429, 422, 'Huancarqui', '040407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373436663239662d393863362d3131, 2),
(430, 422, 'Machaguay', '040408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373437333566342d393863362d3131, 2),
(431, 422, 'Orcopampa', '040409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373437366565622d393863362d3131, 2),
(432, 422, 'Pampacolca', '040410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373437396636362d393863362d3131, 2),
(433, 422, 'Tipan', '040411', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373437653566642d393863362d3131, 2),
(434, 422, 'Uñon', '040412', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373438313431632d393863362d3131, 2),
(435, 422, 'Uraca', '040413', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373438353165622d393863362d3131, 2),
(436, 422, 'Viraco', '040414', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373438376535622d393863362d3131, 2),
(437, 368, 'Caylloma', '040500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373438626165642d393863362d3131, 2),
(438, 437, 'Chivay', '040501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373438653938662d393863362d3131, 2),
(439, 437, 'Achoma', '040502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373439306232322d393863362d3131, 2),
(440, 437, 'Cabanaconde', '040503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373439343664322d393863362d3131, 2),
(441, 437, 'Callalli', '040504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373439383465312d393863362d3131, 2),
(442, 437, 'Caylloma', '040505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373439613561612d393863362d3131, 2),
(443, 437, 'Coporaque', '040506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373439653132392d393863362d3131, 2),
(444, 437, 'Huambo', '040507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373461313236322d393863362d3131, 2),
(445, 437, 'Huanca', '040508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373461353632312d393863362d3131, 2),
(446, 437, 'Ichupampa', '040509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373461393638662d393863362d3131, 2),
(447, 437, 'Lari', '040510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373461633335632d393863362d3131, 2),
(448, 437, 'Lluta', '040511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373461666434652d393863362d3131, 2),
(449, 437, 'Maca', '040512', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373462336431322d393863362d3131, 2),
(450, 437, 'Madrigal', '040513', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373462366130662d393863362d3131, 2),
(451, 437, 'San Antonio De Chuca', '040514', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373462396261632d393863362d3131, 2),
(452, 437, 'Sibayo', '040515', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373462636136302d393863362d3131, 2),
(453, 437, 'Tapay', '040516', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373463303566612d393863362d3131, 2),
(454, 437, 'Tisco', '040517', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373463333464632d393863362d3131, 2),
(455, 437, 'Tuti', '040518', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373463363662632d393863362d3131, 2),
(456, 437, 'Yanque', '040519', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373463386132612d393863362d3131, 2),
(457, 437, 'Majes', '040520', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373463636532622d393863362d3131, 2),
(458, 368, 'Condesuyos', '040600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373463663836342d393863362d3131, 2),
(459, 458, 'Chuquibamba', '040601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373464336131362d393863362d3131, 2),
(460, 458, 'Andaray', '040602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373464363766332d393863362d3131, 2),
(461, 458, 'Cayarani', '040603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373464386139332d393863362d3131, 2),
(462, 458, 'Chichas', '040604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373464626131372d393863362d3131, 2),
(463, 458, 'Iray', '040605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373464656461322d393863362d3131, 2),
(464, 458, 'Rio Grande', '040606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373465323962312d393863362d3131, 2),
(465, 458, 'Salamanca', '040607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373465353862302d393863362d3131, 2),
(466, 458, 'Yanaquihua', '040608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373465373664372d393863362d3131, 2),
(467, 368, 'Islay', '040700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373465613666372d393863362d3131, 2),
(468, 467, 'Mollendo', '040701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373465653764342d393863362d3131, 2),
(469, 467, 'Cocachacra', '040702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373466313733332d393863362d3131, 2),
(470, 467, 'Dean Valdivia', '040703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373466346465322d393863362d3131, 2),
(471, 467, 'Islay', '040704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373466376237652d393863362d3131, 2),
(472, 467, 'Mejia', '040705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373466613737632d393863362d3131, 2),
(473, 467, 'Punta De Bombon', '040706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373466653066322d393863362d3131, 2),
(474, 368, 'La Union', '040800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373530316535352d393863362d3131, 2),
(475, 474, 'Cotahuasi', '040801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373530356132612d393863362d3131, 2),
(476, 474, 'Alca', '040802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373530396238352d393863362d3131, 2),
(477, 474, 'Charcana', '040803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373530633663392d393863362d3131, 2),
(478, 474, 'Huaynacotas', '040804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373530663965392d393863362d3131, 2),
(479, 474, 'Pampamarca', '040805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373531313764612d393863362d3131, 2),
(480, 474, 'Puyca', '040806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373531343961622d393863362d3131, 2),
(481, 474, 'Quechualla', '040807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373531613865642d393863362d3131, 2),
(482, 474, 'Sayla', '040808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373531646362632d393863362d3131, 2),
(483, 474, 'Tauria', '040809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373532306230392d393863362d3131, 2),
(484, 474, 'Tomepampa', '040810', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373532333764342d393863362d3131, 2),
(485, 474, 'Toro', '040811', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373532366165322d393863362d3131, 2),
(486, 2055, 'Ayacucho', '050000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373532393636362d393863362d3131, 2),
(487, 486, 'Huamanga', '050100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373532646264642d393863362d3131, 2),
(488, 487, 'Ayacucho', '050101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373532666634362d393863362d3131, 2),
(489, 487, 'Acocro', '050102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373533336364312d393863362d3131, 2),
(490, 487, 'Acos Vinchos', '050103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373533376331612d393863362d3131, 2),
(491, 487, 'Carmen Alto', '050104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x36373533613664392d393863362d3131, 2),
(492, 487, 'Chiara', '050105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313738643033662d393863362d3131, 2),
(493, 487, 'Ocros', '050106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313739323134322d393863362d3131, 2),
(494, 487, 'Pacaycasa', '050107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313739373661342d393863362d3131, 2),
(495, 487, 'Quinua', '050108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313739616362352d393863362d3131, 2),
(496, 487, 'San Jose De Ticllas', '050109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313739646464392d393863362d3131, 2),
(497, 487, 'San Juan Bautista', '050110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313761303466392d393863362d3131, 2),
(498, 487, 'Santiago De Pischa', '050111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313761326563612d393863362d3131, 2),
(499, 487, 'Socos', '050112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313761353432312d393863362d3131, 2),
(500, 487, 'Tambillo', '050113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313761373466382d393863362d3131, 2),
(501, 487, 'Vinchos', '050114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313761616638622d393863362d3131, 2),
(502, 487, 'Jesus Nazareno', '050115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313761636466322d393863362d3131, 2),
(503, 486, 'Cangallo', '050200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313762303335342d393863362d3131, 2),
(504, 503, 'Cangallo', '050201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313762333161662d393863362d3131, 2),
(505, 503, 'Chuschi', '050202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313762363264652d393863362d3131, 2),
(506, 503, 'Los Morochucos', '050203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313762396535302d393863362d3131, 2),
(507, 503, 'Maria Parado De Bellido', '050204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313762626466312d393863362d3131, 2),
(508, 503, 'Paras', '050205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313762656263662d393863362d3131, 2),
(509, 503, 'Totos', '050206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313763313938612d393863362d3131, 2),
(510, 486, 'Huanca Sancos', '050300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313763336133392d393863362d3131, 2),
(511, 510, 'Sancos', '050301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313763363833322d393863362d3131, 2),
(512, 510, 'Carapo', '050302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313763393765302d393863362d3131, 2),
(513, 510, 'Sacsamarca', '050303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313763623566642d393863362d3131, 2),
(514, 510, 'Santiago De Lucanamarca', '050304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313763653732622d393863362d3131, 2),
(515, 486, 'Huanta', '050400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313764303331612d393863362d3131, 2),
(516, 515, 'Huanta', '050401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313764333130642d393863362d3131, 2),
(517, 515, 'Ayahuanco', '050402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313764363138652d393863362d3131, 2),
(518, 515, 'Huamanguilla', '050403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313764383039312d393863362d3131, 2),
(519, 515, 'Iguain', '050404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313764616662612d393863362d3131, 2),
(520, 515, 'Luricocha', '050405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313764646564382d393863362d3131, 2),
(521, 515, 'Santillana', '050406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313765306335642d393863362d3131, 2),
(522, 515, 'Sivia', '050407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313765346664642d393863362d3131, 2),
(523, 515, 'Llochegua', '050408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313765376233312d393863362d3131, 2),
(524, 486, 'La Mar', '050500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313765633631642d393863362d3131, 2),
(525, 524, 'San Miguel', '050501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313765663636352d393863362d3131, 2),
(526, 524, 'Anco', '050502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313766313265632d393863362d3131, 2),
(527, 524, 'Ayna', '050503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313766336564312d393863362d3131, 2),
(528, 524, 'Chilcas', '050504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313766373035312d393863362d3131, 2),
(529, 524, 'Chungui', '050505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313766386338372d393863362d3131, 2),
(530, 524, 'Luis Carranza', '050506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313766626537332d393863362d3131, 2),
(531, 524, 'Santa Rosa', '050507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313766643964302d393863362d3131, 2),
(532, 524, 'Tambo', '050508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830303762612d393863362d3131, 2),
(533, 486, 'Lucanas', '050600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830323733382d393863362d3131, 2),
(534, 533, 'Puquio', '050601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830343562382d393863362d3131, 2),
(535, 533, 'Aucara', '050602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830373365392d393863362d3131, 2),
(536, 533, 'Cabana', '050603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830613634302d393863362d3131, 2),
(537, 533, 'Carmen Salcedo', '050604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830633139322d393863362d3131, 2),
(538, 533, 'Chaviña', '050605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313830663563312d393863362d3131, 2),
(539, 533, 'Chipao', '050606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313831306666302d393863362d3131, 2),
(540, 533, 'Huac-Huas', '050607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313831343263312d393863362d3131, 2),
(541, 533, 'Laramate', '050608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313831376561392d393863362d3131, 2),
(542, 533, 'Leoncio Prado', '050609', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313831613237632d393863362d3131, 2),
(543, 533, 'Llauta', '050610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313831653432302d393863362d3131, 2),
(544, 533, 'Lucanas', '050611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313832323035612d393863362d3131, 2),
(545, 533, 'Ocaña', '050612', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313832343263612d393863362d3131, 2),
(546, 533, 'Otoca', '050613', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313832373233662d393863362d3131, 2),
(547, 533, 'Saisa', '050614', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313832623534332d393863362d3131, 2),
(548, 533, 'San Cristobal', '050615', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313832653539662d393863362d3131, 2),
(549, 533, 'San Juan', '050616', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313833303831392d393863362d3131, 2),
(550, 533, 'San Pedro', '050617', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313833323765642d393863362d3131, 2),
(551, 533, 'San Pedro De Palco', '050618', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313833353732392d393863362d3131, 2),
(552, 533, 'Sancos', '050619', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313833396231632d393863362d3131, 2),
(553, 533, 'Santa Ana De Huaycahuacho', '050620', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313833636234342d393863362d3131, 2),
(554, 533, 'Santa Lucia', '050621', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313833663832372d393863362d3131, 2),
(555, 486, 'Parinacochas', '050700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313834326363612d393863362d3131, 2),
(556, 555, 'Coracora', '050701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313834346239302d393863362d3131, 2),
(557, 555, 'Chumpi', '050702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313834376537662d393863362d3131, 2),
(558, 555, 'Coronel Castañeda', '050703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313834626630332d393863362d3131, 2),
(559, 555, 'Pacapausa', '050704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313834656566372d393863362d3131, 2),
(560, 555, 'Pullo', '050705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313835323964662d393863362d3131, 2),
(561, 555, 'Puyusca', '050706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313835343866642d393863362d3131, 2),
(562, 555, 'San Francisco De Ravacayco', '050707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313835383664302d393863362d3131, 2),
(563, 555, 'Upahuacho', '050708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313835633235612d393863362d3131, 2),
(564, 486, 'Paucar Del Sara Sara', '050800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313835663262352d393863362d3131, 2),
(565, 564, 'Pausa', '050801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313836323462332d393863362d3131, 2),
(566, 564, 'Colta', '050802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313836363766612d393863362d3131, 2),
(567, 564, 'Corculla', '050803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313836393865382d393863362d3131, 2),
(568, 564, 'Lampa', '050804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313836633633622d393863362d3131, 2),
(569, 564, 'Marcabamba', '050805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313837303136382d393863362d3131, 2),
(570, 564, 'Oyolo', '050806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313837333531622d393863362d3131, 2),
(571, 564, 'Pararca', '050807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313837366437372d393863362d3131, 2),
(572, 564, 'San Javier De Alpabamba', '050808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313837613636642d393863362d3131, 2),
(573, 564, 'San Jose De Ushua', '050809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313837646230392d393863362d3131, 2),
(574, 564, 'Sara Sara', '050810', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313838313038322d393863362d3131, 2),
(575, 486, 'Sucre', '050900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313838336636392d393863362d3131, 2),
(576, 575, 'Querobamba', '050901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313838383230612d393863362d3131, 2),
(577, 575, 'Belen', '050902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313838623862662d393863362d3131, 2),
(578, 575, 'Chalcos', '050903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313838653537362d393863362d3131, 2),
(579, 575, 'Chilcayoc', '050904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313839313831342d393863362d3131, 2),
(580, 575, 'Huacaña', '050905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313839353566312d393863362d3131, 2),
(581, 575, 'Morcolla', '050906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313839373933362d393863362d3131, 2),
(582, 575, 'Paico', '050907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313839626262392d393863362d3131, 2),
(583, 575, 'San Pedro De Larcay', '050908', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313839646266352d393863362d3131, 2),
(584, 575, 'San Salvador De Quije', '050909', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313861306537342d393863362d3131, 2),
(585, 575, 'Santiago De Paucaray', '050910', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313861346237302d393863362d3131, 2),
(586, 575, 'Soras', '050911', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313861366137622d393863362d3131, 2),
(587, 486, 'Victor Fajardo', '051000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313861623031332d393863362d3131, 2),
(588, 587, 'Huancapi', '051001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313861663235652d393863362d3131, 2),
(589, 587, 'Alcamenca', '051002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313862316538362d393863362d3131, 2),
(590, 587, 'Apongo', '051003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313862346666312d393863362d3131, 2),
(591, 587, 'Asquipata', '051004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313862393436342d393863362d3131, 2),
(592, 587, 'Canaria', '051005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313862633862342d393863362d3131, 2),
(593, 587, 'Cayara', '051006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313863306162372d393863362d3131, 2),
(594, 587, 'Colca', '051007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313863333539612d393863362d3131, 2),
(595, 587, 'Huamanquiquia', '051008', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313863373730362d393863362d3131, 2),
(596, 587, 'Huancaraylla', '051009', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313863613837622d393863362d3131, 2),
(597, 587, 'Huaya', '051010', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313863643730632d393863362d3131, 2),
(598, 587, 'Sarhua', '051011', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313864303965302d393863362d3131, 2),
(599, 587, 'Vilcanchos', '051012', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313864333962642d393863362d3131, 2),
(600, 486, 'Vilcas Huaman', '051100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313864356238332d393863362d3131, 2),
(601, 600, 'Vilcas Huaman', '051101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313864393033302d393863362d3131, 2),
(602, 600, 'Accomarca', '051102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313864636662342d393863362d3131, 2),
(603, 600, 'Carhuanca', '051103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313864656535392d393863362d3131, 2),
(604, 600, 'Concepcion', '051104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313865326632352d393863362d3131, 2),
(605, 600, 'Huambalpa', '051105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313865356361362d393863362d3131, 2),
(606, 600, 'Independencia', '051106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313865396530382d393863362d3131, 2),
(607, 600, 'Saurama', '051107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313865636531632d393863362d3131, 2),
(608, 600, 'Vischongo', '051108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313865666233352d393863362d3131, 2),
(609, 2055, 'Cajamarca', '060000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313866336637642d393863362d3131, 2),
(610, 609, 'Cajamarca', '060100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313866376335372d393863362d3131, 2),
(611, 610, 'Cajamarca', '060101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313866613963642d393863362d3131, 2),
(612, 610, 'Asuncion', '060102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313866646332312d393863362d3131, 2),
(613, 610, 'Chetilla', '060103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313930306234392d393863362d3131, 2),
(614, 610, 'Cospan', '060104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313930336462622d393863362d3131, 2),
(615, 610, 'Encañada', '060105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313930653139382d393863362d3131, 2),
(616, 610, 'Jesus', '060106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313931323661362d393863362d3131, 2),
(617, 610, 'Llacanora', '060107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313931363430622d393863362d3131, 2),
(618, 610, 'Los Baños Del Inca', '060108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313931393239312d393863362d3131, 2),
(619, 610, 'Magdalena', '060109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313931636566362d393863362d3131, 2),
(620, 610, 'Matara', '060110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313932313031352d393863362d3131, 2),
(621, 610, 'Namora', '060111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313932333864362d393863362d3131, 2),
(622, 610, 'San Juan', '060112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313932373964332d393863362d3131, 2),
(623, 609, 'Cajabamba', '060200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313932396130352d393863362d3131, 2),
(624, 623, 'Cajabamba', '060201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313932646532302d393863362d3131, 2),
(625, 623, 'Cachachi', '060202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313933313938392d393863362d3131, 2),
(626, 623, 'Condebamba', '060203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313933343937612d393863362d3131, 2),
(627, 623, 'Sitacocha', '060204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313933383837332d393863362d3131, 2),
(628, 609, 'Celendin', '060300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313933633530352d393863362d3131, 2),
(629, 628, 'Celendin', '060301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313933663139392d393863362d3131, 2),
(630, 628, 'Chumuch', '060302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313934326431612d393863362d3131, 2),
(631, 628, 'Cortegana', '060303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313934373161332d393863362d3131, 2),
(632, 628, 'Huasmin', '060304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313934396462322d393863362d3131, 2),
(633, 628, 'Jorge Chavez', '060305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313934643033392d393863362d3131, 2),
(634, 628, 'Jose Galvez', '060306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313934666461612d393863362d3131, 2),
(635, 628, 'Miguel Iglesias', '060307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313935336565662d393863362d3131, 2),
(636, 628, 'Oxamarca', '060308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313935376530322d393863362d3131, 2),
(637, 628, 'Sorochuco', '060309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313935613033652d393863362d3131, 2),
(638, 628, 'Sucre', '060310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313935646365352d393863362d3131, 2),
(639, 628, 'Utco', '060311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313936313761362d393863362d3131, 2),
(640, 628, 'La Libertad De Pallan', '060312', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313936343564342d393863362d3131, 2),
(641, 609, 'Chota', '060400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313936383765312d393863362d3131, 2),
(642, 641, 'Chota', '060401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313936623937302d393863362d3131, 2),
(643, 641, 'Anguia', '060402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313936653839652d393863362d3131, 2),
(644, 641, 'Chadin', '060403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313937323461332d393863362d3131, 2),
(645, 641, 'Chiguirip', '060404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313937353631302d393863362d3131, 2),
(646, 641, 'Chimban', '060405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313937396337392d393863362d3131, 2),
(647, 641, 'Choropampa', '060406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313937646166372d393863362d3131, 2),
(648, 641, 'Cochabamba', '060407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313938303666332d393863362d3131, 2),
(649, 641, 'Conchan', '060408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313938343663302d393863362d3131, 2),
(650, 641, 'Huambos', '060409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313938366231352d393863362d3131, 2),
(651, 641, 'Lajas', '060410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313938613738322d393863362d3131, 2),
(652, 641, 'Llama', '060411', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313938653935612d393863362d3131, 2),
(653, 641, 'Miracosta', '060412', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313939313732642d393863362d3131, 2),
(654, 641, 'Paccha', '060413', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313939353763612d393863362d3131, 2),
(655, 641, 'Pion', '060414', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313939393337382d393863362d3131, 2),
(656, 641, 'Querocoto', '060415', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313939626236342d393863362d3131, 2),
(657, 641, 'San Juan De Licupis', '060416', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313939666133302d393863362d3131, 2),
(658, 641, 'Tacabamba', '060417', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313961323936612d393863362d3131, 2),
(659, 641, 'Tocmoche', '060418', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313961363464322d393863362d3131, 2),
(660, 641, 'Chalamarca', '060419', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313961396563382d393863362d3131, 2),
(661, 609, 'Contumaza', '060500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313961633838372d393863362d3131, 2),
(662, 661, 'Contumaza', '060501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313962303436322d393863362d3131, 2),
(663, 661, 'Chilete', '060502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313962353630362d393863362d3131, 2),
(664, 661, 'Cupisnique', '060503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313962386237632d393863362d3131, 2),
(665, 661, 'Guzmango', '060504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313962636166632d393863362d3131, 2),
(666, 661, 'San Benito', '060505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313963303763382d393863362d3131, 2),
(667, 661, 'Santa Cruz De Toled', '060506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313963336235632d393863362d3131, 2),
(668, 661, 'Tantarica', '060507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313963373134372d393863362d3131, 2),
(669, 661, 'Yonan', '060508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313963613032662d393863362d3131, 2),
(670, 609, 'Cutervo', '060600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313963646561302d393863362d3131, 2),
(671, 670, 'Cutervo', '060601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313964313162322d393863362d3131, 2),
(672, 670, 'Callayuc', '060602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313964363336652d393863362d3131, 2),
(673, 670, 'Choros', '060603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313964386263362d393863362d3131, 2),
(674, 670, 'Cujillo', '060604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313964626561622d393863362d3131, 2),
(675, 670, 'La Ramada', '060605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313964656334342d393863362d3131, 2),
(676, 670, 'Pimpingos', '060606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313965316161392d393863362d3131, 2),
(677, 670, 'Querocotillo', '060607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313965346338652d393863362d3131, 2),
(678, 670, 'San Andres De Cutervo', '060608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313965366432362d393863362d3131, 2),
(679, 670, 'San Juan De Cutervo', '060609', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313965623037322d393863362d3131, 2),
(680, 670, 'San Luis De Lucma', '060610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313965656461302d393863362d3131, 2),
(681, 670, 'Santa Cruz', '060611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313966306631652d393863362d3131, 2),
(682, 670, 'Santo Domingo De La Capilla', '060612', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313966346463332d393863362d3131, 2),
(683, 670, 'Santo Tomas', '060613', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313966383333652d393863362d3131, 2),
(684, 670, 'Socota', '060614', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313966623464302d393863362d3131, 2),
(685, 670, 'Toribio Casanova', '060615', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37313966656563302d393863362d3131, 2),
(686, 609, 'Hualgayoc', '060700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316130333164312d393863362d3131, 2),
(687, 686, 'Bambamarca', '060701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316130356335632d393863362d3131, 2),
(688, 686, 'Chugur', '060702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316130396332302d393863362d3131, 2),
(689, 686, 'Hualgayoc', '060703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316130626535392d393863362d3131, 2),
(690, 609, 'Jaen', '060800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316130663031662d393863362d3131, 2),
(691, 690, 'Jaen', '060801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316131333034372d393863362d3131, 2),
(692, 690, 'Bellavista', '060802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316131363032382d393863362d3131, 2),
(693, 690, 'Chontali', '060803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316131396531632d393863362d3131, 2),
(694, 690, 'Colasay', '060804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316131643832362d393863362d3131, 2),
(695, 690, 'Huabal', '060805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316131666333632d393863362d3131, 2),
(696, 690, 'Las Pirias', '060806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316132316665392d393863362d3131, 2),
(697, 690, 'Pomahuaca', '060807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316132346336622d393863362d3131, 2),
(698, 690, 'Pucara', '060808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316132386335382d393863362d3131, 2),
(699, 690, 'Sallique', '060809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316132626634662d393863362d3131, 2),
(700, 690, 'San Felipe', '060810', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316132656431352d393863362d3131, 2),
(701, 690, 'San Jose Del Alto', '060811', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316133323231362d393863362d3131, 2),
(702, 690, 'Santa Rosa', '060812', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316133356634632d393863362d3131, 2),
(703, 609, 'San Ignacio', '060900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316133383134322d393863362d3131, 2),
(704, 703, 'San Ignacio', '060901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316133633263312d393863362d3131, 2),
(705, 703, 'Chirinos', '060902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316133666231312d393863362d3131, 2),
(706, 703, 'Huarango', '060903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316134323466662d393863362d3131, 2),
(707, 703, 'La Coipa', '060904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316134373333332d393863362d3131, 2),
(708, 703, 'Namballe', '060905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316134613738362d393863362d3131, 2),
(709, 703, 'San Jose De Lourdes', '060906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316134653236642d393863362d3131, 2),
(710, 703, 'Tabaconas', '060907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316135313131372d393863362d3131, 2),
(711, 609, 'San Marcos', '061000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316135343134612d393863362d3131, 2),
(712, 711, 'Pedro Galvez', '061001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316135373031322d393863362d3131, 2),
(713, 711, 'Chancay', '061002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316135623339652d393863362d3131, 2),
(714, 711, 'Eduardo Villanueva', '061003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316135646663612d393863362d3131, 2),
(715, 711, 'Gregorio Pita', '061004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316136316130632d393863362d3131, 2),
(716, 711, 'Ichocan', '061005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316136356137652d393863362d3131, 2),
(717, 711, 'Jose Manuel Quiroz', '061006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316136386263342d393863362d3131, 2),
(718, 711, 'Jose Sabogal', '061007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316136626238362d393863362d3131, 2),
(719, 609, 'San Miguel', '061100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316136646465642d393863362d3131, 2),
(720, 719, 'San Miguel', '061101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316137313237312d393863362d3131, 2),
(721, 719, 'Bolivar', '061102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316137333835652d393863362d3131, 2),
(722, 719, 'Calquis', '061103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316137363637352d393863362d3131, 2),
(723, 719, 'Catilluc', '061104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316137613666342d393863362d3131, 2),
(724, 719, 'El Prado', '061105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316137656136662d393863362d3131, 2),
(725, 719, 'La Florida', '061106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316138313536332d393863362d3131, 2),
(726, 719, 'Llapa', '061107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316138353063622d393863362d3131, 2),
(727, 719, 'Nanchoc', '061108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316138373337332d393863362d3131, 2),
(728, 719, 'Niepos', '061109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316138613433392d393863362d3131, 2),
(729, 719, 'San Gregorio', '061110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316138643639662d393863362d3131, 2),
(730, 719, 'San Silvestre De Cochan', '061111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316139303162372d393863362d3131, 2),
(731, 719, 'Tongod', '061112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316139343530612d393863362d3131, 2),
(732, 719, 'Union Agua Blanca', '061113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316139373763392d393863362d3131, 2),
(733, 609, 'San Pablo', '061200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316139393966342d393863362d3131, 2),
(734, 733, 'San Pablo', '061201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316139636162642d393863362d3131, 2),
(735, 733, 'San Bernardino', '061202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316139666236372d393863362d3131, 2),
(736, 733, 'San Luis', '061203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316161326338342d393863362d3131, 2),
(737, 733, 'Tumbaden', '061204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316161366237642d393863362d3131, 2),
(738, 609, 'Santa Cruz', '061300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316161393466332d393863362d3131, 2),
(739, 738, 'Santa Cruz', '061301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316161643835312d393863362d3131, 2),
(740, 738, 'Andabamba', '061302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316162313533392d393863362d3131, 2),
(741, 738, 'Catache', '061303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316162336662382d393863362d3131, 2),
(742, 738, 'Chancaybaños', '061304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316162376361662d393863362d3131, 2),
(743, 738, 'La Esperanza', '061305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316162623335622d393863362d3131, 2),
(744, 738, 'Ninabamba', '061306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316162643266362d393863362d3131, 2),
(745, 738, 'Pulan', '061307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316163313261652d393863362d3131, 2),
(746, 738, 'Saucepampa', '061308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316163336663342d393863362d3131, 2),
(747, 738, 'Sexi', '061309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316163373038662d393863362d3131, 2),
(748, 738, 'Uticyacu', '061310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316163613437312d393863362d3131, 2),
(749, 738, 'Yauyucan', '061311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316163643439612d393863362d3131, 2),
(750, 2055, 'Callao', '070000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316164306566642d393863362d3131, 2),
(751, 750, 'Callao', '070100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316164343630312d393863362d3131, 2),
(752, 751, 'Callao', '070101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316164373063652d393863362d3131, 2),
(753, 751, 'Bellavista', '070102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316164613437662d393863362d3131, 2),
(754, 751, 'Carmen De La Legua Reynoso', '070103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316164646637382d393863362d3131, 2),
(755, 751, 'La Perla', '070104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316165313963662d393863362d3131, 2),
(756, 751, 'La Punta', '070105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316165363364302d393863362d3131, 2),
(757, 751, 'Ventanilla', '070106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316165393664652d393863362d3131, 2),
(758, 2055, 'Cusco', '080000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316165636130392d393863362d3131, 2),
(759, 758, 'Cusco', '080100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316165666464342d393863362d3131, 2),
(760, 759, 'Cusco', '080101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316166326439322d393863362d3131, 2),
(761, 759, 'Ccorca', '080102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316166363432612d393863362d3131, 2),
(762, 759, 'Poroy', '080103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316166386534332d393863362d3131, 2),
(763, 759, 'San Jeronimo', '080104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316166636137612d393863362d3131, 2),
(764, 759, 'San Sebastian', '080105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316166666561622d393863362d3131, 2),
(765, 759, 'Santiago', '080106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316230326366662d393863362d3131, 2),
(766, 759, 'Saylla', '080107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316230363462632d393863362d3131, 2),
(767, 759, 'Wanchaq', '080108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316230396266382d393863362d3131, 2),
(768, 758, 'Acomayo', '080200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316230633632332d393863362d3131, 2),
(769, 768, 'Acomayo', '080201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316231303934642d393863362d3131, 2),
(770, 768, 'Acopia', '080202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316231333630642d393863362d3131, 2),
(771, 768, 'Acos', '080203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316231373030652d393863362d3131, 2),
(772, 768, 'Mosoc Llacta', '080204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316231616139382d393863362d3131, 2),
(773, 768, 'Pomacanchi', '080205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316231643165302d393863362d3131, 2),
(774, 768, 'Rondocan', '080206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316232313266352d393863362d3131, 2),
(775, 768, 'Sangarara', '080207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316232353038352d393863362d3131, 2),
(776, 758, 'Anta', '080300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316232376532392d393863362d3131, 2),
(777, 776, 'Anta', '080301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316232626133302d393863362d3131, 2),
(778, 776, 'Ancahuasi', '080302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316232653863622d393863362d3131, 2),
(779, 776, 'Cachimayo', '080303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316233313534342d393863362d3131, 2),
(780, 776, 'Chinchaypujio', '080304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316233353337352d393863362d3131, 2),
(781, 776, 'Huarocondo', '080305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316233383732332d393863362d3131, 2),
(782, 776, 'Limatambo', '080306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316233633132622d393863362d3131, 2),
(783, 776, 'Mollepata', '080307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316233666434372d393863362d3131, 2),
(784, 776, 'Pucyura', '080308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316234323337362d393863362d3131, 2),
(785, 776, 'Zurite', '080309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316234363164302d393863362d3131, 2),
(786, 758, 'Calca', '080400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316234393262352d393863362d3131, 2),
(787, 786, 'Calca', '080401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316234623165352d393863362d3131, 2),
(788, 786, 'Coya', '080402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316234663233362d393863362d3131, 2),
(789, 786, 'Lamay', '080403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316235316461372d393863362d3131, 2),
(790, 786, 'Lares', '080404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316235346562632d393863362d3131, 2),
(791, 786, 'Pisac', '080405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316235393065632d393863362d3131, 2),
(792, 786, 'San Salvador', '080406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316235623434642d393863362d3131, 2),
(793, 786, 'Taray', '080407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316235663339652d393863362d3131, 2),
(794, 786, 'Yanatile', '080408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316236323535332d393863362d3131, 2),
(795, 758, 'Canas', '080500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316236363364362d393863362d3131, 2),
(796, 795, 'Yanaoca', '080501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316236396233652d393863362d3131, 2),
(797, 795, 'Checca', '080502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316236633261302d393863362d3131, 2),
(798, 795, 'Kunturkanki', '080503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316236666531352d393863362d3131, 2),
(799, 795, 'Langui', '080504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316237326366622d393863362d3131, 2),
(800, 795, 'Layo', '080505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316237356539612d393863362d3131, 2),
(801, 795, 'Pampamarca', '080506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316237613437662d393863362d3131, 2),
(802, 795, 'Quehue', '080507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316237656364632d393863362d3131, 2),
(803, 795, 'Tupac Amaru', '080508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316238313766382d393863362d3131, 2),
(804, 758, 'Canchis', '080600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316238363334322d393863362d3131, 2),
(805, 804, 'Sicuani', '080601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316238386630612d393863362d3131, 2);
INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(806, 804, 'Checacupe', '080602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316238636536362d393863362d3131, 2),
(807, 804, 'Combapata', '080603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316239306638612d393863362d3131, 2),
(808, 804, 'Marangani', '080604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316239333666642d393863362d3131, 2),
(809, 804, 'Pitumarca', '080605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316239373339302d393863362d3131, 2),
(810, 804, 'San Pablo', '080606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316239613035302d393863362d3131, 2),
(811, 804, 'San Pedro', '080607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316239643139392d393863362d3131, 2),
(812, 804, 'Tinta', '080608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316261303834342d393863362d3131, 2),
(813, 758, 'Chumbivilcas', '080700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316261323834312d393863362d3131, 2),
(814, 813, 'Santo Tomas', '080701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316261356461622d393863362d3131, 2),
(815, 813, 'Capacmarca', '080702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316261396561362d393863362d3131, 2),
(816, 813, 'Chamaca', '080703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316261643730342d393863362d3131, 2),
(817, 813, 'Colquemarca', '080704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316262313934372d393863362d3131, 2),
(818, 813, 'Livitaca', '080705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316262356534332d393863362d3131, 2),
(819, 813, 'Llusco', '080706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316262383363372d393863362d3131, 2),
(820, 813, 'Quiñota', '080707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316262623562312d393863362d3131, 2),
(821, 813, 'Velille', '080708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316262653362382d393863362d3131, 2),
(822, 758, 'Espinar', '080800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316263323530332d393863362d3131, 2),
(823, 822, 'Espinar', '080801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316263356439312d393863362d3131, 2),
(824, 822, 'Condoroma', '080802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316263376636302d393863362d3131, 2),
(825, 822, 'Coporaque', '080803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316263616635342d393863362d3131, 2),
(826, 822, 'Ocoruro', '080804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316263643164342d393863362d3131, 2),
(827, 822, 'Pallpata', '080805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316264313330382d393863362d3131, 2),
(828, 822, 'Pichigua', '080806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316264346663632d393863362d3131, 2),
(829, 822, 'Suyckutambo', '080807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316264376462622d393863362d3131, 2),
(830, 822, 'Alto Pichigua', '080808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316264623933642d393863362d3131, 2),
(831, 758, 'La Convención', '080900', 2, '0000-00-00 00:00:00', '2020-07-29 12:51:31', 1, 0x37316264656132362d393863362d3131, 2),
(832, 831, 'Santa Ana', '080901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316265316631332d393863362d3131, 2),
(833, 831, 'Echarate', '080902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316265363661342d393863362d3131, 2),
(834, 831, 'Huayopata', '080903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316265396237362d393863362d3131, 2),
(835, 831, 'Maranura', '080904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316265636131382d393863362d3131, 2),
(836, 831, 'Ocobamba', '080905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316266306465642d393863362d3131, 2),
(837, 831, 'Quellouno', '080906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316266336335382d393863362d3131, 2),
(838, 831, 'Kimbiri', '080907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316266376266352d393863362d3131, 2),
(839, 831, 'Santa Teresa', '080908', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316266626230362d393863362d3131, 2),
(840, 831, 'Vilcabamba', '080909', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316266653062612d393863362d3131, 2),
(841, 831, 'Pichari', '080910', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316330313438342d393863362d3131, 2),
(842, 758, 'Paruro', '081000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316330353137662d393863362d3131, 2),
(843, 842, 'Paruro', '081001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316330373161332d393863362d3131, 2),
(844, 842, 'Accha', '081002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316330623238662d393863362d3131, 2),
(845, 842, 'Ccapi', '081003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316330643430332d393863362d3131, 2),
(846, 842, 'Colcha', '081004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316331313038372d393863362d3131, 2),
(847, 842, 'Huanoquite', '081005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316331353130652d393863362d3131, 2),
(848, 842, 'Omacha', '081006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316331376266382d393863362d3131, 2),
(849, 842, 'Paccaritambo', '081007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316331633762352d393863362d3131, 2),
(850, 842, 'Pillpinto', '081008', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316332313635362d393863362d3131, 2),
(851, 842, 'Yaurisque', '081009', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316332343834352d393863362d3131, 2),
(852, 758, 'Paucartambo', '081100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316332386234352d393863362d3131, 2),
(853, 852, 'Paucartambo', '081101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316332623764392d393863362d3131, 2),
(854, 852, 'Caicay', '081102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316332656564322d393863362d3131, 2),
(855, 852, 'Challabamba', '081103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316333326338632d393863362d3131, 2),
(856, 852, 'Colquepata', '081104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316333353762322d393863362d3131, 2),
(857, 852, 'Huancarani', '081105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316333393932322d393863362d3131, 2),
(858, 852, 'Kosñipata', '081106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316333646164332d393863362d3131, 2),
(859, 758, 'Quispicanchi', '081200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316334303730302d393863362d3131, 2),
(860, 859, 'Urcos', '081201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316334336636312d393863362d3131, 2),
(861, 859, 'Andahuaylillas', '081202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316334363635642d393863362d3131, 2),
(862, 859, 'Camanti', '081203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316334613132392d393863362d3131, 2),
(863, 859, 'Ccarhuayo', '081204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316334653433622d393863362d3131, 2),
(864, 859, 'Ccatca', '081205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316335313666362d393863362d3131, 2),
(865, 859, 'Cusipata', '081206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316335343438612d393863362d3131, 2),
(866, 859, 'Huaro', '081207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316335373663302d393863362d3131, 2),
(867, 859, 'Lucre', '081208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316335623932622d393863362d3131, 2),
(868, 859, 'Marcapata', '081209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316335646331342d393863362d3131, 2),
(869, 859, 'Ocongate', '081210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316336306432342d393863362d3131, 2),
(870, 859, 'Oropesa', '081211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316336336636332d393863362d3131, 2),
(871, 859, 'Quiquijana', '081212', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316336373064392d393863362d3131, 2),
(872, 758, 'Urubamba', '081300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316336623739342d393863362d3131, 2),
(873, 872, 'Urubamba', '081301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316336646234632d393863362d3131, 2),
(874, 872, 'Chinchero', '081302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316337316362652d393863362d3131, 2),
(875, 872, 'Huayllabamba', '081303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316337353839652d393863362d3131, 2),
(876, 872, 'Machupicchu', '081304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316337383663392d393863362d3131, 2),
(877, 872, 'Maras', '081305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316337633564632d393863362d3131, 2),
(878, 872, 'Ollantaytambo', '081306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316337653736342d393863362d3131, 2),
(879, 872, 'Yucay', '081307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316338316365362d393863362d3131, 2),
(880, 2055, 'Huancavelica', '090000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316338343832382d393863362d3131, 2),
(881, 880, 'Huancavelica', '090100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316338376339612d393863362d3131, 2),
(882, 881, 'Huancavelica', '090101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316338626230362d393863362d3131, 2),
(883, 881, 'Acobambilla', '090102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316338656430382d393863362d3131, 2),
(884, 881, 'Acoria', '090103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316339316436362d393863362d3131, 2),
(885, 881, 'Conayca', '090104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316339353666332d393863362d3131, 2),
(886, 881, 'Cuenca', '090105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316339393333322d393863362d3131, 2),
(887, 881, 'Huachocolpa', '090106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316339633162362d393863362d3131, 2),
(888, 881, 'Huayllahuara', '090107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316361303835332d393863362d3131, 2),
(889, 881, 'Izcuchaca', '090108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316361326464352d393863362d3131, 2),
(890, 881, 'Laria', '090109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316361363233612d393863362d3131, 2),
(891, 881, 'Manta', '090110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316361393866622d393863362d3131, 2),
(892, 881, 'Mariscal Caceres', '090111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316361626164362d393863362d3131, 2),
(893, 881, 'Moya', '090112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316361656639382d393863362d3131, 2),
(894, 881, 'Nuevo Occoro', '090113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316362323136612d393863362d3131, 2),
(895, 881, 'Palca', '090114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316362356138312d393863362d3131, 2),
(896, 881, 'Pilchaca', '090115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316362393038652d393863362d3131, 2),
(897, 881, 'Vilca', '090116', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316362633131342d393863362d3131, 2),
(898, 881, 'Yauli', '090117', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316362666362322d393863362d3131, 2),
(899, 881, 'Ascension', '090118', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316363336134612d393863362d3131, 2),
(900, 881, 'Huando', '090119', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316363356333362d393863362d3131, 2),
(901, 880, 'Acobamba', '090200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316363386138382d393863362d3131, 2),
(902, 901, 'Acobamba', '090201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316363626438382d393863362d3131, 2),
(903, 901, 'Andabamba', '090202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316363653762322d393863362d3131, 2),
(904, 901, 'Anta', '090203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316364323836332d393863362d3131, 2),
(905, 901, 'Caja', '090204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316364343662332d393863362d3131, 2),
(906, 901, 'Marcas', '090205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316364373666302d393863362d3131, 2),
(907, 901, 'Paucara', '090206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316364623931312d393863362d3131, 2),
(908, 901, 'Pomacocha', '090207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316364653634652d393863362d3131, 2),
(909, 901, 'Rosario', '090208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316365323737392d393863362d3131, 2),
(910, 880, 'Angaraes', '090300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316365353939662d393863362d3131, 2),
(911, 910, 'Lircay', '090301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316365376234352d393863362d3131, 2),
(912, 910, 'Anchonga', '090302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316365626436372d393863362d3131, 2),
(913, 910, 'Callanmarca', '090303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316365646536632d393863362d3131, 2),
(914, 910, 'Ccochaccasa', '090304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316366316663342d393863362d3131, 2),
(915, 910, 'Chincho', '090305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316366346363382d393863362d3131, 2),
(916, 910, 'Congalla', '090306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316366376432342d393863362d3131, 2),
(917, 910, 'Huanca-Huanca', '090307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316366623861362d393863362d3131, 2),
(918, 910, 'Huayllay Grande', '090308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316366653661392d393863362d3131, 2),
(919, 910, 'Julcamarca', '090309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316430306139352d393863362d3131, 2),
(920, 910, 'San Antonio De Antaparco', '090310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316430343134642d393863362d3131, 2),
(921, 910, 'Santo Tomas De Pata', '090311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316430393765622d393863362d3131, 2),
(922, 910, 'Secclla', '090312', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316430636638352d393863362d3131, 2),
(923, 880, 'Castrovirreyna', '090400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316431303232622d393863362d3131, 2),
(924, 923, 'Castrovirreyna', '090401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316431333438342d393863362d3131, 2),
(925, 923, 'Arma', '090402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x37316431373131302d393863362d3131, 2),
(926, 923, 'Aurahua', '090403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356431396434662d393863362d3131, 2),
(927, 923, 'Capillas', '090404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356432306262652d393863362d3131, 2),
(928, 923, 'Chupamarca', '090405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356432346537372d393863362d3131, 2),
(929, 923, 'Cocas', '090406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356432393337312d393863362d3131, 2),
(930, 923, 'Huachos', '090407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356432636134382d393863362d3131, 2),
(931, 923, 'Huamatambo', '090408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356432663461642d393863362d3131, 2),
(932, 923, 'Mollepampa', '090409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356433316136332d393863362d3131, 2),
(933, 923, 'San Juan', '090410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356433356336662d393863362d3131, 2),
(934, 923, 'Santa Ana', '090411', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356433383931612d393863362d3131, 2),
(935, 923, 'Tantara', '090412', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356433613930652d393863362d3131, 2),
(936, 923, 'Ticrapo', '090413', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356433636136322d393863362d3131, 2),
(937, 880, 'Churcampa', '090500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356433666434382d393863362d3131, 2),
(938, 937, 'Churcampa', '090501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356434316534372d393863362d3131, 2),
(939, 937, 'Anco', '090502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356434346136362d393863362d3131, 2),
(940, 937, 'Chinchihuasi', '090503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356434373763302d393863362d3131, 2),
(941, 937, 'El Carmen', '090504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356434613936642d393863362d3131, 2),
(942, 937, 'La Merced', '090505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356434643764352d393863362d3131, 2),
(943, 937, 'Locroja', '090506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356434663534312d393863362d3131, 2),
(944, 937, 'Paucarbamba', '090507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356435323531372d393863362d3131, 2),
(945, 937, 'San Miguel De Mayocc', '090508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356435353237322d393863362d3131, 2),
(946, 937, 'San Pedro De Coris', '090509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356435373232622d393863362d3131, 2),
(947, 937, 'Pachamarca', '090510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356435393237612d393863362d3131, 2),
(948, 880, 'Huaytara', '090600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356435633464382d393863362d3131, 2),
(949, 948, 'Huaytara', '090601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356435656536342d393863362d3131, 2),
(950, 948, 'Ayavi', '090602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356436323933382d393863362d3131, 2),
(951, 948, 'Cordova', '090603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356436343739302d393863362d3131, 2),
(952, 948, 'Huayacundo Arma', '090604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356436373865622d393863362d3131, 2),
(953, 948, 'Laramarca', '090605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356436613635342d393863362d3131, 2),
(954, 948, 'Ocoyo', '090606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356436633663322d393863362d3131, 2),
(955, 948, 'Pilpichaca', '090607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356436663335392d393863362d3131, 2),
(956, 948, 'Querco', '090608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356437323066382d393863362d3131, 2),
(957, 948, 'Quito-Arma', '090609', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356437343831312d393863362d3131, 2),
(958, 948, 'San Antonio De Cusicancha', '090610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356437383233642d393863362d3131, 2),
(959, 948, 'San Francisco De Sangayaico', '090611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356437623831352d393863362d3131, 2),
(960, 948, 'San Isidro', '090612', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356437653161642d393863362d3131, 2),
(961, 948, 'Santiago De Chocorvos', '090613', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356438303233382d393863362d3131, 2),
(962, 948, 'Santiago De Quirahuara', '090614', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356438326666332d393863362d3131, 2),
(963, 948, 'Santo Domingo De Capillas', '090615', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356438353062302d393863362d3131, 2),
(964, 948, 'Tambo', '090616', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356438383233322d393863362d3131, 2),
(965, 880, 'Tayacaja', '090700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356438623033362d393863362d3131, 2),
(966, 965, 'Pampas', '090701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356438646666342d393863362d3131, 2),
(967, 965, 'Acostambo', '090702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356439316532322d393863362d3131, 2),
(968, 965, 'Acraquia', '090703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356439336335332d393863362d3131, 2),
(969, 965, 'Ahuaycha', '090704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356439366335322d393863362d3131, 2),
(970, 965, 'Colcabamba', '090705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356439613964342d393863362d3131, 2),
(971, 965, 'Daniel Hernandez', '090706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356439633933612d393863362d3131, 2),
(972, 965, 'Huachocolpa', '090707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356439663733372d393863362d3131, 2),
(973, 965, 'Huaribamba', '090709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356461323764382d393863362d3131, 2),
(974, 965, 'Ñahuimpuquio', '090710', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356461343133312d393863362d3131, 2),
(975, 965, 'Pazos', '090711', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356461366637652d393863362d3131, 2),
(976, 965, 'Quishuar', '090713', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356461393630632d393863362d3131, 2),
(977, 965, 'Salcabamba', '090714', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356461633732332d393863362d3131, 2),
(978, 965, 'Salcahuasi', '090715', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356462303666362d393863362d3131, 2),
(979, 965, 'San Marcos De Rocchac', '090716', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356462326562332d393863362d3131, 2),
(980, 965, 'Surcubamba', '090717', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356462363438312d393863362d3131, 2),
(981, 965, 'Tintay Puncu', '090718', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356462393536652d393863362d3131, 2),
(982, 2055, 'Huanuco', '100000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356462623438652d393863362d3131, 2),
(983, 982, 'Huanuco', '100100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356462663230632d393863362d3131, 2),
(984, 983, 'Huanuco', '100101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356463323232362d393863362d3131, 2),
(985, 983, 'Amarilis', '100102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356463353566642d393863362d3131, 2),
(986, 983, 'Chinchao', '100103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356463393431342d393863362d3131, 2),
(987, 983, 'Churubamba', '100104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356463633130332d393863362d3131, 2),
(988, 983, 'Margos', '100105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356463663134632d393863362d3131, 2),
(989, 983, 'Quisqui', '100106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356464333230662d393863362d3131, 2),
(990, 983, 'San Francisco De Cayran', '100107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356464396331662d393863362d3131, 2),
(991, 983, 'San Pedro De Chaulan', '100108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356464626562302d393863362d3131, 2),
(992, 983, 'Santa Maria Del Valle', '100109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356465303231612d393863362d3131, 2),
(993, 983, 'Yarumayo', '100110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356465343162382d393863362d3131, 2),
(994, 983, 'Pillco Marca', '100111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356465363130612d393863362d3131, 2),
(995, 982, 'Ambo', '100200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356465393231352d393863362d3131, 2),
(996, 995, 'Ambo', '100201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356465636336352d393863362d3131, 2),
(997, 995, 'Cayna', '100202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356465656364352d393863362d3131, 2),
(998, 995, 'Colpas', '100203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356466323865302d393863362d3131, 2),
(999, 995, 'Conchamarca', '100204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356466353836622d393863362d3131, 2),
(1000, 995, 'Huacar', '100205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356466383933312d393863362d3131, 2),
(1001, 995, 'San Francisco', '100206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356466633830652d393863362d3131, 2),
(1002, 995, 'San Rafael', '100207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356466653864302d393863362d3131, 2),
(1003, 995, 'Tomay Kichwa', '100208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356530326330372d393863362d3131, 2),
(1004, 982, 'Dos De Mayo', '100300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356530363364372d393863362d3131, 2),
(1005, 1004, 'La Union', '100301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356530386438322d393863362d3131, 2),
(1006, 1004, 'Chuquis', '100307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356530643836382d393863362d3131, 2),
(1007, 1004, 'Marias', '100311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356531313265342d393863362d3131, 2),
(1008, 1004, 'Pachas', '100313', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356531336531342d393863362d3131, 2),
(1009, 1004, 'Quivilla', '100316', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356531366566342d393863362d3131, 2),
(1010, 1004, 'Ripan', '100317', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356531386539652d393863362d3131, 2),
(1011, 1004, 'Shunqui', '100321', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356531626561612d393863362d3131, 2),
(1012, 1004, 'Sillapata', '100322', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356531656664332d393863362d3131, 2),
(1013, 1004, 'Yanas', '100323', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356532316334612d393863362d3131, 2),
(1014, 982, 'Huacaybamba', '100400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356532356533662d393863362d3131, 2),
(1015, 1014, 'Huacaybamba', '100401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356532613163372d393863362d3131, 2),
(1016, 1014, 'Canchabamba', '100402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356532636561652d393863362d3131, 2),
(1017, 1014, 'Cochabamba', '100403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356533306663612d393863362d3131, 2),
(1018, 1014, 'Pinra', '100404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356533326462622d393863362d3131, 2),
(1019, 982, 'Huamalies', '100500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356533356439372d393863362d3131, 2),
(1020, 1019, 'Llata', '100501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356533386538622d393863362d3131, 2),
(1021, 1019, 'Arancay', '100502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356533626239332d393863362d3131, 2),
(1022, 1019, 'Chavin De Pariarca', '100503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356533656332392d393863362d3131, 2),
(1023, 1019, 'Jacas Grande', '100504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356534326637352d393863362d3131, 2),
(1024, 1019, 'Jircan', '100505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356534356165352d393863362d3131, 2),
(1025, 1019, 'Miraflores', '100506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356534386466372d393863362d3131, 2),
(1026, 1019, 'Monzon', '100507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356534636134372d393863362d3131, 2),
(1027, 1019, 'Punchao', '100508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356534666232632d393863362d3131, 2),
(1028, 1019, 'Puños', '100509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356535336435382d393863362d3131, 2),
(1029, 1019, 'Singa', '100510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356535356531632d393863362d3131, 2),
(1030, 1019, 'Tantamayo', '100511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356535613238382d393863362d3131, 2),
(1031, 982, 'Leoncio Prado', '100600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356535653438642d393863362d3131, 2),
(1032, 1031, 'Rupa-Rupa', '100601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356536303538612d393863362d3131, 2),
(1033, 1031, 'Daniel Alomias Robles', '100602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356536343866652d393863362d3131, 2),
(1034, 1031, 'Hermilio Valdizan', '100603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356536383562612d393863362d3131, 2),
(1035, 1031, 'Jose Crespo Y Castillo', '100604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356536623637302d393863362d3131, 2),
(1036, 1031, 'Luyando', '100605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356536663437622d393863362d3131, 2),
(1037, 1031, 'Mariano Damaso Beraun', '100606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356537333736372d393863362d3131, 2),
(1038, 982, 'Marañon', '100700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356537353861302d393863362d3131, 2),
(1039, 1038, 'Huacrachuco', '100701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356537386136352d393863362d3131, 2),
(1040, 1038, 'Cholon', '100702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356537623835372d393863362d3131, 2),
(1041, 1038, 'San Buenaventura', '100703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356537643838382d393863362d3131, 2),
(1042, 982, 'Pachitea', '100800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356538303663342d393863362d3131, 2),
(1043, 1042, 'Panao', '100801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356538323836312d393863362d3131, 2),
(1044, 1042, 'Chaglla', '100802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356538356166612d393863362d3131, 2),
(1045, 1042, 'Molino', '100803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356538393832392d393863362d3131, 2),
(1046, 1042, 'Umari', '100804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356538633562342d393863362d3131, 2),
(1047, 982, 'Puerto Inca', '100900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356538663630642d393863362d3131, 2),
(1048, 1047, 'Puerto Inca', '100901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356539323634342d393863362d3131, 2),
(1049, 1047, 'Codo Del Pozuzo', '100902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356539356632662d393863362d3131, 2),
(1050, 1047, 'Honoria', '100903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356539613466662d393863362d3131, 2),
(1051, 1047, 'Tournavista', '100904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356539643838642d393863362d3131, 2),
(1052, 1047, 'Yuyapichis', '100905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356561323130302d393863362d3131, 2),
(1053, 982, 'Lauricocha', '101000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356561373461312d393863362d3131, 2),
(1054, 1053, 'Jesus', '101001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356561613637632d393863362d3131, 2),
(1055, 1053, 'Baños', '101002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356561643161322d393863362d3131, 2),
(1056, 1053, 'Jivia', '101003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356562313262332d393863362d3131, 2),
(1057, 1053, 'Queropalca', '101004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356562343061652d393863362d3131, 2),
(1058, 1053, 'Rondos', '101005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356562373365322d393863362d3131, 2),
(1059, 1053, 'San Francisco De Asis', '101006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356562623238372d393863362d3131, 2),
(1060, 1053, 'San Miguel De Cauri', '101007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356562653037312d393863362d3131, 2),
(1061, 982, 'Yarowilca', '101100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356563323165312d393863362d3131, 2),
(1062, 1061, 'Chavinillo', '101101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356563356366322d393863362d3131, 2),
(1063, 1061, 'Cahuac', '101102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356563383738662d393863362d3131, 2),
(1064, 1061, 'Chacabamba', '101103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356563626161382d393863362d3131, 2),
(1065, 1061, 'Aparicio Pomares', '101104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356563663738612d393863362d3131, 2),
(1066, 1061, 'Jacas Chico', '101105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356564323364312d393863362d3131, 2),
(1067, 1061, 'Obas', '101106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356564353331632d393863362d3131, 2),
(1068, 1061, 'Pampamarca', '101107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356564383465662d393863362d3131, 2),
(1069, 1061, 'Choras', '101108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356564613234392d393863362d3131, 2),
(1070, 2055, 'Ica', '110000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356564643364312d393863362d3131, 2),
(1071, 1070, 'Ica', '110100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356564663665362d393863362d3131, 2),
(1072, 1071, 'Ica', '110101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356565333439612d393863362d3131, 2),
(1073, 1071, 'La Tinguiña', '110102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356565373539622d393863362d3131, 2),
(1074, 1071, 'Los Aquijes', '110103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356565613137372d393863362d3131, 2),
(1075, 1071, 'Ocucaje', '110104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356565643434612d393863362d3131, 2),
(1076, 1071, 'Pachacutec', '110105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356566303330392d393863362d3131, 2),
(1077, 1071, 'Parcona', '110106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356566323461382d393863362d3131, 2),
(1078, 1071, 'Pueblo Nuevo', '110107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356566363430322d393863362d3131, 2),
(1079, 1071, 'Salas', '110108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356566393533382d393863362d3131, 2),
(1080, 1071, 'San Jose De Los Molinos', '110109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356566643334662d393863362d3131, 2),
(1081, 1071, 'San Juan Bautista', '110110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356630303363312d393863362d3131, 2),
(1082, 1071, 'Santiago', '110111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356630333730392d393863362d3131, 2),
(1083, 1071, 'Subtanjalla', '110112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356630366431342d393863362d3131, 2),
(1084, 1071, 'Tate', '110113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356630396664342d393863362d3131, 2),
(1085, 1071, 'Yauca Del Rosario', '110114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356630636631352d393863362d3131, 2),
(1086, 1070, 'Chincha', '110200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356631303537352d393863362d3131, 2),
(1087, 1086, 'Chincha Alta', '110201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356631343035322d393863362d3131, 2),
(1088, 1086, 'Alto Laran', '110202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356631366262342d393863362d3131, 2),
(1089, 1086, 'Chavin', '110203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356631616465612d393863362d3131, 2),
(1090, 1086, 'Chincha Baja', '110204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356631653066362d393863362d3131, 2),
(1091, 1086, 'El Carmen', '110205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356632303065342d393863362d3131, 2),
(1092, 1086, 'Grocio Prado', '110206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356632333264322d393863362d3131, 2),
(1093, 1086, 'Pueblo Nuevo', '110207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356632363130392d393863362d3131, 2),
(1094, 1086, 'San Juan De Yanac', '110208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356632393238392d393863362d3131, 2),
(1095, 1086, 'San Pedro De Huacarpana', '110209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356632646434302d393863362d3131, 2),
(1096, 1086, 'Sunampe', '110210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356633313565662d393863362d3131, 2),
(1097, 1086, 'Tambo De Mora', '110211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356633353937302d393863362d3131, 2),
(1098, 1070, 'Nazca', '110300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356633393539352d393863362d3131, 2),
(1099, 1098, 'Nazca', '110301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356633633165642d393863362d3131, 2),
(1100, 1098, 'Changuillo', '110302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356634303530612d393863362d3131, 2),
(1101, 1098, 'El Ingenio', '110303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356634343538352d393863362d3131, 2),
(1102, 1098, 'Marcona', '110304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356634366661342d393863362d3131, 2),
(1103, 1098, 'Vista Alegre', '110305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356634623238342d393863362d3131, 2),
(1104, 1070, 'Palpa', '110400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356634643230362d393863362d3131, 2),
(1105, 1104, 'Palpa', '110401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356635303563302d393863362d3131, 2),
(1106, 1104, 'Llipata', '110402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356635326336362d393863362d3131, 2),
(1107, 1104, 'Rio Grande', '110403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356635356331632d393863362d3131, 2),
(1108, 1104, 'Santa Cruz', '110404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356635396633612d393863362d3131, 2),
(1109, 1104, 'Tibillo', '110405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356635643033372d393863362d3131, 2),
(1110, 1070, 'Pisco', '110500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356635666535372d393863362d3131, 2),
(1111, 1110, 'Pisco', '110501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356636343063302d393863362d3131, 2),
(1112, 1110, 'Huancano', '110502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356636366565332d393863362d3131, 2),
(1113, 1110, 'Humay', '110503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356636616636632d393863362d3131, 2),
(1114, 1110, 'Independencia', '110504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356636663065392d393863362d3131, 2),
(1115, 1110, 'Paracas', '110505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356637313931392d393863362d3131, 2),
(1116, 1110, 'San Andres', '110506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356637353065382d393863362d3131, 2),
(1117, 1110, 'San Clemente', '110507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356637383035352d393863362d3131, 2),
(1118, 1110, 'Tupac Amaru Inca', '110508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356637613362642d393863362d3131, 2),
(1119, 2055, 'Junin', '120000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356637643533312d393863362d3131, 2),
(1120, 1119, 'Huancayo', '120100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356638303233312d393863362d3131, 2),
(1121, 1120, 'Huancayo', '120101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356638343430632d393863362d3131, 2),
(1122, 1120, 'Carhuacallanga', '120104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356639303765662d393863362d3131, 2),
(1123, 1120, 'Chacapampa', '120105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356639326637302d393863362d3131, 2),
(1124, 1120, 'Chicche', '120106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356639363130332d393863362d3131, 2),
(1125, 1120, 'Chilca', '120107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356639393365652d393863362d3131, 2),
(1126, 1120, 'Chongos Alto', '120108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356661313033662d393863362d3131, 2),
(1127, 1120, 'Chupuro', '120111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356661343862332d393863362d3131, 2),
(1128, 1120, 'Colca', '120112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356661376363392d393863362d3131, 2),
(1129, 1120, 'Cullhuas', '120113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356661613763632d393863362d3131, 2),
(1130, 1120, 'El Tambo', '120114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356661646163632d393863362d3131, 2),
(1131, 1120, 'Huacrapuquio', '120116', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356662303839372d393863362d3131, 2),
(1132, 1120, 'Hualhuas', '120117', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356662336239352d393863362d3131, 2),
(1133, 1120, 'Huancan', '120119', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356662376530322d393863362d3131, 2),
(1134, 1120, 'Huasicancha', '120120', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356662623338382d393863362d3131, 2),
(1135, 1120, 'Huayucachi', '120121', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356662656633652d393863362d3131, 2),
(1136, 1120, 'Ingenio', '120122', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356663336435392d393863362d3131, 2),
(1137, 1120, 'Pariahuanca', '120124', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356663373930342d393863362d3131, 2),
(1138, 1120, 'Pilcomayo', '120125', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356663623233312d393863362d3131, 2),
(1139, 1120, 'Pucara', '120126', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356663646139362d393863362d3131, 2),
(1140, 1120, 'Quichuay', '120127', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356664306139632d393863362d3131, 2),
(1141, 1120, 'Quilcas', '120128', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356664346161322d393863362d3131, 2),
(1142, 1120, 'San Agustin', '120129', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356664373562362d393863362d3131, 2),
(1143, 1120, 'San Jeronimo De Tunan', '120130', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356664623232632d393863362d3131, 2),
(1144, 1120, 'Saño', '120132', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356664663333372d393863362d3131, 2),
(1145, 1120, 'Sapallanga', '120133', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356665313337642d393863362d3131, 2),
(1146, 1120, 'Sicaya', '120134', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356665343762332d393863362d3131, 2),
(1147, 1120, 'Santo Domingo De Acobamba', '120135', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356665383564622d393863362d3131, 2),
(1148, 1120, 'Viques', '120136', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356665616666322d393863362d3131, 2),
(1149, 1119, 'Concepcion', '120200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356665653433612d393863362d3131, 2),
(1150, 1149, 'Concepcion', '120201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356666306535642d393863362d3131, 2),
(1151, 1149, 'Aco', '120202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356666343233312d393863362d3131, 2),
(1152, 1149, 'Andamarca', '120203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356666383036392d393863362d3131, 2),
(1153, 1149, 'Chambara', '120204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356666616331632d393863362d3131, 2),
(1154, 1149, 'Cochas', '120205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38356666646463322d393863362d3131, 2),
(1155, 1149, 'Comas', '120206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363030316366382d393863362d3131, 2),
(1156, 1149, 'Heroinas Toledo', '120207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363030333931322d393863362d3131, 2),
(1157, 1149, 'Manzanares', '120208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363030363939642d393863362d3131, 2),
(1158, 1149, 'Mariscal Castilla', '120209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363030616531392d393863362d3131, 2),
(1159, 1149, 'Matahuasi', '120210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363030643433612d393863362d3131, 2),
(1160, 1149, 'Mito', '120211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363031313666332d393863362d3131, 2),
(1161, 1149, 'Nueve De Julio', '120212', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363031333666302d393863362d3131, 2),
(1162, 1149, 'Orcotuna', '120213', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363031373730352d393863362d3131, 2),
(1163, 1149, 'San Jose De Quero', '120214', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363031626334642d393863362d3131, 2),
(1164, 1149, 'Santa Rosa De Ocopa', '120215', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363031653238622d393863362d3131, 2),
(1165, 1119, 'Chanchamayo', '120300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363032323266332d393863362d3131, 2),
(1166, 1165, 'Chanchamayo', '120301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363032343633362d393863362d3131, 2),
(1167, 1165, 'Perene', '120302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363032363761322d393863362d3131, 2),
(1168, 1165, 'Pichanaqui', '120303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363032613336302d393863362d3131, 2),
(1169, 1165, 'San Luis De Shuaro', '120304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363032643938332d393863362d3131, 2),
(1170, 1165, 'San Ramon', '120305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363033303363312d393863362d3131, 2),
(1171, 1165, 'Vitoc', '120306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363033333436302d393863362d3131, 2),
(1172, 1119, 'Jauja', '120400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363033353539302d393863362d3131, 2),
(1173, 1172, 'Jauja', '120401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363033383938362d393863362d3131, 2),
(1174, 1172, 'Acolla', '120402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363033643363312d393863362d3131, 2),
(1175, 1172, 'Apata', '120403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363033663663362d393863362d3131, 2),
(1176, 1172, 'Ataura', '120404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363034323538392d393863362d3131, 2),
(1177, 1172, 'Canchayllo', '120405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363034353663372d393863362d3131, 2),
(1178, 1172, 'Curicaca', '120406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363034373563302d393863362d3131, 2),
(1179, 1172, 'El Mantaro', '120407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363034613663352d393863362d3131, 2),
(1180, 1172, 'Huamali', '120408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363034633639642d393863362d3131, 2),
(1181, 1172, 'Huaripampa', '120409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363035303232362d393863362d3131, 2),
(1182, 1172, 'Huertas', '120410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363035346235612d393863362d3131, 2),
(1183, 1172, 'Janjaillo', '120411', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363035376234322d393863362d3131, 2),
(1184, 1172, 'Julcan', '120412', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363035633138352d393863362d3131, 2),
(1185, 1172, 'Leonor Ordoñez', '120413', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363035666330612d393863362d3131, 2),
(1186, 1172, 'Llocllapampa', '120414', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363036333035622d393863362d3131, 2),
(1187, 1172, 'Marco', '120415', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363036373331652d393863362d3131, 2),
(1188, 1172, 'Masma', '120416', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363036623332362d393863362d3131, 2),
(1189, 1172, 'Masma Chicche', '120417', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363036653336372d393863362d3131, 2),
(1190, 1172, 'Molinos', '120418', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363037313539642d393863362d3131, 2),
(1191, 1172, 'Monobamba', '120419', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363037333736392d393863362d3131, 2),
(1192, 1172, 'Muqui', '120420', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363037373739392d393863362d3131, 2),
(1193, 1172, 'Muquiyauyo', '120421', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363037623931632d393863362d3131, 2),
(1194, 1172, 'Paca', '120422', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363037653036362d393863362d3131, 2),
(1195, 1172, 'Paccha', '120423', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363038306666312d393863362d3131, 2),
(1196, 1172, 'Pancan', '120424', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363038346337372d393863362d3131, 2),
(1197, 1172, 'Parco', '120425', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363038366431332d393863362d3131, 2),
(1198, 1172, 'Pomacancha', '120426', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363038623031612d393863362d3131, 2),
(1199, 1172, 'Ricran', '120427', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363038643733652d393863362d3131, 2),
(1200, 1172, 'San Lorenzo', '120428', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363039313533642d393863362d3131, 2),
(1201, 1172, 'San Pedro De Chunan', '120429', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363039353932372d393863362d3131, 2),
(1202, 1172, 'Sausa', '120430', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363039383435312d393863362d3131, 2);
INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(1203, 1172, 'Sincos', '120431', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363039633333662d393863362d3131, 2),
(1204, 1172, 'Tunan Marca', '120432', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363039663739322d393863362d3131, 2),
(1205, 1172, 'Yauli', '120433', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363061316130652d393863362d3131, 2),
(1206, 1172, 'Yauyos', '120434', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363061353735302d393863362d3131, 2),
(1207, 1119, 'Junin', '120500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363061383862372d393863362d3131, 2),
(1208, 1207, 'Junin', '120501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363061633738382d393863362d3131, 2),
(1209, 1207, 'Carhuamayo', '120502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363062303731632d393863362d3131, 2),
(1210, 1207, 'Ondores', '120503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363062326536322d393863362d3131, 2),
(1211, 1207, 'Ulcumayo', '120504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363062363338662d393863362d3131, 2),
(1212, 1119, 'Satipo', '120600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363062613138312d393863362d3131, 2),
(1213, 1212, 'Satipo', '120601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363062636430332d393863362d3131, 2),
(1214, 1212, 'Coviriali', '120602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363063303936632d393863362d3131, 2),
(1215, 1212, 'Llaylla', '120603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363063326535632d393863362d3131, 2),
(1216, 1212, 'Mazamari', '120604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363063363839332d393863362d3131, 2),
(1217, 1212, 'Pampa Hermosa', '120605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363063616436392d393863362d3131, 2),
(1218, 1212, 'Pangoa', '120606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363063653133642d393863362d3131, 2),
(1219, 1212, 'Rio Negro', '120607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363064323466302d393863362d3131, 2),
(1220, 1212, 'Rio Tambo', '120608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363064363739392d393863362d3131, 2),
(1221, 1119, 'Tarma', '120700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363064396134362d393863362d3131, 2),
(1222, 1221, 'Tarma', '120701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363064653163372d393863362d3131, 2),
(1223, 1221, 'Acobamba', '120702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363065316339302d393863362d3131, 2),
(1224, 1221, 'Huaricolca', '120703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363065356562342d393863362d3131, 2),
(1225, 1221, 'Huasahuasi', '120704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363065396162302d393863362d3131, 2),
(1226, 1221, 'La Union', '120705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363065633535612d393863362d3131, 2),
(1227, 1221, 'Palca', '120706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363066303062662d393863362d3131, 2),
(1228, 1221, 'Palcamayo', '120707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363066336530612d393863362d3131, 2),
(1229, 1221, 'San Pedro De Cajas', '120708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363066373464652d393863362d3131, 2),
(1230, 1221, 'Tapo', '120709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363066633036362d393863362d3131, 2),
(1231, 1119, 'Yauli', '120800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363066666366352d393863362d3131, 2),
(1232, 1231, 'La Oroya', '120801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363130333366322d393863362d3131, 2),
(1233, 1231, 'Chacapalpa', '120802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363130366463342d393863362d3131, 2),
(1234, 1231, 'Huay-Huay', '120803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363130396262372d393863362d3131, 2),
(1235, 1231, 'Marcapomacocha', '120804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363130636366362d393863362d3131, 2),
(1236, 1231, 'Morococha', '120805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363131306632622d393863362d3131, 2),
(1237, 1231, 'Paccha', '120806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363131333466302d393863362d3131, 2),
(1238, 1231, 'Santa Barbara De Carhuacayan', '120807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363131366636652d393863362d3131, 2),
(1239, 1231, 'Santa Rosa De Sacco', '120808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363131613064652d393863362d3131, 2),
(1240, 1231, 'Suitucancha', '120809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363131643262382d393863362d3131, 2),
(1241, 1231, 'Yauli', '120810', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363132303138312d393863362d3131, 2),
(1242, 1119, 'Chupaca', '120900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363132343439362d393863362d3131, 2),
(1243, 1242, 'Chupaca', '120901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363132373464352d393863362d3131, 2),
(1244, 1242, 'Ahuac', '120902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363132626632332d393863362d3131, 2),
(1245, 1242, 'Chongos Bajo', '120903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363132666530312d393863362d3131, 2),
(1246, 1242, 'Huachac', '120904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363133323135322d393863362d3131, 2),
(1247, 1242, 'Huamancaca Chico', '120905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363133363433642d393863362d3131, 2),
(1248, 1242, 'San Juan De Yscos', '120906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363133613638652d393863362d3131, 2),
(1249, 1242, 'San Juan De Jarpa', '120907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363133636461312d393863362d3131, 2),
(1250, 1242, 'Tres De Diciembre', '120908', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363134306332652d393863362d3131, 2),
(1251, 1242, 'Yanacancha', '120909', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363134346130662d393863362d3131, 2),
(1252, 2055, 'La Libertad', '130000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363134376133342d393863362d3131, 2),
(1253, 1252, 'Trujillo', '130100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363134616430612d393863362d3131, 2),
(1254, 1253, 'Trujillo', '130101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363134646266662d393863362d3131, 2),
(1255, 1253, 'El Porvenir', '130102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363135316230302d393863362d3131, 2),
(1256, 1253, 'Florencia De Mora', '130103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363135353963632d393863362d3131, 2),
(1257, 1253, 'Huanchaco', '130104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363135376238322d393863362d3131, 2),
(1258, 1253, 'La Esperanza', '130105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363135626237392d393863362d3131, 2),
(1259, 1253, 'Laredo', '130106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363135663937312d393863362d3131, 2),
(1260, 1253, 'Moche', '130107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363136316336632d393863362d3131, 2),
(1261, 1253, 'Poroto', '130108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363136356133322d393863362d3131, 2),
(1262, 1253, 'Salaverry', '130109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363136383934352d393863362d3131, 2),
(1263, 1253, 'Simbal', '130110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363136633566362d393863362d3131, 2),
(1264, 1253, 'Victor Larco Herrera', '130111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363136666131322d393863362d3131, 2),
(1265, 1252, 'Ascope', '130200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363137316266652d393863362d3131, 2),
(1266, 1265, 'Ascope', '130201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363137346434392d393863362d3131, 2),
(1267, 1265, 'Chicama', '130202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363137373434392d393863362d3131, 2),
(1268, 1265, 'Chocope', '130203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363137396663392d393863362d3131, 2),
(1269, 1265, 'Magdalena De Cao', '130204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363137643264352d393863362d3131, 2),
(1270, 1265, 'Paijan', '130205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363138313231632d393863362d3131, 2),
(1271, 1265, 'Razuri', '130206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363138336635382d393863362d3131, 2),
(1272, 1265, 'Santiago De Cao', '130207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363138376137312d393863362d3131, 2),
(1273, 1265, 'Casa Grande', '130208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363138393862372d393863362d3131, 2),
(1274, 1252, 'Bolivar', '130300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363138633934312d393863362d3131, 2),
(1275, 1274, 'Bolivar', '130301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363138666631642d393863362d3131, 2),
(1276, 1274, 'Bambamarca', '130302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363139333333312d393863362d3131, 2),
(1277, 1274, 'Condormarca', '130303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363139373161652d393863362d3131, 2),
(1278, 1274, 'Longotea', '130304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363139626233352d393863362d3131, 2),
(1279, 1274, 'Uchumarca', '130305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363139653537332d393863362d3131, 2),
(1280, 1274, 'Ucuncha', '130306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363161323137622d393863362d3131, 2),
(1281, 1252, 'Chepen', '130400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363161353539312d393863362d3131, 2),
(1282, 1281, 'Chepen', '130401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363161393366312d393863362d3131, 2),
(1283, 1281, 'Pacanga', '130402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363161636237322d393863362d3131, 2),
(1284, 1281, 'Pueblo Nuevo', '130403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363161663139652d393863362d3131, 2),
(1285, 1252, 'Julcan', '130500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363162323732622d393863362d3131, 2),
(1286, 1285, 'Julcan', '130501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363162356537392d393863362d3131, 2),
(1287, 1285, 'Calamarca', '130502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363162383762642d393863362d3131, 2),
(1288, 1285, 'Carabamba', '130503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363162633635342d393863362d3131, 2),
(1289, 1285, 'Huaso', '130504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363162656334612d393863362d3131, 2),
(1290, 1252, 'Otuzco', '130600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363163316565322d393863362d3131, 2),
(1291, 1290, 'Otuzco', '130601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363163353233652d393863362d3131, 2),
(1292, 1290, 'Agallpampa', '130602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363163383030332d393863362d3131, 2),
(1293, 1290, 'Charat', '130604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363163633131362d393863362d3131, 2),
(1294, 1290, 'Huaranchal', '130605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363163666230312d393863362d3131, 2),
(1295, 1290, 'La Cuesta', '130606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363164316564612d393863362d3131, 2),
(1296, 1290, 'Mache', '130608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363164353361342d393863362d3131, 2),
(1297, 1290, 'Paranday', '130610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363164383063342d393863362d3131, 2),
(1298, 1290, 'Salpo', '130611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363164633065342d393863362d3131, 2),
(1299, 1290, 'Sinsicap', '130613', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363164666337332d393863362d3131, 2),
(1300, 1290, 'Usquil', '130614', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363165326261372d393863362d3131, 2),
(1301, 1252, 'Pacasmayo', '130700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363165363962332d393863362d3131, 2),
(1302, 1301, 'San Pedro De Lloc', '130701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363165616162302d393863362d3131, 2),
(1303, 1301, 'Guadalupe', '130702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363165646566372d393863362d3131, 2),
(1304, 1301, 'Jequetepeque', '130703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363166316234652d393863362d3131, 2),
(1305, 1301, 'Pacasmayo', '130704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363166343865612d393863362d3131, 2),
(1306, 1301, 'San Jose', '130705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363166373835642d393863362d3131, 2),
(1307, 1252, 'Pataz', '130800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363166396338372d393863362d3131, 2),
(1308, 1307, 'Tayabamba', '130801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363166626362322d393863362d3131, 2),
(1309, 1307, 'Buldibuyo', '130802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363230303030342d393863362d3131, 2),
(1310, 1307, 'Chillia', '130803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363230336433332d393863362d3131, 2),
(1311, 1307, 'Huancaspata', '130804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363230366162382d393863362d3131, 2),
(1312, 1307, 'Huaylillas', '130805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363230613630322d393863362d3131, 2),
(1313, 1307, 'Huayo', '130806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363230643565372d393863362d3131, 2),
(1314, 1307, 'Ongon', '130807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363231303738342d393863362d3131, 2),
(1315, 1307, 'Parcoy', '130808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363231343830342d393863362d3131, 2),
(1316, 1307, 'Pataz', '130809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363231373434612d393863362d3131, 2),
(1317, 1307, 'Pias', '130810', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363231613531622d393863362d3131, 2),
(1318, 1307, 'Santiago De Challas', '130811', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363231643866612d393863362d3131, 2),
(1319, 1307, 'Taurija', '130812', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363231666164632d393863362d3131, 2),
(1320, 1307, 'Urpay', '130813', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363232336134362d393863362d3131, 2),
(1321, 1252, 'Sanchez Carrion', '130900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363232373932612d393863362d3131, 2),
(1322, 1321, 'Huamachuco', '130901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363232613861632d393863362d3131, 2),
(1323, 1321, 'Chugay', '130902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363232653430662d393863362d3131, 2),
(1324, 1321, 'Cochorco', '130903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363233313033372d393863362d3131, 2),
(1325, 1321, 'Curgos', '130904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363233353262622d393863362d3131, 2),
(1326, 1321, 'Marcabal', '130905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363233393537302d393863362d3131, 2),
(1327, 1321, 'Sanagoran', '130906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363233633032382d393863362d3131, 2),
(1328, 1321, 'Sarin', '130907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363233663161382d393863362d3131, 2),
(1329, 1321, 'Sartimbamba', '130908', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363234326631652d393863362d3131, 2),
(1330, 1252, 'Santiago De Chuco', '131000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363234356333382d393863362d3131, 2),
(1331, 1330, 'Santiago De Chuco', '131001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363234376637632d393863362d3131, 2),
(1332, 1330, 'Angasmarca', '131002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363234616433302d393863362d3131, 2),
(1333, 1330, 'Cachicadan', '131003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363234636530632d393863362d3131, 2),
(1334, 1330, 'Mollebamba', '131004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363234666331342d393863362d3131, 2),
(1335, 1330, 'Mollepata', '131005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363235316364612d393863362d3131, 2),
(1336, 1330, 'Quiruvilca', '131006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363235356136392d393863362d3131, 2),
(1337, 1330, 'Santa Cruz De Chuca', '131007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363235393766382d393863362d3131, 2),
(1338, 1330, 'Sitabamba', '131008', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363235623832312d393863362d3131, 2),
(1339, 1252, 'Gran Chimu', '131100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363235663936362d393863362d3131, 2),
(1340, 1339, 'Cascas', '131101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363236326335382d393863362d3131, 2),
(1341, 1339, 'Lucma', '131102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363236346365352d393863362d3131, 2),
(1342, 1339, 'Compin', '131103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363236386330372d393863362d3131, 2),
(1343, 1339, 'Sayapullo', '131104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363236636366302d393863362d3131, 2),
(1344, 1252, 'Viru', '131200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363236663932382d393863362d3131, 2),
(1345, 1344, 'Viru', '131201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363237333833342d393863362d3131, 2),
(1346, 1344, 'Chao', '131202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363237356166642d393863362d3131, 2),
(1347, 1344, 'Guadalupito', '131203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363237393763372d393863362d3131, 2),
(1348, 2055, 'Lambayeque', '140000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363237633736362d393863362d3131, 2),
(1349, 1348, 'Chiclayo', '140100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363237663737312d393863362d3131, 2),
(1350, 1349, 'Chiclayo', '140101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363238333536342d393863362d3131, 2),
(1351, 1349, 'Chongoyape', '140102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363238363232332d393863362d3131, 2),
(1352, 1349, 'Eten', '140103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363238613165382d393863362d3131, 2),
(1353, 1349, 'Eten Puerto', '140104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363238643366642d393863362d3131, 2),
(1354, 1349, 'Jose Leonardo Ortiz', '140105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363239303435342d393863362d3131, 2),
(1355, 1349, 'La Victoria', '140106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363239333561352d393863362d3131, 2),
(1356, 1349, 'Lagunas', '140107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363239363662332d393863362d3131, 2),
(1357, 1349, 'Monsefu', '140108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363239383639382d393863362d3131, 2),
(1358, 1349, 'Nueva Arica', '140109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363239623632652d393863362d3131, 2),
(1359, 1349, 'Oyotun', '140110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363239663636352d393863362d3131, 2),
(1360, 1349, 'Picsi', '140111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363261313835362d393863362d3131, 2),
(1361, 1349, 'Pimentel', '140112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363261346131632d393863362d3131, 2),
(1362, 1349, 'Reque', '140113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363261366236362d393863362d3131, 2),
(1363, 1349, 'Santa Rosa', '140114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363261623036382d393863362d3131, 2),
(1364, 1349, 'Saña', '140115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363261653562352d393863362d3131, 2),
(1365, 1349, 'Cayalti', '140116', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363262313230302d393863362d3131, 2),
(1366, 1349, 'Patapo', '140117', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363262353533312d393863362d3131, 2),
(1367, 1349, 'Pomalca', '140118', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363262386234652d393863362d3131, 2),
(1368, 1349, 'Pucala', '140119', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363262623638342d393863362d3131, 2),
(1369, 1349, 'Tuman', '140120', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363262656231322d393863362d3131, 2),
(1370, 1348, 'Ferreñafe', '140200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363263306466352d393863362d3131, 2),
(1371, 1370, 'Ferreñafe', '140201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363263353564312d393863362d3131, 2),
(1372, 1370, 'Cañaris', '140202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363263613135342d393863362d3131, 2),
(1373, 1370, 'Incahuasi', '140203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363263646635302d393863362d3131, 2),
(1374, 1370, 'Manuel Antonio Mesones Muro', '140204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363264316432302d393863362d3131, 2),
(1375, 1370, 'Pitipo', '140205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363264353739352d393863362d3131, 2),
(1376, 1370, 'Pueblo Nuevo', '140206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363264383438612d393863362d3131, 2),
(1377, 1348, 'Lambayeque', '140300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363264633335332d393863362d3131, 2),
(1378, 1377, 'Lambayeque', '140301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363265303062622d393863362d3131, 2),
(1379, 1377, 'Chochope', '140302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363265333031322d393863362d3131, 2),
(1380, 1377, 'Illimo', '140303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363265373232342d393863362d3131, 2),
(1381, 1377, 'Jayanca', '140304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363265393264362d393863362d3131, 2),
(1382, 1377, 'Mochumi', '140305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363265643138642d393863362d3131, 2),
(1383, 1377, 'Morrope', '140306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363266306336382d393863362d3131, 2),
(1384, 1377, 'Motupe', '140307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363266343032372d393863362d3131, 2),
(1385, 1377, 'Olmos', '140308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363266373435352d393863362d3131, 2),
(1386, 1377, 'Pacora', '140309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363266623039342d393863362d3131, 2),
(1387, 1377, 'Salas', '140310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363266653139352d393863362d3131, 2),
(1388, 1377, 'San Jose', '140311', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363330316535382d393863362d3131, 2),
(1389, 1377, 'Tucume', '140312', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363330346366612d393863362d3131, 2),
(1390, 2055, 'Lima', '150000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363330376530662d393863362d3131, 2),
(1391, 1390, 'Lima', '150100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363330626363652d393863362d3131, 2),
(1392, 1391, 'Lima', '150101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363330646430642d393863362d3131, 2),
(1393, 1391, 'Ancon', '150102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363331316334372d393863362d3131, 2),
(1394, 1391, 'Ate', '150103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363331343933322d393863362d3131, 2),
(1395, 1391, 'Barranco', '150104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363331373939662d393863362d3131, 2),
(1396, 1391, 'Breña', '150105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363331616237652d393863362d3131, 2),
(1397, 1391, 'Carabayllo', '150106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363331643965652d393863362d3131, 2),
(1398, 1391, 'Chaclacayo', '150107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363332306332392d393863362d3131, 2),
(1399, 1391, 'Chorrillos', '150108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363332343632392d393863362d3131, 2),
(1400, 1391, 'Cieneguilla', '150109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363332363632372d393863362d3131, 2),
(1401, 1391, 'Comas', '150110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363332383866312d393863362d3131, 2),
(1402, 1391, 'El Agustino', '150111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363332623935342d393863362d3131, 2),
(1403, 1391, 'Independencia', '150112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363332653864632d393863362d3131, 2),
(1404, 1391, 'Jesus Maria', '150113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363333323732332d393863362d3131, 2),
(1405, 1391, 'La Molina', '150114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363333353563612d393863362d3131, 2),
(1406, 1391, 'La Victoria', '150115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363333393538302d393863362d3131, 2),
(1407, 1391, 'Lince', '150116', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363333636436642d393863362d3131, 2),
(1408, 1391, 'Los Olivos', '150117', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363334303065642d393863362d3131, 2),
(1409, 1391, 'Lurigancho', '150118', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363334343035642d393863362d3131, 2),
(1410, 1391, 'Lurin', '150119', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363334383761662d393863362d3131, 2),
(1411, 1391, 'Magdalena Del Mar', '150120', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363334633332392d393863362d3131, 2),
(1412, 1391, 'Magdalena Vieja', '150121', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363335303437332d393863362d3131, 2),
(1413, 1391, 'Miraflores', '150122', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363335326564642d393863362d3131, 2),
(1414, 1391, 'Pachacamac', '150123', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363335366137622d393863362d3131, 2),
(1415, 1391, 'Pucusana', '150124', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363335613731332d393863362d3131, 2),
(1416, 1391, 'Puente Piedra', '150125', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363335643833612d393863362d3131, 2),
(1417, 1391, 'Punta Hermosa', '150126', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363336303538642d393863362d3131, 2),
(1418, 1391, 'Punta Negra', '150127', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363336333963652d393863362d3131, 2),
(1419, 1391, 'Rimac', '150128', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363336353861352d393863362d3131, 2),
(1420, 1391, 'San Bartolo', '150129', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363336386238372d393863362d3131, 2),
(1421, 1391, 'San Borja', '150130', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363336626436392d393863362d3131, 2),
(1422, 1391, 'San Isidro', '150131', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363336653964382d393863362d3131, 2),
(1423, 1391, 'San Juan De Lurigancho', '150132', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363337316264362d393863362d3131, 2),
(1424, 1391, 'San Juan De Miraflores', '150133', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363337346233342d393863362d3131, 2),
(1425, 1391, 'San Luis', '150134', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363337396534642d393863362d3131, 2),
(1426, 1391, 'San Martin De Porres', '150135', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363337633530362d393863362d3131, 2),
(1427, 1391, 'San Miguel', '150136', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363337663738652d393863362d3131, 2),
(1428, 1391, 'Santa Anita', '150137', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363338333539372d393863362d3131, 2),
(1429, 1391, 'Santa Maria Del Mar', '150138', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363338373761332d393863362d3131, 2),
(1430, 1391, 'Santa Rosa', '150139', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363338393763642d393863362d3131, 2),
(1431, 1391, 'Santiago De Surco', '150140', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363338643865362d393863362d3131, 2),
(1432, 1391, 'Surquillo', '150141', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363339306638332d393863362d3131, 2),
(1433, 1391, 'Villa El Salvador', '150142', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363339336162662d393863362d3131, 2),
(1434, 1391, 'Villa Maria Del Triunfo', '150143', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363339366363642d393863362d3131, 2),
(1435, 1390, 'Barranca', '150200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363339633637642d393863362d3131, 2),
(1436, 1435, 'Barranca', '150201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363339663038382d393863362d3131, 2),
(1437, 1435, 'Paramonga', '150202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363361333063342d393863362d3131, 2),
(1438, 1435, 'Pativilca', '150203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363361366436322d393863362d3131, 2),
(1439, 1435, 'Supe', '150204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363361396139352d393863362d3131, 2),
(1440, 1435, 'Supe Puerto', '150205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363361636661302d393863362d3131, 2),
(1441, 1390, 'Cajatambo', '150300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363362303031322d393863362d3131, 2),
(1442, 1441, 'Cajatambo', '150301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363362316637322d393863362d3131, 2),
(1443, 1441, 'Copa', '150302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363362346462392d393863362d3131, 2),
(1444, 1441, 'Gorgor', '150303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363362366665622d393863362d3131, 2),
(1445, 1441, 'Huancapon', '150304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363362623035652d393863362d3131, 2),
(1446, 1441, 'Manas', '150305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363362663066342d393863362d3131, 2),
(1447, 1390, 'Canta', '150400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363363316366632d393863362d3131, 2),
(1448, 1447, 'Canta', '150401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363363363137392d393863362d3131, 2),
(1449, 1447, 'Arahuay', '150402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363363383235352d393863362d3131, 2),
(1450, 1447, 'Huamantanga', '150403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363363626639342d393863362d3131, 2),
(1451, 1447, 'Huaros', '150404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363363663235612d393863362d3131, 2),
(1452, 1447, 'Lachaqui', '150405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363364313338382d393863362d3131, 2),
(1453, 1447, 'San Buenaventura', '150406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363364353166362d393863362d3131, 2),
(1454, 1447, 'Santa Rosa De Quives', '150407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363364386663322d393863362d3131, 2),
(1455, 1390, 'Cañete', '150500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363364623462332d393863362d3131, 2),
(1456, 1455, 'San Vicente De Cañete', '150501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363364666164662d393863362d3131, 2),
(1457, 1455, 'Asia', '150502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363365336639662d393863362d3131, 2),
(1458, 1455, 'Calango', '150503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363365363562362d393863362d3131, 2),
(1459, 1455, 'Cerro Azul', '150504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363365613161392d393863362d3131, 2),
(1460, 1455, 'Chilca', '150505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363365643334662d393863362d3131, 2),
(1461, 1455, 'Coayllo', '150506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363366313434632d393863362d3131, 2),
(1462, 1455, 'Imperial', '150507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363366346362382d393863362d3131, 2),
(1463, 1455, 'Lunahuana', '150508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363366383130322d393863362d3131, 2),
(1464, 1455, 'Mala', '150509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363366633136342d393863362d3131, 2),
(1465, 1455, 'Nuevo Imperial', '150510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363366666237652d393863362d3131, 2),
(1466, 1455, 'Pacaran', '150511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363430326239662d393863362d3131, 2),
(1467, 1455, 'Quilmana', '150512', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363430366134642d393863362d3131, 2),
(1468, 1455, 'San Antonio', '150513', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363430396331652d393863362d3131, 2),
(1469, 1455, 'San Luis', '150514', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363430626164392d393863362d3131, 2),
(1470, 1455, 'Santa Cruz De Flores', '150515', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363430666162322d393863362d3131, 2),
(1471, 1455, 'Zuñiga', '150516', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363431326538312d393863362d3131, 2),
(1472, 1390, 'Huaral', '150600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363431363465362d393863362d3131, 2),
(1473, 1472, 'Huaral', '150601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363431613766332d393863362d3131, 2),
(1474, 1472, 'Atavillos Alto', '150602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363431643435632d393863362d3131, 2),
(1475, 1472, 'Atavillos Bajo', '150603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363432313564362d393863362d3131, 2),
(1476, 1472, 'Aucallama', '150604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363432366466342d393863362d3131, 2),
(1477, 1472, 'Chancay', '150605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363432393433392d393863362d3131, 2),
(1478, 1472, 'Ihuari', '150606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363432643565622d393863362d3131, 2),
(1479, 1472, 'Lampian', '150607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363433313136352d393863362d3131, 2),
(1480, 1472, 'Pacaraos', '150608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363433336334622d393863362d3131, 2),
(1481, 1472, 'San Miguel De Acos', '150609', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363433376632642d393863362d3131, 2),
(1482, 1472, 'Santa Cruz De Andamarca', '150610', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363433396562342d393863362d3131, 2),
(1483, 1472, 'Sumbilca', '150611', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363433646439652d393863362d3131, 2),
(1484, 1472, 'Veintisiete De Noviembre', '150612', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363434306536322d393863362d3131, 2),
(1485, 1390, 'Huarochiri', '150700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363434336164642d393863362d3131, 2),
(1486, 1485, 'Matucana', '150701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363434376435612d393863362d3131, 2),
(1487, 1485, 'Antioquia', '150702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363434616434652d393863362d3131, 2),
(1488, 1485, 'Callahuanca', '150703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363434653033382d393863362d3131, 2),
(1489, 1485, 'Carampoma', '150704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363435323631392d393863362d3131, 2),
(1490, 1485, 'Chicla', '150705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363435373462332d393863362d3131, 2),
(1491, 1485, 'Cuenca', '150706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363435623366312d393863362d3131, 2),
(1492, 1485, 'Huachupampa', '150707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363435666134342d393863362d3131, 2),
(1493, 1485, 'Huanza', '150708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363436336461652d393863362d3131, 2),
(1494, 1485, 'Huarochiri', '150709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363436376465612d393863362d3131, 2),
(1495, 1485, 'Lahuaytambo', '150710', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363436633834352d393863362d3131, 2),
(1496, 1485, 'Langa', '150711', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363437303739362d393863362d3131, 2),
(1497, 1485, 'Laraos', '150712', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363437356139332d393863362d3131, 2),
(1498, 1485, 'Mariatana', '150713', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363437623139312d393863362d3131, 2),
(1499, 1485, 'Ricardo Palma', '150714', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363437653630372d393863362d3131, 2),
(1500, 1485, 'San Andres De Tupicocha', '150715', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363438333437622d393863362d3131, 2),
(1501, 1485, 'San Antonio', '150716', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363438376338302d393863362d3131, 2),
(1502, 1485, 'San Bartolome', '150717', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363438613139382d393863362d3131, 2),
(1503, 1485, 'San Damian', '150718', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363438643036322d393863362d3131, 2),
(1504, 1485, 'San Juan De Iris', '150719', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363439303934312d393863362d3131, 2),
(1505, 1485, 'San Juan De Tantaranche', '150720', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363439353935342d393863362d3131, 2),
(1506, 1485, 'San Lorenzo De Quinti', '150721', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363439393965332d393863362d3131, 2),
(1507, 1485, 'San Mateo', '150722', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363439633033312d393863362d3131, 2),
(1508, 1485, 'San Mateo De Otao', '150723', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363461303239352d393863362d3131, 2),
(1509, 1485, 'San Pedro De Casta', '150724', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363461336462632d393863362d3131, 2),
(1510, 1485, 'San Pedro De Huancayre', '150725', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363461366261632d393863362d3131, 2),
(1511, 1485, 'Sangallaya', '150726', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363461623339352d393863362d3131, 2),
(1512, 1485, 'Santa Cruz De Cocachacra', '150727', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363462313064352d393863362d3131, 2),
(1513, 1485, 'Santa Eulalia', '150728', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363462346335382d393863362d3131, 2),
(1514, 1485, 'Santiago De Anchucaya', '150729', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363462386430332d393863362d3131, 2),
(1515, 1485, 'Santiago De Tuna', '150730', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363463356166362d393863362d3131, 2),
(1516, 1485, 'Santo Domingo De Los Olleros', '150731', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363463386164312d393863362d3131, 2),
(1517, 1485, 'Surco', '150732', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363463656530622d393863362d3131, 2),
(1518, 1390, 'Huaura', '150800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363464343037612d393863362d3131, 2),
(1519, 1518, 'Huacho', '150801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363464363435612d393863362d3131, 2),
(1520, 1518, 'Ambar', '150802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363464613430302d393863362d3131, 2),
(1521, 1518, 'Caleta De Carquin', '150803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363464653239362d393863362d3131, 2),
(1522, 1518, 'Checras', '150804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363465333638352d393863362d3131, 2),
(1523, 1518, 'Hualmay', '150805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363465373061372d393863362d3131, 2),
(1524, 1518, 'Huaura', '150806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363465613638612d393863362d3131, 2),
(1525, 1518, 'Leoncio Prado', '150807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363466396365342d393863362d3131, 2),
(1526, 1518, 'Paccho', '150808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363466653636622d393863362d3131, 2),
(1527, 1518, 'Santa Leonor', '150809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363530313836622d393863362d3131, 2),
(1528, 1518, 'Santa Maria', '150810', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363530383736322d393863362d3131, 2),
(1529, 1518, 'Sayan', '150811', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363530623039362d393863362d3131, 2),
(1530, 1518, 'Vegueta', '150812', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363530663265382d393863362d3131, 2),
(1531, 1390, 'Oyon', '150900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363531383065322d393863362d3131, 2),
(1532, 1531, 'Oyon', '150901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363531623034342d393863362d3131, 2),
(1533, 1531, 'Andajes', '150902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363531656532652d393863362d3131, 2),
(1534, 1531, 'Caujul', '150903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363532323265322d393863362d3131, 2),
(1535, 1531, 'Cochamarca', '150904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363532353065302d393863362d3131, 2),
(1536, 1531, 'Navan', '150905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363532383238392d393863362d3131, 2),
(1537, 1531, 'Pachangara', '150906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363532623532632d393863362d3131, 2),
(1538, 1390, 'Yauyos', '151000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363532646566362d393863362d3131, 2),
(1539, 1538, 'Yauyos', '151001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363533313461632d393863362d3131, 2),
(1540, 1538, 'Alis', '151002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363533333831322d393863362d3131, 2),
(1541, 1538, 'Ayauca', '151003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363533373633642d393863362d3131, 2),
(1542, 1538, 'Ayaviri', '151004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363533623538342d393863362d3131, 2),
(1543, 1538, 'Azangaro', '151005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363533653830622d393863362d3131, 2),
(1544, 1538, 'Cacra', '151006', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363534323462352d393863362d3131, 2),
(1545, 1538, 'Carania', '151007', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363534353561382d393863362d3131, 2),
(1546, 1538, 'Catahuasi', '151008', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363534383461322d393863362d3131, 2),
(1547, 1538, 'Chocos', '151009', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363534613638372d393863362d3131, 2),
(1548, 1538, 'Cochas', '151010', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363534643462332d393863362d3131, 2),
(1549, 1538, 'Colonia', '151011', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363535303330302d393863362d3131, 2),
(1550, 1538, 'Hongos', '151012', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363535343037322d393863362d3131, 2),
(1551, 1538, 'Huampara', '151013', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363535363634342d393863362d3131, 2),
(1552, 1538, 'Huancaya', '151014', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363535633632372d393863362d3131, 2),
(1553, 1538, 'Huangascar', '151015', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363535666636362d393863362d3131, 2),
(1554, 1538, 'Huantan', '151016', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363536326364352d393863362d3131, 2),
(1555, 1538, 'Huañec', '151017', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363536366139312d393863362d3131, 2),
(1556, 1538, 'Laraos', '151018', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363536393834382d393863362d3131, 2),
(1557, 1538, 'Lincha', '151019', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363536633933332d393863362d3131, 2),
(1558, 1538, 'Madean', '151020', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363537306262612d393863362d3131, 2),
(1559, 1538, 'Miraflores', '151021', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363537333861632d393863362d3131, 2),
(1560, 1538, 'Omas', '151022', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363537373834362d393863362d3131, 2),
(1561, 1538, 'Putinza', '151023', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363537623930302d393863362d3131, 2),
(1562, 1538, 'Quinches', '151024', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363537653665372d393863362d3131, 2),
(1563, 1538, 'Quinocay', '151025', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363538323736362d393863362d3131, 2),
(1564, 1538, 'San Joaquin', '151026', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363538346230322d393863362d3131, 2),
(1565, 1538, 'San Pedro De Pilas', '151027', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363538386439372d393863362d3131, 2),
(1566, 1538, 'Tanta', '151028', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363538643838322d393863362d3131, 2),
(1567, 1538, 'Tauripampa', '151029', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363539303733312d393863362d3131, 2),
(1568, 1538, 'Tomas', '151030', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363539353337622d393863362d3131, 2),
(1569, 1538, 'Tupe', '151031', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363539386265642d393863362d3131, 2),
(1570, 1538, 'Viñac', '151032', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363539626432382d393863362d3131, 2),
(1571, 1538, 'Vitis', '151033', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363539653134372d393863362d3131, 2),
(1572, 2055, 'Loreto', '160000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363561303133632d393863362d3131, 2),
(1573, 1572, 'Maynas', '160100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363561343435642d393863362d3131, 2),
(1574, 1573, 'Iquitos', '160101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363561383032312d393863362d3131, 2),
(1575, 1573, 'Alto Nanay', '160102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363561616265622d393863362d3131, 2),
(1576, 1573, 'Fernando Lores', '160103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363561653935332d393863362d3131, 2),
(1577, 1573, 'Indiana', '160104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363562313965382d393863362d3131, 2),
(1578, 1573, 'Las Amazonas', '160105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363562336237662d393863362d3131, 2),
(1579, 1573, 'Mazan', '160106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363562373733652d393863362d3131, 2),
(1580, 1573, 'Napo', '160107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363562613761352d393863362d3131, 2),
(1581, 1573, 'Punchana', '160108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363562646338382d393863362d3131, 2),
(1582, 1573, 'Putumayo', '160109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363563306236382d393863362d3131, 2),
(1583, 1573, 'Torres Causana', '160110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363563333834642d393863362d3131, 2),
(1584, 1573, 'Belen', '160112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363563366166342d393863362d3131, 2),
(1585, 1573, 'San Juan Bautista', '160113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363563393363632d393863362d3131, 2),
(1586, 1573, 'Teniente Manuel Clavero', '160114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363563626239322d393863362d3131, 2),
(1587, 1572, 'Alto Amazonas', '160200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363563663761322d393863362d3131, 2),
(1588, 1587, 'Yurimaguas', '160201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363564326134302d393863362d3131, 2),
(1589, 1587, 'Balsapuerto', '160202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363564353833342d393863362d3131, 2),
(1590, 1587, 'Jeberos', '160205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363564383963392d393863362d3131, 2),
(1591, 1587, 'Lagunas', '160206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363564633664382d393863362d3131, 2),
(1592, 1587, 'Santa Cruz', '160210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363564663534392d393863362d3131, 2),
(1593, 1587, 'Teniente Cesar Lopez Rojas', '160211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363565323463642d393863362d3131, 2),
(1594, 1572, 'Loreto', '160300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363565353534652d393863362d3131, 2),
(1595, 1594, 'Nauta', '160301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363565393336392d393863362d3131, 2),
(1596, 1594, 'Parinari', '160302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363565643564312d393863362d3131, 2);
INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(1597, 1594, 'Tigre', '160303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363566303233372d393863362d3131, 2),
(1598, 1594, 'Trompeteros', '160304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363566336630352d393863362d3131, 2),
(1599, 1594, 'Urarinas', '160305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363566376237652d393863362d3131, 2),
(1600, 1572, 'Mariscal Ramon Castilla', '160400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363566616561372d393863362d3131, 2),
(1601, 1600, 'Ramon Castilla', '160401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363566656635372d393863362d3131, 2),
(1602, 1600, 'Pebas', '160402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363630343162362d393863362d3131, 2),
(1603, 1600, 'Yavari', '160403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363630383330622d393863362d3131, 2),
(1604, 1600, 'San Pablo', '160404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363630623439342d393863362d3131, 2),
(1605, 1572, 'Requena', '160500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363630653663302d393863362d3131, 2),
(1606, 1605, 'Requena', '160501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363631313362362d393863362d3131, 2),
(1607, 1605, 'Alto Tapiche', '160502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363631343631332d393863362d3131, 2),
(1608, 1605, 'Capelo', '160503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363631383236632d393863362d3131, 2),
(1609, 1605, 'Emilio San Martin', '160504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363631613230382d393863362d3131, 2),
(1610, 1605, 'Maquia', '160505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363631653362372d393863362d3131, 2),
(1611, 1605, 'Puinahua', '160506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363632313366312d393863362d3131, 2),
(1612, 1605, 'Saquena', '160507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363632333762372d393863362d3131, 2),
(1613, 1605, 'Soplin', '160508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363632376639372d393863362d3131, 2),
(1614, 1605, 'Tapiche', '160509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363632623966662d393863362d3131, 2),
(1615, 1605, 'Jenaro Herrera', '160510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363632653339352d393863362d3131, 2),
(1616, 1605, 'Yaquerana', '160511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363633323062342d393863362d3131, 2),
(1617, 1572, 'Ucayali', '160600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363633346365332d393863362d3131, 2),
(1618, 1617, 'Contamana', '160601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363633393137662d393863362d3131, 2),
(1619, 1617, 'Inahuaya', '160602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363633633630302d393863362d3131, 2),
(1620, 1617, 'Padre Marquez', '160603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363633663331342d393863362d3131, 2),
(1621, 1617, 'Pampa Hermosa', '160604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363634333162382d393863362d3131, 2),
(1622, 1617, 'Sarayacu', '160605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363634363534332d393863362d3131, 2),
(1623, 1617, 'Vargas Guerra', '160606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363634393130662d393863362d3131, 2),
(1624, 1572, 'Datem Del Marañon', '160700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363634643131632d393863362d3131, 2),
(1625, 1624, 'Barranca', '160701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363635333463312d393863362d3131, 2),
(1626, 1624, 'Cahuapanas', '160702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363635353537642d393863362d3131, 2),
(1627, 1624, 'Manseriche', '160703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363635383639342d393863362d3131, 2),
(1628, 1624, 'Morona', '160704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363635633936662d393863362d3131, 2),
(1629, 1624, 'Pastaza', '160705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363635656631372d393863362d3131, 2),
(1630, 1624, 'Andoas', '160706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363636323461372d393863362d3131, 2),
(1631, 2055, 'Madre De Dios', '170000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363636363466392d393863362d3131, 2),
(1632, 1631, 'Tambopata', '170100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363636386565612d393863362d3131, 2),
(1633, 1632, 'Tambopata', '170101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363636633935612d393863362d3131, 2),
(1634, 1632, 'Inambari', '170102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363636656136322d393863362d3131, 2),
(1635, 1632, 'Las Piedras', '170103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363637306536312d393863362d3131, 2),
(1636, 1632, 'Laberinto', '170104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363637343437662d393863362d3131, 2),
(1637, 1631, 'Manu', '170200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363637373433302d393863362d3131, 2),
(1638, 1637, 'Manu', '170201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363637613338652d393863362d3131, 2),
(1639, 1637, 'Fitzcarrald', '170202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363637653635622d393863362d3131, 2),
(1640, 1637, 'Madre De Dios', '170203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363638303437352d393863362d3131, 2),
(1641, 1637, 'Huepetuhe', '170204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363638336337642d393863362d3131, 2),
(1642, 1631, 'Tahuamanu', '170300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363638373766662d393863362d3131, 2),
(1643, 1642, 'Iñapari', '170301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363638396361312d393863362d3131, 2),
(1644, 1642, 'Iberia', '170302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363638646266352d393863362d3131, 2),
(1645, 1642, 'Tahuamanu', '170303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363639306566642d393863362d3131, 2),
(1646, 2055, 'Moquegua', '180000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363639346264642d393863362d3131, 2),
(1647, 1646, 'Mariscal Nieto', '180100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363639386331362d393863362d3131, 2),
(1648, 1647, 'Moquegua', '180101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363639623466382d393863362d3131, 2),
(1649, 1647, 'Carumas', '180102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363639663633322d393863362d3131, 2),
(1650, 1647, 'Cuchumbaya', '180103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363661333935362d393863362d3131, 2),
(1651, 1647, 'Samegua', '180104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363661363566382d393863362d3131, 2),
(1652, 1647, 'San Cristobal', '180105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363661613732372d393863362d3131, 2),
(1653, 1647, 'Torata', '180106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363661653235632d393863362d3131, 2),
(1654, 1646, 'General Sanchez Cerro', '180200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363662306534302d393863362d3131, 2),
(1655, 1654, 'Omate', '180201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363662336366382d393863362d3131, 2),
(1656, 1654, 'Chojata', '180202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363662366633662d393863362d3131, 2),
(1657, 1654, 'Coalaque', '180203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363662623365362d393863362d3131, 2),
(1658, 1654, 'Ichuña', '180204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363662653932332d393863362d3131, 2),
(1659, 1654, 'La Capilla', '180205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363663323239632d393863362d3131, 2),
(1660, 1654, 'Lloque', '180206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363663363462662d393863362d3131, 2),
(1661, 1654, 'Matalaque', '180207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363663623062312d393863362d3131, 2),
(1662, 1654, 'Puquina', '180208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363663653530622d393863362d3131, 2),
(1663, 1654, 'Quinistaquillas', '180209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363664316262652d393863362d3131, 2),
(1664, 1654, 'Ubinas', '180210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363664353639352d393863362d3131, 2),
(1665, 1654, 'Yunga', '180211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363664383431342d393863362d3131, 2),
(1666, 1646, 'Ilo', '180300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363664626635332d393863362d3131, 2),
(1667, 1666, 'Ilo', '180301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363664653133332d393863362d3131, 2),
(1668, 1666, 'El Algarrobal', '180302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363665323136612d393863362d3131, 2),
(1669, 1666, 'Pacocha', '180303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363665356337362d393863362d3131, 2),
(1670, 2055, 'Pasco', '190000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363665376431372d393863362d3131, 2),
(1671, 1670, 'Pasco', '190100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363665633038352d393863362d3131, 2),
(1672, 1671, 'Chaupimarca', '190101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363665653834382d393863362d3131, 2),
(1673, 1671, 'Huachon', '190102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363666333133362d393863362d3131, 2),
(1674, 1671, 'Huariaca', '190103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363666373866632d393863362d3131, 2),
(1675, 1671, 'Huayllay', '190104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363666396537312d393863362d3131, 2),
(1676, 1671, 'Ninacaca', '190105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363666646234372d393863362d3131, 2),
(1677, 1671, 'Pallanchacra', '190106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363730316139302d393863362d3131, 2),
(1678, 1671, 'Paucartambo', '190107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363730336434652d393863362d3131, 2),
(1679, 1671, 'San Francisco De Asis De Yarusyacan', '190108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363730376133622d393863362d3131, 2),
(1680, 1671, 'Simon Bolivar', '190109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363730616136622d393863362d3131, 2),
(1681, 1671, 'Ticlacayan', '190110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363730636337312d393863362d3131, 2),
(1682, 1671, 'Tinyahuarco', '190111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363731353565372d393863362d3131, 2),
(1683, 1671, 'Vicco', '190112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363731383939332d393863362d3131, 2),
(1684, 1671, 'Yanacancha', '190113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363731633138322d393863362d3131, 2),
(1685, 1670, 'Daniel Alcides Carrion', '190200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363731656430312d393863362d3131, 2),
(1686, 1685, 'Yanahuanca', '190201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363732326235612d393863362d3131, 2),
(1687, 1685, 'Chacayan', '190202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363732363963312d393863362d3131, 2),
(1688, 1685, 'Goyllarisquizga', '190203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363732393565372d393863362d3131, 2),
(1689, 1685, 'Paucar', '190204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363732643632302d393863362d3131, 2),
(1690, 1685, 'San Pedro De Pillao', '190205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363733303865392d393863362d3131, 2),
(1691, 1685, 'Santa Ana De Tusi', '190206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363733353761392d393863362d3131, 2),
(1692, 1685, 'Tapuc', '190207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363733393865662d393863362d3131, 2),
(1693, 1685, 'Vilcabamba', '190208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363733643731332d393863362d3131, 2),
(1694, 1670, 'Oxapampa', '190300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363734303466302d393863362d3131, 2),
(1695, 1694, 'Oxapampa', '190301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363734353966352d393863362d3131, 2),
(1696, 1694, 'Chontabamba', '190302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363734393433632d393863362d3131, 2),
(1697, 1694, 'Huancabamba', '190303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363734633163332d393863362d3131, 2),
(1698, 1694, 'Palcazu', '190304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363734663632612d393863362d3131, 2),
(1699, 1694, 'Pozuzo', '190305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363735336230612d393863362d3131, 2),
(1700, 1694, 'Puerto Bermudez', '190306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363735363265392d393863362d3131, 2),
(1701, 1694, 'Villa Rica', '190307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363735396439342d393863362d3131, 2),
(1702, 2055, 'Piura', '200000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363735633739332d393863362d3131, 2),
(1703, 1702, 'Piura', '200100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363736303135652d393863362d3131, 2),
(1704, 1703, 'Piura', '200101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363736343163342d393863362d3131, 2),
(1705, 1703, 'Castilla', '200104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363736376164332d393863362d3131, 2),
(1706, 1703, 'Catacaos', '200105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363736623532642d393863362d3131, 2),
(1707, 1703, 'Cura Mori', '200107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363736663538632d393863362d3131, 2),
(1708, 1703, 'El Tallan', '200108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363737313638362d393863362d3131, 2),
(1709, 1703, 'La Arena', '200109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363737353337332d393863362d3131, 2),
(1710, 1703, 'La Union', '200110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363737373332372d393863362d3131, 2),
(1711, 1703, 'Las Lomas', '200111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363737613266322d393863362d3131, 2),
(1712, 1703, 'Tambo Grande', '200114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363737653562332d393863362d3131, 2),
(1713, 1702, 'Ayabaca', '200200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363738306436622d393863362d3131, 2),
(1714, 1713, 'Ayabaca', '200201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363738346465642d393863362d3131, 2),
(1715, 1713, 'Frias', '200202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363738376431342d393863362d3131, 2),
(1716, 1713, 'Jilili', '200203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363738616334302d393863362d3131, 2),
(1717, 1713, 'Lagunas', '200204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363738653865302d393863362d3131, 2),
(1718, 1713, 'Montero', '200205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363739313432612d393863362d3131, 2),
(1719, 1713, 'Pacaipampa', '200206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363739353832302d393863362d3131, 2),
(1720, 1713, 'Paimas', '200207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363739393231662d393863362d3131, 2),
(1721, 1713, 'Sapillica', '200208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363739633332362d393863362d3131, 2),
(1722, 1713, 'Sicchez', '200209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363761303832342d393863362d3131, 2),
(1723, 1713, 'Suyo', '200210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363761343333642d393863362d3131, 2),
(1724, 1702, 'Huancabamba', '200300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363761373164362d393863362d3131, 2),
(1725, 1724, 'Huancabamba', '200301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363761616564622d393863362d3131, 2),
(1726, 1724, 'Canchaque', '200302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363761656662642d393863362d3131, 2),
(1727, 1724, 'El Carmen De La Frontera', '200303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363762316131312d393863362d3131, 2),
(1728, 1724, 'Huarmaca', '200304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363762346334662d393863362d3131, 2),
(1729, 1724, 'Lalaquiz', '200305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363762376133662d393863362d3131, 2),
(1730, 1724, 'San Miguel De El Faique', '200306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363762623762332d393863362d3131, 2),
(1731, 1724, 'Sondor', '200307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363762653663372d393863362d3131, 2),
(1732, 1724, 'Sondorillo', '200308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363763303562652d393863362d3131, 2),
(1733, 1702, 'Morropon', '200400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363763343862362d393863362d3131, 2),
(1734, 1733, 'Chulucanas', '200401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363763373965372d393863362d3131, 2),
(1735, 1733, 'Buenos Aires', '200402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363763396339622d393863362d3131, 2),
(1736, 1733, 'Chalaco', '200403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363763643837302d393863362d3131, 2),
(1737, 1733, 'La Matanza', '200404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363764313832662d393863362d3131, 2),
(1738, 1733, 'Morropon', '200405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363764343834302d393863362d3131, 2),
(1739, 1733, 'Salitral', '200406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363764376531342d393863362d3131, 2),
(1740, 1733, 'San Juan De Bigote', '200407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363764616465312d393863362d3131, 2),
(1741, 1733, 'Santa Catalina De Mossa', '200408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363764653839342d393863362d3131, 2),
(1742, 1733, 'Santo Domingo', '200409', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363765323438352d393863362d3131, 2),
(1743, 1733, 'Yamango', '200410', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363765353364632d393863362d3131, 2),
(1744, 1702, 'Paita', '200500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363765393161302d393863362d3131, 2),
(1745, 1744, 'Paita', '200501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363765633236622d393863362d3131, 2),
(1746, 1744, 'Amotape', '200502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363765653464662d393863362d3131, 2),
(1747, 1744, 'Arenal', '200503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363766313463622d393863362d3131, 2),
(1748, 1744, 'Colan', '200504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363766333635382d393863362d3131, 2),
(1749, 1744, 'La Huaca', '200505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363766373061662d393863362d3131, 2),
(1750, 1744, 'Tamarindo', '200506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363766626262332d393863362d3131, 2),
(1751, 1744, 'Vichayal', '200507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363766663361322d393863362d3131, 2),
(1752, 1702, 'Sullana', '200600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363830323530332d393863362d3131, 2),
(1753, 1752, 'Sullana', '200601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363830363762632d393863362d3131, 2),
(1754, 1752, 'Bellavista', '200602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363830393464342d393863362d3131, 2),
(1755, 1752, 'Ignacio Escudero', '200603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363830643232652d393863362d3131, 2),
(1756, 1752, 'Lancones', '200604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363831313430352d393863362d3131, 2),
(1757, 1752, 'Marcavelica', '200605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363831343137322d393863362d3131, 2),
(1758, 1752, 'Miguel Checa', '200606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363831376665382d393863362d3131, 2),
(1759, 1752, 'Querecotillo', '200607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363831616339392d393863362d3131, 2),
(1760, 1752, 'Salitral', '200608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363831663132632d393863362d3131, 2),
(1761, 1702, 'Talara', '200700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363832323561372d393863362d3131, 2),
(1762, 1761, 'Pariñas', '200701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363832353230302d393863362d3131, 2),
(1763, 1761, 'El Alto', '200702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363832383330642d393863362d3131, 2),
(1764, 1761, 'La Brea', '200703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363832623566632d393863362d3131, 2),
(1765, 1761, 'Lobitos', '200704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363832646165632d393863362d3131, 2),
(1766, 1761, 'Los Organos', '200705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363833313832322d393863362d3131, 2),
(1767, 1761, 'Mancora', '200706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363833333963342d393863362d3131, 2),
(1768, 1702, 'Sechura', '200800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363833373932332d393863362d3131, 2),
(1769, 1768, 'Sechura', '200801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363833616137362d393863362d3131, 2),
(1770, 1768, 'Bellavista De La Union', '200802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363833636165352d393863362d3131, 2),
(1771, 1768, 'Bernal', '200803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363833666363632d393863362d3131, 2),
(1772, 1768, 'Cristo Nos Valga', '200804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363834336432332d393863362d3131, 2),
(1773, 1768, 'Vice', '200805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363834363662632d393863362d3131, 2),
(1774, 1768, 'Rinconada Llicuar', '200806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363834393937662d393863362d3131, 2),
(1775, 2055, 'Puno', '210000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363834633465332d393863362d3131, 2),
(1776, 1775, 'Puno', '210100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363835303461642d393863362d3131, 2),
(1777, 1776, 'Puno', '210101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363835343337382d393863362d3131, 2),
(1778, 1776, 'Acora', '210102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363835363539362d393863362d3131, 2),
(1779, 1776, 'Amantani', '210103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363835613765322d393863362d3131, 2),
(1780, 1776, 'Atuncolla', '210104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363835653333662d393863362d3131, 2),
(1781, 1776, 'Capachica', '210105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363836313036392d393863362d3131, 2),
(1782, 1776, 'Chucuito', '210106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363836343136372d393863362d3131, 2),
(1783, 1776, 'Coata', '210107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363836373266302d393863362d3131, 2),
(1784, 1776, 'Huata', '210108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363836623133302d393863362d3131, 2),
(1785, 1776, 'Mañazo', '210109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363836663163362d393863362d3131, 2),
(1786, 1776, 'Paucarcolla', '210110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363837313138302d393863362d3131, 2),
(1787, 1776, 'Pichacani', '210111', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363837353431652d393863362d3131, 2),
(1788, 1776, 'Plateria', '210112', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363837393638642d393863362d3131, 2),
(1789, 1776, 'San Antonio', '210113', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363837623639352d393863362d3131, 2),
(1790, 1776, 'Tiquillaca', '210114', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363837653838642d393863362d3131, 2),
(1791, 1776, 'Vilque', '210115', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363838303839632d393863362d3131, 2),
(1792, 1775, 'Azangaro', '210200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363838343633362d393863362d3131, 2),
(1793, 1792, 'Azangaro', '210201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363838383566342d393863362d3131, 2),
(1794, 1792, 'Achaya', '210202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363838626434342d393863362d3131, 2),
(1795, 1792, 'Arapa', '210203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363838666564312d393863362d3131, 2),
(1796, 1792, 'Asillo', '210204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363839336539342d393863362d3131, 2),
(1797, 1792, 'Caminaca', '210205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363839373961662d393863362d3131, 2),
(1798, 1792, 'Chupa', '210206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363839633230642d393863362d3131, 2),
(1799, 1792, 'Jose Domingo Choquehuanca', '210207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363839666265342d393863362d3131, 2),
(1800, 1792, 'Muñani', '210208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363861333338332d393863362d3131, 2),
(1801, 1792, 'Potoni', '210209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363861353662382d393863362d3131, 2),
(1802, 1792, 'Saman', '210210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363861376132312d393863362d3131, 2),
(1803, 1792, 'San Anton', '210211', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363861616630632d393863362d3131, 2),
(1804, 1792, 'San Jose', '210212', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363861663638362d393863362d3131, 2),
(1805, 1792, 'San Juan De Salinas', '210213', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363862326139662d393863362d3131, 2),
(1806, 1792, 'Santiago De Pupuja', '210214', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363862363030352d393863362d3131, 2),
(1807, 1792, 'Tirapata', '210215', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363862386632652d393863362d3131, 2),
(1808, 1775, 'Carabaya', '210300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363862623262382d393863362d3131, 2),
(1809, 1808, 'Macusani', '210301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363862653461392d393863362d3131, 2),
(1810, 1808, 'Ajoyani', '210302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363863303462302d393863362d3131, 2),
(1811, 1808, 'Ayapata', '210303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363863343432352d393863362d3131, 2),
(1812, 1808, 'Coasa', '210304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363863383637312d393863362d3131, 2),
(1813, 1808, 'Corani', '210305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363863613635302d393863362d3131, 2),
(1814, 1808, 'Crucero', '210306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363863653339352d393863362d3131, 2),
(1815, 1808, 'Ituata', '210307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363864323430622d393863362d3131, 2),
(1816, 1808, 'Ollachea', '210308', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363864363330312d393863362d3131, 2),
(1817, 1808, 'San Gaban', '210309', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363864386337612d393863362d3131, 2),
(1818, 1808, 'Usicayos', '210310', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363864636266662d393863362d3131, 2),
(1819, 1775, 'Chucuito', '210400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363864663833652d393863362d3131, 2),
(1820, 1819, 'Juli', '210401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363865323961322d393863362d3131, 2),
(1821, 1819, 'Desaguadero', '210402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363865366262352d393863362d3131, 2),
(1822, 1819, 'Huacullani', '210403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363865393731652d393863362d3131, 2),
(1823, 1819, 'Kelluyo', '210404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363865643937302d393863362d3131, 2),
(1824, 1819, 'Pisacoma', '210405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363865666437372d393863362d3131, 2),
(1825, 1819, 'Pomata', '210406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363866326532322d393863362d3131, 2),
(1826, 1819, 'Zepita', '210407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363866356137322d393863362d3131, 2),
(1827, 1775, 'El Collao', '210500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363866376266662d393863362d3131, 2),
(1828, 1827, 'Ilave', '210501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363866626466322d393863362d3131, 2),
(1829, 1827, 'Capazo', '210502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363866663338622d393863362d3131, 2),
(1830, 1827, 'Pilcuyo', '210503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363930313936642d393863362d3131, 2),
(1831, 1827, 'Santa Rosa', '210504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363930353466632d393863362d3131, 2),
(1832, 1827, 'Conduriri', '210505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363930386637312d393863362d3131, 2),
(1833, 1775, 'Huancane', '210600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363930626561372d393863362d3131, 2),
(1834, 1833, 'Huancane', '210601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363930663038332d393863362d3131, 2),
(1835, 1833, 'Cojata', '210602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363931316632382d393863362d3131, 2),
(1836, 1833, 'Huatasani', '210603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363931353134312d393863362d3131, 2),
(1837, 1833, 'Inchupalla', '210604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363931393434322d393863362d3131, 2),
(1838, 1833, 'Pusi', '210605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363931626239612d393863362d3131, 2),
(1839, 1833, 'Rosaspata', '210606', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363931656438632d393863362d3131, 2),
(1840, 1833, 'Taraco', '210607', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363932323131612d393863362d3131, 2),
(1841, 1833, 'Vilque Chico', '210608', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363932346561642d393863362d3131, 2),
(1842, 1775, 'Lampa', '210700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363932393437612d393863362d3131, 2),
(1843, 1842, 'Lampa', '210701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363932623566362d393863362d3131, 2),
(1844, 1842, 'Cabanilla', '210702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363932666538342d393863362d3131, 2),
(1845, 1842, 'Calapuja', '210703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363933343930652d393863362d3131, 2),
(1846, 1842, 'Nicasio', '210704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363933373330372d393863362d3131, 2),
(1847, 1842, 'Ocuviri', '210705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363933626661632d393863362d3131, 2),
(1848, 1842, 'Palca', '210706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363934303364332d393863362d3131, 2),
(1849, 1842, 'Paratia', '210707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363934333335652d393863362d3131, 2),
(1850, 1842, 'Pucara', '210708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363934373232612d393863362d3131, 2),
(1851, 1842, 'Santa Lucia', '210709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363934393333392d393863362d3131, 2),
(1852, 1842, 'Vilavila', '210710', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363934643632352d393863362d3131, 2),
(1853, 1775, 'Melgar', '210800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363935303930622d393863362d3131, 2),
(1854, 1853, 'Ayaviri', '210801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363935333732382d393863362d3131, 2),
(1855, 1853, 'Antauta', '210802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363935363663652d393863362d3131, 2),
(1856, 1853, 'Cupi', '210803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363935396465612d393863362d3131, 2),
(1857, 1853, 'Llalli', '210804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363935636465652d393863362d3131, 2),
(1858, 1853, 'Macari', '210805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363936303861372d393863362d3131, 2),
(1859, 1853, 'Nuñoa', '210806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363936326361362d393863362d3131, 2),
(1860, 1853, 'Orurillo', '210807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363936356462332d393863362d3131, 2),
(1861, 1853, 'Santa Rosa', '210808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363936396365382d393863362d3131, 2),
(1862, 1853, 'Umachiri', '210809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363936636234322d393863362d3131, 2),
(1863, 1775, 'Moho', '210900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363936666262322d393863362d3131, 2),
(1864, 1863, 'Moho', '210901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363937346434332d393863362d3131, 2),
(1865, 1863, 'Conima', '210902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363937376537342d393863362d3131, 2),
(1866, 1863, 'Huayrapata', '210903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363937626236342d393863362d3131, 2),
(1867, 1863, 'Tilali', '210904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363937653761342d393863362d3131, 2),
(1868, 1775, 'San Antonio De Putina', '211000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363938323438302d393863362d3131, 2),
(1869, 1868, 'Putina', '211001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363938363835352d393863362d3131, 2),
(1870, 1868, 'Ananea', '211002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363938393364632d393863362d3131, 2),
(1871, 1868, 'Pedro Vilca Apaza', '211003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363938633533362d393863362d3131, 2),
(1872, 1868, 'Quilcapuncu', '211004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363939303334632d393863362d3131, 2),
(1873, 1868, 'Sina', '211005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363939333031322d393863362d3131, 2),
(1874, 1775, 'San Roman', '211100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363939363335652d393863362d3131, 2),
(1875, 1874, 'Juliaca', '211101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363939386665642d393863362d3131, 2),
(1876, 1874, 'Cabana', '211102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363939643036622d393863362d3131, 2),
(1877, 1874, 'Cabanillas', '211103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363961313232312d393863362d3131, 2),
(1878, 1874, 'Caracoto', '211104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363961336533652d393863362d3131, 2),
(1879, 1775, 'Sandia', '211200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363961383138642d393863362d3131, 2),
(1880, 1879, 'Sandia', '211201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363961623062362d393863362d3131, 2),
(1881, 1879, 'Cuyocuyo', '211202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363961653030342d393863362d3131, 2),
(1882, 1879, 'Limbani', '211203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363962323138392d393863362d3131, 2),
(1883, 1879, 'Patambuco', '211204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363962363037392d393863362d3131, 2),
(1884, 1879, 'Phara', '211205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363962386338332d393863362d3131, 2),
(1885, 1879, 'Quiaca', '211206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363962633939642d393863362d3131, 2),
(1886, 1879, 'San Juan Del Oro', '211207', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363962656366312d393863362d3131, 2),
(1887, 1879, 'Yanahuaya', '211208', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363963333139372d393863362d3131, 2),
(1888, 1879, 'Alto Inambari', '211209', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363963363066652d393863362d3131, 2),
(1889, 1879, 'San Pedro De Putina Punco', '211210', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363963393266652d393863362d3131, 2),
(1890, 1775, 'Yunguyo', '211300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363963643065302d393863362d3131, 2),
(1891, 1890, 'Yunguyo', '211301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363964313866382d393863362d3131, 2),
(1892, 1890, 'Anapia', '211302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363964343536652d393863362d3131, 2),
(1893, 1890, 'Copani', '211303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363964376563372d393863362d3131, 2),
(1894, 1890, 'Cuturapi', '211304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363964616238312d393863362d3131, 2),
(1895, 1890, 'Ollaraya', '211305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363964653862362d393863362d3131, 2),
(1896, 1890, 'Tinicachi', '211306', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363965306333642d393863362d3131, 2),
(1897, 1890, 'Unicachi', '211307', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363965326463642d393863362d3131, 2),
(1898, 2055, 'San Martin', '220000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363965366361312d393863362d3131, 2),
(1899, 1898, 'Moyobamba', '220100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363965396366332d393863362d3131, 2),
(1900, 1899, 'Moyobamba', '220101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363965626338382d393863362d3131, 2),
(1901, 1899, 'Calzada', '220102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363965656263352d393863362d3131, 2),
(1902, 1899, 'Habana', '220103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363966306161652d393863362d3131, 2),
(1903, 1899, 'Jepelacio', '220104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363966343963392d393863362d3131, 2),
(1904, 1899, 'Soritor', '220105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363966376365652d393863362d3131, 2),
(1905, 1899, 'Yantalo', '220106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363966613834302d393863362d3131, 2),
(1906, 1898, 'Bellavista', '220200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38363966656130322d393863362d3131, 2),
(1907, 1906, 'Bellavista', '220201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366130316166322d393863362d3131, 2),
(1908, 1906, 'Alto Biavo', '220202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366130336261302d393863362d3131, 2),
(1909, 1906, 'Bajo Biavo', '220203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366130373935652d393863362d3131, 2),
(1910, 1906, 'Huallaga', '220204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366130616165612d393863362d3131, 2),
(1911, 1906, 'San Pablo', '220205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366130646336372d393863362d3131, 2),
(1912, 1906, 'San Rafael', '220206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366131306661302d393863362d3131, 2),
(1913, 1898, 'El Dorado', '220300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366131343161312d393863362d3131, 2),
(1914, 1913, 'San Jose De Sisa', '220301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366131366639302d393863362d3131, 2),
(1915, 1913, 'Agua Blanca', '220302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366131613163342d393863362d3131, 2),
(1916, 1913, 'San Martin', '220303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366131636461632d393863362d3131, 2),
(1917, 1913, 'Santa Rosa', '220304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366131666433652d393863362d3131, 2),
(1918, 1913, 'Shatoja', '220305', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366132336666322d393863362d3131, 2),
(1919, 1898, 'Huallaga', '220400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366132366236312d393863362d3131, 2),
(1920, 1919, 'Saposoa', '220401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366132396337382d393863362d3131, 2),
(1921, 1919, 'Alto Saposoa', '220402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366132636235642d393863362d3131, 2),
(1922, 1919, 'El Eslabon', '220403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366132666264632d393863362d3131, 2),
(1923, 1919, 'Piscoyacu', '220404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366133326462642d393863362d3131, 2),
(1924, 1919, 'Sacanche', '220405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366133363930362d393863362d3131, 2),
(1925, 1919, 'Tingo De Saposoa', '220406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366133396530642d393863362d3131, 2),
(1926, 1898, 'Lamas', '220500', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366133643733352d393863362d3131, 2),
(1927, 1926, 'Lamas', '220501', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134303633342d393863362d3131, 2),
(1928, 1926, 'Alonso De Alvarado', '220502', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134333538612d393863362d3131, 2),
(1929, 1926, 'Barranquita', '220503', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134353330372d393863362d3131, 2),
(1930, 1926, 'Caynarachi', '220504', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134383037612d393863362d3131, 2),
(1931, 1926, 'Cuñumbuqui', '220505', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134616465642d393863362d3131, 2),
(1932, 1926, 'Pinto Recodo', '220506', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134636232622d393863362d3131, 2),
(1933, 1926, 'Rumisapa', '220507', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366134663934342d393863362d3131, 2),
(1934, 1926, 'San Roque De Cumbaza', '220508', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366135323635342d393863362d3131, 2),
(1935, 1926, 'Shanao', '220509', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366135343437622d393863362d3131, 2),
(1936, 1926, 'Tabalosos', '220510', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366135373836362d393863362d3131, 2),
(1937, 1926, 'Zapatero', '220511', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366135613965612d393863362d3131, 2),
(1938, 1898, 'Mariscal Caceres', '220600', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366135633961632d393863362d3131, 2),
(1939, 1938, 'Juanjui', '220601', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366136313839362d393863362d3131, 2),
(1940, 1938, 'Campanilla', '220602', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366136343331622d393863362d3131, 2),
(1941, 1938, 'Huicungo', '220603', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366136386439612d393863362d3131, 2),
(1942, 1938, 'Pachiza', '220604', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366136626435342d393863362d3131, 2),
(1943, 1938, 'Pajarillo', '220605', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366136656464632d393863362d3131, 2),
(1944, 1898, 'Picota', '220700', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366137306631322d393863362d3131, 2),
(1945, 1944, 'Picota', '220701', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366137336433352d393863362d3131, 2),
(1946, 1944, 'Buenos Aires', '220702', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366137356162362d393863362d3131, 2),
(1947, 1944, 'Caspisapa', '220703', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366137386361622d393863362d3131, 2),
(1948, 1944, 'Pilluana', '220704', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366137636461372d393863362d3131, 2),
(1949, 1944, 'Pucacaca', '220705', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366137663537302d393863362d3131, 2),
(1950, 1944, 'San Cristobal', '220706', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366138336137632d393863362d3131, 2),
(1951, 1944, 'San Hilarion', '220707', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366138363739632d393863362d3131, 2),
(1952, 1944, 'Shamboyacu', '220708', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366138613935322d393863362d3131, 2),
(1953, 1944, 'Tingo De Ponasa', '220709', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366138653632662d393863362d3131, 2),
(1954, 1944, 'Tres Unidos', '220710', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366139303533392d393863362d3131, 2),
(1955, 1898, 'Rioja', '220800', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366139333630382d393863362d3131, 2),
(1956, 1955, 'Rioja', '220801', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366139373063632d393863362d3131, 2),
(1957, 1955, 'Awajun', '220802', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366139393139332d393863362d3131, 2),
(1958, 1955, 'Elias Soplin Vargas', '220803', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366139643362392d393863362d3131, 2),
(1959, 1955, 'Nueva Cajamarca', '220804', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366161303364322d393863362d3131, 2),
(1960, 1955, 'Pardo Miguel', '220805', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366161333436372d393863362d3131, 2),
(1961, 1955, 'Posic', '220806', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366161363239662d393863362d3131, 2),
(1962, 1955, 'San Fernando', '220807', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366161383165612d393863362d3131, 2),
(1963, 1955, 'Yorongos', '220808', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366161616638372d393863362d3131, 2),
(1964, 1955, 'Yuracyacu', '220809', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366161646663302d393863362d3131, 2),
(1965, 1898, 'San Martin', '220900', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366162306336642d393863362d3131, 2),
(1966, 1965, 'Tarapoto', '220901', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366162336435662d393863362d3131, 2),
(1967, 1965, 'Alberto Leveau', '220902', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366162366334382d393863362d3131, 2),
(1968, 1965, 'Cacatachi', '220903', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366162386133342d393863362d3131, 2),
(1969, 1965, 'Chazuta', '220904', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366162636535362d393863362d3131, 2),
(1970, 1965, 'Chipurana', '220905', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366162666461642d393863362d3131, 2),
(1971, 1965, 'El Porvenir', '220906', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366163326139302d393863362d3131, 2),
(1972, 1965, 'Huimbayoc', '220907', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366163356239632d393863362d3131, 2),
(1973, 1965, 'Juan Guerra', '220908', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366163386164342d393863362d3131, 2),
(1974, 1965, 'La Banda De Shilcayo', '220909', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366163633765362d393863362d3131, 2),
(1975, 1965, 'Morales', '220910', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366163663830372d393863362d3131, 2),
(1976, 1965, 'Papaplaya', '220911', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366164323731392d393863362d3131, 2),
(1977, 1965, 'San Antonio', '220912', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366164353839662d393863362d3131, 2),
(1978, 1965, 'Sauce', '220913', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366164396163662d393863362d3131, 2),
(1979, 1965, 'Shapaja', '220914', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366164633832632d393863362d3131, 2),
(1980, 1898, 'Tocache', '221000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366165303633322d393863362d3131, 2),
(1981, 1980, 'Tocache', '221001', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366165333464622d393863362d3131, 2),
(1982, 1980, 'Nuevo Progreso', '221002', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366165353763392d393863362d3131, 2),
(1983, 1980, 'Polvora', '221003', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366165383936342d393863362d3131, 2),
(1984, 1980, 'Shunte', '221004', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366165626131312d393863362d3131, 2),
(1985, 1980, 'Uchiza', '221005', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366165663866342d393863362d3131, 2),
(1986, 2055, 'Tacna', '230000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366166333032332d393863362d3131, 2),
(1987, 1986, 'Tacna', '230100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366166366565642d393863362d3131, 2),
(1988, 1987, 'Tacna', '230101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366166613635322d393863362d3131, 2),
(1989, 1987, 'Alto De La Alianza', '230102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366166653438362d393863362d3131, 2),
(1990, 1987, 'Calana', '230103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366230313337322d393863362d3131, 2),
(1991, 1987, 'Ciudad Nueva', '230104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366230343561372d393863362d3131, 2);
INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(1992, 1987, 'Inclan', '230105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366230366636342d393863362d3131, 2),
(1993, 1987, 'Pachia', '230106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366230396366652d393863362d3131, 2),
(1994, 1987, 'Palca', '230107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366230636532642d393863362d3131, 2),
(1995, 1987, 'Pocollay', '230108', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366230666362652d393863362d3131, 2),
(1996, 1987, 'Sama', '230109', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366231323134312d393863362d3131, 2),
(1997, 1987, 'Coronel Gregorio Albarracin Lanchipa', '230110', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366231343232622d393863362d3131, 2),
(1998, 1986, 'Candarave', '230200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366231373430302d393863362d3131, 2),
(1999, 1998, 'Candarave', '230201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366231623333302d393863362d3131, 2),
(2000, 1998, 'Cairani', '230202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366231653161392d393863362d3131, 2),
(2001, 1998, 'Camilaca', '230203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366232323437332d393863362d3131, 2),
(2002, 1998, 'Curibaya', '230204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366232363539642d393863362d3131, 2),
(2003, 1998, 'Huanuara', '230205', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366232383534372d393863362d3131, 2),
(2004, 1998, 'Quilahuani', '230206', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366232633235662d393863362d3131, 2),
(2005, 1986, 'Jorge Basadre', '230300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366233303530372d393863362d3131, 2),
(2006, 2005, 'Locumba', '230301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366233326636392d393863362d3131, 2),
(2007, 2005, 'Ilabaya', '230302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366233373335612d393863362d3131, 2),
(2008, 2005, 'Ite', '230303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366233643266632d393863362d3131, 2),
(2009, 1986, 'Tarata', '230400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366233663738632d393863362d3131, 2),
(2010, 2009, 'Tarata', '230401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366234333766662d393863362d3131, 2),
(2011, 2009, 'Heroes Albarracin', '230402', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366234363935372d393863362d3131, 2),
(2012, 2009, 'Estique', '230403', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366234396265652d393863362d3131, 2),
(2013, 2009, 'Estique-Pampa', '230404', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366234643961372d393863362d3131, 2),
(2014, 2009, 'Sitajara', '230405', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366234666139332d393863362d3131, 2),
(2015, 2009, 'Susapaya', '230406', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366235316432342d393863362d3131, 2),
(2016, 2009, 'Tarucachi', '230407', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366235336534642d393863362d3131, 2),
(2017, 2009, 'Ticaco', '230408', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366235356431372d393863362d3131, 2),
(2018, 2055, 'Tumbes', '240000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366235386336622d393863362d3131, 2),
(2019, 2018, 'Tumbes', '240100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366235636437612d393863362d3131, 2),
(2020, 2019, 'Tumbes', '240101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366235663865642d393863362d3131, 2),
(2021, 2019, 'Corrales', '240102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366236323937372d393863362d3131, 2),
(2022, 2019, 'La Cruz', '240103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366236353937382d393863362d3131, 2),
(2023, 2019, 'Pampas De Hospital', '240104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366236393362312d393863362d3131, 2),
(2024, 2019, 'San Jacinto', '240105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366236633339342d393863362d3131, 2),
(2025, 2019, 'San Juan De La Virgen', '240106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366236663334662d393863362d3131, 2),
(2026, 2018, 'Contralmirante Villar', '240200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366237323437392d393863362d3131, 2),
(2027, 2026, 'Zorritos', '240201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366237363564392d393863362d3131, 2),
(2028, 2026, 'Casitas', '240202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366237396133372d393863362d3131, 2),
(2029, 2026, 'Canoas De Punta Sal', '240203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366237643532622d393863362d3131, 2),
(2030, 2018, 'Zarumilla', '240300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366238313833322d393863362d3131, 2),
(2031, 2030, 'Zarumilla', '240301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366238353532352d393863362d3131, 2),
(2032, 2030, 'Aguas Verdes', '240302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366238396239382d393863362d3131, 2),
(2033, 2030, 'Matapalo', '240303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366238643437652d393863362d3131, 2),
(2034, 2030, 'Papayal', '240304', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366239306265352d393863362d3131, 2),
(2035, 2055, 'Ucayali', '250000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366239346365642d393863362d3131, 2),
(2036, 2035, 'Coronel Portillo', '250100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366239383066312d393863362d3131, 2),
(2037, 2036, 'Calleria', '250101', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366239626666652d393863362d3131, 2),
(2038, 2036, 'Campoverde', '250102', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366239666261372d393863362d3131, 2),
(2039, 2036, 'Iparia', '250103', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366261316430352d393863362d3131, 2),
(2040, 2036, 'Masisea', '250104', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366261346133312d393863362d3131, 2),
(2041, 2036, 'Yarinacocha', '250105', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366261373862612d393863362d3131, 2),
(2042, 2036, 'Nueva Requena', '250106', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366261393830332d393863362d3131, 2),
(2043, 2036, 'Manantay', '250107', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366261626237612d393863362d3131, 2),
(2044, 2035, 'Atalaya', '250200', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366261653836652d393863362d3131, 2),
(2045, 2044, 'Raymondi', '250201', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366262326562362d393863362d3131, 2),
(2046, 2044, 'Sepahua', '250202', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366262363065362d393863362d3131, 2),
(2047, 2044, 'Tahuania', '250203', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366262386533372d393863362d3131, 2),
(2048, 2044, 'Yurua', '250204', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366262643330362d393863362d3131, 2),
(2049, 2035, 'Padre Abad', '250300', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366263313030612d393863362d3131, 2),
(2050, 2049, 'Padre Abad', '250301', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366263326366332d393863362d3131, 2),
(2051, 2049, 'Irazola', '250302', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366263356237312d393863362d3131, 2),
(2052, 2049, 'Curimana', '250303', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366263386237342d393863362d3131, 2),
(2053, 2035, 'Purus', '250400', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366263636137312d393863362d3131, 2),
(2054, 2053, 'Purus', '250401', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366263666262332d393863362d3131, 2),
(2055, 2679, 'Perú', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366264326138392d393863362d3131, 2),
(2056, 705, 'Chirinos', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366264353861642d393863362d3131, 2),
(2057, 705, 'El Corazón', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366264383936382d393863362d3131, 2),
(2058, 705, 'El Limón', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366264623563312d393863362d3131, 2),
(2059, 705, 'Huacacuro', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366264663634662d393863362d3131, 2),
(2060, 705, 'La Tranca', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366265323261312d393863362d3131, 2),
(2061, 705, 'Santa Rosa', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366265363938622d393863362d3131, 2),
(2062, 695, 'Nuevo Moyobamba', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366265613438342d393863362d3131, 2),
(2063, 695, 'San Ramon Alto', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366265643262652d393863362d3131, 2),
(2064, 706, 'El Triunfo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366266306631622d393863362d3131, 2),
(2065, 706, 'Huaduillo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366266336665372d393863362d3131, 2),
(2066, 706, 'La Mushca', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366266363663322d393863362d3131, 2),
(2067, 706, 'Las Chontas', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366266613664612d393863362d3131, 2),
(2068, 706, 'Miraflores', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366266636562382d393863362d3131, 2),
(2069, 706, 'Nuevo Piura', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366266666436662d393863362d3131, 2),
(2070, 706, 'Vista Florida', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366330316663652d393863362d3131, 2),
(2071, 706, 'San Martin del Ch.', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366330343130652d393863362d3131, 2),
(2072, 691, 'Chambamontera', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366330383264302d393863362d3131, 2),
(2073, 691, 'Colasay', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366330626538622d393863362d3131, 2),
(2074, 691, 'El Eden', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366330646434632d393863362d3131, 2),
(2075, 691, 'El Nogal', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366331303037642d393863362d3131, 2),
(2076, 691, 'La Cascarilla', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366331323037632d393863362d3131, 2),
(2077, 691, 'La Palma Central', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366331346638382d393863362d3131, 2),
(2078, 691, 'San José de la Alianza', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366331376538382d393863362d3131, 2),
(2079, 691, 'San Miguel de las Naranjas', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366331613839342d393863362d3131, 2),
(2080, 691, 'Santa Maria', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366331656465332d393863362d3131, 2),
(2081, 691, 'Tabacal', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366332323837302d393863362d3131, 2),
(2082, 691, 'Valencia', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366332353530392d393863362d3131, 2),
(2083, 691, 'Vista Alegre', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366332386365332d393863362d3131, 2),
(2084, 707, 'Buenos Aires', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366332633163312d393863362d3131, 2),
(2085, 707, 'Chimburique', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366332653335632d393863362d3131, 2),
(2086, 707, 'El Vergel', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366333323131612d393863362d3131, 2),
(2087, 707, 'La Lima', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366333346664302d393863362d3131, 2),
(2088, 707, 'La Coipa', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366333383163362d393863362d3131, 2),
(2089, 707, 'Las Cocas', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366333633430342d393863362d3131, 2),
(2090, 707, 'Machetillo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366334303033342d393863362d3131, 2),
(2091, 707, 'Miraflores', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366334336664302d393863362d3131, 2),
(2092, 707, 'San Marcos', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366334366537662d393863362d3131, 2),
(2093, 707, 'Tamboa', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366334396561372d393863362d3131, 2),
(2094, 696, 'La Laguna', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366334636336342d393863362d3131, 2),
(2095, 704, 'Chamanal', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366334656532372d393863362d3131, 2),
(2096, 704, 'Mandinga', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366335333133352d393863362d3131, 2),
(2097, 701, 'El Triunfo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366335366431622d393863362d3131, 2),
(2098, 701, 'Rastrojos', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366335386566612d393863362d3131, 2),
(2099, 701, 'San Francisco', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366335643034612d393863362d3131, 2),
(2100, 701, 'San Lorenzo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366336303064662d393863362d3131, 2),
(2101, 701, 'San Pedro', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366336343232662d393863362d3131, 2),
(2102, 701, 'Sector Flor de Café', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366336376436342d393863362d3131, 2),
(2103, 702, 'San Juan de Lazo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366336396538632d393863362d3131, 2),
(2104, 702, 'El Molino', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366336653231312d393863362d3131, 2),
(2105, 702, 'El Palmal', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366337306632302d393863362d3131, 2),
(2106, 702, 'Legido', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366337326665392d393863362d3131, 2),
(2107, 702, 'Puentecillos', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366337373361332d393863362d3131, 2),
(2108, 702, 'Santa Rosa', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366337613465332d393863362d3131, 2),
(2109, 710, 'Linderos', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366337643064642d393863362d3131, 2),
(2110, 710, 'El Valor', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366338303033382d393863362d3131, 2),
(2111, 710, 'La Almendra', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366338326436382d393863362d3131, 2),
(2112, 710, 'La Bermeja', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366338366539332d393863362d3131, 2),
(2113, 710, 'La Florida', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366338616432302d393863362d3131, 2),
(2114, 710, 'Naranjo', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366338646430652d393863362d3131, 2),
(2115, 710, 'Nueva Libertad', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366339306232632d393863362d3131, 2),
(2116, 710, 'Puerto San Francisco', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366339326262312d393863362d3131, 2),
(2117, 710, 'Torohuaca', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366339373030382d393863362d3131, 2),
(2118, 706, 'Nuevo Valle', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366339623066662d393863362d3131, 2),
(2119, 691, 'Unión Las Malvinas', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x38366339653435332d393863362d3131, 2),
(2451, 2679, 'Afganistán', 'AFG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643638363562362d393863362d3131, 2),
(2452, 2679, 'Angola', 'AGO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643639306634622d393863362d3131, 2),
(2453, 2679, 'Albania', 'ALB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643639343731332d393863362d3131, 2),
(2454, 2679, 'Andorra', 'AND', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643639373539662d393863362d3131, 2),
(2455, 2679, 'Emiratos Árabes Unidos', 'ARE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643639396435372d393863362d3131, 2),
(2456, 2679, 'Argentina', 'ARG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643639646436392d393863362d3131, 2),
(2457, 2679, 'Armenia', 'ARM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643661306230312d393863362d3131, 2),
(2458, 2679, 'Antigua y Barbuda', 'ATG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643661336235312d393863362d3131, 2),
(2459, 2679, 'Australia', 'AUS', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643661366361322d393863362d3131, 2),
(2460, 2679, 'Austria', 'AUT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643661393737662d393863362d3131, 2),
(2461, 2679, 'Azerbaiyán', 'AZE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643661633861632d393863362d3131, 2),
(2462, 2679, 'Burundi', 'BDI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643661666262322d393863362d3131, 2),
(2463, 2679, 'Bélgica', 'BEL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643662313965322d393863362d3131, 2),
(2464, 2679, 'Benin', 'BEN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643662356137652d393863362d3131, 2),
(2465, 2679, 'Burkina Faso', 'BFA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643662373764622d393863362d3131, 2),
(2466, 2679, 'Bangladesh', 'BGD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643662616238622d393863362d3131, 2),
(2467, 2679, 'Bulgaria', 'BGR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643662653361372d393863362d3131, 2),
(2468, 2679, 'Bahrein', 'BHR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663303139322d393863362d3131, 2),
(2469, 2679, 'Bahamas', 'BHS', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663333062382d393863362d3131, 2),
(2470, 2679, 'Bosnia y Herzegovina', 'BIH', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663346663662d393863362d3131, 2),
(2471, 2679, 'Bielorrusia', 'BLR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663373062302d393863362d3131, 2),
(2472, 2679, 'Belice', 'BLZ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663613233622d393863362d3131, 2),
(2473, 2679, 'Bolivia', 'BOL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663633035632d393863362d3131, 2),
(2474, 2679, 'Brasil', 'BRA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643663663436302d393863362d3131, 2),
(2475, 2679, 'Barbados', 'BRB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643664313439392d393863362d3131, 2),
(2476, 2679, 'Bhután', 'BTN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643664343238372d393863362d3131, 2),
(2477, 2679, 'Botswana', 'BWA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643664373130352d393863362d3131, 2),
(2478, 2679, 'República Centroafricana', 'CAF', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643664386537352d393863362d3131, 2),
(2479, 2679, 'Canadá', 'CAN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643664623230622d393863362d3131, 2),
(2480, 2679, 'Suiza', 'CHE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643664653063362d393863362d3131, 2),
(2481, 2679, 'Chile', 'CHL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665303135632d393863362d3131, 2),
(2482, 2679, 'China', 'CHN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665333138662d393863362d3131, 2),
(2483, 2679, 'Costa de Marfil', 'CIV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665346439302d393863362d3131, 2),
(2485, 2679, 'República Democrática del Congo', 'COD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665376533362d393863362d3131, 2),
(2486, 2679, 'Congo', 'COG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665396639392d393863362d3131, 2),
(2488, 2679, 'Colombia', 'COL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665633033362d393863362d3131, 2),
(2489, 2679, 'Comoras', 'COM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643665663032342d393863362d3131, 2),
(2490, 2679, 'Cabo Verde', 'CPV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643666306466312d393863362d3131, 2),
(2491, 2679, 'Costa Rica', 'CRI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643666343065392d393863362d3131, 2),
(2492, 2679, 'Cuba', 'CUB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643666373461642d393863362d3131, 2),
(2493, 2679, 'Chipre', 'CYP', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643666613634382d393863362d3131, 2),
(2494, 2679, 'República Checa', 'CZE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643666653963342d393863362d3131, 2),
(2495, 2679, 'Alemania', 'DEU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643730313232372d393863362d3131, 2),
(2496, 2679, 'Yibuti', 'DJI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643730346438652d393863362d3131, 2),
(2497, 2679, 'Dominica', 'DMA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643730393762632d393863362d3131, 2),
(2498, 2679, 'Dinamarca', 'DNK', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643730623566362d393863362d3131, 2),
(2499, 2679, 'República Dominicana', 'DOM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643730653662622d393863362d3131, 2),
(2500, 2679, 'Argelia', 'DZA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643731313534312d393863362d3131, 2),
(2501, 2679, 'Ecuador', 'ECU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643731333133362d393863362d3131, 2),
(2502, 2679, 'Egipto', 'EGY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643731363264332d393863362d3131, 2),
(2503, 2679, 'Eritrea', 'ERI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643731383532642d393863362d3131, 2),
(2504, 2679, 'España', 'ESP', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643731633662612d393863362d3131, 2),
(2505, 2679, 'Estonia', 'EST', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643731653832382d393863362d3131, 2),
(2506, 2679, 'Etiopía', 'ETH', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643732313862302d393863362d3131, 2),
(2507, 2679, 'Finlandia', 'FIN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643732353632392d393863362d3131, 2),
(2508, 2679, 'Fiji (Islas Fiyi)', 'FJI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643732373635652d393863362d3131, 2),
(2509, 2679, 'Francia', 'FRA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643732613335382d393863362d3131, 2),
(2510, 2679, 'Islas Feroe', 'FRO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643732643362322d393863362d3131, 2),
(2511, 2679, 'Micronesia', 'FSM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643733303132312d393863362d3131, 2),
(2512, 2679, 'Gabón', 'GAB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643733326564652d393863362d3131, 2),
(2513, 2679, 'Reino Unido de Gran Bretaña e Irlanda del Norte', 'GBR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643733356462322d393863362d3131, 2),
(2514, 2679, 'Georgia', 'GEO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643733386166342d393863362d3131, 2),
(2515, 2679, 'Ghana', 'GHA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643733626237642d393863362d3131, 2),
(2516, 2679, 'Guinea', 'GIN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643733643832612d393863362d3131, 2),
(2517, 2679, 'Gambia', 'GMB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643734303865322d393863362d3131, 2),
(2518, 2679, 'Guinea Bissau', 'GNB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643734323637322d393863362d3131, 2),
(2519, 2679, 'Guinea Ecuatorial', 'GNQ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643734343934352d393863362d3131, 2),
(2520, 2679, 'Grecia', 'GRC', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643734373764312d393863362d3131, 2),
(2521, 2679, 'Granada', 'GRD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643734393863342d393863362d3131, 2),
(2522, 2679, 'Guatemala', 'GTM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643734643831342d393863362d3131, 2),
(2523, 2679, 'Guyana', 'GUY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735303562352d393863362d3131, 2),
(2524, 2679, 'Honduras', 'HND', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735323631362d393863362d3131, 2),
(2525, 2679, 'Croacia', 'HRV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735353832362d393863362d3131, 2),
(2526, 2679, 'Haití', 'HTI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735373763372d393863362d3131, 2),
(2527, 2679, 'Hungría', 'HUN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735613833322d393863362d3131, 2),
(2528, 2679, 'Indonesia', 'IDN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735643533362d393863362d3131, 2),
(2529, 2679, 'India', 'IND', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643735663565392d393863362d3131, 2),
(2530, 2679, 'Irlanda', 'IRL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643736333639642d393863362d3131, 2),
(2531, 2679, 'Irán', 'IRN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643736363662332d393863362d3131, 2),
(2532, 2679, 'Irak', 'IRQ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643736613231382d393863362d3131, 2),
(2533, 2679, 'Islandia', 'ISL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643736646532362d393863362d3131, 2),
(2534, 2679, 'Israel', 'ISR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643737306133632d393863362d3131, 2),
(2535, 2679, 'Italia', 'ITA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643737333766332d393863362d3131, 2),
(2536, 2679, 'Jamaica', 'JAM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643737383739372d393863362d3131, 2),
(2537, 2679, 'Jordania', 'JOR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643737633533632d393863362d3131, 2),
(2538, 2679, 'Japón', 'JPN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643737663033652d393863362d3131, 2),
(2539, 2679, 'Kazajstán', 'KAZ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643738326439312d393863362d3131, 2),
(2540, 2679, 'Kenya (Kenia)', 'KEN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643738353965302d393863362d3131, 2),
(2541, 2679, 'Kirguistán', 'KGZ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643738393236622d393863362d3131, 2),
(2542, 2679, 'Camboya', 'KHM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643738636665322d393863362d3131, 2),
(2543, 2679, 'Kiribati', 'KIR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643739303662352d393863362d3131, 2),
(2544, 2679, 'Saint Kitts y Nevis (San Cristóbal y Nieves)', 'KNA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643739333730632d393863362d3131, 2),
(2545, 2679, 'Corea, República de ', 'KOR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643739363939632d393863362d3131, 2),
(2546, 2679, 'Kuwait', 'KWT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643739393534352d393863362d3131, 2),
(2547, 2679, 'Lao, República Democrática Popular ', 'LAO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643739633435382d393863362d3131, 2),
(2548, 2679, 'Líbano', 'LBN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643739653335332d393863362d3131, 2),
(2549, 2679, 'Liberia', 'LBR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643761316665352d393863362d3131, 2),
(2550, 2679, 'Libia, Jamahiriya Árabe ', 'LBY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643761356434332d393863362d3131, 2),
(2551, 2679, 'Santa Lucía', 'LCA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643761386135372d393863362d3131, 2),
(2552, 2679, 'Sri Lanka', 'LKA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643761633837352d393863362d3131, 2),
(2553, 2679, 'Lesotho (Lesoto)', 'LSO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643761663535302d393863362d3131, 2),
(2554, 2679, 'Lituania', 'LTU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643762333937362d393863362d3131, 2),
(2555, 2679, 'Luxemburgo', 'LUX', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643762373532392d393863362d3131, 2),
(2556, 2679, 'Letonia', 'LVA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643762396664662d393863362d3131, 2),
(2557, 2679, 'Marruecos', 'MAR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643762646362372d393863362d3131, 2),
(2558, 2679, 'Mónaco', 'MCO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643763313962382d393863362d3131, 2),
(2559, 2679, 'Moldova, República de ', 'MDA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643763343833612d393863362d3131, 2),
(2560, 2679, 'Madagascar', 'MDG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643763373734332d393863362d3131, 2),
(2561, 2679, 'Maldivas', 'MDV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643763613334622d393863362d3131, 2),
(2562, 2679, 'México', 'MEX', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643763646638342d393863362d3131, 2),
(2563, 2679, 'Islas Marshall', 'MHL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643764306638322d393863362d3131, 2),
(2564, 2679, 'Macedonia, ex República Yugoslava de ', 'MKD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643764326562382d393863362d3131, 2),
(2565, 2679, 'Malí', 'MLI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643764356430332d393863362d3131, 2),
(2566, 2679, 'Malta', 'MLT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643764396366362d393863362d3131, 2),
(2567, 2679, 'Myanmar (Birmania)', 'MMR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643764636534362d393863362d3131, 2),
(2568, 2679, 'Montenegro ', 'MNE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643765306662662d393863362d3131, 2),
(2569, 2679, 'Mongolia', 'MNG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643765336362662d393863362d3131, 2),
(2570, 2679, 'Mozambique', 'MOZ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643765376234612d393863362d3131, 2),
(2571, 2679, 'Mauritania', 'MRT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643765616232382d393863362d3131, 2),
(2572, 2679, 'Mauricio', 'MUS', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643765636139622d393863362d3131, 2),
(2573, 2679, 'Malawi', 'MWI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643766303635612d393863362d3131, 2),
(2574, 2679, 'Malasia', 'MYS', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643766323463312d393863362d3131, 2),
(2575, 2679, 'Namibia', 'NAM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643766353439372d393863362d3131, 2),
(2576, 2679, 'Niger', 'NER', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643766383961332d393863362d3131, 2),
(2577, 2679, 'Nigeria', 'NGA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643766623233362d393863362d3131, 2),
(2578, 2679, 'Nicaragua', 'NIC', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643766656563662d393863362d3131, 2),
(2580, 2679, 'Países Bajos', 'NLD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643830316661312d393863362d3131, 2),
(2581, 2679, 'Noruega', 'NOR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643830363137632d393863362d3131, 2),
(2582, 2679, 'Nepal, República Federal Democrática', 'NPL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643830396163312d393863362d3131, 2),
(2584, 2679, 'Nueva Zelandia', 'NZL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643830633932302d393863362d3131, 2),
(2585, 2679, 'Omán', 'OMN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643830663964642d393863362d3131, 2),
(2586, 2679, 'Pakistán', 'PAK', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643831333536642d393863362d3131, 2),
(2587, 2679, 'Panamá', 'PAN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643831353437612d393863362d3131, 2),
(2588, 2679, 'Perú', 'PER', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643831383266622d393863362d3131, 2),
(2589, 2679, 'Filipinas', 'PHL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643831613137302d393863362d3131, 2),
(2590, 2679, 'Palaos', 'PLW', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643831643962372d393863362d3131, 2),
(2591, 2679, 'Papua Nueva Guinea', 'PNG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643832313232642d393863362d3131, 2),
(2592, 2679, 'Polonia', 'POL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643832343866312d393863362d3131, 2),
(2593, 2679, 'Corea; República Popular Democrática de ', 'PRK', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643832386132322d393863362d3131, 2),
(2594, 2679, 'Portugal', 'PRT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643832623531652d393863362d3131, 2),
(2595, 2679, 'Paraguay', 'PRY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643832656664662d393863362d3131, 2),
(2596, 2679, 'Qatar', 'QAT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643833326337362d393863362d3131, 2),
(2597, 2679, 'Rumania', 'ROU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643833346265332d393863362d3131, 2),
(2598, 2679, 'Federación de Rusia', 'RUS', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643833376231632d393863362d3131, 2),
(2599, 2679, 'Rwanda (Ruanda)', 'RWA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643833623734382d393863362d3131, 2),
(2600, 2679, 'Arabia Saudita', 'SAU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643833653564652d393863362d3131, 2),
(2601, 2679, 'Sudán', 'SDN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643834313638332d393863362d3131, 2),
(2602, 2679, 'Senegal', 'SEN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643834333631322d393863362d3131, 2),
(2603, 2679, 'Islas Salomón', 'SLB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643834373231342d393863362d3131, 2),
(2604, 2679, 'Sierra Leona', 'SLE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643834616131332d393863362d3131, 2),
(2605, 2679, 'El Salvador', 'SLV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643834643363372d393863362d3131, 2),
(2606, 2679, 'San Marino', 'SMR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643835306661382d393863362d3131, 2),
(2607, 2679, 'Somalia', 'SOM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643835326666352d393863362d3131, 2),
(2608, 2679, 'Serbia', 'SRB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643835373264352d393863362d3131, 2),
(2609, 2679, 'Santo Tomé y Príncipe', 'STP', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643835613532662d393863362d3131, 2),
(2610, 2679, 'Suriname', 'SUR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643835633536362d393863362d3131, 2),
(2611, 2679, 'Eslovaquia', 'SVK', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643835663364302d393863362d3131, 2),
(2612, 2679, 'Eslovenia', 'SVN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643836326662342d393863362d3131, 2),
(2613, 2679, 'Suecia', 'SWE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643836346566332d393863362d3131, 2),
(2614, 2679, 'Swazilandia', 'SWZ', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643836376432352d393863362d3131, 2),
(2615, 2679, 'Seychelles', 'SYC', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643836396237612d393863362d3131, 2),
(2616, 2679, 'República Árabe Siria', 'SYR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643836636166302d393863362d3131, 2),
(2617, 2679, 'Chad', 'TCD', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643837303938352d393863362d3131, 2),
(2618, 2679, 'Togo', 'TGO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643837333435622d393863362d3131, 2),
(2619, 2679, 'Tailandia', 'THA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643837373038642d393863362d3131, 2),
(2620, 2679, 'Tayikistán', 'TJK', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643837386563342d393863362d3131, 2),
(2621, 2679, 'Turkmenistán', 'TKM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643837636335642d393863362d3131, 2),
(2622, 2679, 'Timor-Leste', 'TLS', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643837666139302d393863362d3131, 2),
(2623, 2679, 'Tonga', 'TON', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643838313835612d393863362d3131, 2),
(2624, 2679, 'Trinidad y Tabago', 'TTO', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643838343831392d393863362d3131, 2),
(2625, 2679, 'Túnez', 'TUN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643838376335632d393863362d3131, 2),
(2626, 2679, 'Turquía', 'TUR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643838626130392d393863362d3131, 2),
(2627, 2679, 'Tuvalu', 'TUV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643838663535662d393863362d3131, 2),
(2628, 2679, 'República Unida de Tanzanía', 'TZA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643839316662642d393863362d3131, 2),
(2629, 2679, 'Uganda', 'UGA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643839353431382d393863362d3131, 2),
(2630, 2679, 'Ucrania', 'UKR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643839393233372d393863362d3131, 2),
(2631, 2679, 'Uruguay', 'URY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643839623733612d393863362d3131, 2),
(2632, 2679, 'Estados Unidos de América', 'USA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643839656231382d393863362d3131, 2),
(2633, 2679, 'Uzbekistán', 'UZB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643861316537612d393863362d3131, 2),
(2634, 2679, 'San Vicente y las Granadinas', 'VCT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643861356139612d393863362d3131, 2),
(2635, 2679, 'Venezuela', 'VEN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643861376662662d393863362d3131, 2),
(2636, 2679, 'Viet Nam', 'VNM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643861623061652d393863362d3131, 2),
(2637, 2679, 'Vanuatu', 'VUT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643861663766362d393863362d3131, 2),
(2638, 2679, 'Samoa', 'WSM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643862326534652d393863362d3131, 2),
(2639, 2679, 'Yemen', 'YEM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643862373539652d393863362d3131, 2),
(2640, 2679, 'Sudáfrica', 'ZAF', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643862623430302d393863362d3131, 2),
(2641, 2679, 'Zambia', 'ZMB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643862646430642d393863362d3131, 2),
(2642, 2679, 'Zimbabwe', 'ZWE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643863313933642d393863362d3131, 2),
(2643, 2679, 'Antillas Holandesas', 'ANT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643863343635382d393863362d3131, 2),
(2644, 2679, 'Aruba', 'ABW', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643863373533302d393863362d3131, 2),
(2645, 2679, 'Bermuda', 'BMU', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643863623332662d393863362d3131, 2),
(2646, 2679, 'Brunei Darussalam', 'BRN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643863643234612d393863362d3131, 2),
(2647, 2679, 'Cisjordania y Gaza', 'WBG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643864303138632d393863362d3131, 2),
(2648, 2679, 'Gibraltar', 'GIB', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643864343031312d393863362d3131, 2),
(2649, 2679, 'Groenlandia', 'GRL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643864366238632d393863362d3131, 2),
(2650, 2679, 'Guam', 'GUM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643864613932662d393863362d3131, 2),
(2651, 2679, 'Hong Kong', 'HKG', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643864643536632d393863362d3131, 2),
(2652, 2679, 'Islas Caimán', 'CYM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643865303736382d393863362d3131, 2),
(2653, 2679, 'Islas del Canal', 'CHI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643865343633642d393863362d3131, 2),
(2654, 2679, 'Islas Marianas del Norte', 'MNP', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643865373165642d393863362d3131, 2),
(2655, 2679, 'Islas Turcas y Caicos', 'TCA', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643865393730342d393863362d3131, 2),
(2656, 2679, 'Islas Virgenes', 'VIR', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643865643331632d393863362d3131, 2),
(2657, 2679, 'Kosovo', 'KSV', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643866303030342d393863362d3131, 2),
(2658, 2679, 'La Isla de Man', 'IMY', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643866326661382d393863362d3131, 2),
(2659, 2679, 'Liechtenstein', 'LIE', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643866356439312d393863362d3131, 2),
(2660, 2679, 'Macao SAR, China', 'MAC', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643866393931352d393863362d3131, 2),
(2661, 2679, 'Mayotte', 'MYT', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643866633763312d393863362d3131, 2),
(2662, 2679, 'Nueva Caledonia', 'NCL', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643866663534382d393863362d3131, 2),
(2663, 2679, 'Polinesia Francesa', 'PYF', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643930323935382d393863362d3131, 2),
(2664, 2679, 'Puerto Rico', 'PRI', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643930363264612d393863362d3131, 2),
(2665, 2679, 'Samoa Estadounidense', 'ASM', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643930383736342d393863362d3131, 2),
(2666, 2679, 'Singapur', 'SGP', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63643930633465362d393863362d3131, 2),
(2679, NULL, 'Internacional', '2', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x63366431386661302d393863362d3131, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

DROP TABLE IF EXISTS `lote`;
CREATE TABLE IF NOT EXISTS `lote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `periodo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_lote` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso_neto` decimal(10,2) NOT NULL,
  `acopios` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_65B4329FD17F50A6` (`uuid`),
  KEY `IDX_65B4329F53C8D32C` (`propietario_id`),
  KEY `IDX_65B4329F24DB0683` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `padre_id` int DEFAULT NULL,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` smallint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7D053A93D17F50A6` (`uuid`),
  KEY `IDX_7D053A93613CEC58` (`padre_id`),
  KEY `IDX_7D053A9353C8D32C` (`propietario_id`),
  KEY `IDX_7D053A9324DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `padre_id`, `propietario_id`, `config_id`, `nombre`, `ruta`, `icono`, `orden`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(3, NULL, 2, 2, 'Configuración', NULL, 'fas fa-cog', 3, '2022-02-21 05:14:17', '2022-02-28 18:07:35', 1, 0xd71ac483752d4104bdf19a91b54f0728),
(4, 3, 2, 2, 'Usuarios', 'usuario_index', 'fas fa-user', 1, '2022-02-21 05:33:06', '2022-02-21 05:33:06', 1, 0x3b9dc4e0a0b1416cb8ceff277967d886),
(5, 3, 2, 2, 'Menús', 'menu_index', NULL, 3, '2022-02-21 05:34:45', '2022-02-21 05:34:45', 1, 0x9a2cb7216ae14f48a92a8a38c5fceee8),
(6, 3, 2, 2, 'Roles', 'usuario_rol_index', NULL, 2, '2022-02-21 05:34:56', '2022-02-21 05:34:56', 1, 0xd037f378e8454cadbd563f174f5458c4),
(7, 3, 2, 2, 'Menu Configuración', 'config_menu_index', NULL, 4, '2022-02-21 05:35:39', '2022-02-21 05:35:39', 1, 0x6d4f4254c28448d9a2ddb205f2f5fdd6),
(8, NULL, 2, 2, 'Acopio', NULL, 'fa-solid fa-industry', 2, '2022-02-21 05:39:09', '2022-02-28 18:08:01', 1, 0x53e569c3b6494844acb65519db8067e4),
(9, 8, 2, 2, 'Socios', 'socio_index', NULL, 0, '2022-02-21 06:15:00', '2022-02-21 06:15:15', 1, 0xd00ca5836ac541cc847c57e4d952ac6d),
(10, 8, 2, 2, 'Empresa', 'empresa_index', NULL, 0, '2022-02-21 21:04:57', '2022-02-21 21:04:57', 1, 0xb1e37625a962472a930fd495d5a70d56),
(11, 18, 2, 2, 'Lote', 'lote_index', NULL, 0, '2022-02-21 21:05:12', '2022-02-28 18:08:31', 1, 0xe855dfcb2b634ffcbb336286b36eb884),
(12, 8, 2, 2, 'Periodo', 'periodo_index', NULL, 0, '2022-02-23 21:46:55', '2022-02-23 21:46:55', 1, 0xa3c19564421a4f2192ea00e0e97114bb),
(13, 8, 2, 2, 'Producto', 'producto_index', NULL, 0, '2022-02-23 21:47:09', '2022-02-23 21:47:09', 1, 0xe27189f2a3a04435a46ce0952f9b7c2d),
(14, 8, 2, 2, 'Certificación', 'certificacion_index', NULL, 0, '2022-02-24 20:45:09', '2022-02-24 20:45:09', 1, 0x61774de0a3434d5da35960d507bb3de3),
(15, 8, 2, 2, 'Almacen', 'almacen_index', NULL, 0, '2022-02-25 04:30:34', '2022-02-25 04:30:34', 1, 0xca1e25b0a83f4aea941228c110790e6c),
(16, 8, 2, 2, 'Localidades', 'localidad_index', NULL, 0, '2022-02-25 04:32:42', '2022-02-25 04:32:42', 1, 0x05f9c57aa9684d0bb73adc25ad0abb61),
(17, 8, 2, 2, 'Base Social', 'base_social_index', NULL, 0, '2022-02-25 10:10:52', '2022-02-25 10:10:52', 1, 0x3f99aedd36ca44388664e55127da7e97),
(18, NULL, 2, 2, 'Sistema', NULL, 'fad fa-mug-hot', 1, '2022-02-28 18:05:52', '2022-02-28 18:08:40', 1, 0x04cb0c16c9b1496fb6fc14de3791434b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

DROP TABLE IF EXISTS `parametro`;
CREATE TABLE IF NOT EXISTS `parametro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `padre_id` int DEFAULT NULL,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4C12795FD17F50A6` (`uuid`),
  KEY `IDX_4C12795F613CEC58` (`padre_id`),
  KEY `IDX_4C12795F53C8D32C` (`propietario_id`),
  KEY `IDX_4C12795F24DB0683` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcela`
--

DROP TABLE IF EXISTS `parcela`;
CREATE TABLE IF NOT EXISTS `parcela` (
  `id` int NOT NULL AUTO_INCREMENT,
  `base_id` int NOT NULL,
  `area_parcela_id` int DEFAULT NULL,
  `socio_periodo_id` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sector` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A5CC44469B61D2C7` (`area_parcela_id`),
  KEY `IDX_A5CC44466967DF41` (`base_id`),
  KEY `IDX_A5CC4446BB4A23C2` (`socio_periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parcela`
--

INSERT INTO `parcela` (`id`, `base_id`, `area_parcela_id`, `socio_periodo_id`, `nombre`, `sector`) VALUES
(1, 1, 1, 10, 'Parcela', 'Talara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

DROP TABLE IF EXISTS `periodo`;
CREATE TABLE IF NOT EXISTS `periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7316C4EDD17F50A6` (`uuid`),
  KEY `IDX_7316C4ED53C8D32C` (`propietario_id`),
  KEY `IDX_7316C4ED24DB0683` (`config_id`),
  KEY `IDX_7316C4ED9F5A440B` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id`, `nombre`, `alias`, `descripcion`, `fecha_inicio`, `fecha_final`, `propietario_id`, `config_id`, `created_at`, `updated_at`, `activo`, `uuid`, `estado_id`) VALUES
(1, 'Campaña 2022', 'C2022', NULL, '2022-02-23', '2023-02-23', 2, 2, '2022-02-23 23:03:36', '2022-02-23 23:03:36', 1, 0xaa15614dd5204bf8aa64a49115ef8f7b, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_producto`
--

DROP TABLE IF EXISTS `periodo_producto`;
CREATE TABLE IF NOT EXISTS `periodo_producto` (
  `periodo_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`periodo_id`,`producto_id`),
  KEY `IDX_3556BA9F9C3921AB` (`periodo_id`),
  KEY `IDX_3556BA9F7645698E` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sexo_id` int DEFAULT NULL,
  `tipo_documento_id` int DEFAULT NULL,
  `tipo_empresa_id` int DEFAULT NULL,
  `estado_ruc_id` int DEFAULT NULL,
  `nombres` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_paterno` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_materno` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_documento` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `razon_social` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante_legal` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni_representante` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_51E5B69B2B32DB58` (`sexo_id`),
  KEY `IDX_51E5B69BF6939175` (`tipo_documento_id`),
  KEY `IDX_51E5B69BC3981BB9` (`tipo_empresa_id`),
  KEY `IDX_51E5B69B25304EAF` (`estado_ruc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `sexo_id`, `tipo_documento_id`, `tipo_empresa_id`, `estado_ruc_id`, `nombres`, `apellido_paterno`, `apellido_materno`, `num_documento`, `telefono`, `fecha_nacimiento`, `razon_social`, `direccion`, `representante_legal`, `dni_representante`, `ruc`) VALUES
(5, 1, 1, NULL, NULL, 'Hector', 'Zamora', 'Valladares', '74326789', NULL, '1979-02-28', NULL, NULL, NULL, NULL, NULL),
(6, NULL, 1, NULL, NULL, 'Marcelo', 'Chanamé', 'Chaname', '73545622', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Norandino Corp', 'S/N Hermanos Carcamo A-15', 'Daniel Gutierrez', '78432341', '20602348953');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A7BB0615D17F50A6` (`uuid`),
  KEY `IDX_A7BB061553C8D32C` (`propietario_id`),
  KEY `IDX_A7BB061524DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `propietario_id`, `config_id`, `nombre`, `alias`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(1, 2, 2, 'Cacao Seco', '@CS', '2022-02-25 04:10:18', '2022-02-25 04:10:18', 1, 0x0340a9c7382546bbb21bf8bcfeb1a011),
(2, 2, 2, 'Cacao Baba', '@CB', '2022-02-25 04:10:30', '2022-02-25 04:10:30', 1, 0xd80a0d15d851486fa4dbe4853d1bfcd4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecciones`
--

DROP TABLE IF EXISTS `proyecciones`;
CREATE TABLE IF NOT EXISTS `proyecciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socio_id` int NOT NULL,
  `periodo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_cacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quintales_proyectados` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4DA0A8AEDA04E6A9` (`socio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldo`
--

DROP TABLE IF EXISTS `saldo`;
CREATE TABLE IF NOT EXISTS `saldo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `unidad_id` int NOT NULL,
  `almacen_id` int NOT NULL,
  `saldo` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_669B1D4A9C3921AB` (`periodo_id`),
  KEY `IDX_669B1D4A7645698E` (`producto_id`),
  KEY `IDX_669B1D4A9D01464C` (`unidad_id`),
  KEY `IDX_669B1D4A9C9C9E68` (`almacen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `saldo`
--

INSERT INTO `saldo` (`id`, `periodo_id`, `producto_id`, `unidad_id`, `almacen_id`, `saldo`) VALUES
(1, 1, 1, 1, 1, '35.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

DROP TABLE IF EXISTS `sexo`;
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sexo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id`, `sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

DROP TABLE IF EXISTS `socio`;
CREATE TABLE IF NOT EXISTS `socio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `tipo_persona_id` int NOT NULL,
  `persona_id` int DEFAULT NULL,
  `codigo_socio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_socio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_38B65309D17F50A6` (`uuid`),
  UNIQUE KEY `UNIQ_38B65309F5F88DB9` (`persona_id`),
  KEY `IDX_38B6530953C8D32C` (`propietario_id`),
  KEY `IDX_38B6530924DB0683` (`config_id`),
  KEY `IDX_38B65309647E8F91` (`tipo_persona_id`),
  KEY `IDX_38B653092BF25544` (`estado_socio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id`, `propietario_id`, `config_id`, `created_at`, `updated_at`, `activo`, `uuid`, `tipo_persona_id`, `persona_id`, `codigo_socio`, `estado_socio_id`) VALUES
(5, NULL, NULL, '2022-03-01 23:52:14', '2022-03-09 22:36:11', 1, 0x6d13f50484c948b49616bb061abd307a, 1, 5, '0000000001', 1),
(6, NULL, NULL, '2022-03-02 00:49:04', '2022-03-03 16:37:50', 1, 0x7e3514aca4594d0d8a9ec6c16d743815, 1, 6, '0000000002', 1),
(7, NULL, NULL, '2022-03-09 21:16:25', '2022-03-09 21:16:25', 1, 0xf29b166d9c6f483e88138e0fb71f082d, 2, 7, '0000000003', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio_periodo`
--

DROP TABLE IF EXISTS `socio_periodo`;
CREATE TABLE IF NOT EXISTS `socio_periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo_id` int NOT NULL,
  `socio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_57EECEBE9C3921AB` (`periodo_id`),
  KEY `IDX_57EECEBEDA04E6A9` (`socio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socio_periodo`
--

INSERT INTO `socio_periodo` (`id`, `periodo_id`, `socio_id`) VALUES
(9, 1, 6),
(10, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_almacen`
--

DROP TABLE IF EXISTS `tipo_almacen`;
CREATE TABLE IF NOT EXISTS `tipo_almacen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_almacen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_almacen`
--

INSERT INTO `tipo_almacen` (`id`, `tipo_almacen`) VALUES
(1, 'Centro de Acopio'),
(2, 'Planta de Beneficio Húmedo'),
(3, 'Planta Procesadora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `tipo_documento`) VALUES
(1, 'DNI'),
(2, 'Carnet de Extranjería'),
(3, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empresa`
--

DROP TABLE IF EXISTS `tipo_empresa`;
CREATE TABLE IF NOT EXISTS `tipo_empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_empresa` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_empresa`
--

INSERT INTO `tipo_empresa` (`id`, `tipo_empresa`) VALUES
(1, 'Asociación'),
(2, 'Cooperativa'),
(3, 'Retirado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

DROP TABLE IF EXISTS `tipo_persona`;
CREATE TABLE IF NOT EXISTS `tipo_persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id`, `tipo_persona`) VALUES
(1, 'Natural'),
(2, 'Juridica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

DROP TABLE IF EXISTS `unidad`;
CREATE TABLE IF NOT EXISTS `unidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unidad` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `unidad`) VALUES
(1, 'Kilogramos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2265B05DE7927C74` (`email`),
  UNIQUE KEY `UNIQ_2265B05DD17F50A6` (`uuid`),
  KEY `IDX_2265B05D53C8D32C` (`propietario_id`),
  KEY `IDX_2265B05D24DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `propietario_id`, `config_id`, `username`, `email`, `password`, `full_name`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(2, NULL, 2, 'admin', 'cio@pidia.pe', '$2y$13$3CgBTSwe2qAmExlitytkkeM1nOb.1V0hW0THeuKJOP8wIpZfC2VWm', 'Carlos Chininin', '2022-02-21 05:12:46', '2022-02-21 05:13:58', 1, 0x972afe13af7f4970bbcaccae5484c7f1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `listar` tinyint(1) DEFAULT NULL,
  `mostrar` tinyint(1) DEFAULT NULL,
  `crear` tinyint(1) DEFAULT NULL,
  `editar` tinyint(1) DEFAULT NULL,
  `eliminar` tinyint(1) DEFAULT NULL,
  `imprimir` tinyint(1) DEFAULT NULL,
  `exportar` tinyint(1) DEFAULT NULL,
  `importar` tinyint(1) DEFAULT NULL,
  `maestro` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845C01D9CCD7E912` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso_usuario_rol`
--

DROP TABLE IF EXISTS `usuario_permiso_usuario_rol`;
CREATE TABLE IF NOT EXISTS `usuario_permiso_usuario_rol` (
  `usuario_permiso_id` int NOT NULL,
  `usuario_rol_id` int NOT NULL,
  PRIMARY KEY (`usuario_permiso_id`,`usuario_rol_id`),
  KEY `IDX_B45A84629FDFE795` (`usuario_permiso_id`),
  KEY `IDX_B45A8462FEA85A65` (`usuario_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_72EDD1A4D17F50A6` (`uuid`),
  KEY `IDX_72EDD1A453C8D32C` (`propietario_id`),
  KEY `IDX_72EDD1A424DB0683` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id`, `propietario_id`, `config_id`, `nombre`, `rol`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(2, NULL, NULL, 'Super Administrador', 'ROLE_SUPER_ADMIN', '2022-02-21 05:12:46', '2022-02-21 05:12:46', 1, 0xc96ec525093c431784674d56ab57b66f);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuario_rol`
--

DROP TABLE IF EXISTS `usuario_usuario_rol`;
CREATE TABLE IF NOT EXISTS `usuario_usuario_rol` (
  `usuario_id` int NOT NULL,
  `usuario_rol_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`usuario_rol_id`),
  KEY `IDX_4AC6232ADB38439E` (`usuario_id`),
  KEY `IDX_4AC6232AFEA85A65` (`usuario_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_usuario_rol`
--

INSERT INTO `usuario_usuario_rol` (`usuario_id`, `usuario_rol_id`) VALUES
(2, 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `FK_D5B2D25024DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_D5B2D250521E1991` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK_D5B2D25053C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_D5B2D25057E759E8` FOREIGN KEY (`ubicacion_id`) REFERENCES `localidad` (`id`),
  ADD CONSTRAINT `FK_D5B2D250D1A9C40` FOREIGN KEY (`tipo_almacen_id`) REFERENCES `tipo_almacen` (`id`);

--
-- Filtros para la tabla `base_social`
--
ALTER TABLE `base_social`
  ADD CONSTRAINT `FK_190179EE24DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_190179EE489F4A45` FOREIGN KEY (`almacen_acopio_id`) REFERENCES `almacen` (`id`),
  ADD CONSTRAINT `FK_190179EE53C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_190179EE67707C89` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `certificacion`
--
ALTER TABLE `certificacion`
  ADD CONSTRAINT `FK_A1F2025324DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_A1F2025353C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_A1F20253613CEC58` FOREIGN KEY (`padre_id`) REFERENCES `certificacion` (`id`);

--
-- Filtros para la tabla `config`
--
ALTER TABLE `config`
  ADD CONSTRAINT `FK_D48A2F7C24DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_D48A2F7C53C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `config_config_menu_menus`
--
ALTER TABLE `config_config_menu_menus`
  ADD CONSTRAINT `FK_A8E9CD3124DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A8E9CD31B9CB2BE2` FOREIGN KEY (`config_menu_id`) REFERENCES `config_menu` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `coordenadas`
--
ALTER TABLE `coordenadas`
  ADD CONSTRAINT `FK_979E70791491307D` FOREIGN KEY (`parcela_id`) REFERENCES `parcela` (`id`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `FK_B8D75A5024DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_B8D75A5053C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `estimacion`
--
ALTER TABLE `estimacion`
  ADD CONSTRAINT `FK_1D9C1F02693EA4CA` FOREIGN KEY (`certificacion_id`) REFERENCES `certificacion` (`id`),
  ADD CONSTRAINT `FK_1D9C1F0292A0549A` FOREIGN KEY (`socio_periodos_id`) REFERENCES `socio_periodo` (`id`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `FK_4F68E01024DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_4F68E01053C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_4F68E010613CEC58` FOREIGN KEY (`padre_id`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `FK_65B4329F24DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_65B4329F53C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A9324DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_7D053A9353C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_7D053A93613CEC58` FOREIGN KEY (`padre_id`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD CONSTRAINT `FK_4C12795F24DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_4C12795F53C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_4C12795F613CEC58` FOREIGN KEY (`padre_id`) REFERENCES `parametro` (`id`);

--
-- Filtros para la tabla `parcela`
--
ALTER TABLE `parcela`
  ADD CONSTRAINT `FK_A5CC44466967DF41` FOREIGN KEY (`base_id`) REFERENCES `base_social` (`id`),
  ADD CONSTRAINT `FK_A5CC44469B61D2C7` FOREIGN KEY (`area_parcela_id`) REFERENCES `area_parcela` (`id`),
  ADD CONSTRAINT `FK_A5CC4446BB4A23C2` FOREIGN KEY (`socio_periodo_id`) REFERENCES `socio_periodo` (`id`);

--
-- Filtros para la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD CONSTRAINT `FK_7316C4ED24DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_7316C4ED53C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_7316C4ED9F5A440B` FOREIGN KEY (`estado_id`) REFERENCES `estado_periodo` (`id`);

--
-- Filtros para la tabla `periodo_producto`
--
ALTER TABLE `periodo_producto`
  ADD CONSTRAINT `FK_3556BA9F7645698E` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3556BA9F9C3921AB` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_51E5B69B25304EAF` FOREIGN KEY (`estado_ruc_id`) REFERENCES `estado_ruc` (`id`),
  ADD CONSTRAINT `FK_51E5B69B2B32DB58` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`id`),
  ADD CONSTRAINT `FK_51E5B69BC3981BB9` FOREIGN KEY (`tipo_empresa_id`) REFERENCES `tipo_empresa` (`id`),
  ADD CONSTRAINT `FK_51E5B69BF6939175` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_A7BB061524DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_A7BB061553C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `proyecciones`
--
ALTER TABLE `proyecciones`
  ADD CONSTRAINT `FK_4DA0A8AEDA04E6A9` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id`);

--
-- Filtros para la tabla `saldo`
--
ALTER TABLE `saldo`
  ADD CONSTRAINT `FK_669B1D4A7645698E` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `FK_669B1D4A9C3921AB` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`),
  ADD CONSTRAINT `FK_669B1D4A9C9C9E68` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`id`),
  ADD CONSTRAINT `FK_669B1D4A9D01464C` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`);

--
-- Filtros para la tabla `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `FK_38B6530924DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_38B653092BF25544` FOREIGN KEY (`estado_socio_id`) REFERENCES `estado_socio` (`id`),
  ADD CONSTRAINT `FK_38B6530953C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_38B65309647E8F91` FOREIGN KEY (`tipo_persona_id`) REFERENCES `tipo_persona` (`id`),
  ADD CONSTRAINT `FK_38B65309F5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `socio_periodo`
--
ALTER TABLE `socio_periodo`
  ADD CONSTRAINT `FK_57EECEBE9C3921AB` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`),
  ADD CONSTRAINT `FK_57EECEBEDA04E6A9` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_2265B05D24DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_2265B05D53C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `FK_845C01D9CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `usuario_permiso_usuario_rol`
--
ALTER TABLE `usuario_permiso_usuario_rol`
  ADD CONSTRAINT `FK_B45A84629FDFE795` FOREIGN KEY (`usuario_permiso_id`) REFERENCES `usuario_permiso` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B45A8462FEA85A65` FOREIGN KEY (`usuario_rol_id`) REFERENCES `usuario_rol` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK_72EDD1A424DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_72EDD1A453C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario_usuario_rol`
--
ALTER TABLE `usuario_usuario_rol`
  ADD CONSTRAINT `FK_4AC6232ADB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4AC6232AFEA85A65` FOREIGN KEY (`usuario_rol_id`) REFERENCES `usuario_rol` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
