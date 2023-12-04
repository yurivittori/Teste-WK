-- MySQL dump 10.13  Distrib 5.7.44, for Win32 (AMD64)
--
-- Host: localhost    Database: vendas
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
-- Table structure for table `sequencia`
--

DROP TABLE IF EXISTS `sequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequencia` (
  `codigoPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequencia`
--

LOCK TABLES `sequencia` WRITE;
/*!40000 ALTER TABLE `sequencia` DISABLE KEYS */;
INSERT INTO `sequencia` VALUES (1);
/*!40000 ALTER TABLE `sequencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES (1,'HUGO LEITE','RIBEIRAO PRETO','SP'),(2,'MARIA SILVA','SAO PAULO','SP'),(3,'JOAO PEREIRA','CAMPINAS','SP'),(4,'ANA CARVALHO','RIO DE JANEIRO','RJ'),(5,'LUCAS OLIVEIRA','BELO HORIZONTE','MG'),(6,'FERNANDA SANTOS','BRASILIA','DF'),(7,'GABRIEL FERREIRA','SALVADOR','BA'),(8,'ISABELA ALMEIDA','PORTO ALEGRE','RS'),(9,'MARCOS MARTINS','RECIFE','PE'),(10,'CAROLINA RODRIGUES','CURITIBA','PR'),(11,'PEDRO PEREIRA','FORTALEZA','CE'),(12,'LARISSA LIMA','MANAUS','AM'),(13,'RICARDO ALVES','NATAL','RN'),(14,'BEATRIZ COSTA','JOAO PESSOA','PB'),(15,'RAFAEL RAMOS','CAMPO GRANDE','MS'),(16,'VIVIANE SOUSA','TERESINA','PI'),(17,'DIEGO MENEZES','GOIANIA','GO'),(18,'ALICE SILVEIRA','ARACAJU','SE'),(19,'BRUNO FERNANDES','MACEIO','AL'),(20,'GISELE CASTRO','FLORIANOPOLIS','SC');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_det_pedidos`
--

DROP TABLE IF EXISTS `tb_det_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_det_pedidos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `CodProduto` int(11) DEFAULT NULL,
  `Quant` int(11) DEFAULT NULL,
  `vl_unit` decimal(15,2) DEFAULT NULL,
  `vl_total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tb_det_pedidos_codigo_tb_pedidos` (`codigo`),
  KEY `fk_tb_det_pedidos_codproduto_tb_produtos` (`CodProduto`),
  CONSTRAINT `fk_tb_det_pedidos_codigo_tb_pedidos` FOREIGN KEY (`codigo`) REFERENCES `tb_pedidos` (`codigo`),
  CONSTRAINT `fk_tb_det_pedidos_codproduto_tb_produtos` FOREIGN KEY (`CodProduto`) REFERENCES `tb_produtos` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_det_pedidos`
--

LOCK TABLES `tb_det_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_det_pedidos` DISABLE KEYS */;
INSERT INTO `tb_det_pedidos` VALUES (1,1,1,5,5.99,29.95),(2,1,10,6,2.49,14.94),(3,1,12,3,5.25,15.75);
/*!40000 ALTER TABLE `tb_det_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedidos`
--

DROP TABLE IF EXISTS `tb_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedidos` (
  `codigo` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `codCliente` int(11) DEFAULT NULL,
  `vl_total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `FK_tb_pedidos_codcliente_tb_clientes` FOREIGN KEY (`codigo`) REFERENCES `tb_clientes` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedidos`
--

LOCK TABLES `tb_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_pedidos` DISABLE KEYS */;
INSERT INTO `tb_pedidos` VALUES (1,'2023-12-03',2,60.64);
/*!40000 ALTER TABLE `tb_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produtos`
--

DROP TABLE IF EXISTS `tb_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produtos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `vl_venda` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produtos`
--

LOCK TABLES `tb_produtos` WRITE;
/*!40000 ALTER TABLE `tb_produtos` DISABLE KEYS */;
INSERT INTO `tb_produtos` VALUES (1,'DETERGENTE NITRO',5.99),(2,'SABONETE LUX',3.49),(3,'PAPEL HIGIÊNICO MACIO',8.99),(4,'SHAMPOO REPARADOR',12.50),(5,'SACO DE LIXO 50L',4.75),(6,'ESPONJA DE AÇO',2.29),(7,'AMACIANTE SUAVE',7.99),(8,'DENTIFRÍCIO BRANQUEADOR',6.25),(9,'PAPEL TOALHA EXTRA ABSORVENTE',9.50),(10,'SAL REFINADO 1KG',2.49),(11,'CERVEJA LAGER 350ML',3.99),(12,'AZEITONAS VERDES 250G',5.25),(13,'BISCOITO DE CHOCOLATE',4.79),(14,'CENOURA ORGÂNICA',1.99),(15,'IOGURTE NATURAL 500ML',3.95),(16,'MAIONESE LIGHT 200G',2.75),(17,'CAFÉ MOÍDO 250G',8.50),(18,'QUEIJO MUÇARELA FATIADO 200G',6.99),(19,'PÃO INTEGRAL',4.25),(20,'MOLHO DE TOMATE CASEIRO',4.49),(21,'BANANA CATURRA (kg)',2.29),(22,'FILE DE PEITO DE FRANGO 1KG',15.99),(23,'MACARRÃO ESPAGUETE 500G',2.89),(24,'ARROZ PARBOILIZADO 5KG',12.50),(25,'LEITE INTEGRAL 1L',3.29),(26,'VINAGRE DE MAÇÃ',4.99),(27,'CATCHUP 350G',3.75),(28,'MOLHO DE SOJA 150ML',5.25),(29,'ERVILHAS ENLATADAS 200G',2.49),(30,'LIMPADOR MULTIUSO',6.49),(31,'ALFACE CRESPA',1.79),(32,'BARRA DE CEREAL',1.99),(33,'CERVEJA ARTESANAL IPA 500ML',9.99),(34,'SUCO DE LARANJA 1L',4.50);
/*!40000 ALTER TABLE `tb_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04  0:00:10
