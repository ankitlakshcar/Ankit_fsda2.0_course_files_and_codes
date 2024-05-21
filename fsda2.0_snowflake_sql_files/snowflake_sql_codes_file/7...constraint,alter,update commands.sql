---WHAT IS CONSTRAINT AND ITS TYPE
---HOW TO CREATE COPY OF A TABLE WITH DATA AND WITH OUT DATA
---ALTER TABLE COMMAND--HOW TO ADD COLUMN IN EXISTING TABLE
                      --HOW TO ADD CONSTRAINT IN EXISTING TABLE OR COLUMN
                      --HOW TO DROP PRIMARY KEY
                      --HOW TO DROP ANY COLUMN
---UPDATE COMMMAND
 ---suppose clint has given us a table we want to find out code behind, what code he has used... it type  and find out that what datatype he has usedd it






--- CONSTRAINT --- RESTRICTION AND OBSTACLE WE ARE PUTTING TO ANY COLUMN SO THAT WE DONT ENTER THE WRONG VALUE

---Snowflake supports the following constraint types
--PRIMARY KEY
--FOREIGN KEY
--UNIQUE
--NOT NULL
--DEFAULT

--Note
--Snowflake supports defining and maintaining constraints, but does not enforce them, except for NOT NULL constraints, which are always enforced.

--->PRIMARY KEY---PRIMARY KEY IS THE KEY WHICH IS UNIQUELY IDENTIFY EACH RECORD IN THE TABLE.
---IT HAS TO BE DISTINCT AND IT CAN NOT BE NULL
--EG---- ADHAR NO -- NO PERSON IN INDIA HAVE SAME ADHAR NO.
--- NO PERSON IN THE WORLD WILL HAVE THE SAME PASSPORT NO.

---WE CAN NOT HAVE DUPLICATE RECORD  IF WE KEEP DUPLICATE RECORD IT WILL THROW US A ERROR IN MY SQL BUT SNOWFLAKE WONT GIVE ERROR BECAUSE SNOWFLAKE DOESNT ENFORCE PRIMARY KEY.

--->NOTNULL---WHEN WE SPECIFY NOTNULL IN ANY COLUMN AND WE INSERT NULL VALUE THEN IT WILL GIVE US ERROR  BECAUSE SNOWFLKAE ENFORCE NOTNULL CONSTRAINT.

---DEFAULT--> DEFAULT IS ALSO A CONSTRAINT WHEN WE SPECIFY THIS CONSTRAINT IN ANY COLUMN IT MEANS IF USER IS NOT GIVING ANY VALUE THAEN IT WILL TAKE DEFAULT VALUE.





use database demodatabase;

CREATE OR REPLACE TABLE aj_sales 
(
  customer_id VARCHAR(1) ,
  order_date DATE default TO_DATE('2022-12-10'),
  product_id INT not null );

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
('d','2021-01-23','7'); 

insert into aj_sales( customer_id,product_id) values ('e',9);

describe table aj_sales;

select * from  aj_sales;

 



----IF WE WANT TO CREATE(copy) A TABLE STRUCTURE LIKE PREVIOUSLY CREATE TABLE THEN GO WITH LIKE COMMAND
CREATE or replace TABLE aj_sales_copy like aj_sales ;

describe table aj_sales_copy;

select * from  aj_sales_copy;



---IF WE WANT TO CREATE A TABLE STRUCTURE LIKE PREVIOUSLY CREATE TABLE along with data THEN GO WITH LIKE COMMAND
CREATE or replace TABLE aj_sales_copy_data as select * from  aj_sales ;
---if you want specific column with data
CREATE or replace TABLE aj_sales_copy_data as select customer_id , product_id  from  aj_sales ;

describe table aj_sales_copy_data ;

select * from  aj_sales_copy_data ;

--- alter table command syntax
--- SUPPOSE TABLE HASBEEN CREATED.IF WE WANT TO ADD COLUMN IN EXISTING TABLE THEN WE USE ALTER TABLE COMMAND.
---ALTER MEANS ---CHANGED AND MODIFIED


ALTER TABLE <name>
ADD COLUMN <column_name> <column_type> [ <inline_constraint> ] ;


alter table  aj_sales_copy_data
add column pancard varchar(10) ;----will work---IF WE WANT TO ADD COLUMN IN EXISTING TABLE

alter table  aj_sales_copy_data----will work
add column age int ; 

------ add constraint on existing column 
alter table  aj_sales_copy_data
add primary key (customer_id) ;---IF WE WANT TO ADD CONSTRAINT IN EXISTING TABLE OR COLUMN

------if i want to drop primary key
alter table  aj_sales_copy_data
drop primary key;

---LETS TRY THIS
alter table  aj_sales_copy_data
add column pancard2 varchar(10) primary key;----wont work

alter table  aj_sales_copy_data
add column age2 int not null; ------ wont work giving an error

---the issue is comming when we are adding column along with constraint primary key and notnull

alter table  aj_sales_copy_data
add column country varchar(20) default 'none';----will work
---when we are adding column along with constraint default.....its working fine



---add the column first make it primary key using two step process
---add a new column
alter table  aj_sales_copy_data
add column pancard3 varchar(10) ;---- will work

alter table  aj_sales_copy_data
add primary key (pancard3) ;

---- if you want to delete any column
alter table aj_sales_copy_data 
drop column age ;

alter table aj_sales_copy_data
drop column country ;

alter table  aj_sales_copy_data
add column country varchar(20) ;

select * from  aj_sales_copy_data ;




---lets try with empaty table
alter table  aj_sales_copy
add column age int not null;----- when table is emplty it works 

alter table  aj_sales_copy
add column pancard varchar(10) primary key;----will work


describe table aj_sales_copy;
select * from  aj_sales_copy;

select * from  aj_sales_copy_data ;


---update command
--- whereever is age is null i wnat this '15'
--- update commant is used when we want to change content of data for any specific column
update  aj_sales_copy_data
set age = 15 where age is null;
 
 
 ---suppose clint has given us a table we want to find out code behind, what code he has used... it type  and find out that what datatype he has usedd it

 select get_ddl('table','aj_sales_copy_data');

 
 

