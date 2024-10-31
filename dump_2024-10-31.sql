strib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
	  `cnam` int NOT NULL,
	  `cname` varchar(45) NOT NULL,
	  `city` varchar(45) DEFAULT NULL,
	  `rating` int DEFAULT '100',
	  `snam` int DEFAULT NULL,
	  PRIMARY KEY (`cnam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (201,'Григорий','Питер',100,101),(202,'Александр','Москва',100,102),(203,'Василий','Новосибирск',200,109),(204,'Дарья','Челябинск',200,106),(205,'Мария','Чита',100,NULL),(206,'Виктор','Бердск',300,105),(208,'Сергей','Прокопьевск',200,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
	  `snam` int NOT NULL,
	  `cnam` varchar(45) NOT NULL,
	  `sdate` date NOT NULL,
	  `amount` double(7,2) NOT NULL,
	  PRIMARY KEY (`snam`,`cnam`,`sdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (101,'203','2024-09-12',56156.10),(101,'204','2024-09-12',101.45),(102,'201','2024-06-15',35.03),(102,'202','2001-12-01',15.01),(103,'204','2021-05-05',4568.25),(103,'204','2024-02-25',56812.24),(105,'203','2024-11-18',33.45),(106,'201','2000-06-21',10.00),(106,'205','2023-01-06',568.47),(109,'202','2024-11-26',59899.89),(109,'206','2021-12-18',1.01);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salespeapl`
--

DROP TABLE IF EXISTS `salespeapl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salespeapl` (
	  `snam` int NOT NULL,
	  `sname` varchar(45) NOT NULL,
	  `city` varchar(45) DEFAULT NULL,
	  `comm` decimal(3,2) DEFAULT NULL,
	  PRIMARY KEY (`snam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salespeapl`
--

LOCK TABLES `salespeapl` WRITE;
/*!40000 ALTER TABLE `salespeapl` DISABLE KEYS */;
INSERT INTO `salespeapl` VALUES (101,'Виктория','Новосибирск',0.10),(102,'Татьяна','Новосибирск',0.11),(103,'Виктор','Лондон',0.09),(105,'Сергей','Искитим',0.15),(106,'София','Иваново',0.07),(109,'Марфа','Междуреченск',0.09);
/*!40000 ALTER TABLE `salespeapl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 10:27:36

