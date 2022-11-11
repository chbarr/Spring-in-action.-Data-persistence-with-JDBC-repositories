-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 03:27:56
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tacocloud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredients`
--

CREATE TABLE `ingredients` (
  `id` varchar(10) NOT NULL,
  `name` varchar(15) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `type`) VALUES
('CARN', 'Carnitas', 'PROTEIN'),
('CHED', 'Cheddar', 'CHEESE'),
('COTO', 'Corn Tortilla', 'WRAP'),
('FLTO', 'Flour Tortilla', 'WRAP'),
('GRBF', 'Ground Beef', 'PROTEIN'),
('JACK', 'Monterrey Jack', 'CHEESE'),
('LETC', 'Lettuce', 'VEGGIES'),
('SLSA', 'Salsa', 'SAUCE'),
('SRCR', 'Sour Cream', 'SAUCE'),
('TMTO', 'Diced Tomatoes', 'VEGGIES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tacos`
--

CREATE TABLE `tacos` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(15) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tacos`
--

INSERT INTO `tacos` (`id`, `name`, `createdAt`) VALUES
(1, 'Chbr Taco', '2022-11-07 22:20:43'),
(2, 'Chbr Taco', '2022-11-08 03:08:25'),
(3, 'Chbr Taco', '2022-11-08 03:18:10'),
(4, 'Chbr Taco', '2022-11-08 03:20:55'),
(5, 'Isabela', '2022-11-08 03:26:39'),
(6, 'Isabela', '2022-11-08 03:28:43'),
(7, 'Isabela2', '2022-11-08 03:28:49'),
(8, 'miTaco', '2022-11-08 15:04:44'),
(9, 'tacazo', '2022-11-08 15:20:14'),
(10, 'aaaaa', '2022-11-08 20:27:43'),
(11, 'Ñelos taco', '2022-11-10 00:42:37'),
(12, 'chris', '2022-11-10 00:59:21'),
(13, 'chris', '2022-11-10 01:00:47'),
(14, 'mi Taacazo', '2022-11-10 01:02:32'),
(15, 'tototo', '2022-11-10 01:08:52'),
(16, 'chris', '2022-11-10 01:37:23'),
(17, 'Isabela', '2022-11-10 02:00:33'),
(18, 'chris', '2022-11-10 02:01:52'),
(19, 'sasasa', '2022-11-10 02:04:42'),
(20, 'tororor0', '2022-11-10 02:12:33'),
(21, 'Chbr Taco', '2022-11-10 02:40:29'),
(22, 'chris', '2022-11-10 03:16:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taco_ingredients`
--

