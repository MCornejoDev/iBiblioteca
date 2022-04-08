-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2019 a las 13:19:46
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ibiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(255) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `autor` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `anno` int(11) DEFAULT NULL,
  `editorial` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sinopsis` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `anno`, `editorial`, `sinopsis`) VALUES
(1, 'La Colmena', 'Camilo José Cela Trulock', 1951, 'anónimo', 'Seguramente la obra más valiosa de Camilo José Cela, es un testimonio fiel de la vida cotidiana en las calles, cafés y alcobas de aquel Madrid de 1943, pero es también una amarga crónica existencial. Un aire de rutina y fatalidad ha invadido la conciencia'),
(3, 'La Galatea', 'Miguel de Cervantes Saavedra', 1585, 'anónimo', 'Hay una trama principal y varias secundarias. En la principal, Elicio y Erastro son dos pastores enamorados de Galatea, una hermosísima pastora que reúne todas las demás virtudes de las heroínas cervantinas: discreción (es decir, inteligencia y buen juici'),
(4, 'Don Quijote', 'Miguel de Cervantes Saavedra', 1605, 'anónimo', 'El ingenioso hidalgo don Quijote de la Mancha narra las aventuras de Alonso Quijano, un hidalgo pobre que de tanto leer novelas de caballería acaba enloqueciendo y creyendo ser un caballero andante, nombrándose a sí mismo como don Quijote de la Mancha.'),
(5, 'La Dorotea', 'Félix Lope de Vega y Carpio', 1632, 'anónimo', '«La Dorotea» (1632) es la gran obra narrativa de Lope de Vega, en la que un Lope septuagenario rememora sus amores casi adolescentes con Elena Osorio y cuya estructura es la de «La Celestina» en un claro homenaje a Fernando de Rojas.'),
(6, 'La Dragontea', 'Félix Lope de Vega y Carpio', 1602, 'anónimo', '«La Dragontea» ocupa un lugar de importancia en la carrera literaria de Lope. Con esta epopeya sobre la muerte de Sir Francis Drake y sobre las inmortales gestas de algunos valientes españoles que combatieron los ataques del sanguinario inglés, el poeta m');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
