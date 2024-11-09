-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2024 a las 07:14:36
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
-- Base de datos: `ventas-suscripcion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `perfil` text NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `suscripcion` int(11) NOT NULL,
  `id_suscripcion` text DEFAULT NULL,
  `ciclo_pago` int(11) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `verificacion` int(11) NOT NULL,
  `email_encriptado` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `enlace_afiliado` text DEFAULT NULL,
  `patrocinador` text DEFAULT NULL,
  `paypal` text DEFAULT NULL,
  `pais` text DEFAULT NULL,
  `codigo_pais` text DEFAULT NULL,
  `telefono_movil` text DEFAULT NULL,
  `firma` text DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `perfil`, `nombre`, `email`, `password`, `suscripcion`, `id_suscripcion`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `paypal`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`) VALUES
(1, 'admin', 'Academy of life', 'info@academyoflife.com', '123456', 1, NULL, NULL, NULL, 1, NULL, NULL, 'academy-of-life', NULL, 'tutorialesatualcance-buver@hotmail.com', NULL, NULL, NULL, NULL, NULL, '2024-10-27 06:37:08'),
(3, 'usuario', 'Alexandrer Parra', 'user@gmail.com', '123456', 0, NULL, NULL, NULL, 0, 'abb9c5215c7961ca0d23b0d3d1afeaa5', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-27 08:54:27'),
(4, 'usuario', 'Jaime Lopez', 'userjaime@gmail.com', '123456', 0, NULL, NULL, NULL, 0, 'e2a33bbf39b9cf549c5f9c5fc0898b25', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-27 16:47:18'),
(7, 'usuario', 'Camilo', 'user5@gmail.com', '123456', 0, NULL, NULL, NULL, 0, '30a4cf12c7b1c9a3f69e8ff247e8ed91', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-27 17:37:19'),
(17, 'usuario', 'alvaro', 'a@gmail.com', '12345', 0, NULL, NULL, NULL, 0, '98db6b79acb71383b5a83e0bbc1cadd4', NULL, NULL, '12345', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-27 22:56:43'),
(23, 'usuario', 'Alexandrer Parra', 'user1@gmail.com', '123456', 0, NULL, NULL, NULL, 0, 'abb9c5215c7961ca0d23b0d3d1afeaa5', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-28 03:29:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
