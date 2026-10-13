CREATE DATABASE ONLINE_FOOD_DELIVERY_SYSTEM;
USE ONLINE_FOOD_DELIVERY_SYSTEM ;
CREATE TABLE CUSTOMERS(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(20),
Email VARCHAR(20),
Phone VARCHAR(10),
City VARCHAR(10)
);

CREATE TABLE RESTAURANTS(
restaurantID INT PRIMARY KEY,
restaurantName VARCHAR(20),
Cuisine VARCHAR(20),
rating DECIMAL(10,2) CHECK (rating BETWEEN 1 AND 5),
City VARCHAR(10)
);

CREATE TABLE FOOD_ITEMS(
foodID INT PRIMARY KEY,
restaurantID INT,
FoodName VARCHAR(20),
category VARCHAR(20),
Price DECIMAL(10,2) CHECK (Price > 0),
FOREIGN KEY (restaurantID) REFERENCES RESTAURANTS(restaurantID)
);

CREATE TABLE ORDERS(
OrderID INT PRIMARY KEY,
CustomerID INT,
Order_Date DATE,
total_amount DECIMAL(10,2) CHECK(total_amount>=0),
status VARCHAR(20),
FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
);

CREATE TABLE ORDER_ITEMS(
Order_ItemID INT PRIMARY KEY,
OrderID INT,
FoodID INT,
Quantity INT CHECK(Quantity>0),
FOREIGN KEY(OrderID) REFERENCES ORDERS(OrderID),
FOREIGN KEY (FoodID) REFERENCES FOOD_ITEMS(FoodID)
);

INSERT INTO CUSTOMERS VALUES
(1,'Rahul Sharma','rahul@gmail.com','9876543210','Pune'),
(2,'Priya Patil','priya@gmail.com','9876543211','Mumbai'),
(3,'Amit Joshi','amit@gmail.com','9876543212','Nashik'),
(4,'Sneha Kulkarni','sneha@gmail.com','9876543213','Pune'),
(5,'Rohan Deshmukh','rohan@gmail.com','9876543214','Nagpur'),
(6,'Neha More','neha@gmail.com','9876543215','Pune'),
(7,'Karan Shah','karan@gmail.com','9876543216','Mumbai'),
(8,'Pooja Jadhav','pooja@gmail.com','9876543217','Kolhapur'),
(9,'Vikas Patil','vikas@gmail.com','9876543218','Satara'),
(10,'Anjali Pawar','anjali@gmail.com','9876543219','Pune');

INSERT INTO RESTAURANTS VALUES
(101,'Pizza Hub','Italian',4.50,'Pune'),
(102,'Burger Point','Fast Food',4.20,'Mumbai'),
(103,'Spice Villa','Indian',4.70,'Pune'),
(104,'Chinese Bowl','Chinese',4.10,'Nagpur'),
(105,'South Express','South Indian',4.60,'Nashik'),
(106,'Food Palace','Multi Cuisine',4.30,'Pune'),
(107,'Tandoori House','Indian',4.40,'Mumbai'),
(108,'Cafe Delight','Cafe',4.80,'Pune'),
(109,'BBQ Nation','Barbecue',4.60,'Nagpur'),
(110,'Roll Express','Fast Food',4.00,'Nashik');

INSERT INTO FOOD_ITEMS VALUES
(201,101,'Margherita Pizza','Pizza',299.00),
(202,101,'Farmhouse Pizza','Pizza',399.00),
(203,102,'Veg Burger','Burger',149.00),
(204,102,'Cheese Burger','Burger',199.00),
(205,103,'Paneer Butter','Main Course',280.00),
(206,103,'Butter Naan','Bread',40.00),
(207,104,'Veg Noodles','Chinese',180.00),
(208,104,'Fried Rice','Chinese',200.00),
(209,105,'Masala Dosa','South Indian',120.00),
(210,105,'Idli Sambar','South Indian',90.00),
(211,106,'Veg Thali','Main Course',250.00),
(212,107,'Chicken Tikka','Starter',320.00),
(213,108,'Cold Coffee','Beverage',160.00),
(214,109,'BBQ Chicken','Barbecue',450.00),
(215,110,'Veg Roll','Fast Food',140.00);

