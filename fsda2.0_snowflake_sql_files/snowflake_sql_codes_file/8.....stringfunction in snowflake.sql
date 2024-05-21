---SUBSRTING
---LEN FUNCTION
---CONCAT FUNCTION
---CAST AND TRY_CAST
---TRIM FUNCTION,LTRIM,RTRIM
---REVERCE
---SPLIT,SPLIT_APART,LATERAL FLATTEN
---UPPER AND LOWER
---INITCAP,USE OF DELIMITER IN INITCAP
---REPLACE COMMAND
---RIGHT,LEFT COMMAND
---USE CASES OF LIKE,STARTSWITH,ENDSWITH,CONTAINS
---NYL COMMAND
---COALESCE COMMNAD


USE DEMODATABASE;


create  or replace table agents(
agent_code varchar(6) not null primary key,
agent_name varchar(40),
working_area varchar(35),
commission number(10,2),  --- 10 denotes total no we want with two decimal  and 2 denotes howmany decimal we want 
phone_no varchar(15),
country varchar(25)
);

INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore',0.15,'077-25814763', '');
INSERT INTO AGENTS(AGENT_CODE,AGENT_NAME,WORKING_AREA) 
VALUES ('A110', 'Anand', 'Germany');

 
INSERT INTO agents VALUES  
 ('A003', 'Alex ', 'London', '0.13', '075-12458969', ''),
('A008', 'Alford', 'New York', '0.12', '044-25874365', ''),
 ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', ''),
 ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', ''),
('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', ''),
 ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', ''),
  ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', ''),
 ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', ''),
 ('A006', 'McDen', 'London', '0.15', '078-22255588', ''),
 ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', ''),
 ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');


select * from agents;

-- set the country to india whereever country is null or blank
update agents
set country = 'india' where country is null or country= '';


/* The SUBSTRING () function returns the position of a string or binary value from the complete string, 
starting with the character specified by substring_start_index. If any input is null, null is returned */

--- substring----> it is used to extract the part of string.for eg everyone has a fullname and last name.. so if i want to extract lastname out of full name in that case we use substring function.
---syntax-- select substring('text',start,end);
---start--- starting index of the string that we want
--end---total no of character that we want---means length of the character



--Example 1: Get the substring from a specific string in Snowflake

select substring('ANAND KUMAR JHA', 1, 9) AS PARTIAL_NAME;-- this works in my sql
select substring('ANAND KUMAR JHA', 0, 9) AS PARTIAL_NAME;  ---CHECK IN MYSQL ALSO WHICH WORKS--this doesnt work in my sql

select substring('ANAND KUMAR JHA', 0, 7) AS PARTIAL_NAME;
select substring('ANAND KUMAR JHA', 0, 7) AS PARTIAL_NAME;

select substring('RAJARAM', 1, 3) AS PARTIAL_NAME;

----if we dont specify ending index in syntax then whatever the starting index there it will take till end.

select substring('RAJARAM', 3) AS PARTIAL_NAME;

select substring('ANAND KUMAR JHA', 4, 7);

-- we can also start any string from the beginning  and also from end  for eg

select substring('ANAND KUMAR JHA', -7,3);--- START FROM INDEX -7 AND GIVE NEXT 3 CHARACTER FROM THAT INDEX
select substring('ANAND KUMAR JHA', -7,-3);---WILL GIVE NO OUPPUT

select substring('ANAND KUMAR JHA',NULL);---- will return null

----lets try with column
select agent_code,agent_name, substring(agent_code,-3,3) AS AGENT_FINALS from agents; 
select agent_name, substring(agent_code,2,5) AS AGENT_FINALS from agents;  

---len function
---to returns the length of the string----returns total no of characters in that perticular string
select len('ANAND KUMAR JHA') as my_name_length;

select len('     ANAND KUMAR JHA    ') as my_name_length;



---how to concatenate two string
select 'anand'||'india'||'great' as fullname;

select 'anand'||' india'||' great' as fullname;
          -- or--
select concat('anand','india','great');

select concat('anand',' india',' great');--- if i want to give space

 

----how to concatenate two column
select agent_code||agent_name as agent_details from agent;

