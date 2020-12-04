-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proovitoo
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `value_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sectors_value_id_index` (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'Manufacturing',1),(2,'Construction materials',19),(3,'Electronics and Optics',18),(4,'Food and Beverage',6),(5,'Bakery & confectionery products',342),(6,'Beverages',43),(7,'Fish & fish products',42),(8,'Meat & meat products',40),(9,'Milk & dairy products',39),(10,'Other',437),(11,'Sweets & snack food',378),(12,'Furniture',13),(13,'Bathroom/sauna',389),(14,'Bedroom',385),(15,'Children\'s room',390),(16,'Kitchen',98),(17,'Living room',101),(18,'Office',392),(19,'Other (Furniture)',394),(20,'Outdoor',341),(21,'Project furniture',99),(22,'Machinery',12),(23,'Machinery components',94),(24,'Machinery equipment/tools',91),(25,'Manufacture of machinery',224),(26,'Maritime',97),(27,'Aluminium and steel workboats',271),(28,'Boat/Yacht building',269),(29,'Ship repair and conversion',230),(30,'Metal structures',93),(31,'Other',508),(32,'Repair and maintenance service',227),(33,'Metalworking',11),(34,'Construction of metal structures',67),(35,'Houses and buildings',263),(36,'Metal products',267),(37,'Metal works',542),(38,'CNC-machining',75),(39,'Forgings, Fasteners',62),(40,'Gas, Plasma, Laser cutting',69),(41,'MIG, TIG, Aluminum welding',66),(42,'Plastic and Rubber',9),(43,'Packaging',54),(44,'Plastic goods',556),(45,'Plastic processing technology',559),(46,'Blowing',55),(47,'Moulding',57),(48,'Plastics welding and processing',53),(49,'Plastic profiles',560),(50,'Printing',5),(51,'Advertising',148),(52,'Book/Periodicals printing',150),(53,'Labelling and packaging printing',145),(54,'Textile and Clothing',7),(55,'Clothing',44),(56,'Textile',45),(57,'Wood',8),(58,'Other (Wood)',337),(59,'Wooden building materials',51),(60,'Wooden houses',47),(61,'Other',3),(62,'Creative industries',37),(63,'Energy technology',29),(64,'Environment',33),(65,'Service',2),(66,'Business services',25),(67,'Engineering',35),(68,'Information Technology and Telecommunications',28),(69,'Data processing, Web portals, E-marketing',581),(70,'Programming, Consultancy',576),(71,'Software, Hardware',121),(72,'Telecommunications',122),(73,'Tourism',22),(74,'Translation services',141),(75,'Transport and Logistics',21),(76,'Air',111),(77,'Rail',114),(78,'Road',112),(79,'Water',113);
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `terms` int NOT NULL,
  `session_id` varchar(100) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sectors`
--

DROP TABLE IF EXISTS `user_sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sectors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sector_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sector_value` (`sector_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sector_value` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sectors`
--

LOCK TABLES `user_sectors` WRITE;
/*!40000 ALTER TABLE `user_sectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sectors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 18:36:59
