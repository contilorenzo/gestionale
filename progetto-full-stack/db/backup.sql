-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: sampledb
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `DocDetail`
--

DROP TABLE IF EXISTS `DocDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocDetail` (
  `DocLine` int(11) NOT NULL,
  `DocId` varchar(10) NOT NULL,
  `Item` varchar(12) NOT NULL,
  `LineType` char(1) NOT NULL,
  `LineDescription` varchar(128) NOT NULL,
  `UnitOfMeasure` varchar(6) NOT NULL,
  `Qty` float NOT NULL,
  `UnitAmount` varchar(6) NOT NULL,
  `DiscountFormula` varchar(8) NOT NULL,
  `NetPrice` float NOT NULL,
  `DiscountAmount` float NOT NULL,
  `TaxableAmount` float NOT NULL,
  `TaxCode` int(11) NOT NULL,
  `AmountOfTaxes` float NOT NULL,
  `TotalAmount` float NOT NULL,
  PRIMARY KEY (`DocId`,`DocLine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocDetail`
--

LOCK TABLES `DocDetail` WRITE;
/*!40000 ALTER TABLE `DocDetail` DISABLE KEYS */;
INSERT INTO `DocDetail` VALUES (1,'21/000001','TESTITEM01','M','Descrizione riga 1 documento 1','NR',10,'15.00','10+5',150,21.75,128.25,22,28.215,156.465),(2,'21/000001','TESTITEM02','M','Descrizione riga 2 documento 1','KG',240,'10.00','',2400,0,2400,22,528,2928);
/*!40000 ALTER TABLE `DocDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocMaster`
--

DROP TABLE IF EXISTS `DocMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocMaster` (
  `Customer` varchar(6) NOT NULL,
  `DocDate` date NOT NULL,
  `DocId` varchar(10) NOT NULL,
  `DocumentType` char(3) NOT NULL,
  `PaymentCondition` varchar(6) NOT NULL,
  `PriceList` varchar(6) NOT NULL,
  PRIMARY KEY (`DocId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocMaster`
--

LOCK TABLES `DocMaster` WRITE;
/*!40000 ALTER TABLE `DocMaster` DISABLE KEYS */;
INSERT INTO `DocMaster` VALUES ('000002','2021-01-18','21/000001','FAT','CONT','MENO10'),('000003','2021-01-20','21/000002','DDT','RIBA','MENO20'),('000004','2021-01-21','21/000003','FAT','ASS','STAND'),('000001','2021-01-22','21/000004','DDT','BON','STAND');
/*!40000 ALTER TABLE `DocMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocSummary`
--

DROP TABLE IF EXISTS `DocSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocSummary` (
  `DocId` varchar(10) NOT NULL,
  `GoodsAmount` float NOT NULL,
  `ServiceAmount` float NOT NULL,
  `RowsDiscount` float NOT NULL,
  `SummaryDiscount` float NOT NULL,
  `SummaryDiscountAmount` float NOT NULL,
  `TotalDiscount` float NOT NULL,
  `TotalTaxableAmount` float NOT NULL,
  `TotalTaxesAmount` float NOT NULL,
  `FinalAmount` float NOT NULL,
  PRIMARY KEY (`DocId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocSummary`
--

LOCK TABLES `DocSummary` WRITE;
/*!40000 ALTER TABLE `DocSummary` DISABLE KEYS */;
INSERT INTO `DocSummary` VALUES ('21/000001',2550,0,21.75,0,0,21.75,2528.25,556.215,3084.47);
/*!40000 ALTER TABLE `DocSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotti`
--

DROP TABLE IF EXISTS `prodotti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotti` (
  `nome` varchar(32) NOT NULL,
  `descrizione` varchar(128) NOT NULL,
  `categoria` varchar(32) NOT NULL,
  `prezzo` int(11) NOT NULL,
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotti`
--

LOCK TABLES `prodotti` WRITE;
/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` VALUES ('prova','asd','5',10,3),('grano','alimento ....','3',2,4),('asd','asd','2',4,5),('adasdas','sadasdas','8',4,6);
/*!40000 ALTER TABLE `prodotti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-27 11:08:51