select agent_code||' '||agent_name as agent_details from agent;

select phone_no || ' ' || country as detail from agent;



select concat(agent_code,' ',agent_name)as agent_details from agent;



---use of concatenate function in substring

select substring('ANAND KUMAR JHA',1,1)||substring('ANAND KUMAR JHA',7,1)||substring('ANAND KUMAR JHA',13,1)as partial_name;
----------------or------------------------
select concat(substring('ANAND KUMAR JHA',1,1),substring('ANAND KUMAR JHA',7,1),substring('ANAND KUMAR JHA',13,1))as partial_name;






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

 

select * from NJ_CONSUMER_COMPLAINTS;

select concat(Zip_Code,PRODUCT_NAME)as details from  NJ_CONSUMER_COMPLAINTS;

create view NJ_CONSUMER_COMPLAINTS_view as select *,concat(Zip_Code,PRODUCT_NAME)as details from  NJ_CONSUMER_COMPLAINTS;

describe view NJ_CONSUMER_COMPLAINTS_view; ----- TO SEE WHAT IS THE DATA TYPE OF DETAILS

 
create view CONSUMER_COMPLAINTS_view2 as select *, concat(State_Name,'-',Zip_Code) as details from  NJ_CONSUMER_COMPLAINTS where SUB_ISSUE is not null and CONSUMER_COMPLAINT_NARRATIVE is not null and SUB_PRODUCT is not null and Company_Public_Response is not null;

select * from CONSUMER_COMPLAINTS_view2;

----cast syntax---Converts a value of one data type into another data type
CAST(' <source_expr>' AS <target_data_type> )
  

 select cast('1.6845' as decimal(4,3));
 
select '1.6845'::decimal(4,3);

select cast('10-Sep-2021' as timestamp);

-- When the provided precision is insufficient 
-- to hold the input value, the Snowflake CAST command raises an error as follows:
select cast('123.12' as number(4,2));
--Here, precision is set as 4 but the input value has a total of 5 digits, thereby raising the error.
select cast('123.12' as number(4,1));

---TRY_CAST
---A special version of CAST , :: that is available for a subset of data type conversions. It performs the same operation (i.e. converts a value of one data type into another data type), but returns a NULL value instead of raising an error when the conversion can not be performed.
--TRY_CAST( <source_string_expr> AS <target_data_type> )

select try_cast('05-Mar-2016' as timestamp);

--The Snowflake TRY_CAST command returns NULL as the input value 
--has more characters than the provided precision in the target data type.
select try_cast('ANAND' as char(4));

select try_cast('1990-09-23' as timestamp);

----trim function--Removes leading and trailing characters from a string.
--trim function---syntax---TRIM( '<expr>' ,' <characters>')
select trim('❄-❄ABC-❄-', '❄-') as trimmed_string;
select trim('❄-❄ABC-❄-', '❄') as trimmed_string;
select trim('❄-❄ABC-❄-', '-') as trimmed_string;
SELECT TRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE;
SELECT TRIM('********T E S T I*N*G 1 2 3 4********','*') AS TRIMMED_SPACE;

--ltrim
select ltrim('#000000123', '0#');
select ltrim('#0000AISHWARYA', '0#');
select ltrim('      ANAND JHA', '');

--RTRIM
select rtrim('$125.00', '0.');
select rtrim('ANAND JHA*****', '*');

--To remove the white spaces or the blank spaces from the string TRIM function can be used. 
--It can remove the whitespaces from the start and end both.
select TRIM('  Snwoflake Space Remove  ', ' ');

--To remove the first character from the string you can pass the string in the RTRIM function.
select LTRIM('Snowflake Remove  ', 'S'); --in EXCEL U WILL FIND LEFT
--To remove the last character from the string you can pass the string in the RTRIM function.
select RTRIM('Snwoflake Remove  ', 'e'); --IN EXCEL U WILL FIND RIGHT

---REVERSE FUNCTION IN STRING
SELECT REVERSE ('INDIA');


