SQL> CREATE TABLE Inventory (
  2      Inventory_ID NUMBER(5) PRIMARY KEY,
  3      Product_ID NUMBER(5),
  4      Seller_ID NUMBER(5),
  5      Stock_Quantity NUMBER(5) NOT NULL,
  6      Stock_Status VARCHAR2(20) NOT NULL,
  7      Last_Updated DATE NOT NULL,
  8      FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
  9  );

Table created.

SQL> INSERT INTO Inventory VALUES
  2  (201, 1001, 101, 50, 'Available', SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (202, 1002, 102, 30, 'Available', SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (203, 1003, 103, 0, 'Unavailable', SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (204, 1004, 104, 0, 'Unavailable', SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES
  2  (205, 1005, 105, 40, 'Available', SYSDATE);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Inventory;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS
------------ ---------- ---------- -------------- ------------
LAST_UPDATED
-----------
         201       1001        101             50 Available
07-OCT-26

         202       1002        102             30 Available
07-OCT-26

         203       1003        103              0 Unavailable
07-OCT-26

         204       1004        104              0 Unavailable
07-OCT-26

         205       1005        105             40 Available
07-OCT-26

5 rows selected.

SQL> SELECT S.Seller_Name,
  2         I.Product_ID,
  3         I.Stock_Quantity,
  4         I.Stock_Status
  5  FROM Inventory I
  6  INNER JOIN Seller S
  7  ON I.Seller_ID = S.Seller_ID;

SELLER_NAME         PRODUCT_ID STOCK_QUANTITY STOCK_STATUS
------------------ ---------- -------------- ------------
ABC Traders               1001             50 Available
XYZ Store                 1002             30 Available
Kumar Products            1003              0 Unavailable
Sri Enterprises           1004              0 Unavailable
Green Mart                1005             40 Available

5 rows selected.