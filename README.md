# 01_mysql_project

__Project's status: *finished*__ :heavy_check_mark:

## Index

1. [Introduction](#1-Introduction)
 
	1.[Motivation behind the project](#11-Motivation-behind-the-project)

	2.[Naming convention](#12-Naming-convention)

	3.[Database schemas](#13-Database-schemas )

1. [Technical aspects](#2-Technical-aspects)

	1.[Stored procedures](#21-Stored-procedures)
	
	2.[Triggers](#22-Triggers)

1. [Contributors](#Contributors)


## 1 Introduction

### 1.1 Motivation behind the project

The main purpose of the present project is to put into practice the knowledge about designing and creating a MySQL relational database.
In order to do that the whole project takes as requeriments the ones given by a fictional company, which needs to keep track of the data that is inserted, updated and deleted from the regular entities present in database, as well as, it needs to put certain rules to keep the integrity of the data. Also, to make this development more interesting all the SQL statements are created and run in the __MySQL Command-Line__, and the resulting database is exported as a sql file with __HeidiSQL__.

#### Technologies/tools used for this project
	
	1. Dia
	2. HeidiSQL
	3. MySQL

### 1.2 Naming convention

1. The __table names__ are in plural and lowercase. 
	
	>E.g: *__users__*.

1. The __column names__ are fully human-readable, in order to make that possible the names are in singular and use camelCase naming practice followed by an underscore and then the first three letters of the table's name where each column belongs to. 
	
	>E.g: *__userName_use__*. This is a column that belongs to a table called "users".

1. The __primary key column names__ use as default name "ID" followed by an underscore and then the first three letters of the table's name where each primary key column belongs to.

	>E.g.: *__ID_use__*. This is a primary key column that belongs to a table called "users".

### 1.3 Database schemas 
#### Related tables
The 1st schema shows the tables that are in the database and how they are related to each other.
	
![01 schema](https://raw.githubusercontent.com/davidlozada-dev/01_mysql_project/master/img/01_mysql_project_db_schema_01.png)

#### Non-related tables
The 2nd schema shows the tables that are not related in the database, these tables are mostly used for backup and audit purposes.

![02 schema](https://raw.githubusercontent.com/davidlozada-dev/01_mysql_project/master/img/01_mysql_project_db_schema_02.png)

## 2 Technical aspects

### 2.1 Stored procedures

#### 01_delete_audit

The *01_delete_audit* procedure inserts into the __audit table__ data related to the 'delete' action taken by an user.

```SQL
DELIMITER //

CREATE PROCEDURE `01_delete_audit`(IN affectedTable varchar(60))
BEGIN
INSERT INTO audit VALUES (CURRENT_USER(), CURRENT_TIMESTAMP(), affectedTable, 'DELETE');
END//

DELIMITER ;
```
---

#### 01_insert_audit

The *01_insert_audit* procedure inserts into the __audit table__ data related to the 'insert' action taken by an user.

```SQL
DELIMITER //

CREATE PROCEDURE `01_insert_audit`(IN affectedTable varchar(60))
BEGIN
INSERT INTO audit VALUES (CURRENT_USER(), CURRENT_TIMESTAMP(), affectedTable, 'INSERT');
END//

DELIMITER ;
```

---

#### 01_update_audit

The *01_update_audit* procedure inserts into the __audit table__ data related to the 'update' action taken by an user.

```SQL
DELIMITER //

CREATE PROCEDURE `01_update_audit`(IN affectedTable varchar(60))
BEGIN
INSERT INTO audit VALUES (CURRENT_USER(), CURRENT_TIMESTAMP(), affectedTable, 'UPDATE');
END//

DELIMITER ;
```

---

#### different_products_finder

The *different_products_finder* procedure selects the different types of products by the 'name_pro' column from the __products table__.

```SQL
DELIMITER //

CREATE PROCEDURE `different_products_finder`()
BEGIN SELECT DISTINCT name_pro FROM products; 
END//

DELIMITER ;
```

---

#### employees_finder_by_full_name

The *employees_finder_by_full_name* procedure selects from the __employees table__ all the records that matches the full name given by the user.

```SQL
DELIMITER //

CREATE PROCEDURE `employees_finder_by_full_name`(IN name varchar(30), IN lastName varchar(30))
BEGIN SELECT * FROM employees WHERE name_emp LIKE concat('%', name, '%') AND lastName_emp LIKE concat('%', lastName, '%');
END//

DELIMITER ;
```

---

#### employees_finder_by_last_name

The *employees_finder_by_last_name* procedure selects from the __employees table__ all the records that matches the last name given by the user.

```SQL
DELIMITER //

CREATE PROCEDURE `employees_finder_by_last_name`(IN lastName varchar(30))
BEGIN SELECT * FROM employees WHERE lastName_emp LIKE concat('%', lastName, '%'); 
END//

DELIMITER ;
```

---

#### employees_finder_by_name

The *employees_finder_by_name* procedure selects from the __employees table__ all the records that matches the first name given by the user.

```SQL
DELIMITER //

CREATE PROCEDURE `employees_finder_by_name`(IN name varchar(30))
BEGIN SELECT * FROM employees WHERE name_emp LIKE concat('%', name, '%'); 
END//

DELIMITER ;
```

---

#### products_between_given_prices

The *products_between_given_prices* procedure selects all the products from the __products table__ that fit in a given price range by the user.

```SQL
DELIMITER //

CREATE PROCEDURE `products_between_given_prices`(IN val1 decimal(22,2),IN val2 decimal(22,2))
BEGIN SELECT * FROM products WHERE unitPrice_pro between val1 AND val2; 
END//

DELIMITER ;
```

---

#### show_all_suppliers_with_and_without_products_related

The *show_all_suppliers_with_and_without_products_related* procedure selects all the different suppliers from the __suppliers table__ no matter whether they have a related product to them.

```SQL
DELIMITER //

CREATE PROCEDURE `show_all_suppliers_with_and_without_products_related`()
BEGIN SELECT DISTINCT suppliers.ID_sup, name_sup FROM suppliers LEFT JOIN products ON suppliers.ID_sup = products.ID_sup;
END//

DELIMITER ;
```

---

#### show_categories_with_products

The *show_categories_with_products* procedure selects all the categories with related products to them from the __categories table__.

```SQL
DELIMITER //

CREATE PROCEDURE `show_categories_with_products`()
BEGIN SELECT * FROM categories INNER JOIN products ON categories.ID_cat = products.ID_cat; 
END//

DELIMITER ;
```

---

#### show_employees_by_country

The *show_employees_by_country* procedure selects the number of employees and groups them by country from the __employees table__ if there are at least 5 employees registered in that specific country.

```SQL
DELIMITER //

CREATE PROCEDURE `show_employees_by_country`()
BEGIN SELECT country_emp AS country, COUNT(ID_emp) AS numberOfEmployees FROM employees GROUP BY country_emp HAVING numberOfEmployees >= 5; 
END//

DELIMITER ;
```

---

### 2.2 Triggers

#### 01_delete_trigger_on_categories

The *01_delete_trigger_on_categories* trigger is a type of trigger that calls the stored procedure *01_delete_audit* and gives to it a parameter which is the name of the table where the trigger is on, in current case it is on the __categories table__. Also, this trigger structure is applied on all parent tables which are *suppliers, categories, products, clients, employees, shippingcompanies* and *orders*.

```SQL
DELIMITER //

CREATE TRIGGER 01_delete_trigger_on_categories BEFORE DELETE ON categories FOR EACH ROW BEGIN CALL 01_delete_audit('categories');
END//

DELIMITER ;
```

---
#### 01_insert_trigger_on_categories

The *01_insert_trigger_on_categories* trigger is a type of trigger that calls the stored procedure *01_insert_audit* and gives to it a parameter which is the name of the table where the trigger is on, in current case it is on the __categories table__. Also, this trigger structure is applied on all the parent tables which are *suppliers, categories, products, clients, employees, shippingcompanies* and *orders*.

```SQL
DELIMITER //

CREATE TRIGGER 01_insert_trigger_on_categories BEFORE INSERT ON categories FOR EACH ROW BEGIN CALL 01_insert_audit('categories'); 
END//

DELIMITER ;
```

---

#### 01_update_trigger_on_categories

The *01_update_trigger_on_categories* trigger is a type of trigger that calls the stored procedure *01_update_audit* and gives to it a parameter which is the name of the table where the trigger is on, in current case it is on the __categories table__. Also, this trigger structure is applied on all the parent tables which are *suppliers, categories, products, clients, employees, shippingcompanies* and *orders*.

```SQL
DELIMITER //

CREATE TRIGGER 01_update_trigger_on_categories BEFORE UPDATE ON categories FOR EACH ROW BEGIN CALL 01_update_audit('categories'); 
END//

DELIMITER ;
```

---

#### 02_stop_delete_on_categories

The *02_stop_delete_on_categories* trigger is a type of trigger that stops the 'delete' action of a record from a parent table whenever that record is linked to a child tables's record, in the current case the trigger is on the __categories table__. Also, this trigger structure is applied on all the parent tables which are *suppliers, categories, products, clients, employees, shippingcompanies* and *orders*.

```SQL
DELIMITER //

CREATE TRIGGER 02_stop_delete_on_categories BEFORE DELETE ON categories FOR EACH ROW BEGIN SET @children = (SELECT COUNT(ID_cat) FROM products WHERE ID_cat = OLD.ID_cat); IF @children > 0 THEN signal sqlstate '45000' SET message_text = 'DELETE action cancelled'; END IF; 
END//

DELIMITER ;
```

---

#### 03_backup_trigger_on_categories

The *03_backup_trigger_on_categories* trigger is a type of trigger that backups the record that is being deleted from a table by inserting the data stored in the columns into another table (backup table) that has the same colum data types, in the current case the trigger is on the __categories table__. Also, this trigger structure is applied (modifying certain fields in order to adapt it to each table's requirements) on all the parent tables which are *suppliers, categories, products, clients, employees, shippingcompanies* and *orders*.

```SQL
DELIMITER //

CREATE TRIGGER 03_backup_trigger_on_categories BEFORE DELETE ON categories FOR EACH ROW BEGIN INSERT INTO categories_backup VALUES(old.ID_cat, old.name_cat, old.description_cat, old.image_cat); 
END//

DELIMITER ;
```

---

#### 04_insert_new_unit_availability_trigger_on_orderdetails

The *04_insert_new_unit_availability_trigger_on_orderdetails* trigger is a type of trigger that updates the availability of a product after an order is taken.

```SQL
DELIMITER //

CREATE TRIGGER `04_insert_new_unit_availability_trigger_on_orderdetails` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN UPDATE products SET products.unitAvailability_pro = products.unitAvailability_pro - NEW.quantity_det WHERE products.ID_pro = NEW.ID_pro; 
END//

DELIMITER ;
```

---

#### 04_insert_record_in_products_logs_trigger_on_orderdetails

The *04_insert_record_in_products_logs_trigger_on_orderdetails* trigger is a type of trigger that keeps the track of the product logs after an order is taken.

```SQL
DELIMITER //

CREATE TRIGGER 04_insert_record_in_products_logs_trigger_on_orderdetails BEFORE INSERT ON orderdetails FOR EACH ROW BEGIN INSERT INTO products_logs VALUES(new.ID_pro, new.unitPrice_pro, CURRENT_TIMESTAMP()); 
END//

DELIMITER ;
```

---

#### 05_insert_trigger_on_products

The *05_insert_trigger_on_products* trigger is a type of trigger that inserts into a temporary table data that is related to the 'insert' action on the __products table__ taken by an user.

```SQL
DELIMITER //

CREATE TRIGGER `05_insert_trigger_on_products` BEFORE INSERT ON `products` FOR EACH ROW BEGIN IF new.statusOrder_pro != 'inactive' THEN INSERT INTO products_temporary VALUES (new.ID_pro, CURRENT_TIMESTAMP(), new.unitAvailability_pro, 'INSERT'); END IF; 
END//

DELIMITER ;
```

---

#### 05_update_trigger_on_products

The *05_update_trigger_on_products* trigger is a type of trigger that inserts into a temporary table data that is related to the 'update' action on the __products table__ taken by an user.


```SQL
DELIMITER //

CREATE TRIGGER `05_update_trigger_on_products` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN IF old.statusOrder_pro != 'inactive' THEN INSERT INTO products_temporary VALUES (old.ID_pro, CURRENT_TIMESTAMP(), old.unitAvailability_pro, 'UPDATE'); END IF; 
END//

DELIMITER ;
```

---

## Contributors

Copyright © 2021 __David Lozada__