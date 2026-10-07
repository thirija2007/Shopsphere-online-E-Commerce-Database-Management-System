SQL> CREATE TABLE Seller (
  2      Seller_ID NUMBER(5) PRIMARY KEY,
  3      Seller_Name VARCHAR2(100) NOT NULL,
  4      Seller_Email VARCHAR2(100) UNIQUE,
  5      Contact_Number VARCHAR2(15) UNIQUE,
  6      Business_Type VARCHAR2(50) NOT NULL
  7  );

Table created.

SQL> INSERT INTO Seller VALUES
  2  (101, 'ABC Traders', 'abc@gmail.com', '9876543210', 'Electronics');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (102, 'XYZ Store', 'xyz@gmail.com', '9876543211', 'Clothing');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (103, 'Kumar Products', 'kumar@gmail.com', '9876543212', 'Home Appliances');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (104, 'Sri Enterprises', 'sri@gmail.com', '9876543213', 'Furniture');

1 row created.

SQL> INSERT INTO Seller VALUES
  2  (105, 'Green Mart', 'green@gmail.com', '9876543214', 'Grocery');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Seller;

 SELLER_ID SELLER_NAME
---------- ----------------------------------------
SELLER_EMAIL
----------------------------------------
CONTACT_NUMBER   BUSINESS_TYPE
---------------  --------------------
       101 ABC Traders
abc@gmail.com
9876543210       Electronics

       102 XYZ Store
xyz@gmail.com
9876543211       Clothing

       103 Kumar Products
kumar@gmail.com
9876543212       Home Appliances

       104 Sri Enterprises
sri@gmail.com
9876543213       Furniture

       105 Green Mart
green@gmail.com
9876543214       Grocery

5 rows selected.