-- SPLIT---Splits a given string with a given separator and returns the result in an array of strings.--ARRAY OF STRING MEANS LIST OF STRING
--SYNTAX--SPLIT('<string>', '<separator>')
select split('127.0.0.1', '.');
SELECT SPLIT('ANAND-KUMAR-JHA',' ');----IF WE DONT SPECIFY FROM WHERE WE NEED TO SPLIT.IT WILL GIVE US ORIGINAL STRING
SELECT SPLIT('ANAND-KUMAR-JHA','-');
select split('|a||', '|');



---split_part--Splits a given string at a specified character and returns the requested part.

----SPLIT_PART('<string>',' <delimiter>', <partNumber>)


select split_part('aaa--bbb-BBB--ccc', '--',1);
select split_part('aaa--bbb-BBB--ccc', '--',2);
select split_part('aaa--bbb-BBB--ccc', '--',3);
select split_part('aaa--bbb-BBB--ccc', '--',4);

select  split_part('11.22.33', '.',0 );-----0 AND 1 BOTH BEHAVE THE SAME.

select  split_part('11.22.33', '.', 1) as first_part , 
        split_part('11.22.33', '.', 2) as sec_part; 

SELECT *,concat(AGENT_CODE, '-', AGENT_NAME) AS agent_details 
  from agents ;  --- i have this out come
         
SELECT split(agent_details, '-')
FROM (
SELECT *,concat(AGENT_CODE, '-', AGENT_NAME) AS agent_details 
  from agents );----- i want agent_details to be split apart


SELECT SPLIT(CONCAT(AGENT_CODE, '-',AGENT_NAME),'-')
  AS agent_details 
  from agents ;
  






---LATERAL FLATTEN----Use the result of SPLIT to generate multiple records from a single string using the LATERAL FLATTEN construct.NOT AVAILABLE IN MYSQL
create table al_persons(
name varchar(10),
children varchar(30)
);

insert  into al_persons values( 'Mark', 'Marky,Mark Jr,Maria' ),
( 'John' ,'Johnny,Jane')   ;

select * from al_persons;

select split(children,',') from al_persons;

SELECT name, C.value::string AS childName
FROM al_persons,
     LATERAL FLATTEN(input=>split(children, ',')) C;


 
----upper and lower ---use case 
---UPPER--Returns the input string expr with all characters converted to uppercase.
-----syn--upper( 'string' )
---LOWER---Returns the input string (expr) with all characters converted to lowercase.
--syn--LOWER( 'string' )
SELECT lower('India Is My Country') as lwr_strng;
SELECT UPPER('India Is My Country') as upr_strng;


select UPPER(CONCAT(substring('ruhee k qureshi',1,1), 
                    substring('ruhee k qureshi',7,1) ,
                    substring('ruhee k qureshi',9,1))) as initial;

---initcap---- Returns the input string (expr) with the first letter of each word in uppercase and the subsequent letters in lowercase.
--syn--INITCAP('<expr>')         
SELECT INITCAP('india is my country') as init_cap_sent;

/*
delimiters specified as an empty string (i.e. '') instructs INITCAP to ignore all delimiters, 
including whitespace characters, in the input expression (i.e. the input expression is treated as a single, continuous word). 
The resulting output is a string with the 
first character capitalized (if the first character is a letter) and all other letters in lowercase.
*/
select initcap('this is the new Frame+work');
select initcap('this is the new Framework','');

---if we are specifying 'q' as a delimiter then first letter will be capital and the every letter after q will be capitalize
select initcap('iqamqinterestedqinqthisqtopic','q');
select initcap('lion☂fRog potato⨊cLoUD', '⨊☂');

---replace command---
--Removes all occurrences of a specified substring, and optionally replaces them with another substring. 
---syn--REPLACE('<subject> ',' <pattern>', '<replacement>'  )This is the value used as a replacement for the pattern.
---subject---The subject is the string in which to do the replacements. Typically, this is a column, but it can be a literal.
--pattern---This is the substring that you want to replace. Typically, this is a literal, but it can be a column or expression
---replacement---

select REPLACE( '   ANAND KUMAR JHA   ' ,' ','*');
select REPLACE( '   ANAND KUMAR JHA   ' ,' '); -- just like trim---If replacement is not specified, subject is returned with all occurrences of pattern removed.

