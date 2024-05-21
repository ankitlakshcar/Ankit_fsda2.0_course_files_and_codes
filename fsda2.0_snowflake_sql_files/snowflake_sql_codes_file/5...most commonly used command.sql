---distint
---limit
---% and underscore(_)
---where and like keyword
---where and in clause
---where and between use cases
use database demodatabase;


CREATE or replace table NJ_CONSUMER_COMPLAINTS

(    DATE_RECEIVED STRING,
     PRODUCT_NAME VARCHAR2(50),
     SUB_PRODUCT VARCHAR2(100),
     ISSUE VARCHAR2(100),
     SUB_ISSUE VARCHAR2(100),
     CONSUMER_COMPLAINT_NARRATIVE string,
     Company_Public_Response STRING,
     Company VARCHAR(100),
     State_Name CHAR(4),
     Zip_Code string,
     Tags VARCHAR(40),
     Consumer_Consent_Provided CHAR(25),
     Submitted_via STRING,
     Date_Sent_to_Company STRING,
     Company_Response_to_Consumer VARCHAR(40),
     Timely_Response CHAR(4),
     CONSUMER_DISPUTED CHAR(4),
     COMPLAINT_ID NUMBER(12,0) NOT NULL PRIMARY KEY
);

select * from  NJ_CONSUMER_COMPLAINTS;

select DISTINCT * from  NJ_CONSUMER_COMPLAINTS;

--SYNTAX : SELECT DISTINCT COL_NAME FROM TABLE_NAME
SELECT DISTINCT PRODUCT_NAME FROM NJ_CONSUMER_COMPLAINTS;----what is the distinct product_name my company having
SELECT DISTINCT SUB_PRODUCT FROM NJ_CONSUMER_COMPLAINTS;
SELECT DISTINCT company FROM NJ_CONSUMER_COMPLAINTS;

select * from NJ_CONSUMER_COMPLAINTS LIMIT 100;------IF YOU WANT TO SEE TOP100 DATA

-- % represents zero,one or multiple character
---_ underscore represent one single charcter

/*
% --- means_any_sequence_of_charector;
a% -- any value that start with a
%a -- any value that ends with a
%word%  -- any values that has word in any position
_a% --- any value that has 'a'in the second position
a_% ---- any value that starts with "a" and are atleast 2 character in length
a__% --- any value that starts with "a" and are atleast 3 character in length
a%r - any values that starts with a and ends with r
ab%cd%de%f - any values that starts with ab followed by any characters and then cd and then followed by any characters 
and then de followed by any charcaters and ending with f
*/




----LIKE KEYWORD------HIGHLY USED IN SQL
a% -- any value that start with a
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE 'Bank%';----IT WILL GIVE ME ALL THE RECORD WHEREEVER THE WORD BANK WILL APPEARING--BANK AT THE START FOLLOWED BY ANY CHARCTER---% AT THE END MEANS-- BANK FOLLOWED BY ANY SEQUENCE OF CHARACTER--

%word% -- any values that has word in any position
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%account%';
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%Credit%';
-----anywhere word 'accound' appearing in the data---it can be ine first,middle or in the last

%a-- any value that ends with a
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%account';----willl show the data 'account' at the and
% --- means_any_sequence_of_charector;
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%loan';----at the end i need loan keyword to be there
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%loan';

_a% --- any value that has a in the second position
SELECT  * FROM NJ_CONSUMER_COMPLAINTS WHERE company LIKE '_a%';

a_% ---- any value that starts with "a" and are atleast 2 character in length;
SELECT  * FROM NJ_CONSUMER_COMPLAINTS WHERE SUBMITTED_VIA LIKE 'F_%';

a__%---any value that starts with "a" and are atleast 3 character in length
SELECT  * FROM NJ_CONSUMER_COMPLAINTS WHERE CONSUMER_COMPLAINT_NARRATIVE LIKE 'a__%';

a%r - any values that starts with a and ends with r
SELECT  * FROM NJ_CONSUMER_COMPLAINTS WHERE SUB_PRODUCT LIKE 'C%t';


  table like_ex
(subject varchar(20));

insert into like_ex values
    ('John  Dddoe'),
    ('Joe   Doe'),
    ('John_down'),
    ('Joe down'),
    ('Elaine'),
    (''),    -- empty string
    (null);

SELECT * FROM like_ex;

select subject from like_ex where subject like '%Jo%oe%' ;


--------------------------in keyword ---------------------------------
SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS;

SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME IN ('Consumer Loan','Mortgage','Debt collection');

SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME = 'Consumer Loan' OR 
PRODUCT_NAME = 'Mortage' OR PRODUCT_NAME = 'Debt collection';


SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS 
WHERE COMPANY IN ('Wells Fargo & Company','Citibank','
Bank of America');

SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS WHERE DATE_RECEIVED BETWEEN '29-07-2013' AND '31-07-2013';  ------- between command wont work untill or unless its(DATE_RECEIVED ) datatype is 'date'data type


use database demodatabase;

CREATE OR REPLACE TABLE aj_sales 
(
  customer_id VARCHAR(1)  ,
  order_date DATE DEFAULT TO_DATE('2022-12-10'),
  product_id INT );

  INSERT INTO aj_sales
VALUES
('A', '2021-01-01', '1'),
('A', '2021-01-01', '2'),
('A', '2021-01-07', '2'),
('A', '2021-01-10', '3'),
('A', '2021-01-11', '3'),
('A', '2021-01-11', '3'),
('B', '2021-01-01', '2'),
('B', '2021-01-02', '2'),
('B', '2021-01-04', '1'),
('B', '2021-01-11', '1'),
('B', '2021-01-16', '3'),
('C','2021-01-07', '3'),
('d','2021-01-23', 4); 

select * from aj_sales where order_date between '2021-01-07' and '2021-02-01' ;---- between command wont work untill or unless its(order_date) datatype is 'date'data type










