-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2025 a las 03:00:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `australnetworks`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `curso_id` int(11) NOT NULL,
  `nombre_curso` varchar(100) NOT NULL,
  `orientacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`curso_id`, `nombre_curso`, `orientacion`) VALUES
(21, '6to 1ra', 'Tecnica'),
(22, '6to 2da', 'Tecnica'),
(23, '6to 3ra', 'Tecnica'),
(24, '6to 4ta', 'Tecnica'),
(25, '7mo 1ra', 'Tecnica'),
(26, '7mo 2da', 'Tecnica'),
(27, '7mo 3ra', 'Tecnica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_materia`
--

CREATE TABLE `curso_materia` (
  `curso_materia_id` int(11) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso_materia`
--

INSERT INTO `curso_materia` (`curso_materia_id`, `curso_id`, `materia_id`) VALUES
(1, 21, 1),
(2, 21, 2),
(3, 21, 8),
(4, 21, 9),
(5, 21, 10),
(6, 22, 1),
(7, 22, 2),
(8, 22, 8),
(9, 22, 9),
(10, 22, 10),
(11, 25, 1),
(12, 25, 2),
(13, 25, 3),
(14, 25, 4),
(15, 25, 5),
(16, 25, 6),
(17, 25, 7),
(18, 25, 8),
(19, 25, 9),
(20, 25, 10),
(21, 26, 1),
(22, 26, 2),
(23, 26, 3),
(24, 26, 4),
(25, 26, 5),
(26, 26, 6),
(27, 26, 7),
(28, 26, 8),
(29, 26, 9),
(30, 26, 10),
(31, 27, 1),
(32, 27, 2),
(33, 27, 3),
(34, 27, 4),
(35, 27, 5),
(36, 27, 6),
(37, 27, 7),
(38, 27, 8),
(39, 27, 9),
(40, 27, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `materia_id` int(11) NOT NULL,
  `nombre_materia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`materia_id`, `nombre_materia`) VALUES
(1, 'Matemáticas'),
(2, 'Inglés Técnico'),
(3, 'Marco Jurídico'),
(4, 'Asistencia 2'),
(5, 'Autogestión'),
(6, 'Hardware 4'),
(7, 'Prácticas Profesionalizantes 2'),
(8, 'Programación'),
(9, 'Redes 3'),
(10, 'EDI: Egg Tech');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `nota_id` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `nota` decimal(5,2) NOT NULL,
  `cuatrimestre` int(11) NOT NULL,
  `informe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`nota_id`, `persona_id`, `materia_id`, `curso_id`, `nota`, `cuatrimestre`, `informe`) VALUES
(1, 101, 1, 25, 6.00, 1, 1),
(2, 102, 1, 25, 5.00, 1, 1),
(3, 103, 1, 25, 5.00, 1, 1),
(4, 104, 1, 25, 5.00, 1, 1),
(5, 105, 1, 25, 5.00, 1, 1),
(6, 101, 1, 25, 6.00, 1, 2),
(7, 102, 1, 25, 6.00, 1, 2),
(8, 103, 1, 25, 6.00, 1, 2),
(9, 104, 1, 25, 7.00, 1, 2),
(10, 105, 1, 25, 10.00, 1, 2),
(11, 101, 7, 25, 5.00, 1, 1),
(12, 102, 7, 25, 5.00, 1, 1),
(13, 103, 7, 25, 5.00, 1, 1),
(14, 104, 7, 25, 5.00, 1, 1),
(15, 105, 7, 25, 5.00, 1, 1),
(16, 101, 6, 25, 8.00, 1, 1),
(17, 102, 6, 25, 1.00, 1, 1),
(18, 103, 6, 25, 1.00, 1, 1),
(19, 104, 6, 25, 9.00, 1, 1),
(20, 105, 6, 25, 1.00, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `persona_id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `tipo_usuario_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`persona_id`, `nombre`, `correo`, `contrasena`, `tipo_usuario_id`, `curso_id`) VALUES
(1, 'Administración ', 'australnetworks@gmail.com', '228098', 2, NULL),
(101, 'Lucas Diaz', 'lucasdiaz9845@gmail.com', '2280', 1, 25),
(102, 'Tiziano Degiovanni', 'tiziano@gmail.com', '22', 1, 25),
(103, 'Rene Ruiz', 'reneruiz@gmail.com', '1234', 1, 25),
(104, 'Gonzalo Forneron', 'gonzalo@gmail.com', 'gonza123', 1, 25),
(105, 'Agustin Colman', 'agustin123@gmail.com', '2280', 1, 25),
(201, 'Maria Lopez', 'maria@gmail.com', 'pass123', 1, 21),
(202, 'Juan Perez', 'juan@gmail.com', 'pass123', 1, 21),
(203, 'Ana Garcia', 'ana@gmail.com', 'pass123', 1, 22),
(35455891, 'Matias Fernandez', 'matif@gmail.com', '505', 3, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `tipo_usuario_id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`tipo_usuario_id`, `rol`) VALUES
(1, 'alumno'),
(2, 'administrador'),
(3, 'alumnado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`curso_id`);

--
-- Indices de la tabla `curso_materia`
--
ALTER TABLE `curso_materia`
  ADD PRIMARY KEY (`curso_materia_id`),
  ADD KEY `curso_materia_ibfk_1` (`curso_id`),
  ADD KEY `curso_materia_ibfk_2` (`materia_id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`materia_id`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`nota_id`),
  ADD KEY `nota_ibfk_1` (`persona_id`),
  ADD KEY `nota_ibfk_2` (`materia_id`),
  ADD KEY `nota_ibfk_3` (`curso_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`persona_id`),
  ADD KEY `persona_ibfk_1` (`curso_id`),
  ADD KEY `persona_ibfk_2` (`tipo_usuario_id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`tipo_usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `curso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `curso_materia`
--
ALTER TABLE `curso_materia`
  MODIFY `curso_materia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `materia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `nota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `tipo_usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso_materia`
--
ALTER TABLE `curso_materia`
  ADD CONSTRAINT `curso_materia_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`curso_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `curso_materia_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`materia_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`materia_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_ibfk_3` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`curso_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`curso_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`tipo_usuario_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
