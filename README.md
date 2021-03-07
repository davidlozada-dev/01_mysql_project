# 01_mysql_project

## Index

1. Introduction

	1.Motivation behind the project

	2.Database schemes

1. Tecnhical aspects

	1.Stored procedures
	
	2.Triggers

1. License & Copyright
1. Contributors


## 1 Introduction

#### 1.1 Motivation behind the project

The main purpose of the present project is to put into practice the knowledge about designing and creating a MySQL relational database.
In order to do that the whole project takes as requeriments the ones given by a fictional company, which needs to keep track of the data that is inserted, updated and deleted from the regular entities present in database, as well as, it needs to put certain rules to keep the integrity of the data.

#### 1.2 Database schemes 
##### Related tables
The 1st scheme shows the tables that are in the database and how they are related to each other.
	
![01 scheme](https://raw.githubusercontent.com/davidlozada-dev/01_mysql_project/master/img/01_mysql_project_db_scheme_01.png)

##### Non-related tables
The 2nd scheme shows the tables that are not related in the database, these tables are mostly used for backup and audit purposes.

![02 scheme](https://raw.githubusercontent.com/davidlozada-dev/01_mysql_project/master/img/01_mysql_project_db_scheme_02.png)

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