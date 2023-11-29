-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2023 a las 05:05:42
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consultoriobd`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`Miguel`@`%` PROCEDURE `deleteDireccion` ()   begin
	delete from direccion 
	where estado='Veracruz' and municipio = 'Córdoba';
end$$

CREATE DEFINER=`Miguel`@`%` PROCEDURE `insertDireccion` ()   begin
	insert into direccion (id, userinfo, tipo, estado, municipio, colonia, calle, CP, noExt, noInt, created_at)
	values (30, 15, 'Oficina', 'Veracruz', 'Córdoba', '20 de Noviembre', '34 Sur', '94487', 12, 1, now());
end$$

CREATE DEFINER=`Miguel`@`%` PROCEDURE `readDireccion` ()   begin
	select * from direccion where estado='Veracruz' and municipio = 'Córdoba';
end$$

CREATE DEFINER=`Miguel`@`%` PROCEDURE `updateDireccion` ()   begin
	update direccion  set tipo = 'Departamento',
	noInt = 8
	where estado='Veracruz' and municipio = 'Córdoba';
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add auth group', 7, 'add_authgroup'),
(26, 'Can change auth group', 7, 'change_authgroup'),
(27, 'Can delete auth group', 7, 'delete_authgroup'),
(28, 'Can view auth group', 7, 'view_authgroup'),
(29, 'Can add auth group permissions', 8, 'add_authgrouppermissions'),
(30, 'Can change auth group permissions', 8, 'change_authgrouppermissions'),
(31, 'Can delete auth group permissions', 8, 'delete_authgrouppermissions'),
(32, 'Can view auth group permissions', 8, 'view_authgrouppermissions'),
(33, 'Can add auth permission', 9, 'add_authpermission'),
(34, 'Can change auth permission', 9, 'change_authpermission'),
(35, 'Can delete auth permission', 9, 'delete_authpermission'),
(36, 'Can view auth permission', 9, 'view_authpermission'),
(37, 'Can add auth user', 10, 'add_authuser'),
(38, 'Can change auth user', 10, 'change_authuser'),
(39, 'Can delete auth user', 10, 'delete_authuser'),
(40, 'Can view auth user', 10, 'view_authuser'),
(41, 'Can add auth user groups', 11, 'add_authusergroups'),
(42, 'Can change auth user groups', 11, 'change_authusergroups'),
(43, 'Can delete auth user groups', 11, 'delete_authusergroups'),
(44, 'Can view auth user groups', 11, 'view_authusergroups'),
(45, 'Can add auth user user permissions', 12, 'add_authuseruserpermissions'),
(46, 'Can change auth user user permissions', 12, 'change_authuseruserpermissions'),
(47, 'Can delete auth user user permissions', 12, 'delete_authuseruserpermissions'),
(48, 'Can view auth user user permissions', 12, 'view_authuseruserpermissions'),
(49, 'Can add consultas', 13, 'add_consultas'),
(50, 'Can change consultas', 13, 'change_consultas'),
(51, 'Can delete consultas', 13, 'delete_consultas'),
(52, 'Can view consultas', 13, 'view_consultas'),
(53, 'Can add direccion', 14, 'add_direccion'),
(54, 'Can change direccion', 14, 'change_direccion'),
(55, 'Can delete direccion', 14, 'delete_direccion'),
(56, 'Can view direccion', 14, 'view_direccion'),
(57, 'Can add django admin log', 15, 'add_djangoadminlog'),
(58, 'Can change django admin log', 15, 'change_djangoadminlog'),
(59, 'Can delete django admin log', 15, 'delete_djangoadminlog'),
(60, 'Can view django admin log', 15, 'view_djangoadminlog'),
(61, 'Can add django content type', 16, 'add_djangocontenttype'),
(62, 'Can change django content type', 16, 'change_djangocontenttype'),
(63, 'Can delete django content type', 16, 'delete_djangocontenttype'),
(64, 'Can view django content type', 16, 'view_djangocontenttype'),
(65, 'Can add django migrations', 17, 'add_djangomigrations'),
(66, 'Can change django migrations', 17, 'change_djangomigrations'),
(67, 'Can delete django migrations', 17, 'delete_djangomigrations'),
(68, 'Can view django migrations', 17, 'view_djangomigrations'),
(69, 'Can add django session', 18, 'add_djangosession'),
(70, 'Can change django session', 18, 'change_djangosession'),
(71, 'Can delete django session', 18, 'delete_djangosession'),
(72, 'Can view django session', 18, 'view_djangosession'),
(73, 'Can add medicamentos', 19, 'add_medicamentos'),
(74, 'Can change medicamentos', 19, 'change_medicamentos'),
(75, 'Can delete medicamentos', 19, 'delete_medicamentos'),
(76, 'Can view medicamentos', 19, 'view_medicamentos'),
(77, 'Can add medico', 20, 'add_medico'),
(78, 'Can change medico', 20, 'change_medico'),
(79, 'Can delete medico', 20, 'delete_medico'),
(80, 'Can view medico', 20, 'view_medico'),
(81, 'Can add medico paciente', 21, 'add_medicopaciente'),
(82, 'Can change medico paciente', 21, 'change_medicopaciente'),
(83, 'Can delete medico paciente', 21, 'delete_medicopaciente'),
(84, 'Can view medico paciente', 21, 'view_medicopaciente'),
(85, 'Can add paciente', 22, 'add_paciente'),
(86, 'Can change paciente', 22, 'change_paciente'),
(87, 'Can delete paciente', 22, 'delete_paciente'),
(88, 'Can view paciente', 22, 'view_paciente'),
(89, 'Can add receta', 23, 'add_receta'),
(90, 'Can change receta', 23, 'change_receta'),
(91, 'Can delete receta', 23, 'delete_receta'),
(92, 'Can view receta', 23, 'view_receta'),
(93, 'Can add receta medicamento', 24, 'add_recetamedicamento'),
(94, 'Can change receta medicamento', 24, 'change_recetamedicamento'),
(95, 'Can delete receta medicamento', 24, 'delete_recetamedicamento'),
(96, 'Can view receta medicamento', 24, 'view_recetamedicamento'),
(97, 'Can add userinfo', 25, 'add_userinfo'),
(98, 'Can change userinfo', 25, 'change_userinfo'),
(99, 'Can delete userinfo', 25, 'delete_userinfo'),
(100, 'Can view userinfo', 25, 'view_userinfo'),
(101, 'Can add users', 26, 'add_users'),
(102, 'Can change users', 26, 'change_users'),
(103, 'Can delete users', 26, 'delete_users'),
(104, 'Can view users', 26, 'view_users');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$S3AZN9DG6QJyhsaN0nrB2r$WP9U/icsoirWJ9cxFtjL+lUEDwkZvXtxVRxkMoX7UU4=', '2023-11-29 04:01:46.636941', 1, 'Admin', '', '', 'l21te0131@teziutlan.tecnm.mx', 1, 1, '2023-11-29 04:01:02.819764');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `lugar` text NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `motivo` text NOT NULL,
  `medico_paciente` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `lugar`, `hora`, `fecha`, `motivo`, `medico_paciente`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hospital A', '09:00:00', '2023-09-01', 'Control de rutina', 3, '2023-09-26 08:00:00', '2023-11-28 21:46:04', NULL),
(2, 'Clínica B', '14:30:00', '2023-08-30', 'Dolor de cabeza', 8, '2023-09-25 10:15:00', '2023-11-28 21:46:04', NULL),
(3, 'Consultorio C', '10:15:00', '2023-08-28', 'Fiebre alta', 12, '2023-09-24 12:30:00', '2023-11-28 21:46:04', NULL),
(4, 'Hospital D', '16:45:00', '2023-08-25', 'Control de diabetes', 4, '2023-09-23 09:45:00', '2023-11-28 21:46:04', NULL),
(5, 'Clínica E', '11:30:00', '2023-08-23', 'Presión arterial', 17, '2023-09-22 14:15:00', '2023-11-28 21:46:04', NULL),
(6, 'Consultorio F', '08:45:00', '2023-08-21', 'Dolor abdominal', 6, '2023-09-21 16:30:00', '2023-11-28 21:46:04', NULL),
(7, 'Hospital A', '09:30:00', '2023-08-18', 'Control de rutina', 2, '2023-09-20 08:45:00', '2023-11-28 21:46:04', NULL),
(8, 'Clínica B', '15:00:00', '2023-08-16', 'Dolor de garganta', 14, '2023-09-19 11:00:00', '2023-11-28 21:46:04', NULL),
(9, 'Consultorio C', '13:45:00', '2023-08-14', 'Vacunación', 10, '2023-09-18 13:15:00', '2023-11-28 21:46:04', NULL),
(10, 'Hospital D', '17:15:00', '2023-08-11', 'Control de presión', 19, '2023-09-17 15:30:00', '2023-11-28 21:46:04', NULL),
(11, 'Clínica E', '10:00:00', '2023-08-09', 'Dolor de espalda', 7, '2023-09-16 09:00:00', '2023-11-28 21:46:04', NULL),
(12, 'Consultorio F', '11:30:00', '2023-08-07', 'Fiebre alta', 15, '2023-09-15 11:15:00', '2023-11-28 21:46:04', NULL),
(13, 'Hospital A', '08:15:00', '2023-08-04', 'Dolor en el pecho', 16, '2023-09-14 13:30:00', '2023-11-28 21:46:04', NULL),
(14, 'Clínica B', '14:00:00', '2023-08-02', 'Control de rutina', 9, '2023-09-13 15:45:00', '2023-11-28 21:46:04', NULL),
(15, 'Consultorio C', '16:30:00', '2023-07-30', 'Dolor de oído', 18, '2023-09-12 18:00:00', '2023-11-28 21:46:04', NULL),
(16, 'Hospital D', '10:45:00', '2023-07-28', 'Presión arterial', 5, '2023-09-11 08:30:00', '2023-11-28 21:46:04', NULL),
(17, 'Clínica E', '11:00:00', '2023-07-26', 'Dolor de cabeza', 11, '2023-09-10 10:45:00', '2023-11-28 21:46:04', NULL),
(18, 'Consultorio F', '15:30:00', '2023-07-23', 'Control of diabetes', 13, '2023-09-09 12:00:00', '2023-11-28 21:46:04', NULL),
(19, 'Hospital A', '09:45:00', '2023-07-21', 'Fiebre alta', 1, '2023-09-08 14:15:00', '2023-11-28 21:46:04', NULL),
(20, 'Clínica B', '13:15:00', '2023-07-19', 'Dolor abdominal', 20, '2023-09-07 16:30:00', '2023-11-28 21:46:04', NULL),
(21, 'Consultorio C', '12:30:00', '2023-07-16', 'Control de rutina', 16, '2023-09-06 18:45:00', '2023-11-28 21:46:04', NULL),
(22, 'Hospital D', '08:00:00', '2023-07-14', 'Dolor de garganta', 6, '2023-09-05 09:15:00', '2023-11-28 21:46:04', NULL),
(23, 'Clínica E', '17:00:00', '2023-07-11', 'Vacunación', 3, '2023-09-04 11:30:00', '2023-11-28 21:46:04', NULL),
(24, 'Consultorio F', '14:45:00', '2023-07-09', 'Control of presión', 8, '2023-09-03 13:45:00', '2023-11-28 21:46:04', NULL),
(25, 'Hospital B', '14:00:00', '2023-07-02', 'Dolor de cabeza', 14, '2023-09-02 15:00:00', '2023-11-28 21:46:04', NULL),
(26, 'Clínica A', '11:30:00', '2023-06-20', 'Fiebre alta', 8, '2023-09-01 17:15:00', '2023-11-28 21:46:04', NULL),
(27, 'Consultorio F', '10:15:00', '2023-06-17', 'Control of diabetes', 5, '2023-08-31 19:30:00', '2023-11-28 21:46:04', NULL),
(28, 'Hospital C', '16:45:00', '2023-06-15', 'Presión arterial', 2, '2023-08-30 21:45:00', '2023-11-28 21:46:04', NULL),
(29, 'Clínica D', '15:30:00', '2023-06-12', 'Dolor abdominal', 7, '2023-08-29 08:00:00', '2023-11-28 21:46:04', NULL),
(30, 'Consultorio E', '09:00:00', '2023-06-10', 'Control de rutina', 13, '2023-08-28 10:15:00', '2023-11-28 21:46:04', NULL),
(31, 'Hospital A', '11:15:00', '2023-06-07', 'Dolor de garganta', 12, '2023-08-27 12:30:00', '2023-11-28 21:46:04', NULL),
(32, 'Clínica F', '14:15:00', '2023-06-05', 'Control de presión', 22, '2023-08-26 14:45:00', '2023-11-28 21:46:04', NULL),
(33, 'Hospital B', '12:30:00', '2023-05-30', 'Dolor de oído', 28, '2023-08-25 16:00:00', '2023-11-28 21:46:04', NULL),
(34, 'Consultorio A', '09:30:00', '2023-05-25', 'Fiebre alta', 29, '2023-08-24 17:15:00', '2023-11-28 21:46:04', NULL),
(35, 'Clínica C', '11:45:00', '2023-05-20', 'Dolor abdominal', 23, '2023-08-23 18:30:00', '2023-11-28 21:46:04', NULL),
(36, 'Hospital D', '08:30:00', '2023-05-15', 'Control de rutina', 30, '2023-08-22 19:45:00', '2023-11-28 21:46:04', NULL),
(37, 'Consultorio B', '15:15:00', '2023-05-10', 'Dolor de garganta', 25, '2023-08-21 08:00:00', '2023-11-28 21:46:04', NULL),
(38, 'Clínica D', '10:45:00', '2023-05-05', 'Vacunación', 18, '2023-08-20 09:15:00', '2023-11-28 21:46:04', NULL),
(39, 'Hospital A', '16:00:00', '2023-04-30', 'Control de presión', 27, '2023-08-19 10:30:00', '2023-11-28 21:46:04', NULL),
(40, 'Consultorio F', '09:45:00', '2023-04-25', 'Dolor de cabeza', 21, '2023-08-18 11:45:00', '2023-11-28 21:46:04', NULL),
(41, 'Clínica B', '13:30:00', '2023-04-20', 'Fiebre alta', 11, '2023-08-17 13:00:00', '2023-11-28 21:46:04', NULL),
(42, 'Hospital E', '14:45:00', '2023-04-15', 'Dolor abdominal', 26, '2023-08-16 14:15:00', '2023-11-28 21:46:04', NULL),
(43, 'Consultorio C', '10:30:00', '2023-04-10', 'Control de rutina', 7, '2023-08-15 15:30:00', '2023-11-28 21:46:04', NULL),
(44, 'Clínica A', '17:15:00', '2023-04-05', 'Dolor de garganta', 19, '2023-08-14 16:45:00', '2023-11-28 21:46:04', NULL),
(45, 'Hospital D', '11:00:00', '2023-03-31', 'Control de diabetes', 6, '2023-08-13 18:00:00', '2023-11-28 21:46:04', NULL),
(46, 'Consultorio E', '08:15:00', '2023-03-26', 'Fiebre alta', 17, '2023-08-12 19:15:00', '2023-11-28 21:46:04', NULL),
(47, 'Clínica C', '15:45:00', '2023-03-21', 'Dolor abdominal', 20, '2023-08-11 20:30:00', '2023-11-28 21:46:04', NULL),
(48, 'Consultorio B', '12:00:00', '2023-03-16', 'Control de rutina', 4, '2023-08-10 08:45:00', '2023-11-28 21:46:04', NULL),
(49, 'Clínica D', '16:30:00', '2023-03-11', 'Dolor de cabeza', 24, '2023-08-09 10:00:00', '2023-11-28 21:46:04', NULL),
(50, 'Hospital F', '14:15:00', '2023-03-06', 'Vacunación', 1, '2023-08-08 11:15:00', '2023-11-28 21:46:04', NULL),
(51, 'Consultorio A', '09:00:00', '2023-03-01', 'Control de presión', 9, '2023-08-07 12:30:00', '2023-11-28 21:46:04', NULL),
(52, 'Hospital C', '10:30:00', '2023-02-24', 'Dolor de espalda', 12, '2023-08-06 13:45:00', '2023-11-28 21:46:04', NULL),
(53, 'Consultorio F', '08:45:00', '2023-02-19', 'Fiebre alta', 5, '2023-08-05 15:00:00', '2023-11-28 21:46:04', NULL),
(54, 'Clínica A', '15:30:00', '2023-02-14', 'Dolor en el pecho', 13, '2023-08-04 16:15:00', '2023-11-28 21:46:04', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `userinfo` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `noExt` int(11) NOT NULL,
  `noInt` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `userinfo`, `tipo`, `estado`, `municipio`, `colonia`, `calle`, `CP`, `noExt`, `noInt`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Casa', 'Ciudad de México', 'Ciudad de México', 'Polanco', 'Avenida Reforma', '11560', 123, NULL, '2023-09-26 08:00:00', NULL, NULL),
(2, 2, 'Departamento', 'Jalisco', 'Guadalajara', 'Zapopan', 'Calle 5 de Mayo', '45050', 456, 301, '2023-09-25 10:15:00', NULL, NULL),
(3, 3, 'Oficina', 'Nuevo León', 'Monterrey', 'Contry', 'Avenida Garza Sada', '64780', 789, 504, '2023-09-24 12:30:00', NULL, NULL),
(4, 4, 'Casa', 'Puebla', 'Puebla', 'San Manuel', 'Calle Alborada', '72570', 101, NULL, '2023-09-23 09:45:00', NULL, NULL),
(5, 5, 'Departamento', 'Quintana Roo', 'Cancún', 'Centro', 'Avenida Tulum', '77500', 789, 202, '2023-09-22 14:15:00', NULL, NULL),
(6, 6, 'Oficina', 'Guanajuato', 'León', 'Centro', 'Calle Juárez', '37000', 987, 502, '2023-09-21 16:30:00', NULL, NULL),
(7, 7, 'Casa', 'Coahuila', 'Saltillo', 'Revolución', 'Calle Abasolo', '25000', 123, NULL, '2023-09-20 08:45:00', NULL, NULL),
(8, 8, 'Departamento', 'Yucatán', 'Mérida', 'Montecristo', 'Calle 20', '97203', 456, 302, '2023-09-19 11:00:00', NULL, NULL),
(9, 9, 'Oficina', 'Chihuahua', 'Chihuahua', 'Centro', 'Avenida Colón', '31000', 789, 505, '2023-09-18 13:15:00', NULL, NULL),
(10, 10, 'Casa', 'Tamaulipas', 'Tampico', 'Zona Centro', 'Calle Hidalgo', '89000', 101, NULL, '2023-09-17 15:30:00', NULL, NULL),
(11, 11, 'Departamento', 'Michoacán', 'Morelia', 'Félix Ireta', 'Avenida Madero', '58000', 456, 303, '2023-09-16 09:00:00', NULL, NULL),
(12, 12, 'Oficina', 'Durango', 'Durango', 'Centro', 'Calle 5 de Febrero', '34000', 789, 506, '2023-09-15 11:15:00', NULL, NULL),
(13, 13, 'Casa', 'Veracruz', 'Veracruz', 'Boca del Río', 'Calle Costa Verde', '94298', 123, NULL, '2023-09-14 13:30:00', NULL, NULL),
(14, 14, 'Departamento', 'San Luis Potosí', 'San Luis Potosí', 'Centro', 'Calle Abasolo', '78000', 456, 304, '2023-09-13 15:45:00', NULL, NULL),
(15, 15, 'Oficina', 'Sonora', 'Hermosillo', 'Centro', 'Avenida Rosales', '83000', 789, 507, '2023-09-12 18:00:00', NULL, NULL),
(16, 16, 'Casa', 'Tabasco', 'Villahermosa', 'Centro', 'Calle Juárez', '86000', 101, NULL, '2023-09-11 08:30:00', NULL, NULL),
(17, 17, 'Departamento', 'Campeche', 'Campeche', 'San Román', 'Calle Baluartes', '24000', 456, 305, '2023-09-10 10:45:00', NULL, NULL),
(18, 18, 'Oficina', 'Sinaloa', 'Culiacán', 'Centro', 'Calle Rosales', '80000', 789, 508, '2023-09-09 12:00:00', NULL, NULL),
(19, 19, 'Casa', 'Nayarit', 'Tepic', 'Centro', 'Calle Colón', '63000', 123, NULL, '2023-09-08 14:15:00', NULL, NULL),
(20, 20, 'Departamento', 'Baja California', 'Tijuana', 'Zonaeste', 'Avenida Revolución', '22000', 456, 306, '2023-09-07 16:30:00', NULL, NULL),
(21, 21, 'Casa', 'Ciudad de México', 'Ciudad de México', 'Polanco', 'Av. Reforma', '11560', 123, 101, '2023-09-26 08:00:00', NULL, NULL),
(22, 22, 'Oficina', 'Ciudad de México', 'Ciudad de México', 'Condesa', 'Av. Ámsterdam', '11540', 456, NULL, '2023-09-25 10:15:00', NULL, NULL),
(23, 23, 'Casa', 'Guadalajara', 'Guadalajara', 'Lomas de Guevara', 'Calle Chapultepec', '44600', 789, 202, '2023-09-24 12:30:00', NULL, NULL),
(24, 24, 'Oficina', 'Guadalajara', 'Guadalajara', 'Providencia', 'Av. Américas', '44620', 101, NULL, '2023-09-23 09:45:00', NULL, NULL),
(25, 25, 'Casa', 'Monterrey', 'Monterrey', 'San Jerónimo', 'Calle Reforma', '64200', 222, 102, '2023-09-22 14:15:00', NULL, NULL),
(26, 26, 'Oficina', 'Monterrey', 'Monterrey', 'Obispado', 'Av. Morones Prieto', '64410', 333, NULL, '2023-09-21 16:30:00', NULL, NULL),
(27, 27, 'Casa', 'Puebla', 'Puebla', 'La Paz', 'Calle 5 de Mayo', '72000', 444, 103, '2023-09-20 08:45:00', NULL, NULL),
(28, 28, 'Oficina', 'Puebla', 'Puebla', 'Centro Histórico', 'Av. Juárez', '72090', 555, NULL, '2023-09-19 11:00:00', NULL, NULL),
(29, 29, 'Casa', 'Tijuana', 'Tijuana', 'Zonaeste', 'Calle Revolución', '22000', 666, 104, '2023-09-18 13:15:00', NULL, NULL),
(30, 30, 'Departamento', 'Nuevo León', 'Monterrey', 'Centro', 'Calle Zaragoza', '64000', 456, 789, '2023-09-26 08:15:00', NULL, NULL),
(31, 31, 'Oficina', 'Jalisco', 'Guadalajara', 'Americana', 'Avenida Chapultepec', '44100', 789, NULL, '2023-09-26 08:30:00', NULL, NULL),
(32, 32, 'Casa', 'Puebla', 'Puebla', 'La Paz', 'Calle Juárez', '72160', 101, NULL, '2023-09-26 08:45:00', NULL, NULL),
(33, 33, 'Departamento', 'Veracruz', 'Veracruz', 'Boca del Río', 'Calle Insurgentes', '94290', 202, NULL, '2023-09-26 09:00:00', NULL, NULL),
(34, 34, 'Oficina', 'Quintana Roo', 'Cancún', 'Centro', 'Avenida Tulum', '77500', 303, NULL, '2023-09-26 09:15:00', NULL, NULL),
(35, 35, 'Casa', 'Guanajuato', 'León', 'La Martinica', 'Boulevard López Mateos', '37170', 404, 123, '2023-09-26 09:30:00', NULL, NULL),
(36, 36, 'Departamento', 'Chihuahua', 'Chihuahua', 'Centro', 'Calle Ocampo', '31000', 505, NULL, '2023-09-26 09:45:00', NULL, NULL),
(37, 37, 'Oficina', 'Tamaulipas', 'Tampico', 'Zona Centro', 'Calle Hidalgo', '89000', 606, NULL, '2023-09-26 10:00:00', NULL, NULL),
(38, 38, 'Casa', 'Sinaloa', 'Culiacán', 'Las Torres', 'Avenida Álvaro Obregón', '80000', 707, NULL, '2023-09-26 10:15:00', NULL, NULL),
(39, 39, 'Departamento', 'Oaxaca', 'Oaxaca', 'Reforma', 'Calle Murguía', '68000', 808, 234, '2023-09-26 10:30:00', NULL, NULL),
(40, 40, 'Oficina', 'Michoacán', 'Morelia', 'Centro', 'Avenida Madero', '58000', 909, NULL, '2023-09-26 10:45:00', NULL, NULL),
(41, 41, 'Casa', 'Sonora', 'Hermosillo', 'Villa de Seris', 'Bulevar Kino', '83280', 1010, NULL, '2023-09-26 11:00:00', NULL, NULL),
(42, 42, 'Departamento', 'Coahuila', 'Saltillo', 'Zona Centro', 'Calle Allende', '25000', 1111, 567, '2023-09-26 11:15:00', NULL, NULL),
(43, 43, 'Oficina', 'Tabasco', 'Villahermosa', 'Gaviotas', 'Avenida Paseo Usumacinta', '86035', 1212, NULL, '2023-09-26 11:30:00', NULL, NULL),
(44, 44, 'Casa', 'Aguascalientes', 'Aguascalientes', 'San Marcos', 'Calle Madero', '20000', 1313, NULL, '2023-09-26 11:45:00', NULL, NULL),
(45, 45, 'Departamento', 'Durango', 'Durango', 'Centro', 'Calle Constitución', '34000', 1414, 890, '2023-09-26 12:00:00', NULL, NULL),
(46, 46, 'Oficina', 'Yucatán', 'Mérida', 'Centro', 'Calle 60', '97000', 1515, NULL, '2023-09-26 12:15:00', NULL, NULL),
(47, 47, 'Oficina', 'Monterrey', 'Monterrey', 'Obispado', 'Av. Morones Prieto', '64410', 333, NULL, '2023-09-21 16:30:00', NULL, NULL),
(48, 48, 'Casa', 'Puebla', 'Puebla', 'La Paz', 'Calle 5 de Mayo', '72000', 444, 103, '2023-09-20 08:45:00', NULL, NULL),
(49, 49, 'Oficina', 'Puebla', 'Puebla', 'Centro Histórico', 'Av. Juárez', '72090', 555, NULL, '2023-09-19 11:00:00', NULL, NULL),
(50, 50, 'Casa', 'Tijuana', 'Tijuana', 'Zonaeste', 'Calle Revolución', '22000', 666, 104, '2023-09-18 13:15:00', NULL, NULL),
(51, 51, 'Casa', 'Puebla', 'Teziutlán', 'Emiliano Zapata', 'El Mirador', '73950', 33, NULL, '2023-09-26 12:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'api', 'authgroup'),
(8, 'api', 'authgrouppermissions'),
(9, 'api', 'authpermission'),
(10, 'api', 'authuser'),
(11, 'api', 'authusergroups'),
(12, 'api', 'authuseruserpermissions'),
(13, 'api', 'consultas'),
(14, 'api', 'direccion'),
(15, 'api', 'djangoadminlog'),
(16, 'api', 'djangocontenttype'),
(17, 'api', 'djangomigrations'),
(18, 'api', 'djangosession'),
(19, 'api', 'medicamentos'),
(20, 'api', 'medico'),
(21, 'api', 'medicopaciente'),
(22, 'api', 'paciente'),
(23, 'api', 'receta'),
(24, 'api', 'recetamedicamento'),
(25, 'api', 'userinfo'),
(26, 'api', 'users'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-29 03:54:32.316837'),
(2, 'auth', '0001_initial', '2023-11-29 03:54:33.264595'),
(3, 'admin', '0001_initial', '2023-11-29 03:54:33.533320'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-29 03:54:33.533320'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-29 03:54:33.562843'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-29 03:54:33.691742'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-29 03:54:33.806762'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-29 03:54:33.851829'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-29 03:54:33.865840'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-29 03:54:33.983796'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-29 03:54:33.991279'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-29 03:54:34.007969'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-29 03:54:34.046863'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-29 03:54:34.099404'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-29 03:54:34.137335'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-29 03:54:34.165442'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-29 03:54:34.207369'),
(18, 'sessions', '0001_initial', '2023-11-29 03:54:34.300084'),
(19, 'api', '0001_initial', '2023-11-29 03:55:43.443795');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL,
  `nombreComercial` varchar(50) NOT NULL,
  `nombreCinetifico` varchar(80) NOT NULL,
  `formaFarmaceutica` varchar(20) NOT NULL,
  `dosis` int(11) NOT NULL,
  `fechaCaducidad` date NOT NULL,
  `loteFabricacion` varchar(10) NOT NULL,
  `version` varchar(15) NOT NULL,
  `simbolo` varchar(250) DEFAULT NULL,
  `imagenEmpaque` varchar(150) NOT NULL,
  `stock` int(11) DEFAULT 50,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `nombreComercial`, `nombreCinetifico`, `formaFarmaceutica`, `dosis`, `fechaCaducidad`, `loteFabricacion`, `version`, `simbolo`, `imagenEmpaque`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aspirina', 'Ácido Acetilsalicílico', 'Tableta', 100, '2024-09-01', 'A12345', 'Adultos', 'Evitar alcohol', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501008491966_1_2.jpgg', 50, '2023-09-26 08:00:00', NULL, NULL),
(2, 'Amoxicilina+', 'Amoxicilina', 'Cápsula', 500, '2024-08-15', 'B56789', 'Adultos', 'No embarazo', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7503006569524.jpg', 50, '2023-09-25 10:15:00', NULL, NULL),
(3, 'Paracetamol', 'Acetaminofén', 'Tableta', 500, '2024-07-20', 'C23456', 'Adultos', 'No alcohol', 'https://www.costco.com.mx/medias/sys_master/products/hde/hf7/79642016940062.webp', 50, '2023-09-24 12:30:00', NULL, NULL),
(4, 'Ibuprofeno', 'Ibuprofeno', 'Tableta', 200, '2024-07-01', 'D78901', 'Adultos', 'Estómago vacío', 'https://www.soriana.com/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dwb718b047/images/product/7500093754352_A.jpg', 50, '2023-09-23 09:45:00', NULL, NULL),
(5, 'Ventolin', 'Salbutamol', 'Aerosol', 100, '2024-06-15', 'E67890', 'Adultos', 'No fumar', 'https://prixz.com/salud/wp-content/uploads/2020/02/ventolin.jpg', 50, '2023-09-22 14:15:00', NULL, NULL),
(6, 'Claritine', 'Loratadina', 'Tableta', 10, '2024-05-30', 'F12345', 'Adultos', 'Sin alcohol', 'https://m.media-amazon.com/images/I/612cMj2y46L._AC_UF1000,1000_QL80_.jpg', 50, '2023-09-21 16:30:00', NULL, NULL),
(7, 'Zyrtec+', 'Cetirizina', 'Tableta', 10, '2024-05-15', 'G67890', 'Adultos', 'Evitar sol', 'https://m.media-amazon.com/images/I/71+Z0WhqnIL._AC_UF1000,1000_QL80_.jpg', 50, '2023-09-20 08:45:00', NULL, NULL),
(8, 'Pedialyte+', 'Electrolitos', 'Solución', 250, '2024-04-30', 'H23456', 'Niños', 'No cafeína', 'https://m.media-amazon.com/images/I/51-0+-DANcL._AC_UF1000,1000_QL80_.jpg', 50, '2023-09-19 11:00:00', NULL, NULL),
(9, 'Mucinex', 'Guaifenesina', 'Jarabe', 100, '2024-04-15', 'I78901', 'Adultos', 'No alcohol', 'https://m.media-amazon.com/images/I/71vaV+EAn8L.jpg', 50, '2023-09-18 13:15:00', NULL, NULL),
(10, 'Metamucil', 'Psyllium', 'Polvo', 5, '2024-03-30', 'J12345', 'Adultos', 'Beber agua', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501001100001_5.jpg', 50, '2023-09-17 15:30:00', NULL, NULL),
(11, 'Ritalin', 'Metilfenidato', 'Tableta', 20, '2024-03-15', 'K67890', 'Niños', 'No alcohol', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501094912437.jpg', 50, '2023-09-16 09:00:00', NULL, NULL),
(12, 'Tums', 'Carbonato de Calcio', 'Tableta', 1000, '2024-02-28', 'L23456', 'Adultos', 'Sin leche', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501065054029_2_1_1.jpg', 50, '2023-09-15 11:15:00', NULL, NULL),
(13, 'Robitussin', 'Dextrometorfano', 'Jarabe', 10, '2024-02-15', 'M78901', 'Adultos', 'No alcohol', 'https://http2.mlstatic.com/D_NQ_NP_641067-MLM43416073068_092020-O.webp', 50, '2023-09-14 13:30:00', NULL, NULL),
(14, 'Benadryl', 'Difenhidramina', 'Tableta', 25, '2024-01-31', 'N12345', 'Adultos', 'No alcohol', 'https://www.biovea.com/mx/images/products/xlrg/3666_z.jpg', 50, '2023-09-13 15:45:00', NULL, NULL),
(15, 'Zantac', 'Ranitidina', 'Tableta', 150, '2024-01-15', 'O67890', 'Adultos', 'Evitar alcohol', 'https://www.usatoday.com/gcdn/presto/2019/09/13/USAT/c1dc70dc-95d6-4e7f-a183-0f4878ddffd2-D_YL_OTC_zantac.JPG', 50, '2023-09-12 18:00:00', NULL, NULL),
(16, 'Pepto-Bismol', 'Bismuto Subsalicilato', 'Tableta', 262, '2023-12-30', 'P23456', 'Adultos', 'No alcohol', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501001258030_4.jpg', 50, '2023-09-11 08:30:00', NULL, NULL),
(17, 'Naproxeno', 'Naproxeno', 'Tableta', 250, '2023-12-15', 'Q78901', 'Adultos', 'Con comida', 'https://www.sams.com.mx/images/product-images/img_small/980008031s.jpg', 50, '2023-09-10 10:45:00', NULL, NULL),
(18, 'Efedrina', 'Efedrina', 'Tableta', 50, '2023-11-30', 'R12345', 'Adultos', 'No alcohol', 'https://www.fahorro.com/media/catalog/product/cache/6517c62f5899ad6aa0ba23ceb3eeff97/7/5/7502223706231.png', 50, '2023-09-09 12:00:00', NULL, NULL),
(19, 'Dramamine', 'Dimenhidrinato', 'Tableta', 50, '2023-11-15', 'S67890', 'Adultos', 'No alcohol', 'https://resources.claroshop.com/imagenes-sanborns-ii/1200/300093642096.jpg', 50, '2023-09-08 14:15:00', NULL, NULL),
(20, 'Motrin+', 'Ibuprofeno', 'Tableta', 200, '2023-10-15', 'U12345', 'Adultos', 'No alcohol', 'https://www.fahorro.com/media/catalog/product/cache/6517c62f5899ad6aa0ba23ceb3eeff97/7/5/7501287627469.jpg', 50, '2023-09-07 16:30:00', NULL, NULL),
(21, 'Lorazepam', 'Lorazepam', 'Tableta', 1, '2023-09-30', 'V67890', 'Adultos', 'No alcohol', 'https://www.pmfarma.com/noticias/noticias/35303/image/Normon%20lanza%20lorazepam%2005%20mg.jpg', 50, '2023-09-06 18:45:00', NULL, NULL),
(22, 'Simvastatin', 'Simvastatina', 'Tableta', 20, '2023-09-15', 'W23456', 'Adultos', 'Evitar alcohol', 'https://www.plmconnection.com/plmservices/PharmaSearchEngine/Ecuador/DEF/SIDEF/400x400/lasante_simvastatina_tabletas.png', 50, '2023-09-05 09:15:00', NULL, NULL),
(23, 'Zoloft', 'Sertralina', 'Cápsula', 50, '2023-08-31', 'X78901', 'Adultos', 'No alcohol', 'https://5.imimg.com/data5/SELLER/Default/2023/5/304645947/TT/OX/LU/188632740/zoloft-sertraline-50mg-tablets-pfizer.webp', 50, '2023-09-04 11:30:00', NULL, NULL),
(24, 'Flonase', 'Fluticasona', 'Aerosol nasal', 50, '2023-08-15', 'Y12345', 'Adultos', 'Evitar alcohol', 'https://m.media-amazon.com/images/I/81lKZzIhq2L.jpg', 50, '2023-09-03 13:45:00', NULL, NULL),
(25, 'Ambien', 'Zolpidem', 'Tableta', 10, '2023-07-30', 'Z67890', 'Adultos', 'No alcohol', 'https://5.imimg.com/data5/SELLER/Default/2023/5/305017087/YQ/DI/VU/188054913/ambien-zolpidem-10-mg-tablets-500x500.jpg', 50, '2023-09-02 15:00:00', NULL, NULL),
(26, 'Cipro', 'Ciprofloxacino', 'Tableta', 500, '2023-07-15', 'AA1234', 'Adultos', 'No alcohol', 'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00750131867089L.jpg', 50, '2023-09-01 08:30:00', NULL, NULL),
(27, 'Prilosec', 'Omeprazol', 'Cápsula', 20, '2023-06-30', 'BB5678', 'Adultos', 'Evitar alcohol', 'https://m.media-amazon.com/images/I/61xjOljyR6L._AC_UF894,1000_QL80_.jpg', 50, '2023-08-31 10:45:00', NULL, NULL),
(28, 'Lisinopril', 'Lisinopril', 'Tableta', 10, '2023-06-15', 'CC2345', 'Adultos', 'No alcohol', 'https://www.fahorro.com/media/amasty/amoptmobile/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7502223709157_png.webp', 50, '2023-08-30 13:00:00', NULL, NULL),
(29, 'Neosporin', 'Neomicina', 'Crema', 1, '2023-05-30', 'DD6789', 'Adultos', 'No ingerir', 'https://http2.mlstatic.com/D_NQ_NP_899269-MLM72023691169_092023-O.webp', 50, '2023-08-29 15:15:00', NULL, NULL),
(30, 'Tetracycline', 'Tetraciclina', 'Tableta', 250, '2023-05-15', 'EE2345', 'Adultos', 'No alcohol', 'https://5.imimg.com/data5/SELLER/Default/2022/12/JH/OJ/YH/20293607/tetracycline-hydrochloride-capsules.jpg', 50, '2023-08-28 17:30:00', NULL, NULL),
(31, 'Dulcolax', 'Bisacodilo', 'Tableta', 5, '2023-04-30', 'FF6789', 'Adultos', 'No alcohol', 'https://m.media-amazon.com/images/I/81z5C09MiBS._AC_UF350,350_QL80_.jpg', 50, '2023-08-27 19:45:00', NULL, NULL),
(32, 'Allegra', 'Fexofenadina', 'Tableta', 180, '2023-04-15', 'GG2345', 'Adultos', 'No alcohol', 'https://m.media-amazon.com/images/I/61cumLwyWeL._AC_UF1000,1000_QL80_.jpg', 50, '2023-08-26 22:00:00', NULL, NULL),
(33, 'Zovirax', 'Aciclovir', 'Crema', 5, '2023-03-31', 'HH6789', 'Adultos', 'No ingerir', 'https://www.plmconnection.com/plmservices/PharmaSearchEngine/Mexico/DEF/SIDEF/400x400/gsk_zoviraxdispersable_tabs_400mgcj35.png', 50, '2023-08-25 08:15:00', NULL, NULL),
(34, 'Celexa', 'Citalopram', 'Tableta', 20, '2023-03-15', 'II2345', 'Adultos', 'No alcohol', 'https://www.dmlawfirm.com/wp-content/uploads/2012/01/celexa-200mg.png', 50, '2023-08-24 10:30:00', NULL, NULL),
(35, 'Nexium', 'Esomeprazol', 'Tableta', 40, '2023-02-28', 'JJ6789', 'Adultos', 'Evitar alcohol', 'https://m.media-amazon.com/images/I/71RT3VH9iXL.jpg', 50, '2023-08-23 12:45:00', NULL, NULL),
(36, 'Prednisone', 'Prednisona', 'Tableta', 5, '2023-02-15', 'KK2345', 'Adultos', 'No alcohol', 'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501125180897_2_1.jpg', 50, '2023-08-22 15:00:00', NULL, NULL),
(37, 'Methylprednisolone', 'Metilprednisolona', 'Tableta', 4, '2023-01-31', 'LL6789', 'Adultos', 'No alcohol', 'https://5.imimg.com/data5/SELLER/Default/2022/11/WN/WC/PA/35828174/methylprednisolone-tablets-16-mg.jpg', 50, '2023-08-21 17:15:00', NULL, NULL),
(38, 'Symbicort', 'Budesonida y Formoterol', 'Aerosol', 200, '2023-01-15', 'MM2345', 'Adultos', 'Evitar alcohol', 'https://www.costco.com.mx/medias/sys_master/products/hdd/h84/47030616391710.jpg', 50, '2023-08-20 19:30:00', NULL, NULL),
(39, 'Amoxicilina Infantil', 'Amoxicilina', 'Suspensión', 250, '2023-10-15', 'AA1234', 'Niños', 'No alcohol', 'https://www.movil.farmaciasguadalajara.com/wcsstore/FGCAS/wcs/products/1211218_A_1280_AL.jpg', 50, '2023-08-30 13:00:00', NULL, NULL),
(40, 'Pedialyte', 'Electrolitos', 'Solución', 100, '2023-09-30', 'BB5678', 'Niños', 'No cafeína', 'https://www.nutri-o.com/nutrio/Pedialyte_SR_60_files/Pedialyte%2060-filtered.jpg', 50, '2023-08-29 15:15:00', NULL, NULL),
(41, 'Tylenol', 'Acetaminofén', 'Jarabe', 120, '2023-09-15', 'CC2345', 'Niños', 'No alcohol', 'https://www.tylenol.com.mx/sites/tylenol_mx/files/styles/product_image/public/product-images/tylenol-pediatrico-980-x-980-px-1.jpg', 50, '2023-08-28 17:30:00', NULL, NULL),
(42, 'Advil', 'Ibuprofeno', 'Jarabe', 50, '2023-08-31', 'DD6789', 'Niños', 'No alcohol', 'https://m.media-amazon.com/images/I/71oSngkKugL._AC_UF1000,1000_QL80_.jpg', 50, '2023-08-27 19:45:00', NULL, NULL),
(43, 'Zyrtec', 'Cetirizina', 'Jarabe', 5, '2023-08-15', 'EE2345', 'Niños', 'Evitar sol', 'https://www.movil.farmaciasguadalajara.com/wcsstore/FGCAS/wcs/products/840416_A_1280_AL.jpg', 50, '2023-08-26 22:00:00', NULL, NULL),
(44, 'Claritin', 'Loratadina', 'Jarabe', 10, '2023-07-30', 'FF6789', 'Niños', 'Sin alcohol', 'https://www.farmalisto.com.mx/68793/comprar-clarityne-d-solucion-pediatrica-067mg2mg1ml-alergias-precio.jpg', 50, '2023-08-25 08:15:00', NULL, NULL),
(45, 'Motrin', 'Ibuprofeno', 'Jarabe', 50, '2023-07-15', 'GG2345', 'Niños', 'No fumar', 'https://www.motrin.com.mx/sites/motrin_mx/files/styles/product_image/public/product-images/packshot-motrin_infantil-980x980.jpg', 50, '2023-08-24 10:30:00', NULL, NULL),
(46, 'Benadryl+', 'Difenhidramina', 'Jarabe', 5, '2023-06-30', 'HH6789', 'Niños', 'No alcohol', 'https://www.benadryl.com/sites/benadryl_us_2/files/styles/large/public/files/header-images/benadryl-childrens-chewables.jpg', 50, '2023-08-23 12:45:00', NULL, NULL),
(47, 'Delsym', 'Dextrometorfano', 'Jarabe', 10, '2023-06-15', 'II2345', 'Niños', 'No alcohol', 'https://m.media-amazon.com/images/I/61eFPGj3NbL._AC_UF1000,1000_QL80_.jpg', 50, '2023-08-22 15:00:00', NULL, NULL),
(48, 'Zantac+', 'Ranitidina', 'Jarabe', 50, '2023-05-30', 'JJ6789', 'Niños', 'No alcohol', 'https://www.makobitelog.com/_exports/2274-large_default/zantac-75.jpg', 50, '2023-08-21 17:15:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_consultas_clinica`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_consultas_clinica` (
`Id de consulta` int(11)
,`Lugar de consulta` text
,`Id de receta` int(11)
,`Medicamentos de la receta` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `diasLaborales` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id`, `especialidad`, `turno`, `diasLaborales`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cardiología', 'matutino', 'Lunes a Viernes', '2023-09-26 08:00:00', NULL, NULL),
(2, 'Neurología', 'vespertino', 'Lunes a Jueves', '2023-09-25 10:15:00', NULL, NULL),
(3, 'Pediatría', 'nocturno', 'Lunes, Miércoles, Viernes', '2023-09-24 20:30:00', NULL, NULL),
(4, 'Dermatología', 'matutino', 'Lunes a Viernes', '2023-09-23 09:45:00', NULL, NULL),
(5, 'Oftalmología', 'vespertino', 'Lunes a Jueves', '2023-09-22 13:20:00', NULL, NULL),
(6, 'Ginecología', 'nocturno', 'Lunes, Miércoles, Viernes', '2023-09-21 21:10:00', NULL, NULL),
(7, 'Ortopedia', 'matutino', 'Lunes a Viernes', '2023-09-20 08:30:00', NULL, NULL),
(8, 'Urología', 'vespertino', 'Lunes a Jueves', '2023-09-19 14:45:00', NULL, NULL),
(9, 'Oncología', 'nocturno', 'Lunes, Miércoles, Viernes', '2023-09-18 19:55:00', NULL, NULL),
(10, 'Endocrinología', 'matutino', 'Lunes a Viernes', '2023-09-17 09:10:00', NULL, NULL),
(11, 'Psiquiatría', 'matutino', 'Lunes a Viernes', '2023-09-16 08:00:00', NULL, NULL),
(12, 'Nutrición', 'vespertino', 'Lunes a Jueves', '2023-09-15 12:30:00', NULL, NULL),
(13, 'Dentista', 'nocturno', 'Lunes, Miércoles, Viernes', '2023-09-14 19:45:00', NULL, NULL),
(14, 'Geriatría', 'matutino', 'Lunes a Viernes', '2023-09-13 10:20:00', NULL, NULL),
(15, 'Otorrinolaringología', 'vespertino', 'Lunes a Jueves', '2023-09-12 15:55:00', NULL, NULL),
(16, 'Pulmonología', 'nocturno', 'Lunes, Miércoles, Viernes', '2023-09-11 21:40:00', NULL, NULL),
(17, 'Oncología Pediátrica', 'matutino', 'Lunes a Viernes', '2023-09-10 08:15:00', NULL, NULL),
(18, 'Traumatología', 'vespertino', 'Lunes a Jueves', '2023-09-09 13:25:00', NULL, NULL),
(19, 'Neumología', 'nocturno', 'Lunes, Miércoles, Viernes', '2023-09-08 19:00:00', NULL, NULL),
(20, 'Dermatopatología', 'matutino', 'Lunes a Viernes', '2023-09-07 09:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicosdelpaciente_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicosdelpaciente_especialidad` (
`id del paciente` int(11)
,`Nombre del Paciente` varchar(152)
,`id del médico` mediumtext
,`Nombre y especilidad del médico que lo atiende` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_pacientesalcoholicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_pacientesalcoholicos` (
`id del paciente` int(11)
,`Nombre del Paciente` varchar(152)
,`Hábito` varchar(250)
,`id del médico que lo atiende` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_pacientesfumadores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_pacientesfumadores` (
`id del paciente` int(11)
,`Nombre del Paciente` varchar(152)
,`Hábito` varchar(250)
,`id del médico que lo atiende` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_puebla`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_puebla` (
`Nombre del Médico` varchar(203)
,`Tipo de dirección` varchar(50)
,`Estado y municipio` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_paciente`
--

CREATE TABLE `medico_paciente` (
  `id` int(11) NOT NULL,
  `medico` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico_paciente`
--

INSERT INTO `medico_paciente` (`id`, `medico`, `paciente`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 15, '2023-09-01 08:00:00', NULL, NULL),
(2, 4, 23, '2023-09-02 10:15:00', NULL, NULL),
(3, 7, 5, '2023-09-03 12:30:00', NULL, NULL),
(4, 12, 30, '2023-09-04 09:45:00', NULL, NULL),
(5, 2, 8, '2023-09-05 14:15:00', NULL, NULL),
(6, 19, 21, '2023-09-06 16:30:00', NULL, NULL),
(7, 9, 17, '2023-09-07 08:45:00', NULL, NULL),
(8, 16, 4, '2023-09-08 11:00:00', NULL, NULL),
(9, 11, 12, '2023-09-09 13:15:00', NULL, NULL),
(10, 5, 9, '2023-09-10 15:30:00', NULL, NULL),
(11, 14, 19, '2023-09-11 18:00:00', NULL, NULL),
(12, 3, 27, '2023-09-12 08:30:00', NULL, NULL),
(13, 6, 14, '2023-09-13 10:45:00', NULL, NULL),
(14, 8, 25, '2023-09-14 12:00:00', NULL, NULL),
(15, 15, 1, '2023-09-15 14:15:00', NULL, NULL),
(16, 10, 18, '2023-09-16 16:30:00', NULL, NULL),
(17, 13, 7, '2023-09-17 08:45:00', NULL, NULL),
(18, 18, 29, '2023-09-18 11:00:00', NULL, NULL),
(19, 20, 10, '2023-09-19 13:15:00', NULL, NULL),
(20, 17, 3, '2023-09-20 15:30:00', NULL, NULL),
(21, 3, 26, '2023-09-21 18:45:00', NULL, NULL),
(22, 7, 15, '2023-09-22 09:15:00', NULL, NULL),
(23, 14, 28, '2023-09-23 11:30:00', NULL, NULL),
(24, 9, 6, '2023-09-24 13:45:00', NULL, NULL),
(25, 2, 22, '2023-09-25 15:00:00', NULL, NULL),
(26, 1, 8, '2023-09-26 17:15:00', NULL, NULL),
(27, 13, 20, '2023-09-27 08:00:00', NULL, NULL),
(28, 6, 3, '2023-09-28 10:15:00', NULL, NULL),
(29, 2, 27, '2023-09-29 12:30:00', NULL, NULL),
(30, 17, 11, '2023-09-30 09:45:00', NULL, NULL),
(31, 4, 14, '2023-10-01 14:15:00', NULL, NULL),
(32, 8, 2, '2023-10-02 16:30:00', NULL, NULL),
(33, 9, 29, '2023-10-03 08:45:00', NULL, NULL),
(34, 12, 19, '2023-10-04 11:00:00', NULL, NULL),
(35, 10, 8, '2023-10-05 13:15:00', NULL, NULL),
(36, 1, 16, '2023-10-06 15:30:00', NULL, NULL),
(37, 5, 5, '2023-10-07 18:00:00', NULL, NULL),
(38, 20, 12, '2023-10-08 08:30:00', NULL, NULL),
(39, 15, 23, '2023-10-09 10:45:00', NULL, NULL),
(40, 7, 1, '2023-10-10 12:00:00', NULL, NULL),
(41, 19, 22, '2023-10-11 14:15:00', NULL, NULL),
(42, 3, 30, '2023-10-12 16:30:00', NULL, NULL),
(43, 16, 28, '2023-10-13 08:45:00', NULL, NULL),
(44, 18, 7, '2023-10-14 11:00:00', NULL, NULL),
(45, 11, 24, '2023-10-15 13:15:00', NULL, NULL),
(46, 14, 9, '2023-10-16 15:30:00', NULL, NULL),
(47, 2, 18, '2023-10-17 17:45:00', NULL, NULL),
(48, 8, 10, '2023-10-18 09:00:00', NULL, NULL),
(49, 6, 21, '2023-10-19 11:15:00', NULL, NULL),
(50, 4, 26, '2023-10-20 13:30:00', NULL, NULL),
(51, 12, 25, '2023-10-21 15:45:00', NULL, NULL),
(52, 15, 4, '2023-10-22 18:00:00', NULL, NULL),
(53, 5, 17, '2023-10-23 08:30:00', NULL, NULL),
(54, 7, 6, '2023-10-24 10:45:00', NULL, NULL),
(55, 1, 13, '2023-10-25 12:00:00', NULL, NULL),
(56, 20, 15, '2023-10-26 14:15:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `npacientes_medicof`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `npacientes_medicof` (
`id del médico` int(11)
,`Nombre del Médico` varchar(152)
,`Género del médico` varchar(1)
,`Número de pacientes que atiende` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `npacientes_medicom`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `npacientes_medicom` (
`id del médico` int(11)
,`Nombre del Médico` varchar(152)
,`Género del médico` varchar(1)
,`Número de pacientes que atiende` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `statusSeguro` varchar(50) NOT NULL,
  `tipoSangre` varchar(3) NOT NULL,
  `alergia` varchar(250) DEFAULT NULL,
  `fechaRevision` date DEFAULT NULL,
  `motivoRevision` text DEFAULT NULL,
  `habitoToxico` varchar(250) DEFAULT NULL,
  `condicionesPrevias` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `CURP`, `statusSeguro`, `tipoSangre`, `alergia`, `fechaRevision`, `motivoRevision`, `habitoToxico`, `condicionesPrevias`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABC123456XYZ789DEF', 'Seguro Social', 'A+', 'Ninguna', '2023-09-26', 'Chequeo de rutina', 'Ninguno', 'Ninguna', '2023-09-26 08:00:00', NULL, NULL),
(2, 'DEF789012XYZ345GHI', 'Seguro Privado', 'B-', 'Polen', '2023-09-25', 'Dolor de cabeza', 'Fumador', 'Ninguna', '2023-09-25 10:15:00', NULL, NULL),
(3, 'GHI456789XYZ012JKL', 'Ninguno', 'O', 'Penicilina', '2023-09-24', 'Revisión anual', 'Alcohol', 'Diabetes', '2023-09-24 12:30:00', NULL, NULL),
(4, 'JKL123456XYZ789MNO', 'Seguro Privado', 'AB+', 'Ninguna', '2023-09-23', 'Fiebre', 'Fumador', 'Ninguna', '2023-09-23 09:45:00', NULL, NULL),
(5, 'MNO789012XYZ345PQR', 'Ninguno', 'A-', 'Polen', '2023-09-22', 'Chequeo de rutina', 'Ninguno', 'Hipertensión', '2023-09-22 14:15:00', NULL, NULL),
(6, 'PQR456789XYZ012STU', 'Seguro Social', 'O+', 'Ninguna', '2023-09-21', 'Dolor de garganta', 'Fumador', 'Ninguna', '2023-09-21 16:30:00', NULL, NULL),
(7, 'STU123456XYZ789VWX', 'Seguro Privado', 'A+', 'Ninguna', '2023-09-20', 'Revisión anual', 'Alcohol', 'Ninguna', '2023-09-20 08:45:00', NULL, NULL),
(8, 'VWX789012XYZ345YZA', 'Ninguno', 'B-', 'Ninguna', '2023-09-19', 'Chequeo de rutina', 'Ninguno', 'Ninguna', '2023-09-19 11:00:00', NULL, NULL),
(9, 'YZA456789XYZ012B4D', 'Seguro Social', 'AB+', 'Ninguna', '2023-09-18', 'Dolor de cabeza', 'Fumador', 'Asma', '2023-09-18 13:15:00', NULL, NULL),
(10, 'B4D123456XYZ789EFG', 'Ninguno', 'A-', 'Ninguna', '2023-09-17', 'Revisión anual', 'Ninguno', 'Ninguna', '2023-09-17 15:30:00', NULL, NULL),
(11, 'EFG789012XYZ345HIJ', 'Seguro Privado', 'O+', 'Ninguna', '2023-09-16', 'Revisión anual', 'Ninguno', 'Ninguna', '2023-09-16 09:00:00', NULL, NULL),
(12, 'HIJ456789XYZ012KLM', 'Ninguno', 'B+', 'Ninguna', '2023-09-15', 'Chequeo de rutina', 'Alcohol', 'Ninguna', '2023-09-15 11:15:00', NULL, NULL),
(13, 'KLM123456XYZ789NOP', 'Seguro Social', 'AB-', 'Polen', '2023-09-14', 'Dolor de cabeza', 'Fumador', 'Ninguna', '2023-09-14 13:30:00', NULL, NULL),
(14, 'NOP789012XYZ345QRS', 'Ninguno', 'A+', 'Ninguna', '2023-09-13', 'Revisión anual', 'Ninguno', 'Ninguna', '2023-09-13 15:45:00', NULL, NULL),
(15, 'QRS456789XYZ012TUV', 'Seguro Privado', 'A-', 'Ninguna', '2023-09-12', 'Dolor de garganta', 'Ninguno', 'Ninguna', '2023-09-12 18:00:00', NULL, NULL),
(16, 'TUV123456XYZ789WXY', 'Seguro Social', 'B+', 'Ninguna', '2023-09-11', 'Chequeo de rutina', 'Alcohol', 'Ninguna', '2023-09-11 08:30:00', NULL, NULL),
(17, 'WXY789012XYZ345YZA', 'Ninguno', 'AB-', 'Ninguna', '2023-09-10', 'Fiebre', 'Ninguno', 'Ninguna', '2023-09-10 10:45:00', NULL, NULL),
(18, 'YZA456789XYZ012BCD', 'Seguro Privado', 'O+', 'Ninguna', '2023-09-09', 'Dolor de cabeza', 'Fumador', 'Ninguna', '2023-09-09 12:00:00', NULL, NULL),
(19, 'BCD123456XYZ789EFG', 'Seguro Social', 'A-', 'Ninguna', '2023-09-08', 'Revisión anual', 'Ninguno', 'Ninguna', '2023-09-08 14:15:00', NULL, NULL),
(20, 'EFG789014XYZ345HIJ', 'Ninguno', 'A+', 'Polen', '2023-09-07', 'Chequeo de rutina', 'Ninguno', 'Ninguna', '2023-09-07 16:30:00', NULL, NULL),
(21, 'HIJ456799XYZ012KLM', 'Seguro Privado', 'B-', 'Ninguna', '2023-09-06', 'Dolor de garganta', 'Ninguno', 'Ninguna', '2023-09-06 18:45:00', NULL, NULL),
(22, 'KLM123356XYZ789DEF', 'Ninguno', 'O+', 'Ninguna', '2023-09-05', 'Revisión anual', 'Ninguno', 'Ninguna', '2023-09-05 09:00:00', NULL, NULL),
(23, 'DEF780012XYZ345GHI', 'Seguro Privado', 'AB+', 'Ninguna', '2023-09-04', 'Dolor de cabeza', 'Ninguno', 'Ninguna', '2023-09-04 11:15:00', NULL, NULL),
(24, 'GHI446789XYZ012JKL', 'Ninguno', 'B-', 'Ninguna', '2023-09-03', 'Chequeo de rutina', 'Ninguno', 'Ninguna', '2023-09-03 13:30:00', NULL, NULL),
(25, 'JKL023456XYZ789MNO', 'Seguro Social', 'A+', 'Ninguna', '2023-09-02', 'Revisión anual', 'Alcohol', 'Ninguna', '2023-09-02 15:45:00', NULL, NULL),
(26, 'MNP789012XYZ345PQR', 'Ninguno', 'A-', 'Ninguna', '2023-09-01', 'Dolor de garganta', 'Ninguno', 'Ninguna', '2023-09-01 08:30:00', NULL, NULL),
(27, 'PZR456789XYZ012STU', 'Seguro Privado', 'B+', 'Ninguna', '2023-08-31', 'Fiebre', 'Ninguno', 'Ninguna', '2023-08-31 10:45:00', NULL, NULL),
(28, 'SAU123456XYZ789VWX', 'Ninguno', 'O-', 'Polen', '2023-08-30', 'Revisión anual', 'Ninguno', 'Ninguna', '2023-08-30 12:00:00', NULL, NULL),
(29, 'QWX789012XYZ345YZA', 'Seguro Social', 'AB-', 'Ninguna', '2023-08-29', 'Dolor de cabeza', 'Ninguno', 'Ninguna', '2023-08-29 14:15:00', NULL, NULL),
(30, 'EZA456789XYZ012BCD', 'Ninguno', 'AB+', 'Ninguna', '2023-08-28', 'Chequeo de rutina', 'Ninguno', 'Ninguna', '2023-08-28 16:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `consulta` int(11) NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `consulta`, `fechaVencimiento`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, '2023-10-10', 0, '2023-09-26 08:00:00', NULL, NULL),
(2, 15, '2023-10-15', 0, '2023-09-25 10:15:00', NULL, NULL),
(3, 27, '2023-10-20', 0, '2023-09-24 12:30:00', NULL, NULL),
(4, 4, '2023-10-25', 0, '2023-09-23 09:45:00', NULL, NULL),
(5, 32, '2023-10-30', 0, '2023-09-22 14:15:00', NULL, NULL),
(6, 6, '2023-11-05', 0, '2023-09-21 16:30:00', NULL, NULL),
(7, 11, '2023-11-10', 0, '2023-09-20 08:45:00', NULL, NULL),
(8, 19, '2023-11-15', 0, '2023-09-19 11:00:00', NULL, NULL),
(9, 3, '2023-11-20', 0, '2023-09-18 13:15:00', NULL, NULL),
(10, 22, '2023-11-25', 0, '2023-09-17 15:30:00', NULL, NULL),
(11, 2, '2023-11-30', 1, '2023-09-16 09:00:00', NULL, NULL),
(12, 7, '2023-12-05', 1, '2023-09-15 11:15:00', NULL, NULL),
(13, 9, '2023-12-10', 1, '2023-09-14 13:30:00', NULL, NULL),
(14, 37, '2023-12-15', 1, '2023-09-13 15:45:00', NULL, NULL),
(15, 44, '2023-12-20', 1, '2023-09-12 18:00:00', NULL, NULL),
(16, 10, '2023-12-25', 1, '2023-09-11 08:30:00', NULL, NULL),
(17, 31, '2023-12-30', 1, '2023-09-10 10:45:00', NULL, NULL),
(18, 12, '2024-01-05', 1, '2023-09-09 12:00:00', NULL, NULL),
(19, 17, '2024-01-10', 1, '2023-09-08 14:15:00', NULL, NULL),
(20, 23, '2024-01-15', 1, '2023-09-07 16:30:00', NULL, NULL),
(21, 14, '2024-01-20', 1, '2023-09-06 18:45:00', NULL, NULL),
(22, 41, '2024-01-25', 1, '2023-09-05 09:15:00', NULL, NULL),
(23, 30, '2024-01-30', 1, '2023-09-04 11:30:00', NULL, NULL),
(24, 35, '2024-02-05', 1, '2023-09-03 13:45:00', NULL, NULL),
(25, 5, '2024-02-10', 1, '2023-09-02 15:00:00', NULL, NULL),
(26, 21, '2024-02-15', 1, '2023-09-01 08:15:00', NULL, NULL),
(27, 8, '2024-02-20', 1, '2023-08-31 10:30:00', NULL, NULL),
(28, 24, '2024-02-25', 1, '2023-08-30 13:45:00', NULL, NULL),
(29, 26, '2024-03-01', 1, '2023-08-29 15:00:00', NULL, NULL),
(30, 20, '2024-03-05', 1, '2023-08-28 17:15:00', NULL, NULL),
(31, 16, '2024-03-10', 1, '2023-08-27 19:30:00', NULL, NULL),
(32, 39, '2024-03-15', 1, '2023-08-26 22:00:00', NULL, NULL),
(33, 33, '2024-03-20', 1, '2023-08-25 08:15:00', NULL, NULL),
(34, 25, '2024-03-25', 1, '2023-08-24 10:30:00', NULL, NULL),
(35, 38, '2024-03-30', 1, '2023-08-23 12:45:00', NULL, NULL),
(36, 36, '2024-04-04', 1, '2023-08-22 15:00:00', NULL, NULL),
(37, 34, '2024-04-09', 1, '2023-08-21 17:15:00', NULL, NULL),
(38, 52, '2024-04-14', 1, '2023-08-20 19:30:00', NULL, NULL),
(39, 47, '2024-04-19', 1, '2023-08-19 21:45:00', NULL, NULL),
(40, 51, '2024-04-24', 1, '2023-08-18 08:00:00', NULL, NULL),
(41, 46, '2024-04-29', 1, '2023-08-17 10:15:00', NULL, NULL),
(42, 48, '2024-05-04', 1, '2023-08-16 12:30:00', NULL, NULL),
(43, 49, '2024-05-09', 1, '2023-08-15 14:45:00', NULL, NULL),
(44, 50, '2024-05-14', 1, '2023-08-14 17:00:00', NULL, NULL),
(45, 53, '2024-05-19', 1, '2023-08-13 19:15:00', NULL, NULL),
(46, 54, '2024-05-24', 1, '2023-08-12 21:30:00', NULL, NULL),
(47, 13, '2024-05-29', 1, '2023-08-11 08:45:00', NULL, NULL),
(48, 28, '2024-06-03', 1, '2023-08-10 11:00:00', NULL, NULL),
(49, 18, '2024-06-08', 1, '2023-08-09 13:15:00', NULL, NULL),
(50, 42, '2024-06-13', 1, '2023-08-08 15:30:00', NULL, NULL),
(51, 29, '2024-06-18', 1, '2023-08-07 17:45:00', NULL, NULL),
(52, 43, '2024-06-23', 1, '2023-08-06 20:00:00', NULL, NULL),
(53, 51, '2024-06-28', 1, '2023-08-05 08:15:00', NULL, NULL),
(54, 45, '2024-07-03', 1, '2023-08-04 10:30:00', NULL, NULL),
(55, 23, '2024-07-08', 1, '2023-08-03 12:45:00', NULL, NULL),
(56, 31, '2024-07-13', 1, '2023-08-02 15:00:00', NULL, NULL),
(57, 40, '2024-07-18', 1, '2023-08-01 08:15:00', NULL, NULL),
(58, 30, '2024-07-23', 1, '2023-07-31 10:30:00', NULL, NULL),
(59, 41, '2024-07-28', 1, '2023-07-30 13:45:00', NULL, NULL),
(60, 22, '2024-08-02', 1, '2023-07-29 16:00:00', NULL, NULL),
(61, 37, '2024-08-07', 1, '2023-07-28 18:15:00', NULL, NULL),
(62, 21, '2024-08-12', 1, '2023-07-27 20:30:00', NULL, NULL),
(63, 11, '2024-08-17', 1, '2023-07-26 22:45:00', NULL, NULL),
(64, 12, '2024-08-22', 1, '2023-07-25 09:00:00', NULL, NULL),
(65, 26, '2024-08-27', 1, '2023-07-24 11:15:00', NULL, NULL),
(66, 38, '2024-09-01', 1, '2023-07-23 13:30:00', NULL, NULL),
(67, 43, '2024-09-06', 1, '2023-07-22 15:45:00', NULL, NULL),
(68, 45, '2024-09-11', 1, '2023-07-21 18:00:00', NULL, NULL),
(69, 14, '2024-09-16', 1, '2023-07-20 20:15:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_medicamento`
--

CREATE TABLE `receta_medicamento` (
  `id` int(11) NOT NULL,
  `medicamento` int(11) NOT NULL,
  `receta` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta_medicamento`
--

INSERT INTO `receta_medicamento` (`id`, `medicamento`, `receta`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, '2023-11-28 21:45:55', NULL, NULL),
(2, 14, 2, '2023-11-28 21:45:55', NULL, NULL),
(3, 27, 3, '2023-11-28 21:45:55', NULL, NULL),
(4, 7, 4, '2023-11-28 21:45:55', NULL, NULL),
(5, 32, 5, '2023-11-28 21:45:55', NULL, NULL),
(6, 6, 6, '2023-11-28 21:45:55', NULL, NULL),
(7, 12, 7, '2023-11-28 21:45:55', NULL, NULL),
(8, 22, 8, '2023-11-28 21:45:55', NULL, NULL),
(9, 3, 9, '2023-11-28 21:45:55', NULL, NULL),
(10, 25, 10, '2023-11-28 21:45:55', NULL, NULL),
(11, 2, 11, '2023-11-28 21:45:55', NULL, NULL),
(12, 7, 12, '2023-11-28 21:45:55', NULL, NULL),
(13, 8, 13, '2023-11-28 21:45:55', NULL, NULL),
(14, 36, 14, '2023-11-28 21:45:55', NULL, NULL),
(15, 41, 15, '2023-11-28 21:45:55', NULL, NULL),
(16, 10, 16, '2023-11-28 21:45:55', NULL, NULL),
(17, 31, 17, '2023-11-28 21:45:55', NULL, NULL),
(18, 12, 18, '2023-11-28 21:45:55', NULL, NULL),
(19, 17, 19, '2023-11-28 21:45:55', NULL, NULL),
(20, 23, 20, '2023-11-28 21:45:55', NULL, NULL),
(21, 14, 21, '2023-11-28 21:45:55', NULL, NULL),
(22, 44, 22, '2023-11-28 21:45:55', NULL, NULL),
(23, 30, 23, '2023-11-28 21:45:55', NULL, NULL),
(24, 35, 24, '2023-11-28 21:45:55', NULL, NULL),
(25, 5, 25, '2023-11-28 21:45:55', NULL, NULL),
(26, 21, 26, '2023-11-28 21:45:55', NULL, NULL),
(27, 8, 27, '2023-11-28 21:45:55', NULL, NULL),
(28, 24, 28, '2023-11-28 21:45:55', NULL, NULL),
(29, 26, 29, '2023-11-28 21:45:55', NULL, NULL),
(30, 20, 30, '2023-11-28 21:45:55', NULL, NULL),
(31, 16, 31, '2023-11-28 21:45:55', NULL, NULL),
(32, 39, 32, '2023-11-28 21:45:55', NULL, NULL),
(33, 33, 33, '2023-11-28 21:45:55', NULL, NULL),
(34, 25, 34, '2023-11-28 21:45:55', NULL, NULL),
(35, 38, 35, '2023-11-28 21:45:55', NULL, NULL),
(36, 36, 36, '2023-11-28 21:45:55', NULL, NULL),
(37, 34, 37, '2023-11-28 21:45:55', NULL, NULL),
(38, 12, 38, '2023-11-28 21:45:55', NULL, NULL),
(39, 47, 39, '2023-11-28 21:45:55', NULL, NULL),
(40, 21, 40, '2023-11-28 21:45:55', NULL, NULL),
(41, 46, 41, '2023-11-28 21:45:55', NULL, NULL),
(42, 48, 42, '2023-11-28 21:45:55', NULL, NULL),
(43, 39, 43, '2023-11-28 21:45:55', NULL, NULL),
(44, 40, 44, '2023-11-28 21:45:55', NULL, NULL),
(45, 3, 45, '2023-11-28 21:45:55', NULL, NULL),
(46, 14, 46, '2023-11-28 21:45:55', NULL, NULL),
(47, 13, 47, '2023-11-28 21:45:55', NULL, NULL),
(48, 28, 48, '2023-11-28 21:45:55', NULL, NULL),
(49, 18, 29, '2023-11-28 21:45:55', NULL, NULL),
(50, 42, 10, '2023-11-28 21:45:55', NULL, NULL),
(51, 29, 1, '2023-11-28 21:45:55', NULL, NULL),
(52, 43, 42, '2023-11-28 21:45:55', NULL, NULL),
(53, 35, 33, '2023-11-28 21:45:55', NULL, NULL),
(54, 24, 5, '2023-11-28 21:45:55', NULL, NULL),
(55, 7, 31, '2023-11-28 21:45:55', NULL, NULL),
(56, 16, 15, '2023-11-28 21:45:55', NULL, NULL),
(57, 35, 22, '2023-11-28 21:45:55', NULL, NULL),
(58, 10, 3, '2023-11-28 21:45:55', NULL, NULL),
(59, 46, 19, '2023-11-28 21:45:55', NULL, NULL),
(60, 18, 47, '2023-11-28 21:45:55', NULL, NULL),
(61, 33, 40, '2023-11-28 21:45:55', NULL, NULL),
(62, 9, 12, '2023-11-28 21:45:55', NULL, NULL),
(63, 41, 27, '2023-11-28 21:45:55', NULL, NULL),
(64, 2, 11, '2023-11-28 21:45:55', NULL, NULL),
(65, 30, 39, '2023-11-28 21:45:55', NULL, NULL),
(66, 29, 34, '2023-11-28 21:45:55', NULL, NULL),
(67, 20, 45, '2023-11-28 21:45:55', NULL, NULL),
(68, 37, 47, '2023-11-28 21:45:55', NULL, NULL),
(69, 21, 4, '2023-11-28 21:45:55', NULL, NULL),
(70, 43, 32, '2023-11-28 21:45:55', NULL, NULL),
(71, 36, 22, '2023-11-28 21:45:55', NULL, NULL),
(72, 34, 13, '2023-11-28 21:45:55', NULL, NULL),
(73, 12, 48, '2023-11-28 21:45:55', NULL, NULL),
(74, 47, 16, '2023-11-28 21:45:55', NULL, NULL),
(75, 21, 25, '2023-11-28 21:45:55', NULL, NULL),
(76, 46, 13, '2023-11-28 21:45:55', NULL, NULL),
(77, 48, 38, '2023-11-28 21:45:55', NULL, NULL),
(78, 39, 48, '2023-11-28 21:45:55', NULL, NULL),
(79, 40, 6, '2023-11-28 21:45:55', NULL, NULL),
(80, 23, 42, '2023-11-28 21:45:55', NULL, NULL),
(81, 14, 7, '2023-11-28 21:45:55', NULL, NULL),
(82, 13, 21, '2023-11-28 21:45:55', NULL, NULL),
(83, 28, 36, '2023-11-28 21:45:55', NULL, NULL),
(84, 38, 1, '2023-11-28 21:45:55', NULL, NULL),
(85, 43, 44, '2023-11-28 21:45:55', NULL, NULL),
(86, 45, 29, '2023-11-28 21:45:55', NULL, NULL),
(87, 14, 9, '2023-11-28 21:45:55', NULL, NULL),
(88, 23, 30, '2023-11-28 21:45:55', NULL, NULL),
(89, 31, 2, '2023-11-28 21:45:55', NULL, NULL),
(90, 40, 24, '2023-11-28 21:45:55', NULL, NULL),
(91, 30, 8, '2023-11-28 21:45:55', NULL, NULL),
(92, 41, 26, '2023-11-28 21:45:55', NULL, NULL),
(93, 22, 33, '2023-11-28 21:45:55', NULL, NULL),
(94, 37, 20, '2023-11-28 21:45:55', NULL, NULL),
(95, 21, 35, '2023-11-28 21:45:55', NULL, NULL),
(96, 11, 17, '2023-11-28 21:45:55', NULL, NULL),
(97, 12, 18, '2023-11-28 21:45:55', NULL, NULL),
(98, 26, 28, '2023-11-28 21:45:55', NULL, NULL),
(99, 38, 23, '2023-11-28 21:45:55', NULL, NULL),
(100, 43, 37, '2023-11-28 21:45:55', NULL, NULL),
(101, 45, 10, '2023-11-28 21:45:55', NULL, NULL),
(102, 14, 14, '2023-11-28 21:45:55', NULL, NULL),
(103, 34, 43, '2023-11-28 21:45:55', NULL, NULL),
(104, 44, 21, '2023-11-28 21:45:55', NULL, NULL),
(105, 45, 41, '2023-11-28 21:45:55', NULL, NULL),
(106, 48, 46, '2023-11-28 21:45:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `primerNombre` varchar(50) NOT NULL,
  `segundoNombre` varchar(50) DEFAULT '',
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `userinfo`
--

INSERT INTO `userinfo` (`id`, `primerNombre`, `segundoNombre`, `apellidoPaterno`, `apellidoMaterno`, `genero`, `telefono`, `foto`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Juan', 'Manuel', 'Pérez', 'González', 'M', '123-456-7890', 'https://i.pinimg.com/originals/ce/63/47/ce63475562f960ede351c2533415adc5.jpg', 1, '2023-09-26 08:00:00', NULL, NULL),
(2, 'María', 'Isabel', 'López', 'Fernández', 'F', '987-654-3210', 'https://previews.123rf.com/images/lenetssergey/lenetssergey1704/lenetssergey170401393/76635167-mujer-doctor-actuaci%C3%B3n-radiograf%C3%ADa-hospital.jpg', 1, '2023-09-25 10:15:00', NULL, NULL),
(3, 'Carlos', NULL, 'García', 'Martínez', 'M', '555-123-7890', 'https://static.vecteezy.com/system/resources/previews/001/131/187/non_2x/serious-man-portrait-real-people-high-definition-grey-background-photo.jpg', 1, '2023-09-24 12:30:00', NULL, NULL),
(4, 'Ana', 'Sofía', 'Ramírez', 'Lara', 'F', '777-888-9999', 'https://previews.123rf.com/images/olegdudko/olegdudko1507/olegdudko150715867/42714296-doctor-mujer-m%C3%A9dico.jpg', 1, '2023-09-23 09:45:00', NULL, NULL),
(5, 'Luis', 'Fernando', 'Gómez', 'Sánchez', 'M', '111-222-3333', 'https://previews.123rf.com/images/shotsstudio/shotsstudio1505/shotsstudio150500055/40062787-vista-frontal-del-hombre-cauc%C3%A1sico-retratos-de-personas-reales.jpg', 1, '2023-09-22 14:15:00', NULL, NULL),
(6, 'Laura', NULL, 'Vargas', 'Díaz', 'F', '444-555-6666', 'https://st.depositphotos.com/1987395/2595/i/950/depositphotos_25957013-stock-photo-smiling-medical-woman-doctor-isolated.jpg', 1, '2023-09-21 16:30:00', NULL, NULL),
(7, 'Pedro', 'José', 'Hernández', 'Pérez', 'M', '888-777-6666', 'https://i.pinimg.com/564x/cb/0e/77/cb0e7778244dfb2f484e53bab2c8e98b.jpg', 1, '2023-09-20 08:45:00', NULL, NULL),
(8, 'Mónica', 'María', 'Dominguez', 'Gómez', 'F', '333-111-5555', 'https://previews.123rf.com/images/kiraliffe/kiraliffe1706/kiraliffe170600327/79345802-belleza-personas-mujer-cara-retrato-hermosa-modelo-de-spa-para-ni%C3%B1a-con-una-piel-limpia-fresca.jpg', 1, '2023-09-19 11:00:00', NULL, NULL),
(9, 'Manuel', NULL, 'Torres', 'Mendoza', 'M', '999-444-2222', 'https://png.pngtree.com/png-clipart/20230926/ourlarge/pngtree-male-physician-doctor-png-image_10167965.png', 1, '2023-09-18 13:15:00', NULL, NULL),
(10, 'Gabriela', 'Isabel', 'Silva', 'Martínez', 'F', '777-666-8888', 'https://i.pinimg.com/236x/be/20/cc/be20ccc1456eb061abbf5a77d84fb8b7.jpg', 1, '2023-09-17 15:30:00', NULL, NULL),
(11, 'Rodrigo', NULL, 'Castro', 'López', 'M', '222-333-4444', 'https://st4.depositphotos.com/1325771/39150/i/450/depositphotos_391507238-stock-photo-confident-smiling-doctor-posing-in.jpg', 1, '2023-09-16 09:00:00', NULL, NULL),
(12, 'Isabel', 'Sofía', 'Pacheco', 'Hernández', 'F', '666-777-5555', 'https://previews.123rf.com/images/tomwang/tomwang1608/tomwang160800042/61622621-sonriendo-mujeres-m%C3%A9dicos-que-trabajan-en-la-oficina.jpg', 1, '2023-09-15 11:15:00', NULL, NULL),
(13, 'Javier', NULL, 'Herrera', 'Gómez', 'M', '111-444-3333', 'https://previews.123rf.com/images/shotsstudio/shotsstudio1505/shotsstudio150500053/40062781-vista-frontal-del-hombre-cauc%C3%A1sico-con-la-expresi%C3%B3n-en-blanco-retratos-de-personas-reales.jpg', 1, '2023-09-14 13:30:00', NULL, NULL),
(14, 'Rosa', 'María', 'González', 'Molina', 'F', '555-666-7777', 'https://previews.123rf.com/images/shefkate/shefkate1601/shefkate160100034/50056361-dos-doctores-de-las-mujeres-j%C3%B3venes-sentados-en-el-sof%C3%A1.jpg', 1, '2023-09-13 15:45:00', NULL, NULL),
(15, 'Jorge', NULL, 'Chávez', 'Sánchez', 'M', '777-555-1111', 'https://media.revistagq.com/photos/5ca5fd6e3492a940f5bf1bf0/master/w_1600%2Cc_limit/doctor_mike_gq_5080.jpg', 1, '2023-09-12 18:00:00', NULL, NULL),
(16, 'Sandra', 'Isabel', 'Pérez', 'Gómez', 'F', '222-333-7777', 'https://previews.123rf.com/images/dolgachov/dolgachov1607/dolgachov160705397/60214976-concepto-de-mujer-g%C3%A9nero-retrato-y-personas-sonriente-cara-de-mujer-joven-sobre-fondo-de-sala.jpg', 1, '2023-09-11 08:30:00', NULL, NULL),
(17, 'Raúl', 'Fernando', 'Luna', 'Díaz', 'M', '666-111-4444', 'https://www.okchicas.com/wp-content/uploads/2017/02/julian-morris-habitue-au-monde-secret-de.jpg', 1, '2023-09-10 10:45:00', NULL, NULL),
(18, 'Patricia', 'María', 'Gómez', 'Santos', 'F', '111-777-2222', 'https://png.pngtree.com/png-clipart/20190813/ourlarge/pngtree-female-doctor-nurse-character-elements-png-image_1691855.jpg', 1, '2023-09-09 12:00:00', NULL, NULL),
(19, 'Mario', NULL, 'Mendoza', 'Hernández', 'M', '555-333-5555', 'https://cdn.pixabay.com/photo/2016/09/14/19/53/person-1670247_1280.jpg', 1, '2023-09-08 14:15:00', NULL, NULL),
(20, 'Renata', 'Isabel', 'Martínez', 'Silva', 'F', '777-222-4444', 'https://gallantdale.com/cdn/shop/products/BATA-MUSA-D-BLANCO_4f99c66a-9482-480a-89ac-83152dcfd6e9.webp?v=1679044088&width=533', 1, '2023-09-07 16:30:00', NULL, NULL),
(21, 'José', NULL, 'Gómez', 'Pérez', 'M', '222-111-6666', 'https://i.pinimg.com/736x/77/ee/19/77ee1972f2086149431014ae8cd44ebd.jpg', 1, '2023-09-06 18:45:00', NULL, NULL),
(22, 'Alejandra', 'Sofía', 'Santos', 'Díaz', 'F', '888-777-3333', 'https://www.expoknews.com/wp-content/uploads/2018/06/JocelynWong.jpg', 1, '2023-09-05 09:15:00', NULL, NULL),
(23, 'Fernando', NULL, 'Molina', 'Gómez', 'M', '333-666-1111', 'https://previews.123rf.com/images/antonioguillem/antonioguillem1412/antonioguillem141200065/34662099-hombre-doctor-serio-pescadilla-un-historial-m%C3%A9dico-aislado-en-un-fondo-blanco.jpg', 1, '2023-09-04 11:30:00', NULL, NULL),
(24, 'María', 'Isabel', 'Silva', 'Hernández', 'F', '111-444-2222', 'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg', 1, '2023-09-03 13:45:00', NULL, NULL),
(25, 'Carlos', NULL, 'Martínez', 'Pacheco', 'M', '666-333-5555', 'https://elpais.com/sociedad/imagenes/2019/10/11/pienso_luego_actuo/1570802566_019322_1570803969_noticia_fotograma.jpg', 1, '2023-09-02 15:00:00', NULL, NULL),
(26, 'Isabel', 'Sofía', 'Gómez', 'Torres', 'F', '222-555-7777', 'https://st4.depositphotos.com/12985790/24589/i/450/depositphotos_245890280-stock-photo-young-doctor-in-white-coat.jpg', 1, '2023-09-01 08:30:00', NULL, NULL),
(27, 'Luis', NULL, 'García', 'Mendoza', 'M', '777-111-4444', 'https://st2.depositphotos.com/4312171/6357/i/450/depositphotos_63570269-stock-photo-half-length-portraif-of-a.jpg', 1, '2023-08-31 10:45:00', NULL, NULL),
(28, 'Ana', NULL, 'López', 'Gómez', 'F', '555-777-2222', 'https://img.freepik.com/foto-gratis/mujer-joven-hermosa-sueter-rosa-calido-aspecto-natural-sonriente-retrato-aislado-cabello-largo_285396-896.jpg', 1, '2023-08-30 13:00:00', NULL, NULL),
(29, 'Manuel', 'Sofía', 'Díaz', 'Sánchez', 'M', '888-444-7777', 'https://cdn.pixabay.com/photo/2014/03/27/13/36/man-299488_1280.jpg', 1, '2023-08-29 15:15:00', NULL, NULL),
(30, 'Isabella', NULL, 'Gómez', 'Herrera', 'F', '333-777-3333', 'https://i.pinimg.com/originals/e7/e3/cf/e7e3cf4eaaaf860cb4635eb00b0b82c5.jpg', 1, '2023-08-28 17:30:00', NULL, NULL),
(31, 'Francisco', '', 'Pérez', 'Sarate', 'M', '123-456-7954', 'https://watermark.lovepik.com/photo/20211202/large/lovepik-male-doctor-smiling-picture_501442603.jpg', 1, '2023-09-26 08:00:00', NULL, NULL),
(32, 'María', 'Isabel', 'López', 'Martínez', 'F', '987-654-3210', 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2023/03/08/16782908970576.jpg', 1, '2023-09-26 08:15:00', NULL, NULL),
(33, 'Carlos', 'Alberto', 'Ramírez', 'Fernández', 'M', '555-123-4567', 'https://assets.afcdn.com/breves/acc2_286618/acc1257x1257a891210.jpg', 1, '2023-09-26 08:30:00', NULL, NULL),
(34, 'Ana', 'Gabriela', 'Gutiérrez', 'Sánchez', 'F', '111-222-3333', 'https://www.expoknews.com/wp-content/uploads/2018/06/HaniaPoole.jpg', 1, '2023-09-26 08:45:00', NULL, NULL),
(35, 'Javier', 'Alejandro', 'Castro', 'Hernández', 'M', '444-555-6666', 'https://i.pinimg.com/originals/59/65/ce/5965cea892fbcc3a8046c7f5c0e3071d.jpg', 1, '2023-09-26 09:00:00', NULL, NULL),
(36, 'Laura', 'Patricia', 'Díaz', 'Mendoza', 'F', '777-888-9999', 'https://www.abogadasmx.org.mx/wp-content/uploads/2020/07/unnamed-702x526.jpg', 1, '2023-09-26 09:15:00', NULL, NULL),
(37, 'Pedro', 'Luis', 'Ortega', 'Núñez', 'M', '666-777-8888', 'https://www.okchicas.com/wp-content/uploads/2017/10/hombres-guapos-paris-francia.jpg', 1, '2023-09-26 09:30:00', NULL, NULL),
(38, 'Rosa', 'Elena', 'García', 'Rodríguez', 'F', '222-333-4444', 'https://www.soycarmin.com/__export/1677340997548/sites/debate/img/2023/02/25/mujeres_solteras_y_sin_hijosx_las_personas_mxs_felicesx_segxn_estudio.png_423682103.png', 1, '2023-09-26 09:45:00', NULL, NULL),
(39, 'Miguel', 'Ángel', 'Vega', 'Santos', 'M', '999-888-7777', 'https://previews.123rf.com/images/ogovorka/ogovorka1803/ogovorka180300003/97546375-concepto-de-expresi%C3%B3n-y-personas-hombre-con-cara-graciosa-sobre-fondo-blanco.jpg', 1, '2023-09-26 10:00:00', NULL, NULL),
(40, 'Paola', 'Fernanda', 'Martínez', 'Gómez', 'F', '333-444-5555', 'https://cdn.pixabay.com/photo/2018/09/09/12/55/women-3664507_1280.jpg', 1, '2023-09-26 10:15:00', NULL, NULL),
(41, 'Ricardo', 'Antonio', 'Silva', 'Pérez', 'M', '888-999-0000', 'https://www.blogdelfotografo.com/wp-content/uploads/2020/02/posedepie1-scaled.webp', 1, '2023-09-26 10:30:00', NULL, NULL),
(42, 'Sofía', 'Valentina', 'Morales', 'Jiménez', 'F', '555-666-7777', 'https://www.gob.mx/cms/uploads/structure/main_image/3659/nad_2_Mesa_de_trabajo_1.jpg', 1, '2023-09-26 10:45:00', NULL, NULL),
(43, 'Fernando', 'Javier', 'Cabrera', 'Álvarez', 'M', '000-111-2222', 'https://static.vecteezy.com/system/resources/thumbnails/003/492/377/small/closeup-male-studio-portrait-of-happy-man-looking-at-the-camera-image-free-photo.jpg', 1, '2023-09-26 11:00:00', NULL, NULL),
(44, 'Julia', 'Beatriz', 'Herrera', 'Torres', 'F', '111-222-3333', 'https://i.pinimg.com/736x/c7/21/af/c721af131a0ae1ea080f365d8552c521.jpg', 1, '2023-09-26 11:15:00', NULL, NULL),
(45, 'Daniel', 'Enrique', 'Reyes', 'Soto', 'M', '222-333-4444', 'https://static.vecteezy.com/system/resources/thumbnails/026/408/660/small/hipster-man-lifestyle-fashion-portrait-background-caucasian-isolated-modern-standing-t-shirt-white-model-student-smile-photo.jpg', 1, '2023-09-26 11:30:00', NULL, NULL),
(46, 'Gabriela', 'Adriana', 'Hernández', 'Cruz', 'F', '333-444-5555', 'https://thumbs.dreamstime.com/b/mujer-afroamericana-que-habla-en-un-tel%C3%A9fono-m%C3%B3vil-personas-negras-50437860.jpg', 1, '2023-09-26 11:45:00', NULL, NULL),
(47, 'Juan', 'Carlo', 'Sotelo', 'Roman', 'M', '761-139-0216', 'https://images.pexels.com/photos/718261/pexels-photo-718261.jpeg?cs=srgb&dl=pexels-sumit-kapoor-718261.jpg&fm=jpg', 1, '2023-09-26 12:00:00', NULL, NULL),
(48, 'Benito', 'Saldivar', 'Cruz', 'Martinez', 'M', '954-139-0216', 'https://static.vecteezy.com/system/resources/previews/000/960/386/non_2x/funny-man-portrait-real-people-high-definition-blue-background-photo.jpg', 1, '2023-09-26 12:00:00', NULL, NULL),
(49, 'María', 'Angelica', 'Sanchez', 'Pérez', 'F', '231-987-0216', 'https://st4.depositphotos.com/12982378/30958/i/450/depositphotos_309582382-stock-photo-attractive-young-woman-in-white.jpg', 1, '2023-09-26 12:00:00', NULL, NULL),
(50, 'Ramona', '', 'Luz', 'Esperanza', 'F', '231-139-1457', 'https://www.soycarmin.com/__export/1680101929101/sites/debate/img/2023/03/29/qux_tatuajes_se_hacen_las_personas_felicesx_disexos_para_la_mujer_con_amor_propio.png_423682103.png', 1, '2023-09-26 12:00:00', NULL, NULL),
(51, 'Miguel', 'Angel', 'Cruz', 'Roman', 'M', '231-139-0216', 'https://s1.eestatic.com/2015/11/13/el-cultural/el_cultural_79002472_220513513_510x295.jpg', 1, '2023-09-26 12:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `username_nombre`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `username_nombre` (
`id` int(11)
,`Nombre` varchar(152)
,`username` varchar(50)
,`correo` varchar(100)
,`password` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `medico` int(11) DEFAULT NULL,
  `paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `correo`, `password`, `status`, `created_at`, `updated_at`, `deleted_at`, `medico`, `paciente`) VALUES
(1, 'Juan', 'usuario1@example.com', 'password1', 1, '2023-09-26 08:00:00', NULL, NULL, 1, NULL),
(2, 'María', 'usuario2@example.com', 'password2', 1, '2023-09-25 10:15:00', NULL, NULL, 2, NULL),
(3, 'Carlos', 'usuario3@example.com', 'password3', 0, '2023-09-24 12:30:00', NULL, NULL, NULL, 1),
(4, 'Ana', 'usuario4@example.com', 'password4', 1, '2023-09-23 09:45:00', NULL, NULL, 3, NULL),
(5, 'Luis', 'usuario5@example.com', 'password5', 0, '2023-09-22 14:15:00', NULL, NULL, NULL, 2),
(6, 'Laura', 'usuario6@example.com', 'password6', 1, '2023-09-21 16:30:00', NULL, NULL, 4, NULL),
(7, 'Pedro', 'usuario7@example.com', 'password7', 1, '2023-09-20 08:45:00', NULL, NULL, 5, NULL),
(8, 'Mónica', 'usuario8@example.com', 'password8', 0, '2023-09-19 11:00:00', NULL, NULL, NULL, 3),
(9, 'Manuel', 'usuario9@example.com', 'password9', 1, '2023-09-18 13:15:00', NULL, NULL, 6, NULL),
(10, 'Gabriela', 'usuario10@example.com', 'password10', 1, '2023-09-17 15:30:00', NULL, NULL, NULL, 4),
(11, 'Rodrigo', 'usuario11@example.com', 'password11', 0, '2023-09-16 09:00:00', NULL, NULL, 7, NULL),
(12, 'Isabel', 'usuario12@example.com', 'password12', 1, '2023-09-15 11:15:00', NULL, NULL, 8, NULL),
(13, 'Javier', 'usuario13@example.com', 'password13', 1, '2023-09-14 13:30:00', NULL, NULL, NULL, 5),
(14, 'Rosa', 'usuario14@example.com', 'password14', 0, '2023-09-13 15:45:00', NULL, NULL, 9, NULL),
(15, 'Jorge', 'usuario15@example.com', 'password15', 1, '2023-09-12 18:00:00', NULL, NULL, 10, NULL),
(16, 'Sandra', 'usuario16@example.com', 'password16', 1, '2023-09-11 08:30:00', NULL, NULL, NULL, 6),
(17, 'Raúl', 'usuario17@example.com', 'password17', 0, '2023-09-10 10:45:00', NULL, NULL, 11, NULL),
(18, 'Patricia', 'usuario18@example.com', 'password18', 1, '2023-09-09 12:00:00', NULL, NULL, 12, NULL),
(19, 'Mario', 'usuario19@example.com', 'password19', 1, '2023-09-08 14:15:00', NULL, NULL, NULL, 7),
(20, 'Renata', 'usuario20@example.com', 'password20', 0, '2023-09-07 16:30:00', NULL, NULL, 13, NULL),
(21, 'José', 'usuario21@example.com', 'password21', 1, '2023-09-06 18:45:00', NULL, NULL, 14, NULL),
(22, 'Alejandra', 'usuario22@example.com', 'password22', 1, '2023-09-05 09:15:00', NULL, NULL, NULL, 8),
(23, 'Fernando', 'usuario23@example.com', 'password23', 0, '2023-09-04 11:30:00', NULL, NULL, 15, NULL),
(24, 'María', 'usuario24@example.com', 'password24', 1, '2023-09-03 13:45:00', NULL, NULL, 16, NULL),
(25, 'Carlos', 'usuario25@example.com', 'password25', 1, '2023-09-02 15:00:00', NULL, NULL, NULL, 9),
(26, 'Isabel', 'usuario26@example.com', 'password26', 0, '2023-09-01 08:30:00', NULL, NULL, 17, NULL),
(27, 'Luis', 'usuario27@example.com', 'password27', 1, '2023-08-31 10:45:00', NULL, NULL, 18, NULL),
(28, 'Ana', 'usuario28@example.com', 'password28', 1, '2023-08-30 13:00:00', NULL, NULL, NULL, 10),
(29, 'Manuel', 'usuario29@example.com', 'password29', 0, '2023-08-29 15:15:00', NULL, NULL, NULL, 13),
(30, 'Isabella', 'usuario29@example.com', 'password29', 0, '2023-08-29 15:15:00', NULL, NULL, 19, NULL),
(31, 'Francisco', 'usuario30@example.com', 'password30', 1, '2023-08-28 17:30:00', NULL, NULL, 20, NULL),
(32, 'María', 'usuario30@example.com', 'password30', 1, '2023-08-28 17:30:00', NULL, NULL, NULL, 14),
(33, 'Carlos', 'usuario23@example.com', 'password23', 0, '2023-09-04 11:30:00', NULL, NULL, NULL, 11),
(34, 'Ana', 'usuario24@example.com', 'password24', 1, '2023-09-03 13:45:00', NULL, NULL, NULL, 12),
(35, 'Javier', 'usuario31@example.com', 'password31', 1, '2023-09-26 08:00:00', NULL, NULL, NULL, 15),
(36, 'Laura', 'usuario32@example.com', 'password32', 1, '2023-09-26 08:15:00', NULL, NULL, NULL, 16),
(37, 'Pedro', 'usuario33@example.com', 'password33', 1, '2023-09-26 08:30:00', NULL, NULL, NULL, 17),
(38, 'Rosa', 'usuario34@example.com', 'password34', 1, '2023-09-26 08:45:00', NULL, NULL, NULL, 18),
(39, 'Miguel', 'usuario35@example.com', 'password35', 1, '2023-09-26 09:00:00', NULL, NULL, NULL, 19),
(40, 'Paola', 'usuario36@example.com', 'password36', 1, '2023-09-26 09:15:00', NULL, NULL, NULL, 20),
(41, 'Ricardo', 'usuario37@example.com', 'password37', 1, '2023-09-26 09:30:00', NULL, NULL, NULL, 21),
(42, 'Sofía', 'usuario38@example.com', 'password38', 1, '2023-09-26 09:45:00', NULL, NULL, NULL, 22),
(43, 'Fernando', 'usuario39@example.com', 'password39', 1, '2023-09-26 10:00:00', NULL, NULL, NULL, 23),
(44, 'Julia', 'usuario40@example.com', 'password40', 1, '2023-09-26 10:15:00', NULL, NULL, NULL, 24),
(45, 'Daniel', 'usuario41@example.com', 'password41', 1, '2023-09-26 10:30:00', NULL, NULL, NULL, 25),
(46, 'Gabriela', 'usuario42@example.com', 'password42', 1, '2023-09-26 10:45:00', NULL, NULL, NULL, 26),
(47, 'Juan', 'usuario43@example.com', 'password43', 1, '2023-09-26 11:00:00', NULL, NULL, NULL, 27),
(48, 'Benito', 'usuario44@example.com', 'password44', 1, '2023-09-26 11:15:00', NULL, NULL, NULL, 28),
(49, 'María', 'usuario45@example.com', 'password45', 1, '2023-09-26 11:30:00', NULL, NULL, NULL, 29),
(50, 'Ramona', 'usuario46@example.com', 'password46', 1, '2023-09-26 11:45:00', NULL, NULL, NULL, 30),
(51, 'Miguel', 'admin@admin.com', 'root', 1, '2023-09-26 08:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_consultas_clinica`
--
DROP TABLE IF EXISTS `medicamentos_consultas_clinica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `medicamentos_consultas_clinica`  AS SELECT `c`.`id` AS `Id de consulta`, `c`.`lugar` AS `Lugar de consulta`, `rm`.`receta` AS `Id de receta`, group_concat(`me`.`nombreComercial`,'(',`me`.`dosis`,' mg)' separator ',') AS `Medicamentos de la receta` FROM (((`receta_medicamento` `rm` join `medicamentos` `me` on(`rm`.`medicamento` = `me`.`id`)) join `receta` `r` on(`rm`.`receta` = `r`.`id`)) join `consultas` `c` on(`r`.`consulta` = `c`.`id`)) WHERE `c`.`lugar` like 'Clinica %' AND `me`.`version` like 'Niños' GROUP BY `rm`.`receta` ORDER BY `c`.`id` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicosdelpaciente_especialidad`
--
DROP TABLE IF EXISTS `medicosdelpaciente_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `medicosdelpaciente_especialidad`  AS SELECT `mp`.`paciente` AS `id del paciente`, concat(`uip`.`primerNombre`,' ',`uip`.`apellidoPaterno`,' ',`uip`.`apellidoMaterno`) AS `Nombre del Paciente`, group_concat(`mp`.`medico` separator ',') AS `id del médico`, group_concat(`uim`.`primerNombre`,' ',`uim`.`apellidoPaterno`,' ',`uim`.`apellidoMaterno`,' (',`m`.`especialidad`,')' separator ',') AS `Nombre y especilidad del médico que lo atiende` FROM ((((((`medico_paciente` `mp` join `paciente` `p` on(`mp`.`paciente` = `p`.`id`)) join `medico` `m` on(`mp`.`medico` = `m`.`id`)) join `users` `up` on(`p`.`id` = `up`.`paciente`)) join `users` `um` on(`m`.`id` = `um`.`medico`)) join `userinfo` `uip` on(`up`.`id` = `uip`.`id`)) join `userinfo` `uim` on(`um`.`id` = `uim`.`id`)) GROUP BY `mp`.`paciente``paciente`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_pacientesalcoholicos`
--
DROP TABLE IF EXISTS `medicos_pacientesalcoholicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `medicos_pacientesalcoholicos`  AS SELECT `mp`.`paciente` AS `id del paciente`, concat(`ui`.`primerNombre`,' ',`ui`.`apellidoPaterno`,' ',`ui`.`apellidoMaterno`) AS `Nombre del Paciente`, `p`.`habitoToxico` AS `Hábito`, group_concat(`mp`.`medico` separator ',') AS `id del médico que lo atiende` FROM (((`medico_paciente` `mp` join `paciente` `p` on(`mp`.`paciente` = `p`.`id`)) join `users` `u` on(`p`.`id` = `u`.`paciente`)) join `userinfo` `ui` on(`u`.`id` = `ui`.`id`)) WHERE `p`.`habitoToxico` like 'Alcohol' GROUP BY `mp`.`paciente``paciente`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_pacientesfumadores`
--
DROP TABLE IF EXISTS `medicos_pacientesfumadores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `medicos_pacientesfumadores`  AS SELECT `mp`.`paciente` AS `id del paciente`, concat(`ui`.`primerNombre`,' ',`ui`.`apellidoPaterno`,' ',`ui`.`apellidoMaterno`) AS `Nombre del Paciente`, `p`.`habitoToxico` AS `Hábito`, group_concat(`mp`.`medico` separator ',') AS `id del médico que lo atiende` FROM (((`medico_paciente` `mp` join `paciente` `p` on(`mp`.`paciente` = `p`.`id`)) join `users` `u` on(`p`.`id` = `u`.`paciente`)) join `userinfo` `ui` on(`u`.`id` = `ui`.`id`)) WHERE `p`.`habitoToxico` like 'Fumador' GROUP BY `mp`.`paciente``paciente`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_puebla`
--
DROP TABLE IF EXISTS `medicos_puebla`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `medicos_puebla`  AS SELECT concat(`ui`.`primerNombre`,' ',`ui`.`segundoNombre`,' ',`ui`.`apellidoPaterno`,' ',`ui`.`apellidoMaterno`) AS `Nombre del Médico`, `d`.`tipo` AS `Tipo de dirección`, concat(`d`.`estado`,',',`d`.`municipio`) AS `Estado y municipio` FROM ((`users` `u` join `userinfo` `ui` on(`u`.`id` = `ui`.`id`)) join `direccion` `d` on(`ui`.`id` = `d`.`id`)) WHERE `u`.`medico` is not null AND `ui`.`segundoNombre` is not null AND `d`.`tipo` like 'Casa' AND `d`.`estado` like 'Puebla''Puebla'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `npacientes_medicof`
--
DROP TABLE IF EXISTS `npacientes_medicof`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `npacientes_medicof`  AS SELECT `mp`.`medico` AS `id del médico`, concat(`ui`.`primerNombre`,' ',`ui`.`apellidoPaterno`,' ',`ui`.`apellidoMaterno`) AS `Nombre del Médico`, `ui`.`genero` AS `Género del médico`, count(`mp`.`paciente`) AS `Número de pacientes que atiende` FROM (((`medico_paciente` `mp` join `medico` `m` on(`mp`.`medico` = `m`.`id`)) join `users` `u` on(`m`.`id` = `u`.`medico`)) join `userinfo` `ui` on(`u`.`id` = `ui`.`id`)) WHERE `ui`.`genero` like 'F' GROUP BY `mp`.`medico``medico`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `npacientes_medicom`
--
DROP TABLE IF EXISTS `npacientes_medicom`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `npacientes_medicom`  AS SELECT `mp`.`medico` AS `id del médico`, concat(`ui`.`primerNombre`,' ',`ui`.`apellidoPaterno`,' ',`ui`.`apellidoMaterno`) AS `Nombre del Médico`, `ui`.`genero` AS `Género del médico`, count(`mp`.`paciente`) AS `Número de pacientes que atiende` FROM (((`medico_paciente` `mp` join `medico` `m` on(`mp`.`medico` = `m`.`id`)) join `users` `u` on(`m`.`id` = `u`.`medico`)) join `userinfo` `ui` on(`u`.`id` = `ui`.`id`)) WHERE `ui`.`genero` like 'M' GROUP BY `mp`.`medico``medico`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `username_nombre`
--
DROP TABLE IF EXISTS `username_nombre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Miguel`@`%` SQL SECURITY DEFINER VIEW `username_nombre`  AS SELECT `ui`.`id` AS `id`, concat(`ui`.`primerNombre`,' ',`ui`.`apellidoPaterno`,' ',`ui`.`apellidoMaterno`) AS `Nombre`, `u`.`username` AS `username`, `u`.`correo` AS `correo`, `u`.`password` AS `password` FROM (`userinfo` `ui` join `users` `u` on(`ui`.`id` = `u`.`id`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medico_paciente` (`medico_paciente`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_userinfo` (`userinfo`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medico_paciente`
--
ALTER TABLE `medico_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medicoConculta` (`medico`),
  ADD KEY `id_pacienteConsulta` (`paciente`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_consulta` (`consulta`);

--
-- Indices de la tabla `receta_medicamento`
--
ALTER TABLE `receta_medicamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medicamento` (`medicamento`),
  ADD KEY `id_receta` (`receta`);

--
-- Indices de la tabla `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medico` (`medico`),
  ADD KEY `id_paciente` (`paciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `medico_paciente`
--
ALTER TABLE `medico_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `receta_medicamento`
--
ALTER TABLE `receta_medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `id_medico_paciente` FOREIGN KEY (`medico_paciente`) REFERENCES `medico_paciente` (`id`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `id_userinfo` FOREIGN KEY (`userinfo`) REFERENCES `userinfo` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `medico_paciente`
--
ALTER TABLE `medico_paciente`
  ADD CONSTRAINT `id_medicoConculta` FOREIGN KEY (`medico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `id_pacienteConsulta` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`id`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `id_consulta` FOREIGN KEY (`consulta`) REFERENCES `consultas` (`id`);

--
-- Filtros para la tabla `receta_medicamento`
--
ALTER TABLE `receta_medicamento`
  ADD CONSTRAINT `id_medicamento` FOREIGN KEY (`medicamento`) REFERENCES `medicamentos` (`id`),
  ADD CONSTRAINT `id_receta` FOREIGN KEY (`receta`) REFERENCES `receta` (`id`);

--
-- Filtros para la tabla `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `id_users` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `id_medico` FOREIGN KEY (`medico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `id_paciente` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
