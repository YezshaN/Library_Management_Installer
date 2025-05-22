CREATE DATABASE  IF NOT EXISTS `libmagementt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libmagementt`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: libmagementt
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `published_year` int NOT NULL,
  `total_copies` int NOT NULL,
  `available_copies` int NOT NULL,
  `review_count` int DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby','F. Scott Fitzgerald','Classic',1925,7,6,0,0.00),(2,'To Kill a Mockingbird','Harper Lee','Fiction',1960,7,4,0,0.00),(3,'1984','George Orwell','Dystopian',1949,6,6,1,4.00),(4,'The Catcher in the Rye','J.D. Salinger','Fiction',1951,4,4,1,3.00),(5,'Pride and Prejudice','Jane Austen','Romance',1813,8,8,0,0.00),(6,'Moby-Dick','Herman Melville','Adventure',1851,3,3,1,4.00),(7,'The Hobbit','J.R.R. Tolkien','Fantasy',1937,9,8,1,3.00),(8,'War and Peace','Leo Tolstoy','Historical',1869,5,5,1,5.00),(9,'Crime and Punishment','Fyodor Dostoevsky','Psychological',1866,4,4,1,4.00),(10,'Summit Lake','Charlie Donlea','Mystery',2016,7,7,1,2.00),(11,'It Ends with Us','Colleen Hoover','Romance',2016,6,6,0,0.00),(12,'Inferno','Dan Brown','Thriller',2013,10,10,0,0.00),(22,'A little Life','Hanya Yanagihara','Novel',2016,10,10,0,0.00);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_books` BEFORE INSERT ON `books` FOR EACH ROW BEGIN
    SET NEW.available_copies = NEW.total_copies;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_books` BEFORE UPDATE ON `books` FOR EACH ROW BEGIN
    IF NEW.total_copies < NEW.available_copies THEN
        SET NEW.available_copies = NEW.total_copies;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loan_summary_log`
--

