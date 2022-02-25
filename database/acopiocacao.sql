-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-02-2022 a las 10:13:41
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
(1, 1, 2, 2, 'Sol y Cafe', 'Urb G20', '2022-02-25 05:13:43', '2022-02-25 05:13:43', 1, 0xd514eed4a5f84c9c8948180a8b94f635, 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('DoctrineMigrations\\Version20220225101109', '2022-02-25 10:11:26', 534);

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
  `socio_id` int NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `socio_periodos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D9C1F02693EA4CA` (`certificacion_id`),
  KEY `IDX_1D9C1F02DA04E6A9` (`socio_id`),
  KEY `IDX_1D9C1F0292A0549A` (`socio_periodos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `padre_id`, `nombre`, `codigo`, `propietario_id`, `created_at`, `updated_at`, `activo`, `uuid`, `config_id`) VALUES
(1, NULL, 'Amazonas', '010000', 2, '2022-02-25 04:03:57', '2022-02-25 04:03:57', 1, 0xa55979bb27fc4a97a9cbe684a23fdbe6, 2),
(2, 1, 'Chachapoyas', '010100', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0x00000000000000000000000000000000, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `padre_id`, `propietario_id`, `config_id`, `nombre`, `ruta`, `icono`, `orden`, `created_at`, `updated_at`, `activo`, `uuid`) VALUES
(3, NULL, 2, 2, 'Configuración', NULL, 'fas fa-cog', 0, '2022-02-21 05:14:17', '2022-02-21 05:14:17', 1, 0xd71ac483752d4104bdf19a91b54f0728),
(4, 3, 2, 2, 'Usuarios', 'usuario_index', 'fas fa-user', 1, '2022-02-21 05:33:06', '2022-02-21 05:33:06', 1, 0x3b9dc4e0a0b1416cb8ceff277967d886),
(5, 3, 2, 2, 'Menús', 'menu_index', NULL, 3, '2022-02-21 05:34:45', '2022-02-21 05:34:45', 1, 0x9a2cb7216ae14f48a92a8a38c5fceee8),
(6, 3, 2, 2, 'Roles', 'usuario_rol_index', NULL, 2, '2022-02-21 05:34:56', '2022-02-21 05:34:56', 1, 0xd037f378e8454cadbd563f174f5458c4),
(7, 3, 2, 2, 'Menu Configuración', 'config_menu_index', NULL, 4, '2022-02-21 05:35:39', '2022-02-21 05:35:39', 1, 0x6d4f4254c28448d9a2ddb205f2f5fdd6),
(8, NULL, 2, 2, 'Acopio', NULL, 'fa-solid fa-industry', 0, '2022-02-21 05:39:09', '2022-02-21 05:40:29', 1, 0x53e569c3b6494844acb65519db8067e4),
(9, 8, 2, 2, 'Socios', 'socio_index', NULL, 0, '2022-02-21 06:15:00', '2022-02-21 06:15:15', 1, 0xd00ca5836ac541cc847c57e4d952ac6d),
(10, 8, 2, 2, 'Empresa', 'empresa_index', NULL, 0, '2022-02-21 21:04:57', '2022-02-21 21:04:57', 1, 0xb1e37625a962472a930fd495d5a70d56),
(11, 8, 2, 2, 'Lote', 'lote_index', NULL, 0, '2022-02-21 21:05:12', '2022-02-21 21:05:12', 1, 0xe855dfcb2b634ffcbb336286b36eb884),
(12, 8, 2, 2, 'Periodo', 'periodo_index', NULL, 0, '2022-02-23 21:46:55', '2022-02-23 21:46:55', 1, 0xa3c19564421a4f2192ea00e0e97114bb),
(13, 8, 2, 2, 'Producto', 'producto_index', NULL, 0, '2022-02-23 21:47:09', '2022-02-23 21:47:09', 1, 0xe27189f2a3a04435a46ce0952f9b7c2d),
(14, 8, 2, 2, 'Certificación', 'certificacion_index', NULL, 0, '2022-02-24 20:45:09', '2022-02-24 20:45:09', 1, 0x61774de0a3434d5da35960d507bb3de3),
(15, 8, 2, 2, 'Almacen', 'almacen_index', NULL, 0, '2022-02-25 04:30:34', '2022-02-25 04:30:34', 1, 0xca1e25b0a83f4aea941228c110790e6c),
(16, 8, 2, 2, 'Localidades', 'localidad_index', NULL, 0, '2022-02-25 04:32:42', '2022-02-25 04:32:42', 1, 0x05f9c57aa9684d0bb73adc25ad0abb61),
(17, 8, 2, 2, 'Base Social', 'base_social_index', NULL, 0, '2022-02-25 10:10:52', '2022-02-25 10:10:52', 1, 0x3f99aedd36ca44388664e55127da7e97);

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
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sector` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A5CC4446D17F50A6` (`uuid`),
  UNIQUE KEY `UNIQ_A5CC44469B61D2C7` (`area_parcela_id`),
  KEY `IDX_A5CC44466967DF41` (`base_id`),
  KEY `IDX_A5CC4446BB4A23C2` (`socio_periodo_id`),
  KEY `IDX_A5CC444653C8D32C` (`propietario_id`),
  KEY `IDX_A5CC444624DB0683` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD CONSTRAINT `FK_1D9C1F0292A0549A` FOREIGN KEY (`socio_periodos_id`) REFERENCES `socio_periodo` (`id`),
  ADD CONSTRAINT `FK_1D9C1F02DA04E6A9` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id`);

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
  ADD CONSTRAINT `FK_A5CC444624DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_A5CC444653C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
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