INSERT INTO ORDERS VALUES
(301,1,'2026-07-01',449.00,'Delivered'),
(302,2,'2026-07-02',199.00,'Delivered'),
(303,3,'2026-07-03',320.00,'Pending'),
(304,4,'2026-07-04',280.00,'Delivered'),
(305,5,'2026-07-05',330.00,'Preparing'),
(306,6,'2026-07-06',120.00,'Delivered'),
(307,7,'2026-07-07',559.00,'Delivered'),
(308,8,'2026-07-08',200.00,'Cancelled'),
(309,9,'2026-07-09',360.00,'Preparing'),
(310,10,'2026-07-10',300.00,'Delivered');

INSERT INTO ORDER_ITEMS VALUES
(401,301,201,1),
(402,301,203,1),
(403,302,204,1),
(404,303,207,1),
(405,303,208,1),
(406,304,205,1),
(407,305,212,1),
(408,305,206,1),
(409,306,209,1),
(410,307,202,1),
(411,307,214,1),
(412,308,208,1),
(413,309,211,1),
(414,309,206,2),
(415,310,215,2);

USE ONLINE_FOOD_DELIVERY_SYSTEM ;

-- 1) Display all customers.

SELECT * FROM CUSTOMERS;
SELECT * FROM RESTAURANTS;
SELECT * FROM FOOD_ITEMS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_ITEMS;

-- 2) Display customer names and their cities.

SELECT CUSTOMERS.CustomerName,
CUSTOMERS.CITY
FROM CUSTOMERS;

-- 3)Find all customers from Pune.

SELECT CUSTOMERS.CustomerName
FROM CUSTOMERS
WHERE CITY = "PUNE";

-- 4)  Display all restaurants located in Mumbai.
SELECT RESTAURANTS.restaurantName
FROM RESTAURANTS
WHERE CITY = "MUMBAI";

-- 5) Display all food items with price greater than ₹200.
SELECT * FROM  FOOD_ITEMS
WHERE PRICE >200;

-- 6) Find all restaurants with rating greater than 4.5.

SELECT *  FROM RESTAURANTS
WHERE RATING > 4.5;

-- 7) Display all orders with status Delivered.
SELECT * FROM ORDERS
WHERE STATUS = "DELIVERED";

-- 8) Find orders placed after 2026-07-05.

SELECT * FROM ORDERS
WHERE Order_Date > '2026-07-05';

-- 9)Display all food items belonging to the Pizza category.
 SELECT FOODNAME FROM FOOD_ITEMS
 WHERE category = "PIZZA";
 
 -- 10 ) Find the most expensive food item
 SELECT * FROM FOOD_ITEMS
 ORDER BY PRICE  DESC
 LIMIT 1;
 
 -- 11)Find the average restaurant rating.
 SELECT AVG(RATING) AS AVG_RATING
 FROM RESTAURANTS;
 
 -- 12) Find the maximum and minimum food price.
 SELECT MAX(PRICE) AS MAX_PRICE
 FROM FOOD_ITEMS;
 
 SELECT MIN(PRICE) AS MIN_PRICE
 FROM FOOD_ITEMS;
 
-- 13)Find the total number of customers.
SELECT COUNT(CUSTOMERID) AS TOTAL_NO_OF_CUSTOMERS
FROM CUSTOMERS;

-- 14)Find the total number of restaurants.
SELECT COUNT(RESTAURANTID) AS TOTAL_NO_OF_RESTAURANTS
FROM RESTAURANTS;

-- 15)Find the total sales amount from all orders.
SELECT SUM(TOTAL_AMOUNT) AS TOTAL_SALES
FROM ORDERS;

-- 16)Find the average order amount.
SELECT AVG(total_amount) AS AVG_O_AMOUNT
FROM ORDERS;

-- 17)Count how many orders are Delivered, Pending, Preparing, and Cancelled.
SELECT STATUS,COUNT(*) AS ORDER_COUNT
FROM ORDERS
GROUP BY STATUS;

-- 18)Display the top 5 most expensive food items.
SELECT * 
FROM FOOD_ITEMS
ORDER BY PRICE  DESC
LIMIT 5;

-- 19)Find customers whose name starts with P.
SELECT * 
FROM CUSTOMERS
WHERE CustomerName LIKE 'P%' ;

-- 20)Find restaurants whose rating is between 4.0 and 4.5.
SELECT * 
FROM RESTAURANTS
WHERE RATING BETWEEN 4 AND 4.5;

