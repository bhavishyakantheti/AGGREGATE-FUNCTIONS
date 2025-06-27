SQL> select sum(available)
  2  from product;

SUM(AVAILABLE)                                                                  
--------------                                                                  
           530                                                                  

SQL> select count(customerid)
  2  from customer;

COUNT(CUSTOMERID)                                                               
-----------------                                                               
                6                                                               


SQL> select * from orders;

ORDER_ID                       ORDER_DAT CUSTOMERID  PRODUCTID                  
------------------------------ --------- ---------- ----------                  
30A190S                        24-SEP-24       1001      90012                  
30A191S                        24-SEP-24       1002      90012                  
30A192S                        25-SEP-24       1003      90014                  
30A193S                        25-JAN-25       1007      90011                  
30A194S                        25-FEB-25       1004      90011                  
30A195S                        25-FEB-25       1005      90013                  

6 rows selected.

SQL> select count(order_id)
  2  from orders;

COUNT(ORDER_ID)                                                                 
---------------                                                                 
              6                                                                 

SQL> select count(productid) as total_products
  2  from product;

TOTAL_PRODUCTS                                                                  
--------------                                                                  
             6                                                                  

SQL> select avg(price)
  2  from product;

AVG(PRICE)                                                                      
----------                                                                      
3427.40833                                                                      

SQL> select * from product
  2  where price > (select avg(price) from product);

 PRODUCTID PNAME                     PRICE  AVAILABLE                           
---------- -------------------- ---------- ----------                           
     90013 WATCH-HARBER           14998.25        100                           

SQL> select order_id
  2  from shipping
  3  where status = 'delivered';

no rows selected

SQL> desc shipping;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SHIPPING_ID                               NOT NULL NUMBER(10)
 DELIVERY_DATE                                      DATE
 STATUS                                             VARCHAR2(20)
 ORDER_ID                                           VARCHAR2(30)

SQL> select * from shipping;

SHIPPING_ID DELIVERY_ STATUS               ORDER_ID                             
----------- --------- -------------------- ------------------------------       
      11180 01-OCT-24 DELIVERD             30A190S                              
      11181 01-OCT-24 DELIVERD             30A191S                              
      11182 03-OCT-24 DELIVERD             30A192S                              
      11183 03-FEB-25 DELIVERD             30A193S                              
      11184 03-MAR-25 DELIVERD             30A194S                              
      11185 03-MAR-25 DELIVERD             30A195S                              

6 rows selected.

SQL> select count(order_id)
  2  from shipping
  3  where status = 'deliverd';

COUNT(ORDER_ID)                                                                 
---------------                                                                 
              0                                                                 

SQL> select count(order_id)
  2  from shipping
  3  where status = 'DELIVERD';

COUNT(ORDER_ID)                                                                 
---------------                                                                 
              6                                                                 

SQL> SELECT MAX (CUSTOMERID)
  2  FROM CUSTOMER;

MAX(CUSTOMERID)                                                                 
---------------                                                                 
           1007                                                                 

SQL> SELECT MAX(PRICE)
  2  FROM PRODUCT;

MAX(PRICE)                                                                      
----------                                                                      
  14998.25                                                                      

SQL> SELECT MIN(PRICE)
  2  FROM PRODUCT;

MIN(PRICE)                                                                      
----------                                                                      
     99.85                                                                      


SQL> SELECT COUNT(ORDER_ID), PRODUCTID
  2  FROM ORDERS
  3  GROUP BY PRODUCTID;

COUNT(ORDER_ID)  PRODUCTID                                                      
--------------- ----------                                                      
              1      90014                                                      
              1      90013                                                      
              2      90012                                                      
              2      90011                                                      

SQL> SELECT COUNT(*) AS ORDER_COUNT
  2  FROM ORDERS
  3  WHERE CUSTOMERID = 1001;

ORDER_COUNT                                                                     
-----------                                                                     
          1                                                                     

SQL> SELECT COUNT(*) AS ORDER_COUNT
  2  FROM ORDERS
  3  WHERE CUSTOMERID = 1002;

ORDER_COUNT                                                                     
-----------                                                                     
          1                                                                     

SQL> SELECT COUNT(*) AS ORDER_COUNT
  2  FROM ORDERS
  3  WHERE CUSTOMERID = 1003;

ORDER_COUNT                                                                     
-----------                                                                     
          1                                                                     

SQL> SELECT COUNT(*) AS ORDER_COUNT
  2  FROM ORDERS
  3  WHERE CUSTOMERID = 1004;

ORDER_COUNT                                                                     
-----------                                                                     
          1                                                                     

SQL> SELECT COUNT(*) AS ORDER_COUNT
  2  FROM ORDERS
  3  WHERE CUSTOMERID = 1005;

ORDER_COUNT                                                                     
-----------                                                                     
          1                                                                     

SQL> SELECT COUNT(*) AS ORDER_COUNT
  2  FROM ORDERS
  3  WHERE CUSTOMERID = 1007;

ORDER_COUNT                                                                     
-----------                                                                     
          1                                                                      

SQL> SELECT COUNT(CUSTOMERID), PRODUCTID
  2  FROM ORDERS
  3  GROUP BY PRODUCTID
  4  HAVING COUNT(CUSTOMERID)>0;

COUNT(CUSTOMERID)  PRODUCTID                                                    
----------------- ----------                                                    
                1      90014                                                    
                1      90013                                                    
                2      90012                                                    
                2      90011                                                    

SQL> SELECT PRODUCTID, SUM(PRICE) AS TOTAL
  2  FROM
  3  PRODUCT
  4  GROUP BY PRODUCTID
  5  HAVING SUM(PRICE) < 1000;

 PRODUCTID      TOTAL                                                           
---------- ----------                                                           
     90009      99.85                                                           
     90010     199.85                                                           

SQL> SPOOL OFF
