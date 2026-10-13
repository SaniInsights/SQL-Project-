# Online Food Delivery System

## 1. Project Overview

The Online Food Delivery System is a database management project developed using MySQL. It is designed to manage the basic operations of an online food delivery platform, including customer information, restaurant details, food items, customer orders, and order items.

The project demonstrates how a relational database can organize and manage information efficiently. It uses SQL queries to retrieve, filter, analyze, and summarize data related to food delivery operations.

## 2. Problem Statement

Managing customers, restaurants, food menus, and orders manually can be time-consuming and may lead to data duplication and errors. A structured database system is required to store related information, maintain relationships between records, and generate useful business insights.

This project provides a database solution for managing food delivery data and analyzing order details using SQL.

## 3. Objectives

* To design a relational database for an online food delivery system.
* To store and manage customer details.
* To maintain restaurant information and ratings.
* To manage food items, categories, and prices.
* To record customer orders and order details.
* To establish relationships between tables using primary and foreign keys.
* To retrieve data using SQL queries.
* To perform calculations using aggregate functions.
* To analyze sales, revenue, customer activity, and restaurant performance.
* To practice SQL joins, subqueries, conditional statements, and window functions.

## 4. Technologies Used

* **Database:** MySQL
* **Query Language:** SQL
* **Development Tool:** MySQL Workbench

## 5. Database Design

The project uses five relational tables.

### 5.1 CUSTOMERS

This table stores customer information.

**Columns:**

* `CustomerID` — Unique identifier for each customer.
* `CustomerName` — Name of the customer.
* `Email` — Customer's email address.
* `Phone` — Customer's phone number.
* `City` — Customer's city.

**Primary Key:** `CustomerID`

### 5.2 RESTAURANTS

This table stores information about restaurants.

**Columns:**

* `restaurantID` — Unique restaurant identifier.
* `restaurantName` — Name of the restaurant.
* `Cuisine` — Type of cuisine offered.
* `rating` — Restaurant rating between 1 and 5.
* `City` — Restaurant location.

**Primary Key:** `restaurantID`

### 5.3 FOOD_ITEMS

This table stores menu items offered by restaurants.

**Columns:**

* `foodID` — Unique food item identifier.
* `restaurantID` — Restaurant associated with the food item.
* `FoodName` — Name of the food item.
* `category` — Category of the food item.
* `Price` — Price of the food item.

**Primary Key:** `foodID`
**Foreign Key:** `restaurantID` references `RESTAURANTS(restaurantID)`.

### 5.4 ORDERS

This table stores customer order information.

**Columns:**

* `OrderID` — Unique order identifier.
* `CustomerID` — Customer who placed the order.
* `Order_Date` — Date the order was placed.
* `total_amount` — Total amount recorded for the order.
* `status` — Current order status.

**Primary Key:** `OrderID`
**Foreign Key:** `CustomerID` references `CUSTOMERS(CustomerID)`.

### 5.5 ORDER_ITEMS

This table stores the food items associated with individual orders.

**Columns:**

* `Order_ItemID` — Unique order-item identifier.
* `OrderID` — Associated order.
* `FoodID` — Ordered food item.
* `Quantity` — Number of units ordered.

**Primary Key:** `Order_ItemID`
**Foreign Keys:**

* `OrderID` references `ORDERS(OrderID)`.
* `FoodID` references `FOOD_ITEMS(foodID)`.

## 6. Database Relationships

The project uses primary keys and foreign keys to establish relationships between tables.

* One customer can place multiple orders.
* One restaurant can offer multiple food items.
* One order can contain multiple order items.
* One food item can appear in multiple order items.

These relationships help maintain referential integrity and connect related information across the database.

## 7. SQL Concepts Implemented

### 7.1 Data Definition Language (DDL)

DDL commands define the database structure.

Examples:

* `CREATE DATABASE`
* `CREATE TABLE`

### 7.2 Data Manipulation Language (DML)

DML commands insert and manipulate records.

Example:

* `INSERT INTO`

### 7.3 Data Query Language

The `SELECT` statement retrieves information from database tables.

Examples include displaying all customers, finding restaurants by city, and retrieving food items above a specified price.

