-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2023 a las 05:14:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dt_eet33`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `dni_de_alumno` int(11) NOT NULL,
  `nombre completo` varchar(30) NOT NULL,
  `id_curso` int(10) NOT NULL,
  `fecha de nacimiento` date NOT NULL,
  `lista de asistencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(30) NOT NULL,
  `alumnos` varchar(50) NOT NULL,
  `division` int(30) NOT NULL,
  `dni_preceptor` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista de asistencia`
--

CREATE TABLE `lista de asistencia` (
  `alumnos` int(11) NOT NULL,
  `codigo de curso` int(11) NOT NULL,
  `profesores` int(11) NOT NULL,
  `fecha_y_hora` date NOT NULL,
  `codigo materia` int(11) NOT NULL,
  `preceptor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preceptor`
--

CREATE TABLE `preceptor` (
  `dni preceptor` int(11) NOT NULL,
  `nombre completo` varchar(50) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `fecha de nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`dni_de_alumno`,`nombre completo`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `division` (`division`);

--
-- Indices de la tabla `lista de asistencia`
--
ALTER TABLE `lista de asistencia`
  ADD PRIMARY KEY (`codigo de curso`,`fecha_y_hora`,`codigo materia`);

--
-- Indices de la tabla `preceptor`
--
ALTER TABLE `preceptor`
  ADD PRIMARY KEY (`dni preceptor`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `asistio` FOREIGN KEY (`dni_de_alumno`) REFERENCES `lista de asistencia` (`codigo de curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `preceptor` (`dni preceptor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`division`) REFERENCES `alumno` (`dni_de_alumno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preceptor`
--
ALTER TABLE `preceptor`
  ADD CONSTRAINT `tiene` FOREIGN KEY (`dni preceptor`) REFERENCES `alumno` (`dni_de_alumno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
