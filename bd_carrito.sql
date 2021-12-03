-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2021 a las 22:38:52
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) UNSIGNED NOT NULL,
  `ci` varchar(9) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `ci`, `nombres`, `direccion`, `email`, `password`) VALUES
(1, '8415572', 'Rosaycela D. Choque Apaza', 'El Alto/Extranca Rio Seco', 'rosayceladanych@gmail.com', 'Dany12345'),
(2, '7854125', 'Karen Flores', 'El Alto/ Rio Seco', 'karen@gmail.com', 'karen12345'),
(3, '7894586', 'Juan Mamani', 'El Alto/Camino Laja', 'juan@gmail.com', 'juan12345'),
(4, '8754691', 'Nelly Quispe', 'El Alto/16 de Julio', 'nelly@gmail.com', 'nelly12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idCliente` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `fechaCompras` varchar(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idCliente`, `idPago`, `fechaCompras`, `monto`, `estado`) VALUES
(1, 1, 1, '27-11-2021', 290, 'Cancelado - En Proceso de Envio'),
(2, 2, 2, '27-11-2021', 210, 'Cancelado - En Proceso de Envio'),
(3, 3, 3, '27-11-2021', 222, 'Cancelado - En Proceso de Envio'),
(5, 1, 5, '28-11-2021', 190, 'Cancelado - En Proceso de Envio'),
(6, 3, 6, '28-11-2021', 70, 'Cancelado - En Proceso de Envio'),
(7, 3, 7, '28-11-2021', 28, 'Cancelado - En Proceso de Envio'),
(8, 2, 8, '28-11-2021', 105, 'Cancelado - En Proceso de Envio'),
(9, 2, 9, '28-11-2021', 15, 'Cancelado - En Proceso de Envio'),
(10, 3, 10, '28-11-2021', 120, 'Cancelado - En Proceso de Envio'),
(11, 4, 11, '28-11-2021', 133, 'Cancelado - En Proceso de Envio'),
(12, 4, 12, '01-12-2021', 116, 'Cancelado - En Proceso de Envio'),
(13, 3, 13, '02-12-2021', 91, 'Cancelado - En Proceso de Envio'),
(14, 4, 15, '03-12-2021', 117, 'Cancelado - En Proceso de Envio'),
(15, 2, 16, '03-12-2021', 50, 'Cancelado - En Proceso de Envio'),
(16, 1, 17, '03-12-2021', 155, 'Cancelado - En Proceso de Envio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(36, 6, 1, 1, 15),
(37, 9, 1, 1, 120),
(38, 10, 1, 1, 35),
(39, 11, 1, 2, 25),
(41, 8, 2, 1, 50),
(42, 5, 2, 1, 12),
(43, 9, 2, 1, 120),
(44, 8, 3, 1, 50),
(46, 7, 3, 2, 35),
(47, 11, 3, 2, 25),
(48, 5, 3, 2, 12),
(52, 9, 5, 1, 120),
(55, 10, 8, 2, 35),
(57, 6, 9, 1, 15),
(58, 8, 10, 1, 50),
(63, 4, 12, 2, 21),
(64, 5, 12, 2, 12),
(65, 8, 12, 1, 50),
(67, 4, 13, 1, 21),
(69, 10, 14, 1, 35),
(70, 5, 14, 1, 12),
(71, 11, 15, 2, 25),
(72, 5, 16, 1, 12),
(73, 6, 16, 2, 15),
(74, 8, 16, 1, 50),
(75, 4, 16, 3, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `monto`) VALUES
(1, 290),
(2, 210),
(3, 222),
(4, 84),
(5, 190),
(6, 70),
(7, 28),
(8, 105),
(9, 15),
(10, 120),
(11, 133),
(12, 116),
(13, 91),
(14, 70),
(15, 117),
(16, 50),
(17, 155);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idUsuario`, `nombres`, `foto`, `descripcion`, `precio`, `stock`) VALUES
(4, 1, 'Libro de practica de escritura', 'https://s.alicdn.com/@sc04/kf/H44c7bc0df44f40bb954ee66c613b43c17.jpg_220x220.jpg', 'Libro de práctica de escritura Best Seller, libros de práctica de escritura reutilizables para niños, cuaderno de práctica mágica hundido, cuadernos para niños', 21, 30),
(5, 1, 'Marcadores de Color', 'https://s.alicdn.com/@sc04/kf/U1d171b88e81a4156942a6e53825b4ec9g.png_220x220.png', 'Marcador de reciclaje de papel, tamaño estándar, apto para mano', 12, 100),
(6, 1, 'Cuaderno', 'https://s.alicdn.com/@sc04/kf/H8294079fda2348df8b59da3cb5bab2c2L.jpg_220x220.jpg', 'Fabricante de portátiles Cuaderno personalizado 2020 2021 2022', 15, 30),
(7, 1, 'Diario', 'https://s.alicdn.com/@sc04/kf/Hfefd7167000a409380215a1303787b604.png_220x220.png', 'Notebook Planner Mejor vendido 2022 OEM Golden Foil Wrie Ring Diario', 35, 50),
(8, 1, 'Sacapuntas eléctrico', 'https://s.alicdn.com/@sc04/kf/HTB1aCU4dW5s3KVjSZFNq6AD3FXa2.jpg_220x220.jpg', 'SUMINISTROS DE OFICINA-Venta caliente Sacapuntas eléctrico', 50, 10),
(9, 1, 'Mochila', 'https://s.alicdn.com/@sc04/kf/H178f0d50077c4ec3b0d1e50437063e9dz.jpg_220x220.jpg', 'Fabricante chino Mochilas escolares baratas de moda Mochilas escolares', 120, 12),
(10, 1, 'Organizador', 'https://s.alicdn.com/@sc04/kf/H7a9485eee46b4cce8d230b322a63d68bT.png_220x220.png', 'Organizador de escritorio, soporte para bolígrafo, papelería escolar, multifunción, 3', 35, 6),
(11, 1, 'Boligrafos', 'https://s.alicdn.com/@sc04/kf/H9ef2abd6246541a2bc2a3d97feda5344r.jpg_220x220.jpg', 'BolÃ­grafo barato multifuncional impreso con logotipo personalizado BolÃ­grafo promocional retrÃ¡ctil barato con lÃ¡piz tÃ¡ctil', 25, 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `apellidos` varchar(32) NOT NULL,
  `cargo` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `apellidos`, `cargo`, `email`, `password`) VALUES
(1, 'Remberto', 'Laura Ticona', 'Usuario', 'rmbrt23@gmail.com', '12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idCliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
