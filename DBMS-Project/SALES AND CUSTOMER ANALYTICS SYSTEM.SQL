SQL> SELECT COUNT(Order_ID) AS Total_Orders FROM Orders;

TOTAL_ORDERS
------------
           4

SQL> SELECT SUM(Total_Amount) AS Total_Sales FROM Orders;

TOTAL_SALES
-----------
       8495

SQL> SELECT AVG(Total_Amount) AS Average_Order_Amount FROM Orders;

AVERAGE_ORDER_AMOUNT
--------------------
             2123.75

SQL> SELECT MIN(Total_Amount) AS Minimum_Order FROM Orders;

MINIMUM_ORDER
-------------
          899

SQL> SELECT MAX(Total_Amount) AS Maximum_Order FROM Orders;

MAXIMUM_ORDER
-------------
         3598

SQL> SELECT
  2      COUNT(Order_ID) AS Total_Orders,
  3      SUM(Total_Amount) AS Total_Sales,
  4      AVG(Total_Amount) AS Average_Order_Value,
  5      MIN(Total_Amount) AS Minimum_Order,
  6      MAX(Total_Amount) AS Maximum_Order
  7  FROM Orders;

TOTAL_ORDERS TOTAL_SALES AVERAGE_ORDER_VALUE MINIMUM_ORDER MAXIMUM_ORDER
------------ ----------- ------------------- ------------- -------------
           4        8495             2123.75           899          3598

SQL> SELECT
  2      C.Customer_ID,
  3      C.Customer_Name,
  4      SUM(O.Total_Amount) AS Total_Purchase
  5  FROM Customer C
  6  JOIN Orders O
  7  ON C.Customer_ID = O.Customer_ID
  8  GROUP BY C.Customer_ID, C.Customer_Name
  9  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME TOTAL_PURCHASE
----------- ------------- --------------
        104 Divya Sri              3598
        102 Priya Sharma           2499
        101 Arun Kumar             1499
        103 Rahul Raj               899

SQL> SELECT
  2      C.Customer_ID,
  3      C.Customer_Name,
  4      SUM(O.Total_Amount) AS Total_Purchase
  5  FROM Customer C
  6  JOIN Orders O
  7  ON C.Customer_ID = O.Customer_ID
  8  GROUP BY C.Customer_ID, C.Customer_Name
  9  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME TOTAL_PURCHASE
----------- ------------- --------------
        104 Divya Sri              3598
        102 Priya Sharma           2499
        101 Arun Kumar             1499
        103 Rahul Raj               899

SQL> SELECT
  2      P.Product_ID,
  3      P.Product_Name,
  4      SUM(OD.Quantity) AS Total_Quantity_Sold
  5  FROM Product P
  6  JOIN Order_Details OD
  7  ON P.Product_ID = OD.Product_ID
  8  GROUP BY P.Product_ID, P.Product_Name
  9  ORDER BY Total_Quantity_Sold DESC;

PRODUCT_ID PRODUCT_NAME  TOTAL_QUANTITY_SOLD
---------- ------------- -------------------
       104 Mobile Phone                   3
       103 Keyboard                       1
       101 Laptop                         1
       102 Mouse                          1

SQL> SELECT
  2      P.Product_ID,
  3      P.Product_Name,
  4      SUM(OD.Quantity) AS Total_Quantity_Sold,
  5      SUM(OD.Quantity * OD.Unit_Price) AS Total_Sales
  6  FROM Product P
  7  JOIN Order_Details OD
  8  ON P.Product_ID = OD.Product_ID
  9  GROUP BY P.Product_ID, P.Product_Name
 10  ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME  TOTAL_QUANTITY_SOLD TOTAL_SALES
---------- ------------- ------------------- -----------
       104 Mobile Phone                   3        4947
       102 Mouse                          1        2499
       101 Laptop                         1        1499
       103 Keyboard                       1         899

SQL> SELECT
  2      C.Category_ID,
  3      C.Category_Name,
  4      SUM(OD.Quantity) AS Total_Quantity_Sold,
  5      SUM(OD.Quantity * OD.Unit_Price) AS Total_Sales
  6  FROM Category C
  7  JOIN Product P
  8  ON C.Category_ID = P.Category_ID
  9  JOIN Order_Details OD
 10  ON P.Product_ID = OD.Product_ID
 11  GROUP BY C.Category_ID, C.Category_Name
 12  ORDER BY Total_Sales DESC;

CATEGORY_ID CATEGORY_NAME     TOTAL_QUANTITY_SOLD TOTAL_SALES
----------- ----------------- ------------------- -----------
          1 Electronics                        6        9844

