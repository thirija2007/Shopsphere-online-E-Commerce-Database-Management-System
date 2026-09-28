CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

Table created.

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount)
VALUES
(1001, 101, DATE '2026-09-15', 1499.00);

1 row created.

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount)
VALUES
(1002, 102, DATE '2026-09-16', 2499.00);

1 row created.

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount)
VALUES
(1003, 103, DATE '2026-09-17', 899.00);

1 row created.

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount)
VALUES
(1004, 104, DATE '2026-09-18', 3298.00);

1 row created.

SELECT * FROM Orders;

  ORDER_ID CUSTOMER_ID ORDER_DATE TOTAL_AMOUNT
---------- ----------- ---------- ------------
      1001         101 15-SEP-26      1499.00
      1002         102 16-SEP-26      2499.00
      1003         103 17-SEP-26       899.00
      1004         104 18-SEP-26      3298.00

4 rows selected.

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price NUMBER(10,2) NOT NULL,
    Subtotal NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_orderdetails_order
        FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),
    CONSTRAINT fk_orderdetails_product
        FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

Table created.

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Unit_Price, Subtotal)
VALUES
(1, 1001, 101, 1, 1499.00, 1499.00);

1 row created.

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Unit_Price, Subtotal)
VALUES
(2, 1002, 102, 1, 2499.00, 2499.00);

1 row created.

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Unit_Price, Subtotal)
VALUES
(3, 1003, 103, 1, 899.00, 899.00);

1 row created.

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Unit_Price, Subtotal)
VALUES
(4, 1004, 104, 2, 1649.00, 3298.00);

1 row created.

SELECT * FROM Order_Details;

ORDER_DETAIL_ID   ORDER_ID PRODUCT_ID   QUANTITY UNIT_PRICE   SUBTOTAL
---------------- ---------- ---------- ---------- ---------- ----------
               1       1001        101          1    1499.00    1499.00
               2       1002        102          1    2499.00    2499.00
               3       1003        103          1     899.00     899.00
               4       1004        104          2    1649.00    3298.00

4 rows selected.

UPDATE Orders
SET Total_Amount = 3598.00
WHERE Order_ID = 1004;

1 row updated.

UPDATE Orders
SET Order_Date = DATE '2026-09-20'
WHERE Order_ID = 1003;

1 row updated.

UPDATE Order_Details
SET Quantity = 3,
    Subtotal = Quantity * Unit_Price
WHERE Order_Detail_ID = 4;

1 row updated.

SELECT * FROM Orders;

  ORDER_ID CUSTOMER_ID ORDER_DATE TOTAL_AMOUNT
---------- ----------- ---------- ------------
      1001         101 15-SEP-26      1499.00
      1002         102 16-SEP-26      2499.00
      1003         103 20-SEP-26       899.00
      1004         104 18-SEP-26      3598.00

4 rows selected.

SELECT * FROM Order_Details;

ORDER_DETAIL_ID   ORDER_ID PRODUCT_ID   QUANTITY UNIT_PRICE   SUBTOTAL
---------------- ---------- ---------- ---------- ---------- ----------
               1       1001        101          1    1499.00    1499.00
               2       1002        102          1    2499.00    2499.00
               3       1003        103          1     899.00     899.00
               4       1004        104          3    1649.00    4947.00

4 rows selected.

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    od.Product_ID,
    od.Quantity,
    od.Unit_Price,
    od.Subtotal
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
ORDER BY c.Customer_ID, o.Order_Date;

CUSTOMER_ID CUSTOMER_NAME       ORDER_ID ORDER_DATE PRODUCT_ID   QUANTITY
----------- ------------------- -------- ---------- ---------- ----------
UNIT_PRICE   SUBTOTAL
---------- ----------
        101 <Customer Name>         1001 15-SEP-26        101          1
   1499.00    1499.00

        102 <Customer Name>         1002 16-SEP-26        102          1
   2499.00    2499.00

        103 <Customer Name>         1003 20-SEP-26        103          1
    899.00     899.00

        104 <Customer Name>         1004 18-SEP-26        104          3
   1649.00    4947.00

4 rows selected.

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Spending
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME       TOTAL_ORDERS TOTAL_SPENDING
----------- ------------------- ------------ --------------
        101 <Customer Name>                1        1499.00
        102 <Customer Name>                1        2499.00
        103 <Customer Name>                1         899.00
        104 <Customer Name>                1        3598.00

4 rows selected.

