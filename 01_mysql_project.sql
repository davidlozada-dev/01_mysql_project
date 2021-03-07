-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.32-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for 01_mysql_project
CREATE DATABASE IF NOT EXISTS `01_mysql_project` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `01_mysql_project`;

-- Dumping structure for procedure 01_mysql_project.01_delete_audit
DELIMITER //
CREATE PROCEDURE `01_delete_audit`(IN affectedTable varchar(60))
BEGIN
INSERT INTO audit VALUES (CURRENT_USER(), CURRENT_TIMESTAMP(), affectedTable, 'DELETE');
END//
DELIMITER ;

-- Dumping structure for procedure 01_mysql_project.01_insert_audit
DELIMITER //
CREATE PROCEDURE `01_insert_audit`(IN affectedTable varchar(60))
BEGIN
INSERT INTO audit VALUES (CURRENT_USER(), CURRENT_TIMESTAMP(), affectedTable, 'INSERT');
END//
DELIMITER ;

-- Dumping structure for procedure 01_mysql_project.01_update_audit
DELIMITER //
CREATE PROCEDURE `01_update_audit`(IN affectedTable varchar(60))
BEGIN
INSERT INTO audit VALUES (CURRENT_USER(), CURRENT_TIMESTAMP(), affectedTable, 'UPDATE');
END//
DELIMITER ;

