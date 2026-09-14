CREATE TABLE Category (
       Category_ID NUMBER PRIMARY KEY,
       Category_Name VARCHAR2(100) NOT NULL UNIQUE,
       Description VARCHAR2(200)                                                                   
);

Table created.

DESC Category;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CATEGORY_ID                               NOT NULL NUMBER
 CATEGORY_NAME                             NOT NULL VARCHAR2(100)
 DESCRIPTION                                        VARCHAR2(200)

INSERT INTO Category VALUES
(1, 'Electronics', 'Electronic products and accessories');

1 row created.

INSERT INTO Category VALUES
(2, 'Fashion', 'Clothing and fashion products');

1 row created.

INSERT INTO Category VALUES
(3, 'Home Appliances', 'Useful appliances for home');

1 row created.

INSERT INTO Category VALUES
(4, 'Beauty', 'Beauty and personal care products');

1 row created.

INSERT INTO Category VALUES
(5, 'Books', 'Books and educational materials');

1 row created.

SELECT * FROM Category;

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
DESCRIPTION
--------------------------------------------------------------------------------
          1
Electronics
Electronic products and accessories

          2
Fashion
Clothing and fashion products

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
DESCRIPTION
--------------------------------------------------------------------------------

          3
Home Appliances
Useful appliances for home

          4
Beauty

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
DESCRIPTION
--------------------------------------------------------------------------------
Beauty and personal care products

          5
Books
Books and educational materials

COMMIT;

Commit complete.