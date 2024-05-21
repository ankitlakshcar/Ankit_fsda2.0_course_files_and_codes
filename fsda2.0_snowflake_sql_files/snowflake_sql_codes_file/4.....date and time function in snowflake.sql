
 
 
 use database demodatabase;

-- GET CURRENT DATE
SELECT CURRENT_DATE;

-- GET CURRENT DATE
SELECT CURRENT_TIME ;

-- GET CURRENT TIME
SELECT CURRENT_TIMESTAMP;------it will take utc timezone by default-- in this time and date both will come


-- CONVERT TIMEZONE

SELECT CONVERT_TIMEZONE('UTC',CURRENT_TIMESTAMP) AS UTC_TIMEZONE;


--to_date---For a string expression, the result of converting the string to a date.

SELECT TO_DATE('2013-05-17'), DATE('2013-05-17');---date format should be yyyy-mm-dd

SELECT TO_DATE('2013-05-17');-----either use this
SELECT DATE('2013-05-17'); --- or this both same

---if i want want current day,current hr,current,min in a diff diff column
select day(current_timestamp() ) ,
  hour( current_timestamp() ) ,
  second(current_timestamp()) ,
  minute(current_timestamp()) ,
  month(current_timestamp());


SELECT DAY(CURRENT_DATE) AS dayno_OF_CURRENT_MONTH;---if i want to know about day no of the current month
SELECT WEEK(CURRENT_DATE) AS WEEKno_FROM_START_OF_THE_YEAR;---if i want to know week no from the starting of the year
SELECT MONTH(CURRENT_DATE) AS MNTHno_FROM_START_OF_THE_YEAR;--if i want to know about month no from the starting of the year


SELECT to_date('2022-11-17') AS whole_date;

SELECT DAY(to_date('2022-11-17')) AS dayno_OF_CURRENT_MONTH;

SELECT DAY(to_date('2022-11-17') -  interval'20days') AS days_20_back_from_given_date;

SELECT DAY(date('2022-11-17') - interval'20days') AS days_20_back_from_given_date;

-- GET LAST DAY OF current MONTH
select last_day(current_date) as last_day_curr_month;---it will give me whole date

select day(last_day(current_date)) as last_day_curr_month; ---it will give me only day

select last_day(to_date('2022-11-17')) as last_date_of_given_month;

-- GET LAST DAY OF PREVIOUS MONTH
SELECT LAST_DAY(CURRENT_DATE - INTERVAL '1 MONTH') AS LAST_DAY_PREV_MNTH;

SELECT LAST_DAY(CURRENT_DATE - INTERVAL '1MONTH') AS LAST_DAY_PREV_MNTH;

SELECT LAST_DAY(CURRENT_DATE - INTERVAL '2MONTH') AS LAST_DAY_2PREV_MNTH;


SELECT LAST_DAY( date('2022-11-17') - INTERVAL '1 MONTH') AS LAST_DAY_given_MNTH;

SELECT LAST_DAY(CURRENT_DATE - INTERVAL '2 MONTH') + INTERVAL '1 DAY' AS FIRST_DAY;---it will give first date of previous month

-- go back 5 days from current date

select date(to_date('2022-11-17');

select date(to_date('2022-11-17')- interval '5 day') as five_days_back_from_given_date;

select date(to_date('2022-11-17')- interval '15 day') as fifteen_days_back_from_given_date;

select date(to_date('2022-11-17')- interval '2 week') as two_week_back_from_given_date;

select date(to_date('2022-11-17')- interval '2 months') as two_months_back_from_given_date;


SELECT QUARTER(CURRENT_DATE) AS QTR;----it gives the no of quarter

SELECT QUARTER(to_date('2022-11-17')) AS QTR;






-- GET YR FROM DATE
SELECT DATE_TRUNC('YEAR',CURRENT_DATE) AS YR_FROM_DATE;------it will give the result in the format yyyy-mm-dd
SELECT DATE_TRUNC('YEAR',to_date('2024-04-15')) AS YR_FROM_DATE;

-- GET MTH FROM DATE
SELECT DATE_TRUNC('MONTH',CURRENT_DATE) AS MTH_FROM_DATE;------it will give the result in the format yyyy-mm-dd
SELECT DATE_TRUNC('MONTH',to_date('2024-04-15')) AS MTH_FROM_DATE;

-- GET DAY FROM DATE------it will give the result in the format yyyy-mm-dd
SELECT DATE_TRUNC('DAY',CURRENT_DATE) AS DAY_FROM_DATE;

SELECT DATE_TRUNC('WEEK',CURRENT_DATE) AS WEEK_FROM_DATE;----it will give mondaydate just before currentdate
SELECT DATE_TRUNC('WEEK',to_date('2022-11-17')) AS WEEK_FROM_DATE;





SELECT EXTRACT(YEAR FROM CURRENT_DATE) AS YR;
SELECT EXTRACT(YEAR FROM date('2022-11-17')) AS YR;

SELECT EXTRACT(MONTH FROM CURRENT_DATE) AS MTH;
SELECT EXTRACT(MONTH FROM date('2022-11-17')) AS MTH;

SELECT EXTRACT(DAY FROM CURRENT_DATE) AS DAY;
SELECT EXTRACT(DAY FROM date('2022-11-17')) AS DAY;

SELECT to_date('08-23-2022','mm-dd-yyyy');

SELECT TO_DATE('1993-08-17') AS DATE;



----to_char--it is used to convert format of the date
SELECT TO_CHAR( current_date,'DD-MM-YYYY');

SELECT TO_CHAR(TO_DATE('1993-08-17'),'DD-MM-YYYY') AS DATE_DD_MM_YYYY; --THIS WILL BE HIGHLY USED

SELECT TO_CHAR(TO_DATE('1993-08-17'),'MM-YYYY') AS MM_YYYY;

SELECT TO_CHAR(TO_DATE('1993-08-17'),'MON-YYYY') AS MON_YYYY;

SELECT TO_CHAR(TO_DATE('1993-08-17'),'MON-YY') AS DATE_MON_YY;

SELECT TO_CHAR(TO_DATE('1993-08-17'),'DY') AS DATE_DAY;

SELECT TO_CHAR(TO_DATE('1993-08-17'),'DY-DD-MM-YYYY') AS DATE_DAY;





