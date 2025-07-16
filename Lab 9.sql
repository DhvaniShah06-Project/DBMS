
--Math functions 
--Part – A: 
--1. Display the result of 5 multiply by 30. 
	SELECT (5*30);
	
--2. Find out the absolute value of -25, 25, -50 and 50. 
	SELECT ABS(-25);
	SELECT ABS(25);
	SELECT ABS(-50);
	SELECT ABS(50);

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
	SELECT CEILING(25.2);
	SELECT CEILING(25.7);
	SELECT CEILING(-25.2);

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
	SELECT FLOOR(25.2)
	SELECT FLOOR(25.7)
	SELECT FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
	SELECT (5%2);
	SELECT(5%3);

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
	SELECT POWER(3,2)
	SELECT POWER(4,3)

--7. Find out the square root of 25, 30 and 50. 
	SELECT SQRT(25)h
	SELECT SQRT(30)
	SELECT SQRT(50)

--8. Find out the square of 5, 15, and 25. 
	SELECT SQUARE(5);
	SELECT SQUARE(15);
	SELECT SQUARE(25);

--9. Find out the value of PI. 
	SELECT PI();

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points. 
	SELECT ROUND(157.732,2)
	SELECT ROUND(157.732,0)
	SELECT ROUND(157.732,-2);

--11. Find out exponential value of 2 and 3. 
	SELECT EXP(2)
	SELECT EXP(3);

--12. Find out logarithm having base e of 10 and 2. 
	SELECT LOG(10)
	SELECT LOG10(10)

	SELECT LOG(2)
	SELECT LOG10(2)

--13. Find out logarithm having base b having value 10 of 5 and 100.  
	SELECT LOG10(5)
	SELECT LOG10(100)

--14. Find sine, cosine and tangent of 3.1415. 
SELECT SIN(3.1415)
SELECT COS(3.1415)
SELECT TAN(3.1415)

--15. Find sign of -25, 0 and 25. 
	SELECT SIGN(-25)
	SELECT SIGN(0)
	SELECT SIGN(25)

--16. Generate random number using function. 
	SELECT RAND();

--Part – B: 
--Create and insert the following records in the EMP_MASTER table.  
--EmpNo EmpName JoiningDate Salary Commission City Dept Code 
--101 Keyur 5-1-02 12000.00 4500 Rajkot 3@g 
--102 Hardik 15-2-04 14000.00 2500 Ahmedabad 3@ 
--103 Kajal 14-3-06 15000.00 3000 Baroda 3-GD 
--104 Bhoomi 23-6-05 12500.00 1000 Ahmedabad 1A3D 
--105 Harmit 15-2-04 14000.00 2000 Rajkot 312A 
	CREATE TABLE EMP_MASTER
	(
	EMPNO INT,
	EMPNAME VARCHAR(30),
	JOININGDATE DATETIME,
	SALARY DECIMAL(7,2),
	COMMISSION INT,
	CITY VARCHAR(30),
	DEPTCODE VARCHAR(15)
	)
	INSERT INTO EMP_MASTER VALUES
	(101,'KEYUR','2002-01-05',12000.00,4500,'RAJKOT','3@G'),
	(102,'HARDIK','2004-02-15',14000.00,2500,'AHMEDABAD','3@'),
	(103,'KAJAL','2006-03-14',15000.00,3000,'BARODA','3-GD'),
	(104,'BHOOMI','2005-06-23',12500.00,1000,'AHMEDABAD','1A3D'),
	(105,'HARMIT','2004-02-15',14000.00,2000,'RAJKOT','312A')
	SELECT * FROM EMP_MASTER;
	ALTER TABLE EMP_MASTER
	ALTER COLUMN SALARY INT
--1. Display the result of Salary plus Commission.
	SELECT COMMISSION+SALARY AS TOTAL_SALARY
	FROM EMP_MASTER;

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2. 
	SELECT CEILING(55.2)
	SELECT CEILING(35.7)
	SELECT CEILING(-55.2)

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2. 
	SELECT FLOOR(55.2)
	SELECT FLOOR(35.7)
	SELECT FLOOR(-55.2)

--4. Find out remainder of 55 divided 2 and 55 divided by 3. 
	SELECT (55%2)
	SELECT (55%3)

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power. 
	SELECT POWER(23,2)
	SELECT POWER(14,3)

--Part – C: 
--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000. 
	SELECT *,(COMMISSION+SALARY) AS TOTAL_SALARY
	FROM EMP_MASTER
	WHERE (COMMISSION+SALARY) > 15000

