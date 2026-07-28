 CREATE TABLE CUSTOMER(
  2      Customer_ID NUMBER PRIMARY KEY,
  3      Full_Name VARCHAR2(50) NOT NULL,
  4      Email VARCHAR2(50) UNIQUE,
  5      Mobile_Number NUMBER(10) UNIQUE,
  6      Password VARCHAR2(30) NOT NULL,
  7      Registration_Date DATE
  8  );

Table created.

SQL> INSERT INTO CUSTOMER VALUES(101,'Arun','arun@gmail.com',9876543210,'Arun@123',TO_DATE('10-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(102,'Priya','priya@gmail.com',9876543211,'Priya@123',TO_DATE('11-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(103,'Karthik','karthik@gmail.com',9876543212,'Karthik@123',TO_DATE('12-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(104,'Divya','divya@gmail.com',9876543213,'Divya@123',TO_DATE('13-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(105,'Rahul','rahul@gmail.com',9876543214,'Rahul@123',TO_DATE('14-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(106,'Meena','meena@gmail.com',9876543215,'Meena@123',TO_DATE('15-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(107,'Nisha','nisha@gmail.com',9876543216,'Nisha@123',TO_DATE('16-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(108,'Suresh','suresh@gmail.com',9876543217,'Suresh@123',TO_DATE('17-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(109,'Anitha','anitha@gmail.com',9876543218,'Anitha@123',TO_DATE('18-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO CUSTOMER VALUES(110,'Vijay','vijay@gmail.com',9876543219,'Vijay@123',TO_DATE('19-JAN-2026','DD-MON-YYYY'));

1 row created.

SQL> SELECT*FROM Customer;

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
        101 Arun
arun@gmail.com                                        9876543210
Arun@123                       10-JAN-26

        102 Priya
priya@gmail.com                                       9876543211
Priya@123                      11-JAN-26

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------

        103 Karthik
karthik@gmail.com                                     9876543212
Karthik@123                    12-JAN-26

        104 Divya
divya@gmail.com                                       9876543213

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
Divya@123                      13-JAN-26

        105 Rahul
rahul@gmail.com                                       9876543214
Rahul@123                      14-JAN-26

        106 Meena

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
meena@gmail.com                                       9876543215
Meena@123                      15-JAN-26

        107 Nisha
nisha@gmail.com                                       9876543216
Nisha@123                      16-JAN-26


CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
        108 Suresh
suresh@gmail.com                                      9876543217
Suresh@123                     17-JAN-26

        109 Anitha
anitha@gmail.com                                      9876543218
Anitha@123                     18-JAN-26

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------

        110 Vijay
vijay@gmail.com                                       9876543219
Vijay@123                      19-JAN-26


10 rows selected.

SQL> UPDATE CUSTOMER
  2  SET Full_Name='Arun Kumar'
  3  WHERE Customer_ID=101;

1 row updated.

SQL> UPDATE CUSTOMER
  2  SET Password='Divya@2026'
  3  WHERE Customer_ID=104;

1 row updated.

SQL> SELECT * FROM CUSTOMER;

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
        101 Arun Kumar
arun@gmail.com                                        9876543210
Arun@123                       10-JAN-26

        102 Priya
priya@gmail.com                                       9876543211
Priya@123                      11-JAN-26

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------

        103 Karthik
karthik@gmail.com                                     9876543212
Karthik@123                    12-JAN-26

        104 Divya
divya@gmail.com                                       9876543213

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
Divya@2026                     13-JAN-26

        105 Rahul
rahul@gmail.com                                       9876543214
Rahul@123                      14-JAN-26

        106 Meena

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
meena@gmail.com                                       9876543215
Meena@123                      15-JAN-26

        107 Nisha
nisha@gmail.com                                       9876543216
Nisha@123                      16-JAN-26


CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
        108 Suresh
suresh@gmail.com                                      9876543217
Suresh@123                     17-JAN-26

        109 Anitha
anitha@gmail.com                                      9876543218
Anitha@123                     18-JAN-26

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------

        110 Vijay
vijay@gmail.com                                       9876543219
Vijay@123                      19-JAN-26


10 rows selected.

SQL> DELETE FROM CUSTOMER
  2  WHERE Customer_ID=109;

1 row deleted.

SQL> DELETE FROM CUSTOMER
  2  WHERE Customer_ID=110;

1 row deleted.

SQL> SELECT * FROM CUSTOMER;

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
        101 Arun Kumar
arun@gmail.com                                        9876543210
Arun@123                       10-JAN-26

        102 Priya
priya@gmail.com                                       9876543211
Priya@123                      11-JAN-26

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------

        103 Karthik
karthik@gmail.com                                     9876543212
Karthik@123                    12-JAN-26

        104 Divya
divya@gmail.com                                       9876543213

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
Divya@2026                     13-JAN-26

        105 Rahul
rahul@gmail.com                                       9876543214
Rahul@123                      14-JAN-26

        106 Meena

CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
meena@gmail.com                                       9876543215
Meena@123                      15-JAN-26

        107 Nisha
nisha@gmail.com                                       9876543216
Nisha@123                      16-JAN-26


CUSTOMER_ID FULL_NAME
----------- --------------------------------------------------
EMAIL                                              MOBILE_NUMBER
-------------------------------------------------- -------------
PASSWORD                       REGISTRAT
------------------------------ ---------
        108 Suresh
suresh@gmail.com                                      9876543217
Suresh@123                     17-JAN-26


8 rows selected.

SQL> COMMIT;

Commit complete.