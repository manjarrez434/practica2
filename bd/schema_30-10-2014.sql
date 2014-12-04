/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.20 : Database - usuario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`usuario` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `usuario`;

/*Table structure for table `alumno_grupo` */

DROP TABLE IF EXISTS `alumno_grupo`;

CREATE TABLE `alumno_grupo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_alumno` int(6) DEFAULT NULL,
  `id_grupo` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alumno_grupo` */

LOCK TABLES `alumno_grupo` WRITE;

UNLOCK TABLES;

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

LOCK TABLES `grupo` WRITE;

insert  into `grupo`(`id`,`nombre`) values (1,'TIC 71'),(2,'TIC 72'),(3,'TIC 73');

UNLOCK TABLES;

/*Table structure for table `maestro_materia` */

DROP TABLE IF EXISTS `maestro_materia`;

CREATE TABLE `maestro_materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_maestro` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `maestro_materia` */

LOCK TABLES `maestro_materia` WRITE;

insert  into `maestro_materia`(`id`,`id_maestro`,`id_materia`) values (1,14,1),(2,15,2),(3,21,2),(4,21,1),(5,22,2);

UNLOCK TABLES;

/*Table structure for table `materia` */

DROP TABLE IF EXISTS `materia`;

CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `avatar` varchar(60) DEFAULT NULL,
  `orden` varchar(60) DEFAULT NULL,
  `estatus` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `materia` */

LOCK TABLES `materia` WRITE;

insert  into `materia`(`id`,`nombre`,`avatar`,`orden`,`estatus`) values (1,'Español',NULL,'0','1'),(2,'Matematicas',NULL,'0','1');

UNLOCK TABLES;

/*Table structure for table `pregunta` */

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `answer` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `pregunta` */

LOCK TABLES `pregunta` WRITE;

insert  into `pregunta`(`id`,`question`,`answer`,`status`) values (1,'¿PHP trabaja del lado del servidor?','si',1),(2,'¿HTML es un lenguaje de programación?','no',1),(3,'¿El autobus es el principal medio de transporte en el Edo de Mex?','si',1),(4,'¿Mexico es el mayor productor de maiz a nivel mundial?','si',1),(5,'¿Alemania es una potencia mundial?','si',1),(6,'¿La torre Ifel esta en Italia?','no',1),(7,'¿Brasil esta en el continente americano?','si',1),(8,'¿Los españoles fueron los primeros en invadir america?','si',1),(9,'¿El dia de la independencia de Mexico es el 15 de Septiembre?','si',1),(10,'¿Abraham Lilcon esta en los billetes de 1 dolar?','no',1),(11,'¿Las viboras son reptiles?','si',1),(12,'¿El rinoceronte esta extinto?','no',1),(13,'¿Los oviparos ponen huevos?','si',1),(14,'¿Las hojas son producidas de las rocas?','no',1),(15,'¿El proceso de fotosintesis lo realizan las tortugas?','no',1),(16,'¿Los podologos se encargan de las enfermedades del pie?','si',1),(17,'¿Los otorrinolaringologos se encargan de las enfermedades de la sangre?','no',1),(18,'¿En Mexico, el numero 911 es para llamar a la ambulancia?','no',1),(19,'¿La revolucion industrial fue en Inglaterra?','si',1),(20,'¿La nube es el principal destino para guardar informacion?','si',1);

UNLOCK TABLES;

/*Table structure for table `preguntas` */

DROP TABLE IF EXISTS `preguntas`;

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `pregunta` varchar(30) DEFAULT NULL,
  `respuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `preguntas` */

LOCK TABLES `preguntas` WRITE;

insert  into `preguntas`(`id_pregunta`,`pregunta`,`respuesta`) values (1,'Pregunta 1 ...n',2),(2,'Pregunta 2 ...s',1),(3,'Pregunta 3 ...n',2),(4,'Pregunta 4 ...n',2),(5,'Pregunta 5 ...n',2),(6,'Pregunta 6 ...s',1),(7,'Pregunta 7 ...s',1),(8,'Pregunta 8 ...n',2),(9,'Pregunta 9 ...s',1),(10,'Pregunta 10 ...n',2),(11,'Pregunta 11 ...n',2),(12,'Pregunta 12 ...s',1),(13,'Pregunta 13 ...s',1),(14,'Pregunta 14 ...s',1),(15,'Pregunta 15 ...n',2),(16,'Pregunta 16 ...n',2),(17,'Pregunta 17 ...s',1),(18,'Pregunta 18 ...n',2),(19,'Pregunta 19 ...s',1),(20,'Pregunta 20 ...s',1);

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(500) DEFAULT NULL,
  `ApellidoPaterno` varchar(500) DEFAULT NULL,
  `ApellidoMaterno` varchar(500) DEFAULT NULL,
  `Telefono` varchar(500) DEFAULT NULL,
  `Calle` varchar(500) DEFAULT NULL,
  `NumeroExterior` int(100) DEFAULT NULL,
  `NumeroInterior` int(100) DEFAULT NULL,
  `Colonia` varchar(500) DEFAULT NULL,
  `Municipio` varchar(500) DEFAULT NULL,
  `Estado` varchar(500) DEFAULT NULL,
  `CP` int(100) DEFAULT NULL,
  `Correo` varchar(500) DEFAULT NULL,
  `Usuario` varchar(500) DEFAULT NULL,
  `Pass` varchar(500) DEFAULT NULL,
  `Nivel` varchar(500) DEFAULT NULL,
  `Estatus` varchar(500) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`Id`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Calle`,`NumeroExterior`,`NumeroInterior`,`Colonia`,`Municipio`,`Estado`,`CP`,`Correo`,`Usuario`,`Pass`,`Nivel`,`Estatus`,`calificacion`) values (1,'Iliana','Arellano','Cruz','0000000000','calle',1,1,'colonia','municipio','estado',0,'correo@gmail.com','Admin','123456','1','1',10),(2,'Maricela','Evagenlista','Montes de Oca','0000000000','calle',1,1,'colonia','municipio','estado',0,'correo@gmail.com','Alumno1','123456','3','1',2),(3,'Miriam','Ramirez ','Gracia','0000000000','calle',1,1,'colonia','municipio','estado',0,'correo@gmail.com','Alumno2','123456','3','1',8),(4,'Mariana','Arellano','Cruz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7);

UNLOCK TABLES;

/* Procedure structure for procedure `actualizarAciertos` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizarAciertos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarAciertos`(in _total varchar(2),in _usuarioid int)
begin
UPDATE usuario SET calificacion = _total WHERE Id = _usuarioid;
end */$$
DELIMITER ;

/* Procedure structure for procedure `validateLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `validateLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLogin`(in _usuario varchar(50), in _password varchar(50))
begin
SELECT Id, Nivel, Estatus FROM usuario WHERE usuario = _usuario AND Pass= _password;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