DROP TABLE IF EXISTS `loan_summary_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_summary_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `loan_count` int NOT NULL,
  `log_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_summary_log`
--

LOCK TABLES `loan_summary_log` WRITE;
/*!40000 ALTER TABLE `loan_summary_log` DISABLE KEYS */;
INSERT INTO `loan_summary_log` VALUES (1,1,'2025-04-01 00:00:00'),(2,0,'2025-04-04 00:00:00'),(3,0,'2025-04-17 00:00:00'),(4,0,'2025-04-17 00:00:00'),(5,0,'2025-04-24 00:00:00'),(6,0,'2025-04-27 00:00:00'),(7,0,'2025-05-02 00:00:00'),(8,0,'2025-05-09 00:00:00'),(9,0,'2025-05-11 00:00:00'),(10,2,'2025-05-17 00:00:00');
/*!40000 ALTER TABLE `loan_summary_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `borrow_date` date NOT NULL DEFAULT (curdate()),
  `due_date` date GENERATED ALWAYS AS ((`borrow_date` + interval 14 day)) STORED,
  `return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned','overdue') DEFAULT 'borrowed',
  PRIMARY KEY (`loan_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loans_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` (`loan_id`, `member_id`, `book_id`, `staff_id`, `borrow_date`, `return_date`, `status`) VALUES (1,1,1,1,'2025-02-04','2025-03-22','returned'),(2,2,3,2,'2025-02-01','2025-03-22','returned'),(4,4,7,4,'2025-02-05','2025-02-24','returned'),(5,5,9,5,'2025-02-06','2025-02-18','returned'),(7,7,4,7,'2025-01-21','2025-01-16','returned'),(8,8,6,8,'2025-01-15','2025-02-08','returned'),(9,9,8,9,'2025-02-10','2025-02-19','returned'),(10,10,10,10,'2025-02-03','2025-02-10','returned'),(11,2,8,1,'2025-02-27','2025-03-22','returned'),(12,4,5,2,'2025-02-27','2025-03-22','returned'),(18,1,3,2,'2025-03-16',NULL,'overdue'),(19,2,5,1,'2025-03-22',NULL,'overdue'),(21,17,10,1,'2025-04-01','2025-04-30','returned'),(36,12,22,1,'2025-04-30','2025-04-30','returned'),(38,16,1,10,'2025-05-08',NULL,'borrowed'),(39,14,2,5,'2025-05-17',NULL,'borrowed'),(40,9,2,4,'2025-05-17','2025-05-17','returned');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_loans` AFTER INSERT ON `loans` FOR EACH ROW BEGIN
  UPDATE books
     SET available_copies = available_copies - 1
   WHERE book_id = NEW.book_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_loans` AFTER UPDATE ON `loans` FOR EACH ROW BEGIN
  -- only when return_date transitions from NULL → NOT NULL
  IF OLD.return_date IS NULL 
     AND NEW.return_date IS NOT NULL THEN
    UPDATE books
       SET available_copies = available_copies + 1
     WHERE book_id = NEW.book_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Alice','Aquino','alice@yahoo.com','1234567890','123 Main St','2025-04-25 23:00:27','2025-04-25 23:12:06'),(2,'James','Lopez','bob@yahoo.com','0987654321','456 Oak St','2025-02-11 08:00:00','2025-03-22 16:02:19'),(4,'David','De Jesus','david@yahoo.com','6789012345','101 Birch St','2025-01-19 08:00:00','2025-03-22 16:02:19'),(5,'Emma','Alcantara','emma@yahoo.com','7890123456','202 Cedar St','2025-02-06 08:00:00','2025-03-22 16:02:19'),(7,'Grace','Rosana','grace@yahoo.com','9012345678','404 Elm St','2024-12-05 08:00:00','2025-03-22 16:02:19'),(8,'Henry','Sison','henry@yahoo.com','0123456789','505 Spruce St','2025-02-06 08:00:00','2025-03-22 16:02:19'),(9,'Ivy','Nuarin','ivy@yahoo.com','1234567891','606 Pine St','2024-06-06 07:00:00','2025-03-22 16:02:19'),(10,'Jack','Alvarez','jack@yahoo.com','2345678901','707 Oak St','2025-01-13 08:00:00','2025-03-22 16:02:19'),(11,'Jose','Reyes','jreyes@yahoo.com','02345678912','472 Rizal St','2025-02-18 08:00:00','2025-03-22 16:02:19'),(12,'Xia','Co','cxia@yahoo.com','09178912276','745 Forbes St','2025-02-19 08:00:00','2025-03-22 16:02:19'),(14,'Lucas','Dela Cruz','lucas@yahoo.com','09451234567','111 Cherry St','2025-02-12 08:00:00','2025-03-22 19:06:51'),(15,'Paula','Manalastas','paula@yahoo.com','09876543211','222 Apple St','2025-02-13 08:00:00','2025-03-22 19:06:51'),(16,'Rafael','Gonzaga','rafael@yahoo.com','09234567891','333 Banana St','2025-02-14 08:00:00','2025-03-22 19:06:51'),(17,'Camille','Santos','camille@yahoo.com','09123456789','444 Guava St','2025-02-15 08:00:00','2025-03-22 19:06:51'),(18,'Nathan','Santos','nath@yahoo.com','09178945612','999 Main St','2025-03-22 18:33:13','2025-04-25 23:22:59'),(19,'Bianca','Gonzales','biancs@yahoo.com','09987654367','879 Rizal. St','2025-04-25 22:41:44','2025-05-17 21:56:17');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_members` AFTER INSERT ON `members` FOR EACH ROW INSERT INTO transactions (member_id, staff_id, transaction_type, amount, transaction_date)
