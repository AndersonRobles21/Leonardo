-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2025 at 04:45 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumi`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_tarea` (IN `pid` INT, IN `texto` VARCHAR(255))   BEGIN
 INSERT INTO tareas(id_plan, descripcion)
 VALUES (pid, texto);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_puntos` (`uid` INT) RETURNS INT DETERMINISTIC BEGIN
  DECLARE pts INT;
  SELECT puntos INTO pts FROM recompensas WHERE id_usuario = uid;
  RETURN pts;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_noti` int NOT NULL COMMENT 'ID de la notificación',
  `id_usuario` int NOT NULL COMMENT 'Usuario destinatario',
  `mensaje` varchar(255) NOT NULL COMMENT 'Contenido de la notificación',
  `fecha` datetime NOT NULL COMMENT 'Fecha y hora de envío',
  `tipo` varchar(40) DEFAULT NULL COMMENT 'Tipo de notificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Notificaciones enviadas al usuario';

--
-- Dumping data for table `notificaciones`
--

INSERT INTO `notificaciones` (`id_noti`, `id_usuario`, `mensaje`, `fecha`, `tipo`) VALUES
(1, 1, 'Tienes una nueva recomendación de estudio', '2025-02-12 00:00:00', 'Sistema'),
(2, 1, 'Tu progreso ha subido a 40%', '2025-02-12 00:00:00', 'Progreso'),
(3, 2, 'No olvides tu ensayo para mañana', '2025-02-14 00:00:00', 'Recordatorio');

-- --------------------------------------------------------

--
-- Table structure for table `plan_estudio`
--

