-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (arm64)
--
-- Host: localhost    Database: PP4
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `BelongsTo`
--

DROP TABLE IF EXISTS `BelongsTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BelongsTo` (
  `ProductId` int NOT NULL,
  `ProductName` varchar(30) DEFAULT NULL,
  `CategoryName` varchar(30) NOT NULL,
  `CustomerID` int NOT NULL,
  KEY `ProductId` (`ProductId`,`CategoryName`),
  KEY `belongsto_ibfk_2` (`CategoryName`),
  KEY `belongsto_ibfk_3` (`CustomerID`),
  CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`) ON DELETE CASCADE,
  CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`CategoryName`) REFERENCES `Category` (`CategoryName`) ON DELETE CASCADE,
  CONSTRAINT `belongsto_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BelongsTo`
--

LOCK TABLES `BelongsTo` WRITE;
/*!40000 ALTER TABLE `BelongsTo` DISABLE KEYS */;
INSERT INTO `BelongsTo` VALUES (1,'Nirma Washing Powder 2kg','Washing Powder',4),(1,'Nirma Washing Powder 2kg','Washing Powder',8),(1,'Nirma Washing Powder 2kg','Washing Powder',10),(2,'Ariel Washing Powder 1kg','Washing Powder',1),(2,'Ariel Washing Powder 1kg','Washing Powder',5),(3,'Colgate Large Tube','Oral N Face',1),(3,'Colgate Large Tube','Oral N Face',5),(4,'Gillette Pens Pack of 10','Stationary',2),(4,'Gillette Pens Pack of 10','Stationary',3),(4,'Gillette Pens Pack of 10','Stationary',8),(4,'Gillette Pens Pack of 10','Stationary',11),(5,'Maggi Pack of 6','Food',5),(5,'Maggi Pack of 6','Food',6),(5,'Maggi Pack of 6','Food',10),(5,'Maggi Pack of 6','Food',12),(6,'Dairy Milk Silk','Food',2),(6,'Dairy Milk Silk','Food',4),(6,'Dairy Milk Silk','Food',8),(6,'Dairy Milk Silk','Food',9),(6,'Dairy Milk Silk','Food',10),(6,'Dairy Milk Silk','Food',11),(7,'Santoor Soap Pack of 8','Oral N Face',1),(7,'Santoor Soap Pack of 8','Oral N Face',2),(7,'Santoor Soap Pack of 8','Oral N Face',3),(7,'Santoor Soap Pack of 8','Oral N Face',7),(7,'Santoor Soap Pack of 8','Oral N Face',11);
/*!40000 ALTER TABLE `BelongsTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Products` varchar(100) DEFAULT NULL,
  `QuantitiesOfEachProductSold` varchar(100) DEFAULT NULL,
  `PaymentMethod` varchar(30) DEFAULT NULL,
  UNIQUE KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,'Alia Bhatt','Kapoor','Colgate Large Tube,Santoor Soap Pack of 8,Ariel Washing Powder 1kg,','5,2,5,','Cash'),(2,'Kareena Kapoor','Khan','Santoor Soap Pack of 8,Gillette Pens Pack of 10,Dairy Milk Silk,','4,2,4,','Cash'),(3,'Deepika Padukone','Singh','Santoor Soap Pack of 8,Gillette Pens Pack of 10,','5,1,','Cash'),(4,'Jahnvi','Kapoor','Dairy Milk Silk,Nirma Washing Powder 2kg,','2,4,','Cash'),(5,'Sara Ali','Khan','Colgate Large Tube,Maggi Pack of 6,Ariel Washing Powder 1kg,','1,5,1,','Credit/Debit Card'),(6,'Ananya','Pandey','Maggi Pack of 6,','2,','Cash'),(7,'Priyanka','Chopra','Santoor Soap Pack of 8,','2,','Credit/Debit Card'),(8,'Alia Bhatt','Kapoor','Gillette Pens Pack of 10,Dairy Milk Silk,Nirma Washing Powder 2kg,','4,5,3,','Credit/Debit Card'),(9,'Jahnvi','Kapoor','Dairy Milk Silk,','1,','Credit/Debit Card'),(10,'Deepika','Padukone','Nirma Washing Powder 2kg,Maggi Pack of 6,Dairy Milk Silk,','1,5,4,','UPI'),(11,'Sunny','Leone','Gillette Pens Pack of 10,Santoor Soap Pack of 8,Dairy Milk Silk,','5,5,5,','UPI'),(12,'Kareena Kapoor','Khan','Maggi Pack of 6,','5,','Credit/Debit Card');
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart_Products`
--

DROP TABLE IF EXISTS `Cart_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart_Products` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `CartProduct` varchar(20) DEFAULT NULL,
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart_Products`
--

LOCK TABLES `Cart_Products` WRITE;
/*!40000 ALTER TABLE `Cart_Products` DISABLE KEYS */;
INSERT INTO `Cart_Products` VALUES (1,'Alia Bhatt','Kapoor','Colgate Large Tube'),(1,'Alia Bhatt','Kapoor','Santoor Soap Pack of'),(1,'Alia Bhatt','Kapoor','Ariel Washing Powder'),(2,'Kareena Kapoor','Khan','Santoor Soap Pack of'),(2,'Kareena Kapoor','Khan','Gillette Pens Pack o'),(2,'Kareena Kapoor','Khan','Dairy Milk Silk'),(3,'Deepika Padukone','Singh','Santoor Soap Pack of'),(3,'Deepika Padukone','Singh','Gillette Pens Pack o'),(4,'Jahnvi','Kapoor','Dairy Milk Silk'),(4,'Jahnvi','Kapoor','Nirma Washing Powder'),(5,'Sara Ali','Khan','Colgate Large Tube'),(5,'Sara Ali','Khan','Maggi Pack of 6'),(5,'Sara Ali','Khan','Ariel Washing Powder'),(6,'Ananya','Pandey','Maggi Pack of 6'),(7,'Priyanka','Chopra','Santoor Soap Pack of'),(8,'Alia Bhatt','Kapoor','Gillette Pens Pack o'),(8,'Alia Bhatt','Kapoor','Dairy Milk Silk'),(8,'Alia Bhatt','Kapoor','Nirma Washing Powder'),(9,'Jahnvi','Kapoor','Dairy Milk Silk'),(10,'Deepika','Padukone','Nirma Washing Powder'),(10,'Deepika','Padukone','Maggi Pack of 6'),(10,'Deepika','Padukone','Dairy Milk Silk'),(11,'Sunny','Leone','Gillette Pens Pack o'),(11,'Sunny','Leone','Santoor Soap Pack of'),(11,'Sunny','Leone','Dairy Milk Silk'),(12,'Kareena Kapoor','Khan','Maggi Pack of 6');
/*!40000 ALTER TABLE `Cart_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart_QOES`
--

DROP TABLE IF EXISTS `Cart_QOES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart_QOES` (
  `CustomerID` int NOT NULL,
  `CartQOES` int DEFAULT NULL,
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `cart_qoes_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart_QOES`
--

LOCK TABLES `Cart_QOES` WRITE;
/*!40000 ALTER TABLE `Cart_QOES` DISABLE KEYS */;
INSERT INTO `Cart_QOES` VALUES (1,5),(1,2),(1,5),(2,4),(2,2),(2,4),(3,5),(3,1),(4,2),(4,4),(5,1),(5,5),(5,1),(6,2),(7,2),(8,4),(8,5),(8,3),(9,1),(10,1),(10,5),(10,4),(11,5),(11,5),(11,5),(12,5);
/*!40000 ALTER TABLE `Cart_QOES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `CategoryName` varchar(30) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES ('Bathroom','Stack5'),('Food','Stack6,Stack7'),('Oral N Face','Stack2,Stack3'),('Stationary','Stack8'),('Washing Powder','Stack1,Stack4');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category_Location`
--

DROP TABLE IF EXISTS `Category_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category_Location` (
  `Category_Name` varchar(30) NOT NULL,
  `CategoryLocation` varchar(30) DEFAULT NULL,
  KEY `Category_Name` (`Category_Name`),
  CONSTRAINT `category_location_ibfk_1` FOREIGN KEY (`Category_Name`) REFERENCES `Category` (`CategoryName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_Location`
--

LOCK TABLES `Category_Location` WRITE;
/*!40000 ALTER TABLE `Category_Location` DISABLE KEYS */;
INSERT INTO `Category_Location` VALUES ('Washing Powder','Stack 4'),('Washing Powder','Stack 1'),('Oral N Face','Stack 2'),('Oral N Face','Stack 3'),('Bathroom','Stack 5'),('Food','Stack 7'),('Food','Stack 6'),('Stationary','Stack 8');
/*!40000 ALTER TABLE `Category_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `ValuePointsEarnedByTheCustomer` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Alia Bhatt','Kapoor',566),(2,'Kareena Kapoor','Khan',336),(3,'Deepika Padukone','Singh',746),(4,'Jahnvi','Kapoor',936),(5,'Sara Ali','Khan',473),(6,'Ananya','Pandey',383),(7,'Priyanka','Chopra',133),(8,'Alia Bhatt','Kapoor',3566),(9,'Jahnvi','Kapoor',1136),(10,'Deepika','Padukone',2266),(11,'Sunny','Leone',4299),(12,'Kareena Kapoor','Khan',2489);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_PhoneNo`
--

DROP TABLE IF EXISTS `Customer_PhoneNo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_PhoneNo` (
  `CustomerID` int NOT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `customer_phoneno_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_PhoneNo`
--

LOCK TABLES `Customer_PhoneNo` WRITE;
/*!40000 ALTER TABLE `Customer_PhoneNo` DISABLE KEYS */;
INSERT INTO `Customer_PhoneNo` VALUES (1,'7446175796'),(2,'6444457343'),(3,'6600238286'),(4,'8513910359'),(5,'6495953893'),(6,'7084997860'),(7,'7300931118'),(8,'6898951098'),(9,'7029112783'),(10,'7083401157'),(11,'7016347665'),(12,'9638353948'),(2,'8947656291'),(4,'6361433851'),(6,'8587222780'),(8,'6255308507'),(10,'8046299199'),(12,'9426784867');
/*!40000 ALTER TABLE `Customer_PhoneNo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `DepartmentName` varchar(30) NOT NULL,
  `DepartmentHeadEmployeeID` int NOT NULL,
  PRIMARY KEY (`DepartmentName`),
  UNIQUE KEY `DepartmentName` (`DepartmentName`),
  KEY `DepartmentHeadEmployeeID` (`DepartmentHeadEmployeeID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`DepartmentHeadEmployeeID`) REFERENCES `Employee` (`EmployeeId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Sales',1),('Finance',5),('Tech',12);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DepartmentHead`
--

DROP TABLE IF EXISTS `DepartmentHead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DepartmentHead` (
  `DepartmentName` varchar(30) NOT NULL,
  `NumberOfEmployees` int DEFAULT NULL,
  UNIQUE KEY `DepartmentName` (`DepartmentName`),
  CONSTRAINT `departmenthead_ibfk_1` FOREIGN KEY (`DepartmentName`) REFERENCES `Department` (`DepartmentName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DepartmentHead`
--

LOCK TABLES `DepartmentHead` WRITE;
/*!40000 ALTER TABLE `DepartmentHead` DISABLE KEYS */;
INSERT INTO `DepartmentHead` VALUES ('Finance',4),('Sales',4),('Tech',4);
/*!40000 ALTER TABLE `DepartmentHead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeId` int NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `EmployeeDept` varchar(30) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `SuperviserID` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  UNIQUE KEY `EmployeeId` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Amey','Choudhary','Sales',73234,'2012-06-16',NULL),(2,'Arvind','Kejriwal','Sales',53234,'2014-09-10',1),(3,'Harsh','Bansal','Sales',32134,'2016-05-08',2),(4,'Krishna','Singh','Sales',32134,'2016-06-08',2),(5,'Pradhuman','Tiwari','Finance',93234,'2010-02-02',NULL),(6,'Jainit','Bafna','Finance',67438,'2015-10-10',5),(7,'Chulbul','Pandey','Finance',63000,'2016-06-06',5),(8,'Kaleen','Bhaiya','Finance',45453,'2016-06-06',6),(9,'Shahrukh','Khan','Tech',92022,'2013-04-11',10),(10,'Narendra','Modi','Tech',23443,'2014-04-04',12),(11,'Rahul','Gandhi','Tech',23445,'2015-07-07',12),(12,'Sarthak','Bansal','Tech',500000,'2020-02-20',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

ALTER TABLE Employee ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SuperviserID`) REFERENCES `Employee` (`EmployeeId`) ON DELETE SET NULL;
--
-- Table structure for table `Employee_PhoneNo`
--

DROP TABLE IF EXISTS `Employee_PhoneNo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_PhoneNo` (
  `EmployeeId` int NOT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  KEY `EmployeeId` (`EmployeeId`),
  CONSTRAINT `employee_phoneno_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `Employee` (`EmployeeId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_PhoneNo`
--

LOCK TABLES `Employee_PhoneNo` WRITE;
/*!40000 ALTER TABLE `Employee_PhoneNo` DISABLE KEYS */;
INSERT INTO `Employee_PhoneNo` VALUES (1,'7922122985'),(2,'6456192341'),(3,'7638992399'),(4,'6812220848'),(5,'8942624645'),(6,'9958189646'),(7,'8483822696'),(8,'8668198354'),(9,'7896558872'),(10,'7011526347'),(11,'9223834862'),(12,'8808338125'),(1,'9844392345'),(4,'9644392345'),(8,'6644392345');
/*!40000 ALTER TABLE `Employee_PhoneNo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductId` int NOT NULL,
  `ManufacturingDate` date NOT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `ProductName` varchar(30) DEFAULT NULL,
  `MaximumRetailPrice` float DEFAULT NULL,
  `CostPrice` float DEFAULT NULL,
  `Discount` float DEFAULT '0',
  `QuantityAvailableInStock` int DEFAULT NULL,
  `DateOfLastOrderingFromTheSupplier` date DEFAULT NULL,
  `AmountLastOrderedFromSupplier` int DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  UNIQUE KEY `ProductId` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'2022-11-10','2023-12-16','Nirma Washing Powder 2kg',599,459,0,34,'2022-11-16',40),(2,'2022-11-10','2023-11-16','Ariel Washing Powder 1kg',399,159,0,15,'2022-11-16',30),(3,'2022-11-10','2023-06-16','Colgate Large Tube',99,59,20,40,'2022-11-16',100),(4,'2022-10-10',NULL,'Gillette Pens Pack of 10',299,199,10,15,'2022-10-27',25),(5,'2022-11-14','2023-01-16','Maggi Pack of 6',79,49,0,19,'2022-11-16',29),(6,'2022-11-10','2023-04-11','Dairy Milk Silk',299,99,0,69,'2022-11-11',100),(7,'2022-10-14','2023-09-13','Santoor Soap Pack of 8',399,159,0,44,'2022-11-16',54);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_SP`
--

DROP TABLE IF EXISTS `Product_SP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_SP` (
  `ProductId` int NOT NULL,
  `MaximumRetailPrice` float NOT NULL,
  `Discount` float NOT NULL DEFAULT '0',
  `CostPrice` float NOT NULL,
  `SellingPrice` float DEFAULT NULL,
  `Profit` float DEFAULT NULL,
  UNIQUE KEY `ProductId` (`ProductId`),
  CONSTRAINT `product_sp_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_SP`
--

LOCK TABLES `Product_SP` WRITE;
/*!40000 ALTER TABLE `Product_SP` DISABLE KEYS */;
INSERT INTO `Product_SP` VALUES (1,599,0,459,599,30.5011),(2,399,0,159,399,150.943),(3,99,20,59,79.2,34.2373),(4,299,10,199,269.1,35.2261),(5,79,0,49,79,61.2245),(6,299,0,99,299,202.02),(7,399,0,159,399,150.943);
/*!40000 ALTER TABLE `Product_SP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotion`
--

DROP TABLE IF EXISTS `Promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Promotion` (
  `ProductId` int NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `HowManyAvailedTheOffer` int DEFAULT NULL,
  `PromoName` varchar(30) DEFAULT NULL,
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion`
--

LOCK TABLES `Promotion` WRITE;
/*!40000 ALTER TABLE `Promotion` DISABLE KEYS */;
INSERT INTO `Promotion` VALUES (1,'2023-02-10','2023-09-26',237,'Summer Sale'),(2,'2023-02-03','2024-03-14',495,'Holi Offer'),(3,'2024-08-28','2024-11-09',428,'Autumn-Winter Sale'),(4,'2024-03-09','2024-09-20',447,'Summer Sale'),(5,'2023-03-10','2023-10-10',238,'Holi Offer'),(7,'2024-10-13','2024-11-12',284,'Diwali Bonanza');
/*!40000 ALTER TABLE `Promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotion_Festive`
--

DROP TABLE IF EXISTS `Promotion_Festive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Promotion_Festive` (
  `ProductId` int NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `FestiveOffer` varchar(10) DEFAULT NULL,
  `DiscountPercentage` float DEFAULT NULL,
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `promotion_festive_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion_Festive`
--

LOCK TABLES `Promotion_Festive` WRITE;
/*!40000 ALTER TABLE `Promotion_Festive` DISABLE KEYS */;
INSERT INTO `Promotion_Festive` VALUES (1,'2023-02-10','2023-09-26','No',0),(2,'2023-02-03','2024-03-14','Yes',30),(3,'2024-08-28','2024-11-09','No',0),(4,'2024-03-09','2024-09-20','No',0),(5,'2023-03-10','2023-10-10','Yes',30),(7,'2024-10-13','2024-11-12','Yes',30);
/*!40000 ALTER TABLE `Promotion_Festive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `ProductId` int NOT NULL,
  `ProductName` varchar(30) DEFAULT NULL,
  `TotalLifeTimeSales` int DEFAULT NULL,
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,'Nirma Washing Powder 2kg',426),(2,'Ariel Washing Powder 1kg',257),(3,'Colgate Large Tube',675),(4,'Gillette Pens Pack of 10',940),(5,'Maggi Pack of 6',228),(6,'Dairy Milk Silk',989),(7,'Santoor Soap Pack of 8',1000);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 11:00:24