VALUES (NEW.member_id, 1, 'Membership Fee', 100.00, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `book_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `reservation_date` date NOT NULL DEFAULT (curdate()),
  `status` enum('Completed','Pending','Cancelled') NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,3,1,'2025-05-01','Completed'),(2,2,5,2,'2025-02-06','Completed'),(12,5,3,6,'2025-05-17','Pending'),(14,4,12,6,'2025-05-17','Completed');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_reservation` AFTER DELETE ON `reservation` FOR EACH ROW BEGIN
    INSERT INTO reservation_logs (
        reservation_id, 
        member_id, 
        book_id, 
        staff_id, 
        reservation_date, 
        status, 
        deleted_at
    )
    VALUES (
        OLD.reservation_id, 
        OLD.member_id, 
        OLD.book_id, 
        OLD.staff_id, 
        OLD.reservation_date, 
        OLD.status, 
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reservation_logs`
--

DROP TABLE IF EXISTS `reservation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `status` enum('Completed','Pending','Cancelled') DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_logs`
--

LOCK TABLES `reservation_logs` WRITE;
/*!40000 ALTER TABLE `reservation_logs` DISABLE KEYS */;
INSERT INTO `reservation_logs` VALUES (1,10,10,1,10,'2025-02-06','Pending','2025-03-22 19:57:51'),(2,9,9,10,9,'2025-02-06','Cancelled','2025-03-22 21:20:16'),(3,8,8,8,8,'2025-02-06','Completed','2025-03-22 22:25:45'),(4,11,12,4,9,'2025-04-30','Completed','2025-05-01 06:31:13'),(5,4,4,9,4,'2025-02-06','Pending','2025-05-17 18:22:22'),(6,7,7,6,7,'2025-02-06','Pending','2025-05-17 18:23:14'),(7,13,5,3,6,'2025-05-17','Cancelled','2025-05-17 22:08:27'),(8,5,5,2,5,'2025-02-06','Completed','2025-05-17 22:10:15');
/*!40000 ALTER TABLE `reservation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `book_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text NOT NULL,
  `review_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,2,3,4,'A thought-provoking read, but a bit dense.','2024-02-04 00:00:00'),(4,4,7,3,'Good adventure book, but not my favorite.','2024-02-02 00:00:00'),(5,5,9,4,'A deep and emotional psychological novel.','2024-02-01 00:00:00'),(7,7,4,3,'Interesting, but I didn’t connect with the characters.','2024-01-30 00:00:00'),(8,8,6,4,'A difficult but rewarding read.','2024-01-29 00:00:00'),(9,9,8,5,'Epic and engaging from start to finish.','2024-01-28 00:00:00'),(10,10,10,2,'Not my cup of tea, but I see the appeal.','2024-01-27 00:00:00');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_reviews` BEFORE DELETE ON `review` FOR EACH ROW BEGIN
    DECLARE total_reviews INT DEFAULT 0;
    DECLARE total_rating DECIMAL(10,2) DEFAULT 0.00;

    -- Count remaining reviews and recalculate average rating
    SELECT COUNT(*), IFNULL(SUM(rating), 0)
    INTO total_reviews, total_rating
    FROM review
    WHERE book_id = OLD.book_id AND review_id != OLD.review_id;

    -- Update book's review stats
    UPDATE books
    SET review_count = total_reviews,
        average_rating = IF(total_reviews > 0, total_rating / total_reviews, 0)
    WHERE book_id = OLD.book_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `role` enum('Librarian','Assistant','Admin') NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Liam','Sayson','liam@yahoo.com','1111111111','Librarian'),(2,'Sophia','Martinez','sophia@yahoo.com','2222222222','Assistant'),(3,'Mary','Aldeguer','maryald@yahoo.com','3333333333','Librarian'),(4,'Isabella','Rodriguez','isabella@yahoo.com','4444444444','Assistant'),(5,'Ethan','Abache','ethan@yahoo.com','5555555555','Librarian'),(6,'Olivia','Herrera','oliviaH@yahoo.com','6666666666','Assistant'),(7,'James','Pascual','james@yahoo.com','7777777777','Librarian'),(8,'Ava','Hernandez','ava@yahoo.com','8888888888','Assistant'),(9,'Noah','Racal','noah@yahoo.com','9999999999','Librarian'),(10,'Emily','Del','emily@yahoo.com','1234543212','Assistant'),(12,'Admin','Radleigh','adminrad@example.com','1234567890','Admin');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `transaction_type` enum('Membership Fee','Fine','Damage Book Fee','Lost Book Fee') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `member_id` (`member_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,'Fine',20.00,'2025-02-06 13:13:12'),(2,2,2,'Membership Fee',100.00,'2025-02-06 13:13:12'),(4,4,4,'Fine',15.00,'2025-02-06 13:13:12'),(5,5,5,'Membership Fee',100.00,'2025-02-06 13:13:12'),(7,7,7,'Membership Fee',100.00,'2025-02-06 13:13:12'),(8,8,8,'Fine',10.50,'2025-02-06 13:13:12'),(9,9,9,'Membership Fee',100.00,'2025-02-06 13:13:12'),(10,10,10,'Fine',25.00,'2025-02-06 13:13:12'),(19,18,1,'Membership Fee',100.00,'2025-03-22 11:33:13'),(25,14,4,'Membership Fee',100.00,'2025-03-22 12:06:51'),(26,15,1,'Membership Fee',100.00,'2025-03-22 12:06:51'),(27,16,6,'Membership Fee',100.00,'2025-03-22 12:06:51'),(28,17,1,'Membership Fee',100.00,'2025-03-22 12:06:51'),(30,19,10,'Membership Fee',100.00,'2025-03-22 14:04:39'),(47,10,10,'Damage Book Fee',250.00,'2025-05-17 15:12:58');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `temp_password` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,12,'adminRad','AdminUser1',0),(4,10,'milly','qwerty',0),(9,2,'Sophie','martinezqwerty',0),(11,8,'AvaHern','Ava12345',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_available_books`
--

DROP TABLE IF EXISTS `view_available_books`;
/*!50001 DROP VIEW IF EXISTS `view_available_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_available_books` AS SELECT 
 1 AS `book_id`,
 1 AS `title`,
 1 AS `author`,
 1 AS `available_copies`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_books_summary`
--

DROP TABLE IF EXISTS `view_books_summary`;
/*!50001 DROP VIEW IF EXISTS `view_books_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_books_summary` AS SELECT 
 1 AS `genre`,
 1 AS `total_books`,
 1 AS `total_copies`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_loan_history`
--

DROP TABLE IF EXISTS `view_loan_history`;
/*!50001 DROP VIEW IF EXISTS `view_loan_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_loan_history` AS SELECT 
 1 AS `loan_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `title`,
 1 AS `borrow_date`,
 1 AS `due_date`,
 1 AS `return_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_member_details`
--

DROP TABLE IF EXISTS `view_member_details`;
/*!50001 DROP VIEW IF EXISTS `view_member_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_member_details` AS SELECT 
 1 AS `member_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_overdue_loans`
--

DROP TABLE IF EXISTS `view_overdue_loans`;
/*!50001 DROP VIEW IF EXISTS `view_overdue_loans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_overdue_loans` AS SELECT 
 1 AS `loan_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `title`,
 1 AS `borrow_date`,
 1 AS `due_date`,
 1 AS `return_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'libmagementt'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `daily_loan_summary` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `daily_loan_summary` ON SCHEDULE EVERY 1 DAY STARTS '2025-04-01 14:58:13' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO loan_summary_log (loan_count, log_date)
SELECT COUNT(*), CURDATE() FROM loans WHERE borrow_date = CURDATE() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'libmagementt'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_get_book_genre_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_book_genre_count`(genre_name VARCHAR(50)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE book_count INT;
    
    SELECT COUNT(*) INTO book_count
    FROM books
    WHERE genre = genre_name;
    
    RETURN book_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_member_loan_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_member_loan_count`(p_member_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE loan_count INT DEFAULT 0;
    
    SELECT COUNT(*) INTO loan_count
    FROM loans
    WHERE member_id = p_member_id;

    RETURN loan_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_staff_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_staff_role`(p_staff_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE staff_role VARCHAR(50) DEFAULT 'Unknown'; 

    SELECT IFNULL(role, 'Unknown') INTO staff_role 
    FROM staff 
    WHERE staff_id = p_staff_id 
    LIMIT 1;

    RETURN staff_role;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_total_fines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_total_fines`(p_member_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_fine INT;

    SELECT IFNULL(SUM(amount), 0) INTO total_fine
    FROM transactions
    WHERE transactions.member_id = p_member_id
      AND transaction_type = 'Fine';

    RETURN total_fine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_is_loan_overdue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_is_loan_overdue`(loan_id INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE is_overdue BOOLEAN DEFAULT FALSE;
    DECLARE due_date DATE;
    DECLARE return_date DATE;

    SELECT l.due_date, l.return_date INTO due_date, return_date 
    FROM loans l 
    WHERE l.loan_id = loan_id;

    IF due_date IS NOT NULL THEN

        IF due_date < CURDATE() AND (return_date IS NULL OR return_date > due_date) THEN
            SET is_overdue = TRUE;
        END IF;
    END IF;

    RETURN is_overdue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_book`(
    IN p_title VARCHAR(255),
    IN p_author VARCHAR(100),  
    IN p_genre VARCHAR(50),   
    IN p_published_year INT,
    IN p_total_copies INT
)
BEGIN
    INSERT INTO books (title, author, genre, published_year, total_copies, available_copies)
    VALUES (p_title, p_author, p_genre, p_published_year, p_total_copies, p_total_copies);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_check_available_books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_available_books`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_title VARCHAR(255);
    DECLARE v_author VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT title, author FROM books WHERE available_copies > 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_title, v_author;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT v_title AS "Available Book", v_author AS "Author";
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_check_overdue_loans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_overdue_loans`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_member VARCHAR(255);
    DECLARE v_title VARCHAR(255);
    DECLARE v_due_date DATE;
    DECLARE v_return_date DATE;
    
    DECLARE cur CURSOR FOR 
        SELECT CONCAT(m.first_name, ' ', m.last_name), b.title, l.due_date, l.return_date
        FROM loans l
        JOIN members m ON l.member_id = m.member_id
        JOIN books b ON l.book_id = b.book_id
        WHERE l.due_date < CURDATE() AND (l.return_date IS NULL OR l.return_date > l.due_date);

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_member, v_title, v_due_date, v_return_date;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT v_member AS "Member", 
               v_title AS "Overdue Book", 
               v_due_date AS "Due Date", 
               v_return_date AS "Return Date";
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_member_contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_member_contact`(
    IN p_member_id INT,
    IN p_phone VARCHAR(15),
    IN p_address TEXT
)
BEGIN
    UPDATE members
    SET phone = COALESCE(p_phone, phone),   
        address = COALESCE(p_address, address)  
    WHERE member_id = p_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_available_books`
--

/*!50001 DROP VIEW IF EXISTS `view_available_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_available_books` AS select `books`.`book_id` AS `book_id`,`books`.`title` AS `title`,`books`.`author` AS `author`,`books`.`available_copies` AS `available_copies` from `books` where (`books`.`available_copies` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_books_summary`
--

/*!50001 DROP VIEW IF EXISTS `view_books_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_books_summary` AS select `books`.`genre` AS `genre`,count(0) AS `total_books`,sum(`books`.`total_copies`) AS `total_copies` from `books` group by `books`.`genre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_loan_history`
--

/*!50001 DROP VIEW IF EXISTS `view_loan_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_loan_history` AS select `l`.`loan_id` AS `loan_id`,`m`.`first_name` AS `first_name`,`m`.`last_name` AS `last_name`,`b`.`title` AS `title`,`l`.`borrow_date` AS `borrow_date`,`l`.`due_date` AS `due_date`,`l`.`return_date` AS `return_date` from ((`loans` `l` join `members` `m` on((`l`.`member_id` = `m`.`member_id`))) join `books` `b` on((`l`.`book_id` = `b`.`book_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_member_details`
--

/*!50001 DROP VIEW IF EXISTS `view_member_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_member_details` AS select `members`.`member_id` AS `member_id`,`members`.`first_name` AS `first_name`,`members`.`last_name` AS `last_name`,`members`.`email` AS `email`,`members`.`phone` AS `phone`,`members`.`address` AS `address` from `members` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_overdue_loans`
--

/*!50001 DROP VIEW IF EXISTS `view_overdue_loans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_overdue_loans` AS select `l`.`loan_id` AS `loan_id`,`m`.`first_name` AS `first_name`,`m`.`last_name` AS `last_name`,`b`.`title` AS `title`,`l`.`borrow_date` AS `borrow_date`,`l`.`due_date` AS `due_date`,`l`.`return_date` AS `return_date` from ((`loans` `l` join `members` `m` on((`l`.`member_id` = `m`.`member_id`))) join `books` `b` on((`l`.`book_id` = `b`.`book_id`))) where ((`l`.`due_date` < curdate()) and ((`l`.`return_date` is null) or (`l`.`return_date` > `l`.`due_date`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-21 16:53:44
