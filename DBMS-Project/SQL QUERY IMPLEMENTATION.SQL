SELECT * FROM Product;

-- OUTPUT:
-- PRODUCT_ID  PRODUCT_NAME  PRICE  CATEGORY_ID
-- 101         Laptop        45000  101
-- 102         Mouse           500  102
-- 103         Keyboard       1200  102
-- 104         Mobile Phone  18000  103
-- 105         Headphones      800  104


SELECT Product_ID, Product_Name, Price
FROM Product;

-- OUTPUT:
-- 101  Laptop        45000
-- 102  Mouse           500
-- 103  Keyboard       1200
-- 104  Mobile Phone  18000
-- 105  Headphones      800


SELECT *
FROM Product
WHERE Price < 1000;

-- OUTPUT:
-- 102  Mouse       500  102
-- 105  Headphones  800  104


SELECT *
FROM Product
WHERE Price > 100;

-- OUTPUT:
-- All five products are displayed.


SELECT *
FROM Product
ORDER BY Price ASC;

-- OUTPUT:
-- 102  Mouse         500
-- 105  Headphones    800
-- 103  Keyboard     1200
-- 104  Mobile Phone 18000
-- 101  Laptop       45000


SELECT *
FROM Product
ORDER BY Price DESC;

-- OUTPUT:
-- 101  Laptop       45000
-- 104  Mobile Phone 18000
-- 103  Keyboard      1200
-- 105  Headphones     800
-- 102  Mouse          500


SELECT DISTINCT Category_ID
FROM Product
ORDER BY Category_ID;

-- OUTPUT:
-- 101
-- 102
-- 103
-- 104


FROM Product
WHERE Price BETWEEN 100 AND 1000;

-- OUTPUT:
-- 102  Mouse       500
-- 105  Headphones  800


SELECT *
FROM Product
WHERE Category_ID = 101;

-- OUTPUT:
-- 101  Laptop  45000  101


SELECT P.Product_ID, P.Product_Name, I.Quantity
FROM Product P
JOIN Inventory I
ON P.Product_ID = I.Product_ID
WHERE I.Quantity > 0;

-- OUTPUT:
-- 101  Laptop        10
-- 102  Mouse         20
-- 103  Keyboard      15
-- 104  Mobile Phone   8
-- 105  Headphones    12


SELECT * FROM Customer;

-- OUTPUT:
-- 101  Arun Kumar    Chennai     30000
-- 102  Priya Sharma  Chennai     33000
-- 103  Rahul Raj     Coimbatore  35000
-- 104  Divya Sri     Chennai     32000
-- 105  Karthik S     Madurai     30000


SELECT *
FROM Customer
WHERE Customer_ID = 101;

-- OUTPUT:
-- Arun Kumar, Customer_ID 101


SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > 500;

-- OUTPUT:
-- 101  Laptop        45000
-- 103  Keyboard       1200
-- 104  Mobile Phone  18000
-- 105  Headphones      800


SELECT *
FROM Product
WHERE Price > 500
AND Price < 2000;

-- OUTPUT:
-- 103  Keyboard    1200  102
-- 105  Headphones   800  104


SELECT *
FROM Product
WHERE Category_ID = 101
OR Category_ID = 102;

-- OUTPUT:
-- Laptop, Mouse, Keyboard


SELECT *
FROM Product
WHERE Category_ID IN (101, 102, 103);

-- OUTPUT:
-- Laptop, Mouse, Keyboard, Mobile Phone


SELECT *
FROM Product
WHERE Price BETWEEN 1000 AND 5000;

-- OUTPUT:
-- 103  Keyboard  1200  102


SELECT C.Customer_ID, C.Customer_Name, O.Order_ID
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- OUTPUT:
-- 101  Arun Kumar    1001
-- 102  Priya Sharma  1002
-- 103  Rahul Raj     1003
-- 104  Divya Sri     1004


SELECT Product_ID, Order_ID
FROM Order_Details;

-- OUTPUT:
-- 101  1001
-- 102  1002
-- 103  1003
-- 104  1004


SELECT C.Customer_ID, C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;

-- OUTPUT:
-- 101  Arun Kumar     1
-- 102  Priya Sharma   1
-- 103  Rahul Raj      1
-- 104  Divya Sri      1
-- 105  Karthik S      0


SELECT C.Customer_ID, C.Customer_Name,
       SUM(O.Total_Amount) AS Total_Purchase
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;

-- OUTPUT:
-- 101  Arun Kumar     1499
-- 102  Priya Sharma   2499
-- 103  Rahul Raj       899
-- 104  Divya Sri      3598


SELECT Customer_ID, COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Customer_ID
ORDER BY Customer_ID;

-- OUTPUT:
-- 101  1
-- 102  1
-- 103  1
-- 104  1


SELECT Product_ID, COUNT(*) AS Total_Records
FROM Order_Details
GROUP BY Product_ID
ORDER BY Product_ID;

-- OUTPUT:
-- 101  1
-- 102  1
-- 103  1
-- 104  1
