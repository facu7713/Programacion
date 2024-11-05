-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2024 a las 18:55:58
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
-- Base de datos: `abdinformatica2024`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_alta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`, `fecha_alta`) VALUES
(1, 'ACCESORIO', '2023-07-15'),
(2, 'ALMACENAMIENTO', '2023-07-20'),
(3, 'PERIFERICO', '2023-07-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `Nombre_Apellido` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Ciudad` varchar(15) NOT NULL,
  `CodPostal` int(11) DEFAULT NULL,
  `Telefono` varchar(15) NOT NULL,
  `ClienteVIP` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `Nombre_Apellido`, `dni`, `Direccion`, `Ciudad`, `CodPostal`, `Telefono`, `ClienteVIP`) VALUES
(1, 'Lorenzo Meyer', '25348916', 'Derqui 3837', 'Santa Fe', 3000, '0342234111', 1),
(2, 'María Ruiz', '30574767', 'Avellaneda 6321', 'Santo Domingo', 3409, '0343234221', 0),
(3, 'Jacinto Paredes', '22830420', 'Sarmiento 2132', 'Ceres', 3090, '3420323232', 0),
(4, 'Lucía Guerrero', '35671841', 'Avda san Martín 928', 'San Guillermo', 3059, '3440321345', 1),
(6, 'Julio Barrera', '15938651', 'Avda Freyre 3734', 'Santa Fe', 3000, '0342542411', 1),
(7, 'Adriana Mestre', '26480951', 'Alvear 1571', 'San Cristóbal', 3070, '3408423911', 0),
(8, 'Juan Mazo', '33856210', 'Urquiza 2019', 'Ceres', 3000, '0342422965', 1),
(9, 'Celeste Corsi', '37815301', 'San Martín 1237', 'Ceres', 3090, '3420321457', 0),
(10, 'Gustavo Rossi', '21460342', 'Caseros 1130', 'San Cristóbal', 3070, '3408420872', 0),
(11, 'José Luque', '18571213', 'Laprida 2341', 'San Cristóbal', 3070, '3408424890', 1),
(12, 'Pedro Poe', '29945843', 'Perón 2312', 'Santa Fe', 3000, '0342233124', 0),
(13, 'Laura Mendieta', '31779897', 'San Lorenzo 6713', 'Ceres', 3090, '3420452345', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_facturas`
--

CREATE TABLE `detalles_facturas` (
  `Item` int(11) NOT NULL,
  `N_Factura` varchar(6) NOT NULL,
  `Idproducto` varchar(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `importesubtotal` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalles_facturas`
--

INSERT INTO `detalles_facturas` (`Item`, `N_Factura`, `Idproducto`, `cantidad`, `importesubtotal`) VALUES
(1, '23211', 'XAY55', 10, 3053.5),
(2, '23211', 'ERT78', 25, 2474.75),
(3, '23211', 'RFI99', 15, 8257.5),
(4, '23312', 'XAY55', 1, 305.35),
(5, '23312', 'WTR65', 2, 370),
(6, '23413', 'ERT78', 30, 2969.7),
(7, '23413', 'FGH03', 12, 3117),
(8, '24020', 'YRF74', 9, 8910),
(9, '24121', 'ZVG91', 10, 15000),
(10, '24323', 'ERT78', 1, 98.99),
(11, '24323', 'UIU66', 1, 170.42),
(12, '24222', 'WTR65', 20, 3700),
(13, '24424', 'FGH03', 3, 779.25),
(14, '24525', 'XAY55', 1, 305.35),
(15, '24626', 'RFI99', 1, 550.5),
(16, '24727', 'WTR65', 1, 185),
(17, '24828', 'FGH03', 1, 259.75),
(18, '24121', 'FGH03', 8, 2078),
(19, '24020', 'ERT78', 5, 494.95),
(20, '24020', 'UIU66', 5, 852.1),
(21, '25050', 'FGH03', 10, 2597.5),
(22, '24222', 'UIU66', 3, 511.26),
(23, '25160', 'XAY55', 3, 916.05),
(24, '25270', 'YRF74', 5, 4950),
(25, '24525', 'ZVG91', 1, 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idf` int(11) NOT NULL,
  `N_Factura` varchar(6) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `Descuento` varchar(5) DEFAULT '0%',
  `IVA` varchar(5) NOT NULL DEFAULT '21%'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idf`, `N_Factura`, `IdCliente`, `fecha`, `Descuento`, `IVA`) VALUES
(1, '23211', 1, '2012-01-05', '5%', '10%'),
(2, '23312', 3, '2012-05-10', '0%', '21%'),
(3, '23413', 4, '2012-12-13', '5%', '10%'),
(4, '24020', 8, '2013-02-23', '5%', '10%'),
(5, '24121', 6, '2013-03-10', '5%', '10%'),
(6, '24222', 11, '2013-06-23', '5%', '10%'),
(7, '24323', 7, '2013-11-15', '0%', '21%'),
(8, '24424', 2, '2014-03-05', '0%', '21%'),
(9, '24525', 9, '2014-07-22', '5%', '10%'),
(10, '24626', 10, '2014-10-25', '0%', '21%'),
(11, '24727', 12, '2014-11-15', '0%', '21%'),
(12, '24828', 13, '2014-12-10', '0%', '21%'),
(13, '25050', 11, '2015-01-03', '5%', '10%'),
(14, '25160', 8, '2015-04-06', '5%', '10%'),
(15, '25270', 6, '2015-07-20', '5%', '10%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `Idproducto` varchar(5) NOT NULL,
  `NombreProd` varchar(50) NOT NULL,
  `Precio_venta` double NOT NULL,
  `Stock` int(11) NOT NULL,
  `Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `Idproducto`, `NombreProd`, `Precio_venta`, `Stock`, `Categoria`) VALUES
(1, 'ASD79', 'ADAPTADOR WIFI', 490.8, 15, 1),
(2, 'ERT78', 'MOUSE GENIUS', 98.99, 125, 3),
(3, 'FGH03', 'PENDRIVE 16 GB', 259.75, 75, 2),
(4, 'RFI99', 'IMPRESORA EPSON', 2550.5, 45, 3),
(5, 'UIU66', 'TECLADO MULTIMEDIAL', 170.42, 105, 3),
(6, 'WTR65', 'ADAPTADOR BLUETOOTH', 185.5, 87, 1),
(7, 'XAY55', 'GRABADORA DE DVD', 305.35, 55, 2),
(8, 'YRF74', 'GRABADORA DE BLU RAY', 990, 25, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosautorizados`
--

CREATE TABLE `usuariosautorizados` (
  `idusuario` int(11) NOT NULL,
  `nombreusuario` varchar(15) NOT NULL,
  `claveusuario` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuariosautorizados`
--

INSERT INTO `usuariosautorizados` (`idusuario`, `nombreusuario`, `claveusuario`) VALUES
(1, 'melina', 'meli2019'),
(2, 'juan', 'juan2019');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `detalles_facturas`
--
ALTER TABLE `detalles_facturas`
  ADD PRIMARY KEY (`Item`),
  ADD KEY `Idproducto` (`Idproducto`),
  ADD KEY `N_Factura` (`N_Factura`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idf`),
  ADD UNIQUE KEY `N_Factura` (`N_Factura`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Idproducto` (`Idproducto`);

--
-- Indices de la tabla `usuariosautorizados`
--
ALTER TABLE `usuariosautorizados`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalles_facturas`
--
ALTER TABLE `detalles_facturas`
  MODIFY `Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuariosautorizados`
--
ALTER TABLE `usuariosautorizados`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
