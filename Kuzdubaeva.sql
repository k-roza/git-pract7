-- MySQL dump 10.13  Distrib 5.7.25, for Win32 (AMD64)
--
-- Host: 10.20.5.135    Database: Kuzdubaeva
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Kliyenty`
--

DROP TABLE IF EXISTS `Kliyenty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kliyenty` (
  `ID_kliyent` int(11) NOT NULL AUTO_INCREMENT,
  `FIO` varchar(100) DEFAULT NULL,
  `Seriya_pasporta` varchar(10) DEFAULT NULL,
  `Number_pasporta` varchar(10) DEFAULT NULL,
  `Home_adres` varchar(200) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_kliyent`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kliyenty`
--

LOCK TABLES `Kliyenty` WRITE;
/*!40000 ALTER TABLE `Kliyenty` DISABLE KEYS */;
INSERT INTO `Kliyenty` VALUES (1,'Иванов ИванИванович','1234','567890','г.Москва,ул.Ленина,д.10,кв.5','+79998886655'),(2,'Петрова Мария Сергеевна','1567','561234','г.Москва,ул.Тагильская,д.1,кв.15','+79917894567'),(3,'Сидоров Алексей Иванович','1890','567834','г.Екатеренбург,ул.Кутузова,д.3,кв.3','+78435672987'),(4,'Кузнецова Ольга Виктровна','1891','561290','г.Москва,пр.Мира,д.1,кв.11','+79913128690'),(5,'Смирнов Дмитрий Анреевич','1432','598345','г.Самара,ул.Кутузова,д.7,кв.34','+79875907632'),(6,'Васильева Елена Михайлова','2345','678910','г.Оренбург,ул.Майская,д.6,кв.32','+79194567230'),(7,'Михайлов Сергей Юрьевич','6754','239076','г.Самара,ул.Пушкина,д.21,кв.11','+79223456789'),(8,'Федорова Анастасия Игоревна','1030','238745','г.Омск,ул.Ленина,д.45,кв.23','+79873256743'),(9,'Николаев Игорь Владимирович','4560','512934','г.Орск,ул.Станиславского,д.51,кв.5','+79347651256'),(10,'Андреев Данил Сергеевич','8965','872309','г.Сочи,ул.Садовая,д.43,кв.43','+79213098754');
/*!40000 ALTER TABLE `Kliyenty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokupka`
--

DROP TABLE IF EXISTS `pokupka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokupka` (
  `ID_tovara` int(11) NOT NULL,
  `ID_kliyent` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `dostavka` enum('да','нет') DEFAULT NULL,
  `vid_oplaty` enum('Наличные','Кредит','Перечисление') DEFAULT NULL,
  KEY `ID_tovara` (`ID_tovara`),
  KEY `ID_kliyent` (`ID_kliyent`),
  CONSTRAINT `pokupka_ibfk_1` FOREIGN KEY (`ID_tovara`) REFERENCES `tovar` (`ID_tovara`),
  CONSTRAINT `pokupka_ibfk_2` FOREIGN KEY (`ID_kliyent`) REFERENCES `Kliyenty` (`ID_kliyent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokupka`
--

LOCK TABLES `pokupka` WRITE;
/*!40000 ALTER TABLE `pokupka` DISABLE KEYS */;
INSERT INTO `pokupka` VALUES (1,1,'2025-03-24','нет','Наличные'),(2,2,'2025-03-24','нет','Кредит'),(3,3,'2025-03-25','да','Перечисление'),(4,4,'2025-03-26','да','Наличные'),(5,5,'2025-03-27','нет','Кредит'),(6,6,'2025-03-27','нет','Перечисление'),(7,7,'2025-03-28','нет','Наличные'),(8,8,'2025-03-29','да','Наличные'),(9,9,'2025-03-30','нет','Кредит'),(10,10,'2025-03-31','нет','Перечисление');
/*!40000 ALTER TABLE `pokupka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technical_data`
--

DROP TABLE IF EXISTS `technical_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technical_data` (
  `ID_tovara` int(11) NOT NULL,
  `Tip_kuzova` varchar(50) DEFAULT NULL,
  `Kol_dverey` int(11) DEFAULT NULL,
  `kol_mest` int(11) DEFAULT NULL,
  `Tip_dvigatel` varchar(20) DEFAULT NULL,
  `Raspolozh_dvigatel` varchar(20) DEFAULT NULL,
  `Obyem_dvigatel` decimal(5,2) DEFAULT NULL,
  KEY `ID_tovara` (`ID_tovara`),
  CONSTRAINT `technical_data_ibfk_1` FOREIGN KEY (`ID_tovara`) REFERENCES `tovar` (`ID_tovara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical_data`
--

LOCK TABLES `technical_data` WRITE;
/*!40000 ALTER TABLE `technical_data` DISABLE KEYS */;
INSERT INTO `technical_data` VALUES (1,'седан',4,5,'бензин','переднее',2.50),(2,'кроссовер',4,5,'бензин','переднее',3.00),(3,'пикап',4,5,'бензин','заднее',2.70),(4,'кроссовер',4,5,'бензин','переднее',3.00),(5,'седан',4,5,'бензин','переднее',3.30),(6,'седан',4,5,'бензин','переднее',2.00),(7,'седан',4,5,'бензин','переднее',3.30),(8,'седан',4,5,'бензин','переднее',1.50),(9,'седан',4,5,'бензин','переднее',1.60),(10,'седан',4,5,'бензин','переднее',2.50);
/*!40000 ALTER TABLE `technical_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tovar`
--

DROP TABLE IF EXISTS `tovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tovar` (
  `ID_tovara` int(11) NOT NULL AUTO_INCREMENT,
  `Strana_izgotovitel` varchar(100) DEFAULT NULL,
  `Marka` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Nalichie` enum('Да','Нет') DEFAULT NULL,
  `Kogda_budet` date DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_tovara`),
  KEY `index_tovar` (`ID_tovara`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovar`
--

LOCK TABLES `tovar` WRITE;
/*!40000 ALTER TABLE `tovar` DISABLE KEYS */;
INSERT INTO `tovar` VALUES (1,'Япония','Toyota','Camry','серый','Да','0000-00-00',25000.00),(2,'Германия','BMV','X5','черный','Да','0000-00-00',3100000.00),(3,'США','Ford','F-150','черный','Нет','2025-04-23',4380000.00),(4,'Германия','BMV','X5','серый','Нет','2025-04-01',2900000.00),(5,'Южная Корея','Hyundai','Sonata','черный','Нет','2025-04-23',1280000.00),(6,'Япония','Honda','Civic','черный','Да','0000-00-00',1101000.00),(7,'Южная Корея','Hyundai','Sonata','серый','Нет','2025-04-23',1280000.00),(8,'Россия','Lada','Granta','белый','Да','0000-00-00',790000.00),(9,'Россия','Lada','Vesta','белый','Да','0000-00-00',1220000.00),(10,'Япония','Toyota','Camry','белый','Нет','2025-03-31',3990000.00);
/*!40000 ALTER TABLE `tovar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 23:20:49