-- Dumping structure for table 01_mysql_project.audit
CREATE TABLE IF NOT EXISTS `audit` (
  `user` varchar(60) NOT NULL,
  `dateAndTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `affectedTable` varchar(60) NOT NULL,
  `eventType` enum('INSERT','UPDATE','DELETE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.audit: ~0 rows (approximately)
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `ID_cat` int(10) NOT NULL,
  `name_cat` varchar(60) NOT NULL,
  `description_cat` tinytext NOT NULL,
  `image_cat` blob NOT NULL,
  PRIMARY KEY (`ID_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.categories_backup
CREATE TABLE IF NOT EXISTS `categories_backup` (
  `ID_cat` int(10) DEFAULT NULL,
  `name_cat` varchar(60) DEFAULT NULL,
  `description_cat` tinytext,
  `image_cat` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.categories_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `categories_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_backup` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `ID_cli` int(10) NOT NULL,
  `companyName_cli` varchar(60) NOT NULL,
  `contactName_cli` varchar(60) NOT NULL,
  `contactCharge_cli` varchar(60) NOT NULL,
  `address_cli` varchar(60) NOT NULL,
  `city_cli` varchar(60) NOT NULL,
  `region_cli` varchar(60) NOT NULL,
  `postalCode_cli` int(20) NOT NULL,
  `country_cli` varchar(60) NOT NULL,
  `phoneNumber_cli` int(40) NOT NULL,
  `fax_cli` int(40) DEFAULT NULL,
  PRIMARY KEY (`ID_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.clients_backup
CREATE TABLE IF NOT EXISTS `clients_backup` (
  `ID_cli` int(10) DEFAULT NULL,
  `companyName_cli` varchar(60) DEFAULT NULL,
  `contactName_cli` varchar(60) DEFAULT NULL,
  `contactCharge_cli` varchar(60) DEFAULT NULL,
  `address_cli` varchar(60) DEFAULT NULL,
  `city_cli` varchar(60) DEFAULT NULL,
  `region_cli` varchar(60) DEFAULT NULL,
  `postalCode_cli` int(20) DEFAULT NULL,
  `country_cli` varchar(60) DEFAULT NULL,
  `phoneNumber_cli` int(40) DEFAULT NULL,
  `fax_cli` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.clients_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `clients_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_backup` ENABLE KEYS */;

-- Dumping structure for procedure 01_mysql_project.different_products_finder
DELIMITER //
CREATE PROCEDURE `different_products_finder`()
BEGIN SELECT DISTINCT name_pro FROM products; END//
DELIMITER ;

-- Dumping structure for table 01_mysql_project.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `ID_emp` int(10) NOT NULL,
  `lastName_emp` varchar(30) NOT NULL,
  `name_emp` varchar(30) NOT NULL,
  `charge_emp` varchar(60) NOT NULL,
  `title_emp` varchar(15) NOT NULL,
  `dateOfBirth_emp` date NOT NULL,
  `dateOfHiring_emp` date NOT NULL,
  `address_emp` varchar(60) NOT NULL,
  `city_emp` varchar(60) NOT NULL,
  `region_emp` varchar(60) NOT NULL,
  `postalCode_emp` int(20) NOT NULL,
  `country_emp` varchar(60) NOT NULL,
  `phoneNumber_emp` int(40) NOT NULL,
  `extensionNumber_emp` int(10) NOT NULL,
  `photo_emp` blob NOT NULL,
  `note_emp` tinytext,
  `supervisor_emp` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.employees: ~0 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.employees_backup
CREATE TABLE IF NOT EXISTS `employees_backup` (
  `ID_emp` int(10) DEFAULT NULL,
  `lastName_emp` varchar(30) DEFAULT NULL,
  `name_emp` varchar(30) DEFAULT NULL,
  `charge_emp` varchar(30) DEFAULT NULL,
  `title_emp` varchar(15) DEFAULT NULL,
  `dateOfBirth_emp` date DEFAULT NULL,
  `dateOfHiring_emp` date DEFAULT NULL,
  `address_emp` varchar(60) DEFAULT NULL,
  `city_emp` varchar(60) DEFAULT NULL,
  `region_emp` varchar(60) DEFAULT NULL,
  `postalCode_emp` int(20) DEFAULT NULL,
  `country_emp` varchar(60) DEFAULT NULL,
  `phoneNumber_emp` int(40) DEFAULT NULL,
  `extensionNumber_emp` int(10) DEFAULT NULL,
  `photo_emp` blob,
  `note_emp` tinytext,
  `supervisor_emp` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.employees_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `employees_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_backup` ENABLE KEYS */;

-- Dumping structure for procedure 01_mysql_project.employees_finder_by_full_name
DELIMITER //
CREATE PROCEDURE `employees_finder_by_full_name`(IN name varchar(30), IN lastName varchar(30))
BEGIN SELECT * FROM employees WHERE name_emp LIKE concat('%', name, '%') AND lastName_emp LIKE concat('%', lastName, '%'); 
END//
DELIMITER ;

-- Dumping structure for procedure 01_mysql_project.employees_finder_by_last_name
DELIMITER //
CREATE PROCEDURE `employees_finder_by_last_name`(IN lastName varchar(30))
BEGIN SELECT * FROM employees WHERE lastName_emp LIKE concat('%', lastName, '%'); 
END//
DELIMITER ;

-- Dumping structure for procedure 01_mysql_project.employees_finder_by_name
DELIMITER //
CREATE PROCEDURE `employees_finder_by_name`(IN name varchar(30))
BEGIN SELECT * FROM employees WHERE name_emp LIKE concat('%', name, '%'); 
END//
DELIMITER ;

-- Dumping structure for table 01_mysql_project.orderdetails
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `ID_ord` int(10) NOT NULL,
  `ID_pro` int(10) NOT NULL,
  `unitPrice_pro` decimal(22,2) NOT NULL,
  `quantity_det` int(11) NOT NULL,
  `discount_det` int(3) DEFAULT NULL,
  KEY `ID_pro` (`ID_pro`),
  KEY `ID_ord` (`ID_ord`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`ID_pro`) REFERENCES `products` (`ID_pro`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ID_pro`) REFERENCES `products` (`ID_pro`) ON DELETE CASCADE,
  CONSTRAINT `orderdetails_ibfk_3` FOREIGN KEY (`ID_ord`) REFERENCES `orders` (`ID_ord`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.orderdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `ID_ord` int(10) NOT NULL,
  `ID_cli` int(10) NOT NULL,
  `ID_emp` int(10) NOT NULL,
  `orderDate_ord` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `arrivalDate_ord` date NOT NULL,
  `departureDate_ord` date NOT NULL,
  `ID_shi` int(10) NOT NULL,
  `charge_ord` varchar(60) NOT NULL,
  `clientName_ord` varchar(60) NOT NULL,
  `clientAddress_ord` varchar(60) NOT NULL,
  `clientCity_ord` varchar(60) NOT NULL,
  `clientRegion_ord` varchar(60) NOT NULL,
  `clientPostalCode_ord` int(20) NOT NULL,
  `clientCountry_ord` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_ord`),
  KEY `ID_cli` (`ID_cli`),
  KEY `ID_emp` (`ID_emp`),
  KEY `ID_shi` (`ID_shi`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_cli`) REFERENCES `clients` (`ID_cli`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ID_emp`) REFERENCES `employees` (`ID_emp`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ID_shi`) REFERENCES `shippingcompanies` (`ID_shi`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.orders_backup
CREATE TABLE IF NOT EXISTS `orders_backup` (
  `ID_ord` int(10) DEFAULT NULL,
  `ID_cli` int(10) DEFAULT NULL,
  `ID_emp` int(10) DEFAULT NULL,
  `orderDate_ord` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `arrivalDate_ord` date DEFAULT NULL,
  `departureDate_ord` date DEFAULT NULL,
  `ID_shi` int(10) DEFAULT NULL,
  `charge_ord` varchar(60) DEFAULT NULL,
  `clientName_ord` varchar(60) DEFAULT NULL,
  `clientAddress_ord` varchar(60) DEFAULT NULL,
  `clientCity_ord` varchar(60) DEFAULT NULL,
  `clientRegion_ord` varchar(60) DEFAULT NULL,
  `clientPostalCode_ord` int(20) DEFAULT NULL,
  `clientCountry_ord` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.orders_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_backup` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.products
CREATE TABLE IF NOT EXISTS `products` (
  `ID_pro` int(10) NOT NULL,
  `name_pro` varchar(60) NOT NULL,
  `ID_sup` int(10) NOT NULL,
  `ID_cat` int(10) NOT NULL,
  `unit_pro` int(11) NOT NULL,
  `unitPrice_pro` decimal(22,2) NOT NULL,
  `unitAvailability_pro` int(11) NOT NULL,
  `unitOrder_pro` int(11) NOT NULL,
  `statusOrder_pro` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`ID_pro`),
  KEY `ID_cat` (`ID_cat`),
  KEY `ID_sup` (`ID_sup`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ID_sup`) REFERENCES `suppliers` (`ID_sup`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`ID_cat`) REFERENCES `categories` (`ID_cat`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`ID_sup`) REFERENCES `suppliers` (`ID_sup`) ON DELETE CASCADE,
  CONSTRAINT `products_ibfk_4` FOREIGN KEY (`ID_sup`) REFERENCES `suppliers` (`ID_sup`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.products_backup
CREATE TABLE IF NOT EXISTS `products_backup` (
  `ID_pro` int(10) DEFAULT NULL,
  `name_pro` varchar(60) DEFAULT NULL,
  `ID_sup` int(10) DEFAULT NULL,
  `ID_cat` int(10) DEFAULT NULL,
  `unit_pro` int(11) DEFAULT NULL,
  `unitPrice_pro` decimal(22,2) DEFAULT NULL,
  `unitAvailability_pro` int(11) DEFAULT NULL,
  `unitOrder_pro` int(11) DEFAULT NULL,
  `statusOrder_pro` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.products_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `products_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_backup` ENABLE KEYS */;

-- Dumping structure for procedure 01_mysql_project.products_between_given_prices
DELIMITER //
CREATE PROCEDURE `products_between_given_prices`(IN val1 decimal(22,2),IN val2 decimal(22,2))
BEGIN SELECT * FROM products WHERE unitPrice_pro between val1 AND val2; 
END//
DELIMITER ;

-- Dumping structure for table 01_mysql_project.products_logs
CREATE TABLE IF NOT EXISTS `products_logs` (
  `ID_pro` int(10) DEFAULT NULL,
  `unitPrice_pro` decimal(22,2) DEFAULT NULL,
  `orderDate_ord` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.products_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `products_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_logs` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.products_temporary
CREATE TABLE IF NOT EXISTS `products_temporary` (
  `ID_pro` int(10) DEFAULT NULL,
  `date_temp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unitAvailability_pro` int(10) DEFAULT NULL,
  `event_temp` enum('INSERT','UPDATE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.products_temporary: ~0 rows (approximately)
/*!40000 ALTER TABLE `products_temporary` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_temporary` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.shippingcompanies
CREATE TABLE IF NOT EXISTS `shippingcompanies` (
  `ID_shi` int(10) NOT NULL,
  `name_shi` varchar(60) NOT NULL,
  `phoneNumber_shi` int(40) NOT NULL,
  PRIMARY KEY (`ID_shi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.shippingcompanies: ~0 rows (approximately)
/*!40000 ALTER TABLE `shippingcompanies` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippingcompanies` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.shippingcompanies_backup
CREATE TABLE IF NOT EXISTS `shippingcompanies_backup` (
  `ID_ship` int(10) DEFAULT NULL,
  `name_shi` varchar(60) DEFAULT NULL,
  `phoneNumber_shi` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.shippingcompanies_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `shippingcompanies_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippingcompanies_backup` ENABLE KEYS */;

-- Dumping structure for procedure 01_mysql_project.show_all_suppliers_with_and_without_products_related
DELIMITER //
CREATE PROCEDURE `show_all_suppliers_with_and_without_products_related`()
BEGIN SELECT DISTINCT suppliers.ID_sup, name_sup FROM suppliers LEFT JOIN products ON suppliers.ID_sup = products.ID_sup;
END//
DELIMITER ;

-- Dumping structure for procedure 01_mysql_project.show_categories_with_products
DELIMITER //
CREATE PROCEDURE `show_categories_with_products`()
BEGIN SELECT * FROM categories INNER JOIN products ON categories.ID_cat = products.ID_cat; 
END//
DELIMITER ;

-- Dumping structure for procedure 01_mysql_project.show_employees_by_country
DELIMITER //
CREATE PROCEDURE `show_employees_by_country`()
BEGIN SELECT country_emp AS country, COUNT(ID_emp) AS numberOfEmployees FROM employees GROUP BY country_emp HAVING numberOfEmployees >= 5; 
END//
DELIMITER ; 

-- Dumping structure for table 01_mysql_project.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `ID_sup` int(10) NOT NULL,
  `name_sup` varchar(60) NOT NULL,
  `contactName_sup` varchar(60) NOT NULL,
  `contactCharge_sup` varchar(60) NOT NULL,
  `address_sup` varchar(60) NOT NULL,
  `city_sup` varchar(60) NOT NULL,
  `region_sup` varchar(60) NOT NULL,
  `postalCode_sup` int(20) NOT NULL,
  `country_sup` varchar(60) NOT NULL,
  `phoneNumber_sup` int(40) NOT NULL,
  `fax_sup` int(40) DEFAULT NULL,
  `webPage_sup` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_sup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.suppliers: ~0 rows (approximately)
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

-- Dumping structure for table 01_mysql_project.suppliers_backup
CREATE TABLE IF NOT EXISTS `suppliers_backup` (
  `ID_sup` int(10) DEFAULT NULL,
  `name_sup` varchar(60) DEFAULT NULL,
  `contactName_sup` varchar(60) DEFAULT NULL,
  `contactCharge_sup` varchar(60) DEFAULT NULL,
  `address_sup` varchar(60) DEFAULT NULL,
  `city_sup` varchar(60) DEFAULT NULL,
  `region_sup` varchar(60) DEFAULT NULL,
  `postalCode_sup` int(20) DEFAULT NULL,
  `country_sup` varchar(60) DEFAULT NULL,
  `phoneNumber_sup` int(40) DEFAULT NULL,
  `fax_sup` int(40) DEFAULT NULL,
  `webPage_sup` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 01_mysql_project.suppliers_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `suppliers_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers_backup` ENABLE KEYS */;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_categories
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_categories BEFORE DELETE ON categories FOR EACH ROW BEGIN CALL 01_delete_audit('categories'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_clients
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_clients BEFORE DELETE ON clients FOR EACH ROW BEGIN CALL 01_delete_audit('clients'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_employees
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_employees BEFORE DELETE ON employees FOR EACH ROW BEGIN CALL 01_delete_audit('employees'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_orders
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_orders BEFORE DELETE ON orders FOR EACH ROW BEGIN CALL 01_delete_audit('orders'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_products BEFORE DELETE ON products FOR EACH ROW BEGIN CALL 01_delete_audit('products'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_shippingcompanies
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_shippingcompanies BEFORE DELETE ON shippingcompanies FOR EACH ROW BEGIN CALL 01_delete_audit('shippingcompanies'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_delete_trigger_on_suppliers
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_delete_trigger_on_suppliers BEFORE DELETE ON suppliers FOR EACH ROW BEGIN CALL 01_delete_audit('suppliers'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_categories
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_categories BEFORE INSERT ON categories FOR EACH ROW BEGIN CALL 01_insert_audit('categories'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_clients
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_clients BEFORE INSERT ON clients FOR EACH ROW BEGIN CALL 01_insert_audit('clients'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_employees
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_employees BEFORE INSERT ON employees FOR EACH ROW BEGIN CALL 01_insert_audit('employees'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_orders
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_orders BEFORE INSERT ON orders FOR EACH ROW BEGIN CALL 01_insert_audit('orders'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_products BEFORE INSERT ON products FOR EACH ROW BEGIN CALL 01_insert_audit('products'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_shippingcompanies
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_shippingcompanies BEFORE INSERT ON shippingcompanies FOR EACH ROW BEGIN CALL 01_insert_audit('shippingcompanies'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_insert_trigger_on_suppliers
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_insert_trigger_on_suppliers BEFORE INSERT ON suppliers FOR EACH ROW BEGIN CALL 01_insert_audit('suppliers'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_categories
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_categories BEFORE UPDATE ON categories FOR EACH ROW BEGIN CALL 01_update_audit('categories'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_clients
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_clients BEFORE UPDATE ON clients FOR EACH ROW BEGIN CALL 01_update_audit('clients'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_employees
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_employees BEFORE UPDATE ON employees FOR EACH ROW BEGIN CALL 01_update_audit('employees'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_orders
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_orders BEFORE UPDATE ON orders FOR EACH ROW BEGIN CALL 01_update_audit('orders'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_products BEFORE UPDATE ON products FOR EACH ROW BEGIN CALL 01_update_audit('products'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_shippingcompanies
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_shippingcompanies BEFORE UPDATE ON shippingcompanies FOR EACH ROW BEGIN CALL 01_update_audit('shippingcompanies'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.01_update_trigger_on_suppliers
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 01_update_trigger_on_suppliers BEFORE UPDATE ON suppliers FOR EACH ROW BEGIN CALL 01_update_audit('suppliers'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_categories
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 02_stop_delete_on_categories BEFORE DELETE ON categories FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_cat) FROM products WHERE ID_cat = OLD.ID_cat); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_clients
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `02_stop_delete_on_clients` BEFORE DELETE ON `clients` FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_cli) FROM orders WHERE ID_cli = OLD.ID_cli); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_employees
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `02_stop_delete_on_employees` BEFORE DELETE ON `employees` FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_emp) FROM orders WHERE ID_emp = OLD.ID_emp); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_orders
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `02_stop_delete_on_orders` BEFORE DELETE ON `orders` FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_ord) FROM orderdetails WHERE ID_ord = OLD.ID_ord); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `02_stop_delete_on_products` BEFORE DELETE ON `products` FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_pro) FROM orderdetails WHERE ID_pro = OLD.ID_pro); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_shippingcompanies
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `02_stop_delete_on_shippingcompanies` BEFORE DELETE ON `shippingcompanies` FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_shi) FROM orders WHERE ID_shi = OLD.ID_shi); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.02_stop_delete_on_suppliers
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `02_stop_delete_on_suppliers` BEFORE DELETE ON `suppliers` FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_sup) FROM products WHERE ID_sup = OLD.ID_sup); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_categories
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_categories BEFORE DELETE ON categories FOR EACH ROW BEGIN INSERT INTO categories_backup VALUES(old.ID_cat, old.name_cat, old.description_cat, old.image_cat); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_clients
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_clients BEFORE DELETE ON clients FOR EACH ROW BEGIN INSERT INTO clients_backup VALUES(old.ID_cli, old.companyName_cli, old.contactName_cli, old.contactCharge_cli, old.address_cli, old.city_cli, old.region_cli, old.postalCode_cli, old.country_cli, old.phoneNumber_cli, old.fax_cli); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_employees
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_employees BEFORE DELETE ON employees FOR EACH ROW BEGIN INSERT INTO employees_backup VALUES(old.ID_emp, old.lastName_emp, old.name_emp, old.charge_emp, old.title_emp, old.dateOfBirth_emp, old.dateOfHiring_emp, old.address_emp, old.city_emp, old.region_emp, old.postalCode_emp, old.country_emp, old.phoneNumber_emp, old.extensionNumber_emp, old.photo_emp, old.note_emp, old.supervisor_emp); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_orders
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_orders BEFORE DELETE ON orders FOR EACH ROW BEGIN INSERT INTO orders_backup VALUES(old.ID_ord, old.ID_cli, old.ID_emp, old.orderDate_ord, old.arrivalDate_ord, old.departureDate_ord, old.ID_shi, old.charge_ord, old.clientName_ord, old.clientAddress_ord, old.clientCity_ord, old.clientRegion_ord, old.clientPostalCode_ord, old.clientCountry_ord); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_products BEFORE DELETE ON products FOR EACH ROW BEGIN INSERT INTO products_backup VALUES(old.ID_pro, old.name_pro, old.ID_sup, old.ID_cat, old.unit_pro, old.unitPrice_pro, old.unitAvailability_pro, old.unitOrder_pro, old.statusOrder_pro); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_shippingcompanies
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_shippingcompanies BEFORE DELETE ON shippingcompanies FOR EACH ROW BEGIN INSERT INTO shippingcompanies_backup VALUES(old.ID_shi, old.name_shi, old.phoneNumber_shi); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.03_backup_trigger_on_suppliers
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 03_backup_trigger_on_suppliers BEFORE DELETE ON suppliers FOR EACH ROW BEGIN INSERT INTO suppliers_backup VALUES(old.ID_sup, old.name_sup, old.contactName_sup, old.contactCharge_sup, old.address_sup, old.city_sup, old.region_sup, old.postalCode_sup, old.country_sup, old.phoneNumber_sup, old.fax_sup, old.webPage_sup); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.04_insert_new_unit_availability_trigger_on_orderdetails
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `04_insert_new_unit_availability_trigger_on_orderdetails` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN UPDATE products SET products.unitAvailability_pro = products.unitAvailability_pro - NEW.quantity_det WHERE products.ID_pro = NEW.ID_pro; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.04_insert_record_in_products_logs_trigger_on_orderdetails
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER 04_insert_record_in_products_logs_trigger_on_orderdetails BEFORE INSERT ON orderdetails FOR EACH ROW BEGIN INSERT INTO products_logs VALUES(new.ID_pro, new.unitPrice_pro, CURRENT_TIMESTAMP()); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.05_insert_trigger_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `05_insert_trigger_on_products` BEFORE INSERT ON `products` FOR EACH ROW BEGIN IF new.statusOrder_pro != 'inactive' THEN INSERT INTO products_temporary VALUES (new.ID_pro, CURRENT_TIMESTAMP(), new.unitAvailability_pro, 'INSERT'); END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for TRIGGER 01_mysql_project.05_update_trigger_on_products
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `05_update_trigger_on_products` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN IF old.statusOrder_pro != 'inactive' THEN INSERT INTO products_temporary VALUES (old.ID_pro, CURRENT_TIMESTAMP(), old.unitAvailability_pro, 'UPDATE'); END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
