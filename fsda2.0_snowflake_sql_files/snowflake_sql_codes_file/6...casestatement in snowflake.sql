 

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

--SYNTAX : SELECT DISTINCT COL_NAME FROM TABLE_NAME
SELECT DISTINCT PRODUCT_NAME FROM NJ_CONSUMER_COMPLAINTS;----what is the distinct product_name which my company having
SELECT DISTINCT SUB_PRODUCT FROM NJ_CONSUMER_COMPLAINTS;
SELECT DISTINCT company FROM NJ_CONSUMER_COMPLAINTS;

SELECT DISTINCT Submitted_via FROM NJ_CONSUMER_COMPLAINTS;

----syn
CASE
    WHEN <condition1> THEN <result1>
  [ WHEN <condition2> THEN <result2> ]
  [ ... ]
  [ ELSE <result3> ]
END


/*
if the customer is submitting the comment(Submitted_via) using' referral,postal mail,email' treat them as 'outbound' and 'phone , web 'treat them as 'inbound 'and for 'fax' treat them as 'electronic' and i need a column called 'submission_type'
*/
 select *,
CASE
    WHEN Submitted_via in ('Referral','Postal mail','Email')  THEN 'outbound'
    WHEN Submitted_via in ('Phone','Web') THEN 'inbound' 
    ELSE 'electronicS' 
END as subission_type from  NJ_CONSUMER_COMPLAINTS;

 --- STAR MEANS -- SELECT_ALL THE_COLUMN;

/* IF I WANT CERTAIN COLUMN THEN */
select  PRODUCT_NAME  ,
     SUB_PRODUCT  ,
     ISSUE  ,
     SUB_ISSUE  ,
CASE
   WHEN Submitted_via in ('Referral','Postal mail','Email')  THEN 'outbound'
   WHEN Submitted_via in ('Phone','Web') THEN 'inbound' 
   ELSE 'electronicS' 
END as subission_type from  NJ_CONSUMER_COMPLAINTS;

/* WHEREEVER THE WORD  'LOAN' COMES IN PRODUCT_NAME COLUMN THEN  CALL IT LOAN AND Bank account or service,Mortgage,Debt collection,Credit reporting,Money transfers CALL THIS 'SERVICE'  AND Other financial service -----> 'OTHER' */

SELECT DISTINCT PRODUCT_NAME FROM NJ_CONSUMER_COMPLAINTS; 

SELECT *, CASE
WHEN PRODUCT_NAME LIKE '%loan' or PRODUCT_NAME like '%Loan' then 'loan type'
when PRODUCT_NAME in ('Bank account or service','Mortgage','Debt collection','Credit reporting','Money transfers') then 'service'
else 'other'
end as finance_type from NJ_CONSUMER_COMPLAINTS; 

-------OPTIMISEDSELECT CODE
SELECT *, CASE
WHEN upper(PRODUCT_NAME) LIKE '%LOAN'   then 'loan type'
when PRODUCT_NAME in ('Bank account or service','Mortgage','Debt collection','Credit reporting','Money transfers') then 'service'
else 'other'
end as finance_type from NJ_CONSUMER_COMPLAINTS; 

SELECT DISTINCT SUB_PRODUCT FROM NJ_CONSUMER_COMPLAINTS;

WHEREEVER 'NULL' AND 'I do not know' ARE THERE WRITE 'NA' ,,,WHEREEVER THE WORD 'CARD' IS THERE WRITE IT 'CARD', WHEREEVER THE WORD LOAN IS THERE WRITE IT 'LOAN' ,WHEREEVER THE WORD 'MORTGAGE' IS THERE WRITE IT MORTGAGE AND NEW COLUMN NAME SUB_PRODUCT_TYPE;

select *,
CASE
 WHEN SUB_PRODUCT IN ('null','I do not know') THEN 'NA'
 WHEN SUB_PRODUCT LIKE '%card%' then 'card'
when SUB_PRODUCT like '%loan%' then 'loan'
when SUB_PRODUCT like '%mortgage%' then 'mortgage'
else SUB_PRODUCT
end as SUB_PRODUCT_TYPE from NJ_CONSUMER_COMPLAINTS;----it is a wrongcode because null comes with is


select *,
CASE
 WHEN SUB_PRODUCT IS NULL OR SUB_PRODUCT ='I do not know' THEN 'NA'------WHENEVER WE ARE CHECKING FOR NULL WE HAVE TO WRITE IS NULL
 WHEN lower(SUB_PRODUCT) LIKE '%card%' then 'card'
when lower(SUB_PRODUCT) like '%loan%' then 'loan'
when lower(SUB_PRODUCT) like '%mortgage%' then 'mortgage'
else SUB_PRODUCT  ------ here SUB_PRODUCT MEANS ALLL THE DATA(VALUE)  OF THAT COLUMN REMAINS SAME
end as SUB_PRODUCT_TYPE from NJ_CONSUMER_COMPLAINTS;


SELECT DISTINCT Company_Response_to_Consumer FROM NJ_CONSUMER_COMPLAINTS;

select *,
case
when Company_Response_to_Consumer in ('Closed with explanation') then 'explained'
when Company_Response_to_Consumer in ('Closed,Closed with non-monetary relief') then 'closed'
when Company_Response_to_Consumer in ('monetary relief provided') then 'monetary relief provided'
else Company_Response_to_Consumer
end as Company_Response_to_Consumer_TYPE from NJ_CONSUMER_COMPLAINTS;

---NOW CREATING VIEW

CREATE VIEW  NJ_Company_Response_to_Consumer AS SELECT 
 DATE_RECEIVED,PRODUCT_NAME,
     SUB_PRODUCT,
     ISSUE,
     SUB_ISSUE,
     Company,
     State_Name,
     Zip_Code,

CASE
    WHEN Submitted_via in ('Referral','Postal mail','Email')  THEN 'outbound'
    WHEN Submitted_via in ('Phone','Web') THEN 'inbound' 
    ELSE 'electronicS' 
END as subission_type ,

CASE
  WHEN SUB_PRODUCT IN ('null','I do not know') THEN 'NA'
  WHEN SUB_PRODUCT LIKE '%card%' then 'card'
  when SUB_PRODUCT like '%loan%' then 'loan'
  when SUB_PRODUCT like '%mortgage%' then 'mortgage'
  else SUB_PRODUCT
end as SUB_PRODUCT_TYPE,
     
case
  when Company_Response_to_Consumer in ('Closed with explanation') then 'explained'
  when Company_Response_to_Consumer in ('Closed,Closed with non-monetary relief') then 
    'closed'
  when Company_Response_to_Consumer in ('monetary relief provided') then 'monetary relief 
    provided'
  else Company_Response_to_Consumer
  end as Company_Response_to_Consumer_TYPE

from NJ_CONSUMER_COMPLAINTS;

 SELECT * FROM  NJ_Company_Response_to_Consumer;
   