### 7.4 WHERE Clause

The `WHERE` clause filters records according to specified conditions.

Examples:

* Finding customers from Pune.
* Displaying orders with Delivered status.
* Finding food items priced above ₹200.

### 7.5 Aggregate Functions

Aggregate functions perform calculations on multiple records.

Functions used:

* `COUNT()` — Counts records.
* `SUM()` — Calculates totals.
* `AVG()` — Calculates averages.
* `MAX()` — Finds the maximum value.
* `MIN()` — Finds the minimum value.

### 7.6 GROUP BY

The `GROUP BY` clause groups records sharing a common value.

Examples:

* Counting customers in each city.
* Counting orders by status.
* Calculating average restaurant ratings by city.
* Calculating average food prices by category.

### 7.7 ORDER BY and LIMIT

`ORDER BY` sorts query results, while `LIMIT` restricts the number of returned rows.

These clauses are used to identify the most expensive food items and find the highest-value results.

### 7.8 Joins

Joins combine related records from multiple tables.

The project uses joins to:

* Display customer names with order details.
* Display restaurant names with their food items.
* Retrieve customer, order, food, and quantity information together.
* Analyze restaurant sales.

### 7.9 CASE Statement

The `CASE` statement categorizes records based on specified conditions.

The project uses it to classify:

* Orders by total amount.
* Restaurants by rating.
* Food items by price.
* Customers by city.
* Orders by status.

### 7.10 Window Functions

Window functions perform calculations across related rows without collapsing them into a single row per group.

Functions used:

* `RANK()` — Ranks food items by price.
* `DENSE_RANK()` — Ranks restaurants by rating.
* `ROW_NUMBER()` — Assigns sequential row numbers.
* `AVG() OVER()` — Displays the overall average order amount alongside individual order records.
* `SUM() OVER()` — Demonstrates running-total calculations.

### 7.11 Business Analysis Queries

The project includes queries to investigate:

* Which customer has spent the most money.
* Which restaurant has generated the highest sales.
* Which food item has been ordered the most.
* Which category generates the highest revenue.
* The average order value.
* The percentage of cancelled orders.
* Food items that have never been ordered.

These queries demonstrate how SQL can support basic business analysis and decision-making.

## 8. How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open the `sql project.sql` file.
4. Execute the database creation statement.
5. Execute the table creation statements.
6. Execute the INSERT statements to populate the tables.
7. Run the SELECT queries individually or in suitable groups.
8. Review the results displayed in MySQL Workbench.

**Important:** Execute the database and table creation statements before running queries that depend on those tables. If you have already created the database and inserted the data, avoid rerunning the setup statements without checking whether the tables or records already exist.

## 9. Applications

The database design and SQL concepts demonstrated in this project can be applied to:

* Online food ordering platforms.
* Restaurant management systems.
* Food menu management.
* Customer order tracking.
* Restaurant performance analysis.
* Sales and revenue reporting.
* Basic business intelligence and database analytics.

## 10. Future Scope

The project can be extended with additional features, such as:

* Customer registration and authentication.
* Restaurant and menu management.
* Order placement and cancellation workflows.
* Delivery partner management.
* Payment tracking.
* Customer reviews and feedback.
* Discounts and coupon management.
* Inventory tracking.
* More advanced sales reports and dashboards.
* Integration with a web or mobile application.

These are possible future enhancements; they are not implemented in the current SQL script.

## 11. Conclusion

The Online Food Delivery System project demonstrates the use of MySQL to design and query a relational database. It organizes customer, restaurant, food, and order information into related tables and uses SQL to retrieve and analyze that information.

Through this project, practical experience is gained in table creation, data insertion, filtering, aggregate functions, grouping, joins, conditional statements, and window functions.

The project also demonstrates how database queries can answer useful business questions about customers, orders, food items, restaurant performance, and sales. It provides a foundation for developing a more complete food delivery management application in the future.

## 12. Project Files

* `sql project.sql` — SQL script containing database creation, table definitions, sample data, and analysis queries.
* `README.md` — Project overview, objectives, database structure, SQL concepts, setup instructions, applications, and future scope.
