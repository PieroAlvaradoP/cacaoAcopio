-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-02-2022 a las 08:16:42
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
(2, NULL, NULL, 'Cacao', 'Acopio Cacao', 'Cacao', '2022-02-21 05:13:50', '2022-02-21 06:14:47', 1, 0xa5efa1d74bec4c8894c52c21ae4f5342);

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
(2, 9);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `config_menu`
--

INSERT INTO `config_menu` (`id`, `name`, `route`, `activo`) VALUES
(4, 'Usuarios Listado', 'usuario_index', 1),
(5, 'Configuración Menu', 'config_menu_index', 1),
(7, 'Roles usuario', 'usuario_rol_index', 1),
(8, 'Menu Listado', 'menu_index', 1),
(9, 'Socios Listado', 'socio_index', 1);

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
('DoctrineMigrations\\Version20220221064857', '2022-02-21 06:49:03', 412);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 8, 2, 2, 'Socios', 'socio_index', NULL, 0, '2022-02-21 06:15:00', '2022-02-21 06:15:15', 1, 0xd00ca5836ac541cc847c57e4d952ac6d);

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
-- Estructura de tabla para la tabla `socio`
--

DROP TABLE IF EXISTS `socio`;
CREATE TABLE IF NOT EXISTS `socio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni_ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugar` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `propietario_id` int DEFAULT NULL,
  `config_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `uuid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_38B65309D17F50A6` (`uuid`),
  KEY `IDX_38B6530953C8D32C` (`propietario_id`),
  KEY `IDX_38B6530924DB0683` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Filtros para la tabla `proyecciones`
--
ALTER TABLE `proyecciones`
  ADD CONSTRAINT `FK_4DA0A8AEDA04E6A9` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id`);

--
-- Filtros para la tabla `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `FK_38B6530924DB0683` FOREIGN KEY (`config_id`) REFERENCES `config` (`id`),
  ADD CONSTRAINT `FK_38B6530953C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`);

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
