-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: barradeeventos
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Edna Krabappel',1,27569710925,'Av. 9 de Julio 2568','ednakrabappel@gmail.com',1141876087,1,1,7321),(2,'Ned Flanders',1,20332649698,'Acassuso 568','nedflanders@gmail.com',1141905526,2,1,9763),(3,'Milhouse Van Houten',1,20402689981,'Aconcagua 6897','milhousevanhouten@gmail.com',1148516804,2,5,9568),(4,'Nelson Muntz',1,20552189506,'Acoyte 689','nelsonmuntz@gmail.com',1146599371,2,6,11855),(5,'Mapple',2,30288412427,'San Martin 5689','mapple@gmail.com',52082858,3,4,1457),(6,'Mindy Simmons',1,27561049114,'Catamarca 5638','mindysimmons@gmail.com',1145051157,1,1,4326),(7,'Alcalde Diamante',1,20284428606,'Vedia 689','alcaldediamante@gmail.com',1140702264,2,6,13136),(8,'Krusty Burger',2,30371955582,'Montaneses 56','krustyburger@gmail.com',1142190590,3,4,7843),(9,'Waylon Smithers',3,38198387,'Av. Corrientes 2698','waylonsmithers@gmail.com',1142725324,2,6,6883),(10,'Charles Montgomery Burns',3,20325722444,'Av. Centenario 1256','charlesmontgomeryburns@gmail.com',1145395923,2,6,9876),(11,'Maude Flanders',3,27610250287,'Cuba 762','maudeflanders@gmail.com',1140441322,1,1,3219),(12,'Globex Corporation',2,30329866321,'Forest 5666','globexcorporation@gmail.com',53015377,3,4,3502),(13,'Helen Lovejoy',3,43491749,'Villarino 4637','helenlovejoy@gmail.com',1149753578,1,6,10473),(14,'El jardinero Willie',3,20407196986,'Fabre 3686','eljardinerowillie@gmail.com',1144062860,2,5,5173),(15,'Mr. Plow',2,30343687869,'Alicante 453','mrplow@gmail.com',1149598073,3,4,8005);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_presupuestos`
--

LOCK TABLES `detalle_presupuestos` WRITE;
/*!40000 ALTER TABLE `detalle_presupuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Homero Simpson',3,20356876981,'Av. Siempre Viva 742',2,1),(2,'Bart Simpson',3,20468953762,'Av. Siempre Viva 742',2,2),(3,'Lisa Simpson',3,27453568963,'Av. Siempre Viva 742',1,4),(4,'Marge Simpson',3,27368968714,'Av. Siempre Viva 742',1,3),(5,'Maggie Simpson',3,27603568765,'Av. Siempre Viva 742',1,5);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `presupuestos`
--

LOCK TABLES `presupuestos` WRITE;
/*!40000 ALTER TABLE `presupuestos` DISABLE KEYS */;
INSERT INTO `presupuestos` VALUES (1,'2023-01-16',7,4,1,'2023-04-22','Springfield Mall'),(2,'2023-02-06',1,5,2,'2023-05-13','Royalty Cruises'),(3,'2023-03-24',14,5,2,'2023-07-22','Escuela Primaria de Springfield'),(4,'2023-03-26',6,5,2,'2023-12-31','Planta Nuclear de Springfield'),(5,'2023-03-28',5,5,1,'2023-11-25','Mapple Store');
/*!40000 ALTER TABLE `presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Buzz Beer',2,30565687391,'Av. Santa Fe 4687','buzzbeer@gmail.com',46836973,4,3549),(2,'Kwik E Mart',2,30125639257,'Av. Maipu 568','kwikemart@gmail.com',56879765,4,2784),(3,'Springfield Mall',2,30869785232,'Av. Cordoba 2358','springfieldmall@gmail.com',56879358,5,5689),(4,'Sweet Home Alabama',2,30689768265,'Cuba 5689','sweethomealabama@gmail.com',48926758,6,672);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 18:04:56
