-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2025 a las 03:22:03
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen_sigi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_formativo`
--

CREATE TABLE `modulo_formativo` (
  `id` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `nro_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_estudio`
--

CREATE TABLE `planes_estudio` (
  `id` int(11) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `resolucion` varchar(100) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `perfil_egresado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_estudios`
--

CREATE TABLE `programa_estudios` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_didacticas`
--

CREATE TABLE `unidades_didacticas` (
  `id` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `creditos_teorico` int(11) NOT NULL,
  `creditos_practico` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `horas_semanales` int(11) NOT NULL,
  `horas_semestrales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `modulo_formativo`
--
ALTER TABLE `modulo_formativo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indices de la tabla `planes_estudio`
--
ALTER TABLE `planes_estudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `programa_estudios`
--
ALTER TABLE `programa_estudios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidades_didacticas`
--
ALTER TABLE `unidades_didacticas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periodo` (`id_periodo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `modulo_formativo`
--
ALTER TABLE `modulo_formativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planes_estudio`
--
ALTER TABLE `planes_estudio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programa_estudios`
--
ALTER TABLE `programa_estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades_didacticas`
--
ALTER TABLE `unidades_didacticas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modulo_formativo`
--
ALTER TABLE `modulo_formativo`
  ADD CONSTRAINT `modulo_formativo_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `planes_estudio` (`id`);

--
-- Filtros para la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD CONSTRAINT `periodos_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo_formativo` (`id`);

--
-- Filtros para la tabla `planes_estudio`
--
ALTER TABLE `planes_estudio`
  ADD CONSTRAINT `planes_estudio_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa_estudios` (`id`);

--
-- Filtros para la tabla `unidades_didacticas`
--
ALTER TABLE `unidades_didacticas`
  ADD CONSTRAINT `unidades_didacticas_ibfk_1` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
