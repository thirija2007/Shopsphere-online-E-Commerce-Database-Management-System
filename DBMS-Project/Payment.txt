CREATE TABLE Payment (
      Payment_ID INT PRIMARY KEY,
      Order_ID INT NOT NULL,
      Payment_Mode VARCHAR2(30) NOT NULL,
      Payment_Date DATE NOT NULL,
      Payment_Status VARCHAR2(20) NOT NULL,
      Payment_Amount NUMBER(10,2) NOT NULL,
        CONSTRAINT fk_payment_order
        FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);

Table created.

INSERT INTO Payment (Payment_ID, Order_ID, Payment_Mode, Payment_Date, Payment_Status, Payment_Amount)
VALUES (501, 1001, 'UPI', DATE '2026-09-15', 'Successful', 1499.00);

1 row created.

INSERT INTO Payment (Payment_ID, Order_ID, Payment_Mode, Payment_Date, Payment_Status, Payment_Amount)
VALUES (502, 1002, 'Credit Card', DATE '2026-09-16', 'Successful', 2499.00);

1 row created.

INSERT INTO Payment (Payment_ID, Order_ID, Payment_Mode, Payment_Date, Payment_Status, Payment_Amount)
VALUES(503, 1003, 'Debit Card', DATE '2026-09-17', 'Failed', 899.00);

1 row created.

INSERT INTO Payment (Payment_ID, Order_ID, Payment_Mode, Payment_Date, Payment_Status, Payment_Amount)
VALUES(504, 1004, 'Cash on Delivery', DATE '2026-09-18', 'Successful', 3298.00);

1 row created.

SELECT * FROM Payment;

PAYMENT_ID   ORDER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ------------------------------ ---------
PAYMENT_STATUS       PAYMENT_AMOUNT
-------------------- --------------
       501       1001 UPI                            15-SEP-26
Successful                     1499

       502       1002 Credit Card                    16-SEP-26
Successful                     2499

       503       1003 Debit Card                     17-SEP-26
Failed                          899


PAYMENT_ID   ORDER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ------------------------------ ---------
PAYMENT_STATUS       PAYMENT_AMOUNT
-------------------- --------------
       504       1004 Cash on Delivery               18-SEP-26
Successful                     3298


SELECT * FROM Payment
WHERE Payment_Status = 'Successful';

PAYMENT_ID   ORDER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ------------------------------ ---------
PAYMENT_STATUS       PAYMENT_AMOUNT
-------------------- --------------
       501       1001 UPI                            15-SEP-26
Successful                     1499

       502       1002 Credit Card                    16-SEP-26
Successful                     2499

       504       1004 Cash on Delivery               18-SEP-26
Successful                     3298


SELECT * FROM Payment
WHERE Payment_Status = 'Failed';

PAYMENT_ID   ORDER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ------------------------------ ---------
PAYMENT_STATUS       PAYMENT_AMOUNT
-------------------- --------------
       503       1003 Debit Card                     17-SEP-26
Failed                          899


UPDATE Payment
SET Payment_Status = 'Successful'
WHERE Payment_ID = 503;

1 row updated.

SELECT * FROM Payment
WHERE Payment_ID = 503;

PAYMENT_ID   ORDER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ------------------------------ ---------
PAYMENT_STATUS       PAYMENT_AMOUNT
-------------------- --------------
       503       1003 Debit Card                     17-SEP-26
Successful                      899


SELECT 
Payment_Mode,
COUNT(*) AS Transaction_Count
FROM Payment
GROUP BY Payment_Mode
ORDER BY Payment_Mode;

PAYMENT_MODE                   TRANSACTION_COUNT
------------------------------ -----------------
Cash on Delivery                               1
Credit Card                                    1
Debit Card                                     1
UPI                                            1

SELECT
Payment_Mode,
SUM(Payment_Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Mode
ORDER BY Payment_Mode;

PAYMENT_MODE                   TOTAL_AMOUNT
------------------------------ ------------
Cash on Delivery                       3298
Credit Card                            2499
Debit Card                              899
UPI                                    1499

SELECT
p.Payment_ID,
p.Order_ID,
c.Customer_ID,
c.Customer_Name,
p.Payment_Mode,
p.Payment_Date,
p.Payment_Status,
p.Payment_Amount
FROM Payment p
JOIN Orders o
ON p.Order_ID = o.Order_ID
JOIN Customer c
ON o.Customer_ID = c.Customer_ID
ORDER BY p.Payment_ID;

PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------
PAYMENT_MODE                   PAYMENT_D PAYMENT_STATUS       PAYMENT_AMOUNT
------------------------------ --------- -------------------- --------------
       501       1001         101
Arun Kumar
UPI                            15-SEP-26 Successful                     1499

       502       1002         102
Priya Sharma
Credit Card                    16-SEP-26 Successful                     2499

PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------
PAYMENT_MODE                   PAYMENT_D PAYMENT_STATUS       PAYMENT_AMOUNT
------------------------------ --------- -------------------- --------------

       503       1003         103
Rahul Raj
Debit Card                     17-SEP-26 Successful                      899

       504       1004         104
Divya Sri

PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------
PAYMENT_MODE                   PAYMENT_D PAYMENT_STATUS       PAYMENT_AMOUNT
------------------------------ --------- -------------------- --------------
Cash on Delivery               18-SEP-26 Successful                     3298


SELECT
SUM(Payment_Amount) AS Successful_Payment_Amount
FROM Payment
WHERE Payment_Status = 'Successful';

SUCCESSFUL_PAYMENT_AMOUNT
-------------------------
                     8195

SELECT
SUM(Payment_Amount) AS Failed_Payment_Amount
FROM Payment
WHERE Payment_Status = 'Failed';

FAILED_PAYMENT_AMOUNT
---------------------
                  899


SELECT
    Payment_Status,
    COUNT(*) AS Transaction_Count,
    SUM(Payment_Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Status
ORDER BY Payment_Status;

PAYMENT_STATUS       TRANSACTION_COUNT TOTAL_AMOUNT
-------------------- ----------------- ------------
Successful                           4         8195
