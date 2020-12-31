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

CREATE SCHEMA IF NOT EXISTS gofish;
-- schema created

DROP TABLE IF EXISTS `products` ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products`(
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45) NOT NULL,
    `price` INT(11) NOT NULL,
    `stock` INT(11) NOT NULL,
    `event_time` DATETIME NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
/*!40101 SET character_set_client = @saved_cs_client */;

alter table products auto_increment=1000000;
INSERT INTO `products` VALUES (1000000,'Red Snapper',20,1000,'2020-12-31 00:00:00');

-- products created and seeded

DROP TABLE IF EXISTS `transaction_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `event_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

alter table transaction_products auto_increment=2000000;
INSERT INTO `gofish`.`transaction_products` (`id`, `transaction_id`, `product_id`, `product_qty`, `event_time`) VALUES ('2000000', '3000000', '1000000', '20', '2020-12-31 00:00:00');

-- transaction_products created and seeded

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
    `customer_transaction_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `event_time` DATETIME NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
/*!40101 SET character_set_client = @saved_cs_client */;

alter table transactions auto_increment=3000000;
INSERT INTO `gofish`.`transactions` (`customer_transaction_id`, `event_time`) VALUES ('3000000', '2020-12-31 00:00:00');

-- transactions created and seeded