--2. Find the details of employees whose commission is more than 25% of their salary. 
	SELECT *
	FROM EMP_MASTER
	WHERE COMMISSION > (0.25*SALARY)

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater than 15000. 
	SELECT * , (SALARY+COMMISSION) AS TOTAL_SALARY
	FROM EMP_MASTER
	WHERE (JOININGDATE < '2005-01-01') AND (SALARY+COMMISSION) > 15000

--4. Find employees whose total earnings (Salary + Commission) are at least double their salary. 
	SELECT *
	FROM EMP_MASTER 
	WHERE ((SALARY+COMMISSION) >= 2*SALARY)

--String functions 
--Part – A: 
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
	SELECT LEN('bLANK');
	SELECT LEN('   HELLO       ')
	SELECT LEN(NULL)

--2. Display your name in lower & upper case. 
	SELECT UPPER('dhvani');
	SELECT LOWER('DHVANI');

--3. Display first three characters of your name.
		SELECT SUBSTRING('DHVANI SHAH',1,3);

	
--4. Display 3rd to 10th character of your name. 
	SELECT SUBSTRING('DHVANI SHAH 3RD SEM',3,10);

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
	SELECT REPLACE('ABC123EFG','ABC123EFG','ABCXYZEFG');

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
	SELECT ASCII('A')
	SELECT ASCII('a')
	SELECT ASCII('Z')
	SELECT ASCII('z')
	SELECT ASCII('0')
	SELECT ASCII('9')

--7. Write a query to display character based on number 97, 65,122,90,48,57.
	--SELECT ASCII(97)
	--SELECT ASCII('a')
	--SELECT ASCII('Z')
	--SELECT ASCII('z')
	--SELECT ASCII('0')
	--SELECT ASCII('9')
	
--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
	SELECT LTRIM(' hello world  ');

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 
	SELECT RTRIM(' hello world  ');

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
	SELECT SUBSTRING('SQL SERVER' ,1,4)
	SELECT RIGHT('SQL SERVER',5)
	
--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
	SELECT CAST(1234.56 AS INTEGER);
	SELECT CONVERT (INTEGER,1234.56);

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 
	SELECT CAST(10.58 AS INTEGER);
	SELECT CONVERT(INTEGER,10.58);

--13. Put 10 space before your name using function. 
	select space(10) + 'DHVANI'

--14. Combine two strings using + sign as well as CONCAT (). 
	SELECT CONCAT('DHVANI ','SHAH');
	SELECT('DHVANI'+' SHAH')

--15. Find reverse of “Darshan”. 
	SELECT REVERSE('DHVANI');

--16. Repeat your name 3 times. 
	SELECT REPLICATE('DHVANI ',3)

--Part – B: Perform following queries on EMP_MASTER table. 
--1. Find the length of EMP Name and City columns. 
	SELECT LEN(EMPNAME) AS LENGTH
	FROM EMP_MASTER;

--2. Display EMP Name and City columns in lower & upper case. 
	SELECT UPPER(EMPNAME) AS UPPER, LOWER(EMPNAME) AS LOWER
	FROM EMP_MASTER;

--3. Display first three characters of EMP Name column. 
	SELECT SUBSTRING(EMPNAME,1,3)
	FROM EMP_MASTER;

--4. Display 3rd to 10th character of city column. 
	SELECT SUBSTRING(CITY,3,10)
	FROM EMP_MASTER
	
--5. Write a query to display first 4 & Last 5 characters of EMP Name column. 
	SELECT LEFT(EMPNAME,4),RIGHT(EMPNAME,5)
	FROM EMP_MASTER;

--Part – C: Perform following queries on EMP_MASTER table. 
--1. Put 10 space before EMP Name using function. 
	SELECT SPACE(10)+EMPNAME
	FROM EMP_MASTER;

--2. Combine EMP Name and city columns using + sign as well as CONCAT ().
	SELECT CONCAT(EMPNAME,CITY)
	FROM EMP_MASTER
	
--3. Combine all columns using + sign as well as CONCAT (). 
	SELECT CONCAT(EMPNO, EMPNAME, JOININGDATE, SALARY,  COMMISSION, CITY, DEPTCODE)
	FROM EMP_MASTER
	SELECT EMPNO + EMPNAME +  JOININGDATE+ SALARY + COMMISSION + CITY + DEPTCODE
	FROM EMP_MASTER
--4. Combine the result as < EMP Name > Lives in <City>. 
	SELECT CONCAT(EMPNAME , ' ', 'LIVES IN',' ',CITY) AS EMPLOYEE_INFORMATION
	FROM EMP_MASTER
	