SELECT REPLACE('   T  E S T I N G 1 2 3 4   ',' ');
SELECT TRIM('   T  E S T I N G 1 2 3 4   ',' ');----ALSO SEE THIS DIFFERENCE

select replace('abcd', 'bc') as replaced_nothing_just_remove;

create or replace table replace_example
(subject varchar(10), 
 pattern varchar(10), 
 replacement varchar(10));
 
insert into replace_example 
values('snowman', 'snow', 'fire'), 
('sad face', 'sad', 'happy');

select * from replace_example;

select subject, pattern, replacement, 
       replace(subject, pattern, replacement) as new 
       from replace_example;

---RIGHT,LEFT COMMAND---JUST LIKE SUBSTRING--RETURNS THE RIGHT/LEFT STRING OF THE INPUT
---SYN---RIGHT( '<expr>' , <length_expr> )
select right('ABCDEFG', 2);
select LEFT('ABCDEFG', 4);
SELECT RIGHT('ASJHKVASFJFSACNKLSAHFL2378475723595469HERLLOUS',2) AS COUNTRY_CODE;


---USE CASES OF LIKE,STARTSWITH,ENDSWITH,CONTAINS
select * from NJ_CONSUMER_COMPLAINTS;

select * from NJ_CONSUMER_COMPLAINTS WHERE STARTSWITH(PRODUCT_NAME,'Bank');----IT WILL GIVE THE OUTPUT WHOSE NAME START WITH BANK
select * from NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE 'Bank%';----SIMILAR STARTWITH

select * from NJ_CONSUMER_COMPLAINTS where endswith(PRODUCT_NAME , 'Loan');----IT WILL GIVE THE OUTPUT WHOSE NAME END WITH LOAN  
select * from NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%loan';----same as endswith

select * from NJ_CONSUMER_COMPLAINTS where contains(PRODUCT_NAME, 'Bank');---IT WILL GIVE THE OUTPUT whereever the word bank is comming 
select * from NJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%Bank%';---same as contains


select * from agents;
 
SELECT LOWER(CONCAT(AGENT_NAME, ' ', country)) AS NAME_COUNTRY,
       INITCAP(NAME_COUNTRY) AS_INITCAP_EX,
       UPPER(RIGHT(NAME_COUNTRY,2)) AS RIGHT_Country
FROM AGENTS;

---NYL---NVL( <expr1> , <expr2> )---If expr1 is NULL, returns expr2, otherwise returns expr1.
select nvl(null, 'bard') as col1, 
       nvl(null, 0) as col2;
select nvl('FOOD', 'bard') as col1, 
       nvl(null, 3.14) as col2;       

---COALESCE
---Returns the first non-NULL expression among its arguments, or RETURNS NULL if all its arguments are NULL.
---Syntax---COALESCE( <expr1> , <expr2> [ , ... , <exprN> ] )

SELECT COALESCE('hello','ANAND','KUMAR') AS NAME;


SELECT column1, column2, column3,
coalesce(column1, column2, column3) AS EXTRACTED_VALUES
FROM (values
  (1,    2,    3   ),
  (null, 2,    3   ),
  (null, null, 3   ),
  (null, null, null),
  (1,    null, 3   ),
  (1,    null, null),
  (1,    2,    null)
) v;
-------OR
select column1, column2, column3, 
coalesce(column1, column2, column3) as extracted_values
from 
(values
  ('anand', 'kumar'   ,   null  ),
  (null, null, 'singh' )
) v;
-----OR
CREATE TABLE TABLE_NAME(column1 INT, column2 INT, column3 INT);

INSERT INTO TABLE_NAME VALUES (1,    2,    3   ),
  (null, 2,    3   ),
  (null, null, 3   ),
  (null, null, null),
  (1,    null, 3   ),
  (1,    null, null),
  (1,    2,    null)
 ;

 SELECT * FROM TABLE_NAME;

SELECT column1, column2, column3,
coalesce(column1, column2, column3) AS EXTRACTED_VALUES
FROM  TABLE_NAME ;

SELECT COALESCE('hello','ANAND','KUMAR') AS NAME;
 
