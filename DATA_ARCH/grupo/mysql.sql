-- MySQL dump 10.13  Distrib 5.7.43, for osx10.18 (x86_64)
--
-- Host: localhost    Database: sapataria
-- ------------------------------------------------------
-- Server version    5.7.43

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cep` char(8) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefones` varchar(255) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES 
('01234567890','Fernanda Ramos','Avenida Atlântica, 707, Apartamento 45','22021010','fernanda.ramos@r7.com','11987654330'),
('12345678901','João Silva','Avenida Paulista, 123, Apartamento 45','01311000','joao.silva@dominiobr.com','11987654321'),
('23456789012','Maria Souza','Rua das Flores, 456, Casa 2','04038000','maria.souza@gmail.com','11987654322'),
('34567890123','Carlos Lima','Avenida Rio Branco, 789, Sala 301','20090003','carlos.lima@yahoo.com','11987654323'),
('45678901234','Ana Oliveira','Rua XV de Novembro, 101, Bloco B','80020200','ana.oliveira@outlook.com','11987654324'),
('56789012345','Pedro Santos','Rua Amazonas, 202, Casa 10','69005300','pedro.santos@hotmail.com','11987654325'),
('67890123456','Beatriz Costa','Rua das Palmeiras, 303, Apartamento 15','29140018','beatriz.costa@uol.com.br','11987654326'),
('78901234567','Marcos Pereira','Avenida Brasil, 404, Apartamento 1102','30140071','marcos.pereira@terra.com.br','11987654327'),
('89012345678','Paula Almeida','Rua dos Andradas, 505, Cobertura','90020002','paula.almeida@bol.com.br','11987654328'),
('90123456789','Ricardo Barbosa','Rua da Praia, 606, Casa 3','29010110','ricardo.barbosa@globo.com','11987654329');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cpf_cliente` char(11) NOT NULL,
  `codigo_produto` int(10) unsigned NOT NULL,
  `itens` varchar(255) NOT NULL,
  `qtdes` smallint(5) unsigned NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_pedidos_clientes` (`cpf_cliente`),
  KEY `fk_pedidos_produtos` (`codigo_produto`),
  CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`cpf_cliente`) REFERENCES `clientes` (`cpf`),
  CONSTRAINT `fk_pedidos_produtos` FOREIGN KEY (`codigo_produto`) REFERENCES `produtos` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES 
(1,'12345678901',1,'Tênis Esportivo',1,299.90),
(2,'23456789012',2,'Sapato Social',1,199.90),
(3,'34567890123',3,'Sapatilha',1,149.90),
(4,'45678901234',4,'Sandália',2,79.90),
(5,'56789012345',5,'Bota',1,499.90),
(6,'67890123456',6,'Chinelo',3,39.90),
(7,'78901234567',7,'Tênis Casual',1,259.90),
(8,'89012345678',8,'Mocassim',1,189.90),
(9,'90123456789',9,'Tênis Esportivo',1,349.90),
(10,'01234567890',10,'Sapato Social',1,179.90);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `cor` set('preto','branco','azul','vermelho','verde','amarelo','roxo','laranja','cinza','marrom','rosa','prata','dourado') NOT NULL,
  `tam` set('20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50') NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES 
(1,'Tênis Esportivo','Running X','Nike','preto,branco,azul','42,43,44,45,46'),
(2,'Sapato Social','Elegant','Ferracini','marrom,preto,cinza','40,41,42,43'),
(3,'Sapatilha','Ballet','Pampili','rosa,branco,prata','36,37,38,39'),
(4,'Sandália','Summer Breeze','Havaianas','azul,verde,amarelo,branco','38,39,40,41,42'),
(5,'Bota','Adventure','Timberland','marrom,preto,verde','43,44,45,46,47'),
(6,'Chinelo','Beach','Havaianas','amarelo,laranja,azul,verde','39,40,41,42,43'),
(7,'Tênis Casual','Street','Adidas','branco,preto,cinza,vermelho','41,42,43,44,45'),
(8,'Mocassim','Comfort','Moleca','preto,marrom,cinza,roxo','37,38,39,40,41'),
(9,'Tênis Esportivo','Active','Asics','vermelho,branco,azul,prata','44,45,46,47,48'),
(10,'Sapato Social','Classic','Vizzano','preto,marrom,cinza,dourado','40,41,42,43,44,45');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-01 19:21:04