--5. Combine the result as ‘EMP no of < EMP Name> is <EmpNo> . 
	SELECT CONCAT('EMP NUMBER OF',' ', EMPNAME,' ', 'IS',' ',EMPNO)
	FROM EMP_MASTER
--6. Retrieve the names of all employee where the third character of the Name is a vowel. 
	SELECT *
	FROM EMP_MASTER
	WHERE EMPNAME LIKE'__[A,E,I,O,U]%'

--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that starts with 'R'.
	SELECT CONCAT(EMPNAME,CITY)
	FROM EMP_MASTER
	WHERE (EMPNAME LIKE '%R') AND (CITY LIKE 'R%')

--Date Functions 
--Part – A: 
--1. Write a query to display the current date & time. Label the column Today_Date.
	SELECT GETDATE() AS TODAY_DATE;

--2. Write a query to find new date after 365 day with reference to today. 
	SELECT DATEADD(D,365,GETDATE());

--3. Display the current date in a format that appears as may 5 1994 12:00AM. 
	SELECT YEAR('05-05-1994 12:00');

--4. Display the current date in a format that appears as 03 Jan 1995. 


--5. Display the current date in a format that appears as Jan 04, 96. 
	
--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
	SELECT DATEDIFF(MONTH,'2008-12-31','2009-03-21');

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
	SELECT DATEDIFF(HOUR,'2012-01-25 7:00','2012-01-26 10:30');

--8. Write a query to extract Day, Month, Year from given date 12-May-16. 
	SELECT DAY('2016-05-12');
	SELECT MONTH('2016-05-12');
	SELECT YEAR('2016-05-12');

--9. Write a query that adds 5 years to current date. 
	SELECT DATEADD(YYYY,5,GETDATE());

--10. Write a query to subtract 2 months from current date. 
	SELECT DATEADD(MM,-2,GETDATE());
		
--11. Extract month from current date using datename () and datepart () function. 
	SELECT DATENAME(MONTH,GETDATE());
	SELECT DATEPART(MONTH,GETDATE());

--12. Write a query to find out last date of current month. 
	SELECT EOMONTH(GETDATE());

--13. Calculate your age in years and months. 
	SELECT DATEDIFF(YEAR,'2006-03-24',GETDATE());
	SELECT DATEDIFF(MONTH,'2006-03-24',GETDATE());

--Part – B: Perform following queries on EMP_MASTER table.  
--1. Write a query to find new date after 365 days with reference to JoiningDate. 
	SELECT DATEADD(DD,365,JOININGDATE)
	FROM EMP_MASTER

--2. Write a query to find out total number of months between JoiningDate and 31-Mar-09. 
	SELECT DATEDIFF(MONTH,JOININGDATE,'2009-03-31')
	FROM EMP_MASTER
--3. Write a query to find out total number of years between JoiningDate and 14-Sep-10.
	SELECT DATEDIFF(YEAR,JOININGDATE,'2010-09-14')
	FROM EMP_MASTER

--Part – C: Perform following queries on EMP_MASTER table. 
--1. Write a query to extract Day, Month, Year from JoiningDate. 
	SELECT DAY(JOININGDATE),MONTH(JOININGDATE),YEAR(JOININGDATE)
	FROM EMP_MASTER;

--2. Write a query that adds 5 years to JoiningDate. 
	SELECT DATEADD(YYYY,5,JOININGDATE)
	FROM EMP_MASTER

--3. Write a query to subtract 2 months from JoiningDate. 
	SELECT DATEADD(MM,-2,JOININGDATE)
	FROM EMP_MASTER;

--4. Extract month from JoiningDate using datename () and datepart () function. 
	SELECT DATEPART(MONTH,JOININGDATE)
	FROM EMP_MASTER
	SELECT DATENAME(MONTH,JOININGDATE)
	FROM EMP_MASTER

--5. Select employee who joined between the 1st and 15th of any month in any year. 
	SELECT *,DATEPART(DAY,JOININGDATE)
	FROM EMP_MASTER
	WHERE DATEPART(DAY,JOININGDATE) < 16

--6. Find employee whose JoiningDate is the last day of any month. 
	SELECT *
	FROM EMP_MASTER
	WHERE DATEPART(DAY,JOININGDATE) =	DATEPART(DAY,EOMONTH(JOININGDATE))
	--7. List employee whose JoiningDate is during a leap year. 
		SELECT *
		FROM EMP_MASTER
		WHERE YEAR(JOININGDATE) %4 =0 AND YEAR(JOININGDATE) %100 !=0 OR YEAR(JOININGDATE) %400 = 0;
		