-- 21)Find the number of customers in each city.
SELECT CITY,COUNT(*) AS CUSTOMERS_COUNT
FROM CUSTOMERS
GROUP BY CITY;

-- 22)Find the number of restaurants in each city.
SELECT CITY, COUNT(*) AS RESTAURANTS_COUNT
FROM RESTAURANTS
GROUP BY CITY;

-- 23)Find the average restaurant rating for each city.
SELECT CITY,AVG(RATING) AS AVG_R_RATING
FROM RESTAURANTS
GROUP BY CITY;

-- 24)Find the number of food items in each category.
SELECT Category,count(*) as category_count
from FOOD_ITEMS
GROUP BY Category;

-- 25)Find the average food price for each category.
SELECT category,AVG(PRICE) AS FOOD_PRICE
FROM FOOD_ITEMS
GROUP BY CATEGORY;

-- 26)Display customer name + order date + order amount + order status.
SELECT C.CUSTOMERNAME,O.ORDER_DATE,
O.TOTAL_AMOUNT,O.STATUS
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMERID=O.CUSTOMERID;

-- 27)Display restaurant name + food name + category + price.
SELECT R.RESTAURANTNAME,FI.FOODNAME,
FI.CATEGORY,FI.PRICE
FROM RESTAURANTS R 
JOIN FOOD_ITEMS FI
ON R.RESTAURANTID=FI.RESTAURANTID;

-- 28)Display customer name + city + order amount.
SELECT C.CUSTOMERNAME,C.CITY,
O.TOTAL_AMOUNT
FROM CUSTOMERS C 
JOIN ORDERS O
ON C.CUSTOMERID=O.CUSTOMERID;

-- 29)Display order ID + customer name + food name + quantity.
SELECT O.OrderID,C.CUSTOMERNAME,
FI.FOODNAME,OI.QUANTITY
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMERID=O.CUSTOMERID
JOIN ORDER_ITEMS OI
ON OI.ORDERID=O.ORDERID
JOIN FOOD_ITEMS FI
ON FI.FOODID=OI.FOODID;
-- 30)Display customer name + restaurant name + food item + quantity.
SELECT
  C.CUSTOMERNAME,
  R.RESTAURANTNAME,
  F.FOODNAME,
  OI.QUANTITY
FROM CUSTOMERS c
INNER JOIN ORDERS o
ON c.CustomerID = o.CustomerID
INNER JOIN OREDER_ITEMS oi
ON o.OrderID = oi.OrderID
INNER JOIN FOOD_ITEMS f
ON oi.FoodID = f.FoodID
INNER JOIN RESTAURANTS r
ON f.RestaurantID = r.RestaurantID;

-- 31)Categorize orders as High, Medium, or Low based on TotalAmount.
SELECT Total_Amount,
CASE
	WHEN Total_Amount>=350 THEN 'HIGH'
    WHEN Total_Amount>=200 THEN 'MIDIUM'
    ELSE 'LOW'
    END AS Categorize_order
FROM ORDERS

-- 32)Categorize restaurants based on their rating.

SELECT RESTAURANTNAME,RATING, 
CASE
	WHEN rating>=4.5 THEN 'HIGH'
    WHEN rating>=3.5THEN 'MIDIUM'
    ELSE 'LOW'
    END AS Categorize_Rating
FROM RESTAURANTS;

-- 33)Categorize food items based on their price
SELECT FoodName,Price,
CASE
	WHEN Price>=350 THEN 'HIGH'
    WHEN Price>=250 THEN 'MIDIUM'
    ELSE 'LOW'
    END AS Categorize_Food_Items
FROM FOOD_ITEMS;

-- 34)Categorize customers based on their city.
SELECT CustomerName,City,
CASE
	WHEN City="MUMBAI" THEN 'economic_capital'
    WHEN city="PUNE" THEN 'high_tech_city'
    ELSE 'LOW_grade'
    END AS Categorize_City
FROM Customers;

-- 35)Classify orders as Completed, Cancelled, or In Progress based on status.
SELECT STATUS,
CASE
	WHEN STAUS="DELIVERED" THEN 'COMPLETED'
    WHEN STATUS="PENDING" THEN 'IN_PROGRESS'
    ELSE 'LOW_grade'
    END AS Categorize_City
FROM Customers;

-- 36)Rank food items by price from highest to lowest.
SELECT FOODNAME,PRICE,
RANK() OVER(ORDER BY PRICE DESC) AS PRICE_RANK
FROM FOOD_ITEMS;

