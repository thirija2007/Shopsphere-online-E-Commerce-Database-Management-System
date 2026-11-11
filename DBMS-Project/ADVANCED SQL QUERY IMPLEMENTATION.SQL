SQL> SELECT Order_ID, Customer_ID, Total_Amount
  2       FROM Orders
  3       WHERE Total_Amount > (SELECT AVG(Total_Amount)
  4                             FROM Orders);

  ORDER_ID CUSTOMER_ID TOTAL_AMOUNT
---------- ----------- ------------
      1002         102         2499
      1004         104         3598

SQL> SELECT Customer_ID, Customer_Name
  2       FROM Customer
  3       WHERE Customer_ID IN (SELECT Customer_ID
  4                             FROM Orders);

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
        101 Arun Kumar
        102 Priya Sharma
        103 Rahul Raj
        104 Divya Sri

SQL> SELECT Product_ID, Product_Name, Price
  2       FROM Product
  3       WHERE Price > (SELECT AVG(Price)
  4                      FROM Product);

PRODUCT_ID PRODUCT_NAME                                            PRICE
---------- -------------------------------------------------- ----------
       101 Laptop                                                  45000
       104 Mobile Phone                                            18000

SQL> SELECT C.Customer_ID, C.Customer_Name
  2       FROM Customer C
  3       WHERE EXISTS (SELECT 1
  4                     FROM Orders O
  5                     WHERE O.Customer_ID = C.Customer_ID);

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
        101 Arun Kumar
        102 Priya Sharma
        103 Rahul Raj
        104 Divya Sri

SQL> SELECT Product_ID,
  2              Product_Name,
  3              Price
  4       FROM Product
  5       WHERE Price > (SELECT AVG(Price)
  6                      FROM Product)
  7       ORDER BY Price DESC;

PRODUCT_ID PRODUCT_NAME                                            PRICE
---------- -------------------------------------------------- ----------
       101 Laptop                                                  45000
       104 Mobile Phone                                            18000

SQL> SELECT C.Customer_ID,
  2              C.Customer_Name,
  3              SUM(O.Total_Amount) AS Total_Purchase
  4       FROM Customer C
  5       JOIN Orders O
  6       ON C.Customer_ID = O.Customer_ID
  7       GROUP BY C.Customer_ID, C.Customer_Name
  8       HAVING SUM(O.Total_Amount) =
  9       (SELECT MAX(Customer_Total)
 10        FROM (SELECT SUM(Total_Amount) AS Customer_Total
 11              FROM Orders
 12              GROUP BY Customer_ID));

CUSTOMER_ID CUSTOMER_NAME                                      TOTAL_PURCHASE
----------- -------------------------------------------------- --------------
        104 Divya Sri                                                    3598

SQL> SELECT DISTINCT C.Customer_ID,
  2                       C.Customer_Name
  3       FROM Customer C
  4       JOIN Orders O
  5       ON C.Customer_ID = O.Customer_ID
  6       WHERE O.Total_Amount > (SELECT AVG(Total_Amount)
  7                               FROM Orders)
  8       ORDER BY C.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
        102 Priya Sharma
        104 Divya Sri

SQL> SELECT P.Product_ID,
  2              P.Product_Name,
  3              SUM(OD.Quantity * OD.Unit_Price) AS Total_Sales
  4       FROM Product P
  5       JOIN Order_Details OD
  6       ON P.Product_ID = OD.Product_ID
  7       GROUP BY P.Product_ID, P.Product_Name
  8       HAVING SUM(OD.Quantity * OD.Unit_Price) >
  9       (SELECT AVG(Product_Sales)
 10        FROM (SELECT SUM(Quantity * Unit_Price) AS Product_Sales
 11              FROM Order_Details
 12              GROUP BY Product_ID))
 13       ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME                                       TOTAL_SALES
---------- -------------------------------------------------- -----------
       104 Mobile Phone                                              4947
       102 Mouse                                                     2499

SQL> SELECT C.Customer_ID,
  2              C.Customer_Name,
  3              COUNT(O.Order_ID) AS Number_Of_Orders,
  4              NVL(SUM(O.Total_Amount), 0) AS Total_Purchase,
  5              NVL(ROUND(AVG(O.Total_Amount), 2), 0) AS Average_Order_Value
  6       FROM Customer C
  7       LEFT JOIN Orders O
  8       ON C.Customer_ID = O.Customer_ID
  9       GROUP BY C.Customer_ID, C.Customer_Name
 10       ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME                                      NUMBER_OF_ORDERS
----------- -------------------------------------------------- ----------------
TOTAL_PURCHASE AVERAGE_ORDER_VALUE
-------------- -------------------
        104 Divya Sri                                                         1
          3598                3598

        102 Priya Sharma                                                      1
          2499                2499

        101 Arun Kumar                                                        1
          1499                1499


CUSTOMER_ID CUSTOMER_NAME                                      NUMBER_OF_ORDERS
----------- -------------------------------------------------- ----------------
TOTAL_PURCHASE AVERAGE_ORDER_VALUE
-------------- -------------------
        103 Rahul Raj                                                         1
           899                 899

        105 Karthik S                                                         0
             0                   0


SQL> SELECT P.Product_ID,
  2              P.Product_Name,
  3              COUNT(DISTINCT OD.Order_ID) AS Number_Of_Orders,
  4              NVL(SUM(OD.Quantity), 0) AS Total_Quantity_Sold,
  5              NVL(SUM(OD.Quantity * OD.Unit_Price), 0) AS Total_Sales,
  6              NVL(ROUND(AVG(OD.Unit_Price), 2), 0) AS Average_Selling_Price
  7       FROM Product P
  8       LEFT JOIN Order_Details OD
  9       ON P.Product_ID = OD.Product_ID
 10       GROUP BY P.Product_ID, P.Product_Name
 11       ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME                                       NUMBER_OF_ORDERS
---------- -------------------------------------------------- ----------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_SELLING_PRICE
------------------- ----------- ---------------------
       104 Mobile Phone                                                      1
                  3        4947                  1649

       102 Mouse                                                             1
                  1        2499                  2499

       101 Laptop                                                            1
                  1        1499                  1499


PRODUCT_ID PRODUCT_NAME                                       NUMBER_OF_ORDERS
---------- -------------------------------------------------- ----------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_SELLING_PRICE
------------------- ----------- ---------------------
       103 Keyboard                                                          1
                  1         899                   899

       105 Headphones                                                        0
                  0           0                     0


SQL> SELECT C.Category_ID,
  2              C.Category_Name,
  3              COUNT(DISTINCT P.Product_ID) AS Total_Products,
  4              NVL(SUM(OD.Quantity), 0) AS Total_Quantity_Sold,
  5              NVL(SUM(OD.Quantity * OD.Unit_Price), 0) AS Total_Sales
  6       FROM Category C
  7       JOIN Product P
  8       ON C.Category_ID = P.Category_ID
  9       LEFT JOIN Order_Details OD
 10       ON P.Product_ID = OD.Product_ID
 11       GROUP BY C.Category_ID, C.Category_Name
 12       ORDER BY Total_Sales DESC;

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
TOTAL_PRODUCTS TOTAL_QUANTITY_SOLD TOTAL_SALES
-------------- ------------------- -----------
          1
Electronics
             5                   6        9844

