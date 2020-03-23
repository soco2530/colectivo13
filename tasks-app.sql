-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2020 a las 02:47:13
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tasks-app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `is_active` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `is_active`, `password`) VALUES
(1, 'ddd', 'dasfdsf@gmail.com', '0', '4111222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `idcolaborador` int(11) NOT NULL,
  `clave` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `fechamodifico` date NOT NULL,
  `fecharegistro` date NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Razonsocil` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` bit(1) NOT NULL,
  `dni` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usuarioregiro` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `colaboradores`
--

INSERT INTO `colaboradores` (`idcolaborador`, `clave`, `direccion`, `telefono`, `fechamodifico`, `fecharegistro`, `nombre`, `Razonsocil`, `estado`, `dni`, `email`, `usuario`, `usuarioregiro`, `apellidos`) VALUES
(1, 'socoococ', 'piyura', '969956668', '2020-02-16', '2020-02-11', 'maria', 'prima', b'1', '76442301', 'socorrolinre@gmail.com', 'soco', 'paula', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision`
--

CREATE TABLE `comision` (
  `idcomision` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  `fechamodifico` datetime NOT NULL,
  `usuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comision`
--

INSERT INTO `comision` (`idcomision`, `descripcion`, `estado`, `fecharegistro`, `fechamodifico`, `usuario`) VALUES
(1, 'proyectos sociales', b'1', '2020-02-18 00:00:00', '2020-02-27 00:00:00', 'soco'),
(4, 'AMBIENTACION', b'1', '2020-02-19 23:16:16', '0000-00-00 00:00:00', ''),
(16, 'k tal', b'1', '2020-02-20 11:30:16', '0000-00-00 00:00:00', ''),
(17, 'BONITA', b'1', '2020-02-20 11:41:23', '0000-00-00 00:00:00', ''),
(18, 'BONITA22', b'1', '2020-02-20 11:41:37', '0000-00-00 00:00:00', ''),
(19, 'TURISMO', b'1', '2020-02-20 11:42:31', '0000-00-00 00:00:00', ''),
(20, 'VIAJES', b'1', '2020-02-20 11:42:39', '0000-00-00 00:00:00', ''),
(21, 'ARBOLIZACION', b'1', '2020-02-20 11:43:02', '0000-00-00 00:00:00', ''),
(22, 'TALLER', b'1', '2020-02-20 11:43:20', '0000-00-00 00:00:00', ''),
(23, 'kkk', b'1', '2020-02-20 11:43:27', '0000-00-00 00:00:00', ''),
(25, 'jjaja', b'1', '2020-02-20 16:57:33', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `idproyecto` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecharegistro` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fechamodifico` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` bit(1) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idrepresentante` int(11) NOT NULL,
  `MOTIVO` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`idproyecto`, `descripcion`, `imagen`, `fecharegistro`, `fechamodifico`, `usuario`, `estado`, `idcategoria`, `idrepresentante`, `MOTIVO`) VALUES
(1, 'compartir chocolatada a ancianos de mayor eddad', '', '2020-02-24 00:00:00', '2020-02-18 00:00:00', 'soco', b'1', 1, 1, 'POR NAVIDAD'),
(2, 'SEMBRAR PLANTAS', '', '2020-02-18 00:00:00', '2020-02-27 00:00:00', 'PAULA', b'1', 2, 3, 'CUIDAR EL MEDIO AMBIENTE APROVECHAR FENOMENO DEL N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `idrepresentante` int(11) NOT NULL,
  `ruc` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `razonsocial` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecharegistro` date NOT NULL,
  `fechamodifico` date NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`idrepresentante`, `ruc`, `nombre`, `direccion`, `razonsocial`, `telefono`, `fecharegistro`, `fechamodifico`, `usuario`, `estado`) VALUES
(1, '1076442305', 'cesar', 'paita', 'exalcalde', '969923019', '2020-02-11', '2020-02-20', 'PAULA', b'1'),
(3, '76442301', 'omarely', 'paita', 'tesorera', '939982135', '2020-02-20', '0000-00-00', '', b'1'),
(4, '76444', 'hermosa', 'calle balta', 'prima', '939982135', '2020-02-20', '0000-00-00', '', b'1'),
(6, '854541230', 'morelia', 'uruay', 'jefa', '93825742', '2020-02-20', '0000-00-00', '', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `task`
--

INSERT INTO `task` (`id`, `name`, `description`) VALUES
(3, 'hjsdgjhfdgsu', 'si pues eshermosa'),
(4, 'BONITA', 'TEMERECES LO MEJOR '),
(5, 'bonita bella', 'inteligente '),
(11, 'valor ', 'debes continuar '),
(12, 'fuerte ', 'mujer valiosa '),
(15, 'PAULA', 'ME GUSTARIA QUE  LAS PLAYAS ESTEN MAS LIMPAS Y QUE AYA MAS ARBOLIZACION '),
(16, 'ROBERT', 'HOLA '),
(17, 'maria', 'carajo'),
(19, 'ayuda', 'sococcocococ'),
(20, 'nnmn', 'mskand'),
(22, 'omarely', 'limpieza mejorar '),
(23, 'socorro ', 'me amo'),
(25, 'moysess', 'bonita tierra hermosa'),
(26, 'PAULA', 'aventurada '),
(28, 'alex', 'fdjfksdnjgk'),
(29, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `dni` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellidos`, `dni`, `estado`) VALUES
(1, 'Angelo', 'Uriol', '48125800', b'1'),
(2, 'Petter', 'Ríos', '49051200', b'1'),
(3, 'Jorge', 'Ríos', '22526385', b'1'),
(4, 'Amelia', 'Abarca', '25123653', b'1'),
(5, 'Geovanny', 'Ríos', '47859612', b'1'),
(6, 'Benita', 'Ávila', '15234871', b'1'),
(7, 'William', 'Duran', '47806512', b'1'),
(8, 'Jaider', 'Miranda', '47582389', b'0'),
(9, 'Daniel', 'Vereau', '47862532', b'0'),
(10, 'Alex', 'Montoya', '42856510', b'0'),
(11, 'Lino', 'Flores', '42850365', b'0'),
(12, 'Alejandra', 'Abarca', '49856321', b'1'),
(13, 'Yoshi', 'Takeuchi', '45126355', b'1'),
(14, 'Jonathan', 'Ganoza', '45982012', b'0'),
(15, 'Daniel', 'Abarca', '14851204', b'1'),
(16, 'Almendra', 'Abarca', '53127854', b'1'),
(17, 'Luis', 'Cordova', '50125896', b'0'),
(18, 'David', 'Rojas', '45891201', b'0'),
(19, 'Kevin', 'Ávila', '48521369', b'0'),
(20, 'Violeta', 'Abarca', '27416589', b'1'),
(21, 'Marco', 'Cordova', '46851298', b'1'),
(22, 'Carlos', 'Ávalos', '26859103', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`idcolaborador`);

--
-- Indices de la tabla `comision`
--
ALTER TABLE `comision`
  ADD PRIMARY KEY (`idcomision`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`idproyecto`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`idrepresentante`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `idcolaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comision`
--
ALTER TABLE `comision`
  MODIFY `idcomision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
