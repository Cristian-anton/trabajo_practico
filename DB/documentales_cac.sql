-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2024 a las 00:50:46
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
  `titulo` varchar(40) DEFAULT NULL,
  `año` date DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `director` varchar(30) DEFAULT NULL,
  `reparto` varchar(100) DEFAULT NULL,
  `detalles` varchar(1024) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `clase_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `año`, `genero`, `director`, `reparto`, `detalles`, `rating`, `duracion`, `clase_id`) VALUES
(1, 'Muchachos', '2023-12-07', 'Deportes', 'Jesus Braceras', 'Guillermo Francella', 'La celebración por el título de la selección argentina en el Mundial de Fútbol de Catar 2022, a través de videos de argentinos alrededor del mundo y material inédito de la fiesta en las calles.', 5, '01:40:00', 0),
(2, 'Maradona', '2019-01-01', 'Deportes', 'Asif Kapadia', 'Diego Armando Maradona, Diego Maradona Jr., Corrad', 'Diego Maradona es una nueva película del ganador del Oscar Asif Kapadia, sobre el ascenso y la caída del jugador estrella de fútbol Diego Maradona. Hecho de más de 500 horas de material de archivo, la película pinta un retrato único de este hombre, rebeld', 5, '02:04:00', 0),
(3, 'Capitanes del Mundo', '2023-01-01', 'Documentales', 'Sin datos', 'Messi, Ronaldo, Maya Yoshida, Luka Modrić, Mbappé ', 'Desde los vestuarios hasta la cancha, esta serie documental brinda acceso exclusivo a los 32 equipos que compiten por la copa en el Mundial de 2022.', 4, '00:40:00', 1),
(4, 'Kaizer', '0000-00-00', 'Documentales', 'Louis Myles,', 'Carlos Henrique Raposo', 'La gran epopeya del futbolista que nunca jugó un partido circula por Río de Janeiro de una y mil maneras. Esta es la historia de Carlos Henrique Raposo el futbolista de Botafogo, Flamengo o Fluminense que nunca llegó a pisar el campo. Dicen que decidió co', 7, '01:38:00', 1),
(5, 'Antoine Griezmann: Campeón del mundo', '2019-03-21', 'Documentales', 'Alex Dell', 'Antoine Griezmann', 'raducción del inglés-Antoine Griezmann: The Making of a Legend es una película documental de 2019 dirigida por Alex Dell, que sigue el camino de Antoine Griezmann desde la Real Sociedad en España hasta el Atlético de Madrid y hasta ganar la Copa Mundial d', 7, '01:00:00', 1),
(6, 'The fanatic search 2 - A girl Thing...', '2011-01-01', 'Deportes', 'Laurent Triay', 'Daila Ojeda, Chris Sharma, Lynn Hill', 'The fanatic search 2 - A girl Thing... es un documental sobre escalada en roca que tiene lugar en Saint Antonin y en Verdon Gorge. Dirigido por Laurent Triay en 2011 y producido por Work Less Climb More. En la película aparecen Nina Caprez, Daila Ojeda, Chris Sharma, Lynn Hill, Brooke Raboutou-Erbesfield y Charlotte Durif entre otros.', 7, '01:25:00', 2);

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
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