CREATE TABLE `plan_estudio` (
  `id_plan` int NOT NULL COMMENT 'ID del plan de estudio',
  `id_usuario` int NOT NULL COMMENT 'Usuario dueño del plan',
  `tipo_actividad` varchar(80) NOT NULL COMMENT 'Tipo de actividad académica',
  `fecha_entrega` date NOT NULL COMMENT 'Fecha límite de entrega',
  `dificultad` varchar(20) DEFAULT NULL COMMENT 'Nivel de dificultad',
  `tiempo_disponible` int DEFAULT NULL COMMENT 'Tiempo disponible para estudiar en minutos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Planes de estudio generados por el usuario o IA';

--
-- Dumping data for table `plan_estudio`
--

INSERT INTO `plan_estudio` (`id_plan`, `id_usuario`, `tipo_actividad`, `fecha_entrega`, `dificultad`, `tiempo_disponible`) VALUES
(1, 1, 'Tarea de matemáticas', '2025-02-15', 'Media', 3),
(2, 1, 'Proyecto de programación', '2025-02-20', 'Alta', 5),
(3, 2, 'Ensayo creativo', '2025-02-18', 'Baja', 2);

-- --------------------------------------------------------

--
-- Table structure for table `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` int NOT NULL COMMENT 'ID del registro de progreso',
  `id_plan` int NOT NULL COMMENT 'Plan asociado',
  `fecha` date NOT NULL COMMENT 'Fecha de registro del progreso',
  `porcentaje` int NOT NULL COMMENT 'Porcentaje de avance (0-100)',
  `estado_general` varchar(50) DEFAULT NULL COMMENT 'Estado general del avance'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registros de avance académico de los estudiantes';

--
-- Dumping data for table `progreso`
--

INSERT INTO `progreso` (`id_progreso`, `id_plan`, `fecha`, `porcentaje`, `estado_general`) VALUES
(1, 1, '2025-02-12', 40, 'En proceso'),
(2, 2, '2025-02-13', 10, 'Iniciado'),
(3, 3, '2025-02-14', 70, 'Avanzado');

-- --------------------------------------------------------

--
-- Table structure for table `recomendaciones_ia`
--

CREATE TABLE `recomendaciones_ia` (
  `id_reco` int NOT NULL COMMENT 'ID de la recomendación generada por IA',
  `id_plan` int NOT NULL COMMENT 'Plan relacionado',
  `metodo_sugerido` varchar(120) NOT NULL COMMENT 'Método de estudio sugerido',
  `descripcion` text COMMENT 'Explicación detallada de la recomendación de la IA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Recomendaciones inteligentes generadas por IA para mejorar el estudio';

--
-- Dumping data for table `recomendaciones_ia`
--

INSERT INTO `recomendaciones_ia` (`id_reco`, `id_plan`, `metodo_sugerido`, `descripcion`) VALUES
(1, 1, 'Mapas mentales', 'Usar colores para relacionar conceptos'),
(2, 2, 'Pomodoro', 'Estudiar 25 min y descansar 5'),
(3, 3, 'Lectura guiada', 'Subrayar palabras clave');

-- --------------------------------------------------------

--
-- Table structure for table `recompensas`
--

CREATE TABLE `recompensas` (
  `id_recompensa` int NOT NULL COMMENT 'ID del sistema de recompensas',
  `id_usuario` int NOT NULL COMMENT 'Usuario dueño del sistema de recompensas',
  `puntos` int NOT NULL COMMENT 'Puntos acumulados',
  `insignias` text COMMENT 'Insignias o logros obtenidos',
  `racha_dias` int DEFAULT NULL COMMENT 'Cantidad de días consecutivos estudiando'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Sistema gamificado de recompensas para motivar el estudio';

--
-- Dumping data for table `recompensas`
--

INSERT INTO `recompensas` (`id_recompensa`, `id_usuario`, `puntos`, `insignias`, `racha_dias`) VALUES
(1, 1, 150, 'Constancia,Objetivo cumplido', 4),
(2, 2, 90, 'Buena organización', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int NOT NULL COMMENT 'ID único de la tarea',
  `id_plan` int NOT NULL COMMENT 'Plan de estudio asignado',
  `descripcion` varchar(255) NOT NULL COMMENT 'Descripción de la tarea',
  `fecha` date DEFAULT NULL COMMENT 'Fecha programada de realización',
  `estado` varchar(20) DEFAULT NULL COMMENT 'Estado de la tarea (Pendiente/Completada)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tareas detalladas dentro de cada plan de estudio';

--
-- Dumping data for table `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `id_plan`, `descripcion`, `fecha`, `estado`) VALUES
(1, 1, 'Resolver ejercicios de trigonometría', '2025-02-10', 'Pendiente'),
(2, 1, 'Preparar resumen de fórmulas', '2025-02-11', 'Completado'),
(3, 2, 'Hacer mockup de interfaz', '2025-02-12', 'Pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL COMMENT 'ID único del usuario',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo del usuario',
  `correo` varchar(120) NOT NULL COMMENT 'Correo institucional, único',
  `programa` varchar(80) DEFAULT NULL COMMENT 'Programa académico del estudiante',
  `disponibilidad` varchar(50) DEFAULT NULL COMMENT 'Tiempo disponible para estudiar',
  `preferencias` text COMMENT 'Preferencias de estudio del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de usuarios registrados en la plataforma';

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `programa`, `disponibilidad`, `preferencias`) VALUES
(1, 'Juan Pérez', 'juan@example.com', 'Ingeniería de Sistemas', 'Tardes', 'Aprendizaje visual'),
(2, 'María López', 'maria@example.com', 'Diseño Gráfico', 'Mañanas', 'Lectura y resúmenes');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_progreso`
-- (See below for the actual view)
--
CREATE TABLE `vista_progreso` (
`fecha` date
,`nombre` varchar(100)
,`porcentaje` int
,`tipo_actividad` varchar(80)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_noti`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `plan_estudio`
--
ALTER TABLE `plan_estudio`
  ADD PRIMARY KEY (`id_plan`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indexes for table `recomendaciones_ia`
--
ALTER TABLE `recomendaciones_ia`
  ADD PRIMARY KEY (`id_reco`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indexes for table `recompensas`
--
ALTER TABLE `recompensas`
  ADD PRIMARY KEY (`id_recompensa`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_noti` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la notificación', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plan_estudio`
--
ALTER TABLE `plan_estudio`
  MODIFY `id_plan` int NOT NULL AUTO_INCREMENT COMMENT 'ID del plan de estudio', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id_progreso` int NOT NULL AUTO_INCREMENT COMMENT 'ID del registro de progreso', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recomendaciones_ia`
--
ALTER TABLE `recomendaciones_ia`
  MODIFY `id_reco` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la recomendación generada por IA', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recompensas`
--
ALTER TABLE `recompensas`
  MODIFY `id_recompensa` int NOT NULL AUTO_INCREMENT COMMENT 'ID del sistema de recompensas', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int NOT NULL AUTO_INCREMENT COMMENT 'ID único de la tarea', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT COMMENT 'ID único del usuario', AUTO_INCREMENT=3;

-- --------------------------------------------------------

--
-- Structure for view `vista_progreso`
--
DROP TABLE IF EXISTS `vista_progreso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_progreso`  AS SELECT `u`.`nombre` AS `nombre`, `p`.`tipo_actividad` AS `tipo_actividad`, `pr`.`porcentaje` AS `porcentaje`, `pr`.`fecha` AS `fecha` FROM ((`progreso` `pr` join `plan_estudio` `p` on((`pr`.`id_plan` = `p`.`id_plan`))) join `usuarios` `u` on((`u`.`id_usuario` = `p`.`id_usuario`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `plan_estudio`
--
ALTER TABLE `plan_estudio`
  ADD CONSTRAINT `plan_estudio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `progreso`
--
ALTER TABLE `progreso`
  ADD CONSTRAINT `progreso_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan_estudio` (`id_plan`);

--
-- Constraints for table `recomendaciones_ia`
--
ALTER TABLE `recomendaciones_ia`
  ADD CONSTRAINT `recomendaciones_ia_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan_estudio` (`id_plan`);

--
-- Constraints for table `recompensas`
--
ALTER TABLE `recompensas`
  ADD CONSTRAINT `recompensas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan_estudio` (`id_plan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