CREATE TABLE `taco_ingredients` (
  `taco` tinyint(4) DEFAULT NULL,
  `ingredient` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `taco_ingredients`
--

INSERT INTO `taco_ingredients` (`taco`, `ingredient`) VALUES
(3, 'FLTO'),
(3, 'CHED'),
(3, 'LETC'),
(3, 'SLSA'),
(4, 'COTO'),
(4, 'CARN'),
(4, 'CHED'),
(4, 'LETC'),
(4, 'SLSA'),
(5, 'COTO'),
(5, 'CARN'),
(5, 'CHED'),
(5, 'LETC'),
(5, 'SLSA'),
(6, 'COTO'),
(6, 'CARN'),
(6, 'CHED'),
(6, 'LETC'),
(6, 'SLSA'),
(7, 'COTO'),
(7, 'CARN'),
(7, 'CHED'),
(7, 'LETC'),
(7, 'SLSA'),
(8, 'FLTO'),
(8, 'GRBF'),
(8, 'JACK'),
(8, 'TMTO'),
(8, 'SLSA'),
(9, 'COTO'),
(9, 'CARN'),
(9, 'JACK'),
(9, 'TMTO'),
(9, 'SRCR'),
(10, 'COTO'),
(10, 'FLTO'),
(10, 'GRBF'),
(10, 'JACK'),
(10, 'TMTO'),
(10, 'SLSA'),
(11, 'COTO'),
(11, 'GRBF'),
(11, 'JACK'),
(11, 'TMTO'),
(11, 'SLSA'),
(12, 'COTO'),
(12, 'CARN'),
(12, 'CHED'),
(12, 'LETC'),
(12, 'SLSA'),
(13, 'COTO'),
(13, 'CARN'),
(13, 'JACK'),
(13, 'TMTO'),
(13, 'SRCR'),
(14, 'COTO'),
(14, 'CARN'),
(14, 'GRBF'),
(14, 'CHED'),
(14, 'JACK'),
(14, 'LETC'),
(14, 'TMTO'),
(14, 'SLSA'),
(14, 'SRCR'),
(15, 'COTO'),
(15, 'CARN'),
(15, 'CHED'),
(15, 'TMTO'),
(15, 'SRCR'),
(16, 'FLTO'),
(16, 'GRBF'),
(16, 'JACK'),
(16, 'TMTO'),
(16, 'SRCR'),
(17, 'COTO'),
(17, 'GRBF'),
(17, 'CHED'),
(17, 'LETC'),
(17, 'SRCR'),
(18, 'COTO'),
(18, 'GRBF'),
(18, 'CHED'),
(18, 'TMTO'),
(18, 'SRCR'),
(19, 'FLTO'),
(19, 'GRBF'),
(19, 'CHED'),
(19, 'TMTO'),
(19, 'SRCR'),
(20, 'COTO'),
(20, 'FLTO'),
(20, 'CARN'),
(20, 'GRBF'),
(20, 'CHED'),
(20, 'JACK'),
(20, 'LETC'),
(20, 'SLSA'),
(21, 'COTO'),
(21, 'CARN'),
(21, 'JACK'),
(21, 'TMTO'),
(21, 'SRCR'),
(22, 'COTO'),
(22, 'GRBF'),
(22, 'JACK'),
(22, 'TMTO'),
(22, 'SRCR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taco_orders`
--

CREATE TABLE `taco_orders` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `ccNumber` varchar(20) NOT NULL,
  `ccExpiration` varchar(20) NOT NULL,
  `ccCVV` varchar(20) NOT NULL,
  `placedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `taco_orders`
--

INSERT INTO `taco_orders` (`id`, `name`, `street`, `city`, `state`, `zip`, `ccNumber`, `ccExpiration`, `ccCVV`, `placedAt`) VALUES
(1, 'Isabela', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/20', '123', '2022-11-08 20:29:44'),
(2, 'Chbr Taco', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/20', '123', '2022-11-10 00:42:57'),
(3, 'aaaaa', 'Calle 1', 'Popa', 'Cauca', '12345', '000000000000000', '12/20', '123', '2022-11-10 00:59:39'),
(4, 'tacazaso', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/20', '123', '2022-11-10 01:01:08'),
(5, 'Chbr Taco', 'Calle 1', 'Popa', 'Cauca', '12345', '000000000000', '12/20', '123', '2022-11-10 01:09:19'),
(6, 'Chbr Taco', 'Calle 1', 'Popa', 'Cauca', '12345', '000000000000000', '12/20', '123', '2022-11-10 01:37:43'),
(7, 'Chbr Taco', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/60', '123', '2022-11-10 02:05:27'),
(8, 'Chbr Taco', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/20', '123', '2022-11-10 02:13:11'),
(9, 'Chbr Taco', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/20', '123', '2022-11-10 02:40:47'),
(10, 'chris', 'Calle 1', 'Popa', 'Cauca', '12345', '0000000000000000', '12/20', '123', '2022-11-10 03:17:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taco_orders_tacos`
--

CREATE TABLE `taco_orders_tacos` (
  `tacoOrder` tinyint(4) DEFAULT NULL,
  `taco` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `taco_orders_tacos`
--

INSERT INTO `taco_orders_tacos` (`tacoOrder`, `taco`) VALUES
(9, 21),
(10, 22);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tacos`
--
ALTER TABLE `tacos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taco_ingredients`
--
ALTER TABLE `taco_ingredients`
  ADD KEY `id` (`taco`),
  ADD KEY `ingredient` (`ingredient`);

--
-- Indices de la tabla `taco_orders`
--
ALTER TABLE `taco_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taco_orders_tacos`
--
ALTER TABLE `taco_orders_tacos`
  ADD KEY `tacoOrder` (`tacoOrder`),
  ADD KEY `taco` (`taco`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tacos`
--
ALTER TABLE `tacos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `taco_orders`
--
ALTER TABLE `taco_orders`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `taco_ingredients`
--
ALTER TABLE `taco_ingredients`
  ADD CONSTRAINT `taco_ingredients_ibfk_1` FOREIGN KEY (`taco`) REFERENCES `tacos` (`id`),
  ADD CONSTRAINT `taco_ingredients_ibfk_2` FOREIGN KEY (`ingredient`) REFERENCES `ingredients` (`id`);

--
-- Filtros para la tabla `taco_orders_tacos`
--
ALTER TABLE `taco_orders_tacos`
  ADD CONSTRAINT `taco_orders_tacos_ibfk_1` FOREIGN KEY (`tacoOrder`) REFERENCES `taco_orders` (`id`),
  ADD CONSTRAINT `taco_orders_tacos_ibfk_2` FOREIGN KEY (`taco`) REFERENCES `tacos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
