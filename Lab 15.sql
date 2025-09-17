CREATE TABLE STU_MASTER
(
RNO INT PRIMARY KEY,
NAME VARCHAR(30),
BRANCH VARCHAR(30) DEFAULT 'GENERAL',
SPI DECIMAL(3,2) CHECK (SPI <=10.00),
BKLOG INT CHECK (BKLOG >=0)
)
UPDATE STU_MASTER
SET SPI = 12.00
WHERE NAME='RAJU'
--Arithmetic overflow error converting numeric to data type numeric.
UPDATE STU_MASTER
SET BKLOG = -1
WHERE NAME='NEHA'
--The UPDATE statement conflicted with the CHECK constraint "CK__STU_MASTE__BKLOG__15702A09". The conflict occurred in database "CSE_3A_102", table "dbo.STU_MASTER", column 'BKLOG'.
SELECT * FROM STU_MASTER

--Part – B: Create table as per following schema with proper validation and try to insert data which violate your validation. 
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) 
	CREATE TABLE EMP_DETAILS(
	EID INT PRIMARY KEY,
	ENAME VARCHAR(25),
	DID INT,
	CID INT FOREIGN KEY REFERENCES CITY_DETAIL(CID),
	SALARY INT,
	EXPERIENCE INT,
	)
--Dept_details(Did, Dname) 
	CREATE TABLE DEPT_DETAILS(
	DID INT PRIMARY KEY,
	DNAME VARCHAR(25)
	)
	

--City_details(Cid, Cname) 
CREATE TABLE CITY_DETAIL (
	CID INT PRIMARY KEY,
	CNAME VARCHAR(30)
)
SELECT * FROM CITY_DETAIL
INSERT INTO CITY_DETAIL VALUES
(50,'MUMBAI')

-- ERROR
--Cannot insert the value NULL into column 'CID', table 'CSE_3A_102.dbo.CITY_DETAIL'; column does not allow nulls. INSERT fails.

--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
	CREATE TABLE EMP_NEW(
	EID INT PRIMARY KEY,
	DID INT FOREIGN KEY REFERENCES DEPT_INFO_NEW (DID),
	CID INT FOREIGN KEY REFERENCES CITY_NEW(CID),
	SALARY INT,
	EXPERIENCE INT
	)
	

--Dept_info(Did, Dname) 
	CREATE TABLE DEPT_INFO_NEW(
	DID INT  PRIMARY KEY,
	DNAME VARCHAR(25)
	)
	--1 2 3 4 5

--City_info(Cid, Cname, Did)) 
	CREATE TABLE CITY_NEW(
	CID INT PRIMARY KEY,
	CNAME VARCHAR(25),
	DID INT FOREIGN KEY REFERENCES DISTRICT_NEW (DID)
	)
	--1001 1002 1003

--District(Did, Dname, Sid) 
	CREATE TABLE DISTRICT_NEW(
	DID INT PRIMARY KEY,
	DNAME VARCHAR(30),
	SID INT FOREIGN KEY REFERENCES STATE_NEW (SID)
	)
	--101 102 103 104 105

--State(Sid, Sname, Cid) 

	CREATE TABLE STATE_NEW(
	SID INT PRIMARY KEY,
	SNAME VARCHAR (25),
	CID INT FOREIGN KEY REFERENCES COUNTRY_NEW (CID))
	--10 20 30 40 50

--Country(Cid, Cname) 
CREATE TABLE COUNTRY_NEW(
CID INT PRIMARY KEY,
CNAME VARCHAR (30)
)
--1 2 3 4 5
--2. Insert 5 records in each table. 
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees.
	SELECT  EMPNAME , SALARY , EXPERIENCE , SNAME , COUNTRY_NEW.CNAME AS COUNTRY_NAME , CITY_NEW.CNAME AS CITY_NAME , DISTRICT_NEW.DNAME AS DISTRICT_NAME
	FROM
	COUNTRY_NEW
	JOIN  STATE_NEW
	ON  COUNTRY_NEW.CID = STATE_NEW.CID
	 JOIN DISTRICT_NEW
	 ON STATE_NEW.SID = DISTRICT_NEW.SID
	 JOIN CITY_NEW
	 ON CITY_NEW.DID = DISTRICT_NEW.DID
	 JOIN EMP_NEW
	 ON CITY_NEW.CID =  EMP_NEW.CID
	 JOIN DEPT_INFO_NEW
	 ON EMP_NEW.DID = DEPT_INFO_NEW.DID
	 
	-- ON EMP_NEW.CID = 
	-- JOIN 
	-- DISTRICT_NEW
	-- ON EMP_NEW.DID = DISTRICT_NEW.DID
	--JOIN 
	--CITY_NEW
	--ON EMP_NEW.CID = CITY_NEW.CID
	--JOIN EMP_NEW 
	--JOIN
	--DEPT_INFO_NEW ON EMP_NEW.DID = DEPT_INFO_NEW.DID
	