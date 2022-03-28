-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2019 a las 05:02:30
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultades`
--

CREATE TABLE `facultades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facultades`
--

INSERT INTO `facultades` (`id`, `nombre`) VALUES
(1, 'Ing. Sistemas'),
(2, 'Ing.Ambiental');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectores`
--

CREATE TABLE `lectores` (
  `id_lector` int(11) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_tipolector` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lectores`
--

INSERT INTO `lectores` (`id_lector`, `nombres`, `apellidos`, `dni`, `telefono`, `direccion`, `estado`, `id_tipolector`) VALUES
(1, 'Julio', 'Gomez Arapa', '45454545', '988898989', 'Calle Arica 430', 1, 1),
(2, 'Gean Carlos', 'Fuentes', '45452126', '988898989', 'Calle Arica 430', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `codigo_libro` varchar(50) NOT NULL,
  `isbn_libro` varchar(50) NOT NULL,
  `titulo_libro` varchar(200) NOT NULL,
  `subtitulo_libro` varchar(200) NOT NULL,
  `autor_libro` varchar(200) NOT NULL,
  `publicacion_libro` varchar(10) NOT NULL,
  `editorial_libro` varchar(150) NOT NULL,
  `ediccion_libro` varchar(100) NOT NULL,
  `idioma_libro` varchar(100) NOT NULL,
  `ejemplares_libro` int(11) NOT NULL,
  `prestados_libro` int(11) NOT NULL,
  `id_facultad` int(11) NOT NULL,
  `imagen_libro` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `codigo_libro`, `isbn_libro`, `titulo_libro`, `subtitulo_libro`, `autor_libro`, `publicacion_libro`, `editorial_libro`, `ediccion_libro`, `idioma_libro`, `ejemplares_libro`, `prestados_libro`, `id_facultad`, `imagen_libro`) VALUES
(1, '10100110', 'B2229', 'Fundamentos de programacion', 'basico para estudiantes', 'Juan Perez', '2010', 'Navarrete', 'Primera', 'Español', 4, 0, 1, 'avatar.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_lector` int(11) NOT NULL,
  `fechaprestamo` varchar(20) NOT NULL,
  `estado_prestamo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fechadevolucion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `id_libro`, `id_lector`, `fechaprestamo`, `estado_prestamo`, `id_usuario`, `fechadevolucion`) VALUES
(1, 1, 1, '0000-00-00', 1, 1, '24/01/2019'),
(2, 1, 2, '24/01/2019', 1, 1, '24/01/2019');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipolector`
--

CREATE TABLE `tipolector` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipolector`
--

INSERT INTO `tipolector` (`id`, `nombre`) VALUES
(1, 'Estudiante'),
(2, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `denominacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `denominacion`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `pass_usuario` varchar(100) NOT NULL,
  `idtipousuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios` 1234
--

INSERT INTO `usuarios` (`id_usuario`, `nombres`, `apellidos`, `dni`, `telefono`, `email`, `pass_usuario`, `idtipousuario`) VALUES
(1, 'yony', 'mamani', '46766807', '46787878', 'admin@admin.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(2, 'Juan', 'Gomez Arapa', '45454545', '45444222', 'juan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `facultades`
--
ALTER TABLE `facultades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lectores`
--
ALTER TABLE `lectores`
  ADD PRIMARY KEY (`id_lector`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipolector`
--
ALTER TABLE `tipolector`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `facultades`
--
ALTER TABLE `facultades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `lectores`
--
ALTER TABLE `lectores`
  MODIFY `id_lector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipolector`
--
ALTER TABLE `tipolector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
