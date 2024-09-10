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

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;

--
-- Base de datos: `ibiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
    `id` int(255) NOT NULL,
    `title` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
    `author` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
    `year` int(11) DEFAULT NULL,
    `publisher` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
    `synopsis` varchar(255) COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO
    `books` (
        `id`,
        `title`,
        `author`,
        `year`,
        `publisher`,
        `synopsis`
    )
VALUES (
        1,
        'La Colmena',
        'Camilo José Cela Trulock',
        1951,
        'anonymous',
        'Probably Camilo José Cela’s most valuable work, it is a faithful testimony of daily life on the streets, cafes, and bedrooms of Madrid in 1943, but it is also a bitter existential chronicle. An air of routine and fatality has invaded consciousness'
    ),
    (
        3,
        'La Galatea',
        'Miguel de Cervantes Saavedra',
        1585,
        'anonymous',
        'There is a main plot and several secondary ones. In the main plot, Elicio and Erastro are two shepherds in love with Galatea, a beautiful shepherdess who has all the other virtues of Cervantes’ heroines: discretion (that is, intelligence and good judgment'
    ),
    (
        4,
        'Don Quijote',
        'Miguel de Cervantes Saavedra',
        1605,
        'anonymous',
        'The ingenious gentleman Don Quixote of La Mancha narrates the adventures of Alonso Quijano, a poor gentleman who, after reading many chivalry novels, goes mad and believes himself to be a knight-errant, naming himself Don Quixote of La Mancha.'
    ),
    (
        5,
        'La Dorotea',
        'Félix Lope de Vega y Carpio',
        1632,
        'anonymous',
        '«La Dorotea» (1632) is Lope de Vega’s great narrative work, where a septuagenarian Lope reminisces about his almost teenage loves with Elena Osorio and whose structure is similar to that of «La Celestina» in a clear tribute to Fernando de Rojas.'
    ),
    (
        6,
        'La Dragontea',
        'Félix Lope de Vega y Carpio',
        1602,
        'anonymous',
        '«La Dragontea» occupies an important place in Lope’s literary career. With this epic about the death of Sir Francis Drake and the immortal deeds of some brave Spaniards who fought the attacks of the bloodthirsty Englishman, the poet m'
    );

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books` ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 7;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;