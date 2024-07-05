-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2024 a las 14:19:01
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
-- Base de datos: `documentales_cac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_pelicula`
--

CREATE TABLE `clase_pelicula` (
  `id` int(2) NOT NULL,
  `clase` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_pelicula`
--

INSERT INTO `clase_pelicula` (`id`, `clase`) VALUES
(1, 'Fiutbol'),
(2, 'Escalada'),
(3, 'Crossfit'),
(4, 'Running');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(2) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `año` date NOT NULL,
  `genero` varchar(20) NOT NULL,
  `director` varchar(30) NOT NULL,
  `reparto` varchar(100) NOT NULL,
  `detalles` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `duracion` time NOT NULL,
  `clase_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `año`, `genero`, `director`, `reparto`, `detalles`, `rating`, `duracion`, `clase_id`) VALUES
(1, 'Muchachos', '2023-12-07', 'Deportes', 'Jesus Braceras', 'Guillermo Francella', 'La celebración por el título de la selección argentina en el Mundial de Fútbol de Catar 2022, a través de videos de argentinos alrededor del mundo y material inédito de la fiesta en las calles.', 5, '01:40:00', 0),
(2, 'Maradona', '2019-01-01', 'Deportes', 'Asif Kapadia', 'Diego Armando Maradona, Diego Maradona Jr., Corrad', 'Diego Maradona es una nueva película del ganador del Oscar Asif Kapadia, sobre el ascenso y la caída del jugador estrella de fútbol Diego Maradona. Hecho de más de 500 horas de material de archivo, la película pinta un retrato único de este hombre, rebeld', 5, '02:04:00', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase_pelicula`
--
ALTER TABLE `clase_pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase_pelicula`
--
ALTER TABLE `clase_pelicula`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