-- 37)Rank restaurants by rating.
SELECT RESTAURANTNAME,RATING,
DENSE_RANK() OVER(ORDER BY RATING) AS RANK_RATING
FROM RESTAURANTS;

-- 38)Give each order a row number based on order date.
SELECT ORDERID,CUSTOMERID,Order_Date,Total_Amount,
ROW_NUMBER() OVER(ORDER BY ORDER_DATE) AS ROW_NO
FROM ORDERS;

-- 39)Display every order along with the overall average order amount.
SELECT Order_Date,Total_Amount,
AVG(total_amount) OVER() AS AVG_AMOUNT
FROM ORDERS;

-- 40)Calculate a running total of order amounts by date.
SELECT Order_Date,TOTAL_AMOUNT,
SUM(TOTAL_AMOUNT) OVER(ORDER BY TOTAL_AMOUNT ) AS RUNNING_TOTAL
FROM ORDERS;

-- 41)Which customer has spent the most money?
SELECT C.CUSTOMERNAME,
SUM(O.TOTAL_AMOUNT) AS SPENT
FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.Customerid=O.customerid
GROUP BY C.CUSTOMERNAME
ORDER BY SPENT DESC
LIMIT 1;


-- 42)Which restaurant has generated the highest sales?
SELECT R.RESTAURANTNAME,
SUM(OI.QUANTITY*FI.PRICE) AS SALES
FROM RESTAURANTS R
JOIN FOOD_ITEMS FI 
ON R.RESTAURANTID=FI.RESTAURANTID
JOIN ORDER_ITEMS OI
ON FI.FOODID=OI.FOODID
JOIN ORDERS O
ON  O.ORDERID=OI.ORDERID
GROUP BY R.RESTAURANTNAME
ORDER BY SALES DESC 
LIMIT 1;

-- 43)Which food item has been ordered the most?
SELECT FI.FOODNAME,
SUM(OI.QUANTITY) AS ORDERED_MOST
FROM FOOD_ITEMS FI
JOIN ORDER_ITEMS OI
ON FI.FOODID=OI.FOODID
JOIN ORDERS O
ON O.ORDERID=OI.ORDERID
GROUP BY FOODNAME
ORDER BY ORDERED_MOST DESC
LIMIT 1;

-- 44)Which category generates the highest revenue?
SELECT FI.CATEGORY,
SUM(OI.QUANTITY*FI.PRICE) AS HIGHEST_REVENUE
FROM FOOD_ITEMS FI
JOIN ORDER_ITEMS OI
ON FI.FOODID=OI.FOODID
GROUP BY CATEGORY
ORDER  BY HIGHEST_REVENUE DESC
LIMIT 1;

-- 45)Which city has the highest number of customers?
SELECT CUSTOMERNAME,CITY,
COUNT(*) AS CUSTOMERS_COUNT
FROM CUSTOMERS
GROUP BY CITY,CUSTOMERNAME
ORDER BY NO_CUSTOMERS
LIMIT 1;

-- 46)Which 5 restaurant has the highest-rated food items?
SELECT F.FOODNAME,R.RATING,R.RESTAURANTNAME,
MAX(RATING) AS HIGH_RATED
FROM RESTAURANTS R
JOIN FOOD_ITEMS F
ON R.RESTAURANTID=F.RESTAURANTID
GROUP BY FOODNAME,RESTAURANTNAME,RATING
LIMIT 5;


-- 47)What is the average order value?
SELECT AVG(TOTAL_AMOUNT) AS AVG_ORDER_VALUE
FROM ORDERS ;

-- 48)What percentage of orders are cancelled?
SELECT
    COUNT(CASE WHEN Status = 'Cancelled' THEN 1 END) * 100.0
    / COUNT(*) AS CancelledPercentage
FROM ORDERS;

-- 49Which customers have never placed an order?
SELECT C.CUSTOMERNAME,C.CUSTOMERID
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMERID=O.CUSTOMERID
WHERE C.CUSTOMERID IS NULL;

-- 50Which food items have never been ordered?
SELECT FI.FOODNAME ,FI.FOODID
FROM FOOD_ITEMS FI
LEFT JOIN ORDER_ITEMS OI
ON FI.FOODID=OI.FOODID
WHERE OI.FOODID IS NULL;

