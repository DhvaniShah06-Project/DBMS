--Sub Queries 

--Part – A: 
--1. Display details of students who are from computer department. 
	SELECT *
	FROM STUDENT_DATA
	WHERE DID = (SELECT 
						DID
						FROM DEPARTMENT
						WHERE DNAME = 'COMPUTER')

--2. Displays name of students whose SPI is more than 8. 
	SELECT RNO,NAME
	FROM STUDENT_DATA
	WHERE RNO IN (SELECT
						RNO
						FROM ACADEMIC
						WHERE SPI > 8)
	
--3. Display details of students of computer department who belongs to Rajkot city.
	SELECT *
	FROM STUDENT_DATA
	WHERE (CITY = 'RAJKOT') AND
	DID = (SELECT 
						DID
						FROM DEPARTMENT
						WHERE DNAME = 'COMPUTER')

--4. Find total number of students of electrical department. 
	SELECT COUNT(DID) AS ELECTRICAL_DEPT_COUNT
	FROM STUDENT_DATA
	WHERE DID IN (SELECT 
						DID
						FROM DEPARTMENT
						WHERE DNAME = 'ELECTRICAL')

--5. Display name of student who is having maximum SPI. 
	SELECT NAME
	FROM STUDENT_DATA
	WHERE RNO = (SELECT 
						RNO
						FROM ACADEMIC
						WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC))

--6. Display details of students having more than 1 backlog. 
	SELECT *
	FROM STUDENT_DATA
	WHERE RNO IN (SELECT 
						RNO
						FROM ACADEMIC
						WHERE BKLOG > 1)

--Part – B: 
--1. Display name of students who are either from computer department or from mechanical department. 
	SELECT NAME
	FROM STUDENT_DATA
	WHERE DID IN (SELECT 
						DID
						FROM DEPARTMENT
						WHERE DNAME IN ('COMPUTER','MECHANICAL'))

--2. Display name of students who are in same department as 102 studying in. 
	SELECT NAME 
	FROM STUDENT_DATA
	WHERE DID IN (SELECT
						DID
						FROM STUDENT_DATA 
						WHERE RNO = 102)

--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
	SELECT NAME
	FROM STUDENT_DATA
	WHERE DID IN(SELECT 
						DID
						FROM DEPARTMENT
						WHERE DNAME = 'ELECTRICAL')
	AND
	RNO IN (SELECT
					RNO
					FROM ACADEMIC
					WHERE SPI > 9)

--2. Display name of student who is having second highest SPI. 
	SELECT NAME
	FROM STUDENT_DATA
	WHERE RNO = (SELECT TOP 1 RNO
						FROM ACADEMIC
						WHERE SPI < (SELECT MAX(SPI) FROM ACADEMIC)
						ORDER BY SPI DESC
						)
											
--3. Display city names whose students SPI is 9.2 
	SELECT CITY
	FROM STUDENT_DATA
	WHERE RNO = (SELECT RNO FROM ACADEMIC WHERE SPI = 9.2)

--4. Find the names of students who have more than the average number of backlogs across all students. 
	SELECT RNO, NAME
	FROM STUDENT_DATA
	WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE BKLOG  > (SELECT AVG(BKLOG) FROM ACADEMIC))

--5. Display the names of students who are in the same department as the student with the highest SPI. 
	SELECT RNO,NAME,CITY
	FROM STUDENT_DATA
	WHERE DID = (SELECT
						DID
						FROM STUDENT_DATA 
						WHERE  RNO IN (SELECT 
												RNO
												FROM ACADEMIC
												WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC)))	

--SET Operators 
--Part – A: 
--1. Display name of students who is either in Computer or in Electrical. 
	SELECT NAME FROM COMPUTER
	UNION
	SELECT NAME FROM ELECTRICAL
	
--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
	SELECT NAME FROM COMPUTER
	UNION ALL
	SELECT NAME FROM ELECTRICAL

--3. Display name of students who is in both Computer and Electrical. 
	SELECT NAME FROM COMPUTER
	INTERSECT
	SELECT NAME FROM ELECTRICAL

--4. Display name of students who are in Computer but not in Electrical. 
	SELECT NAME FROM COMPUTER
	EXCEPT
	SELECT NAME FROM ELECTRICAL

--5. Display name of students who are in Electrical but not in Computer. 
	SELECT NAME FROM ELECTRICAL
	EXCEPT
	SELECT NAME FROM COMPUTER
	
--6. Display all the details of students who are either in Computer or in Electrical.
	SELECT * FROM COMPUTER
	UNION ALL
	SELECT * FROM ELECTRICAL
	
--7. Display all the details of students who are in both Computer and Electrical.
	SELECT * FROM COMPUTER
	INTERSECT
	SELECT * FROM ELECTRICAL

--Part – B: 
--1. Display name of persons who is either Employee or Customer. 
	SELECT NAME FROM EMP_DATA
	UNION
	SELECT NAME FROM CUSTOMER

--2. Display name of persons who is either Employee or Customer including duplicate data. 
	SELECT NAME FROM EMP_DATA
	UNION ALL
	SELECT NAME FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
	SELECT NAME FROM EMP_DATA
	INTERSECT
	SELECT NAME FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
	SELECT NAME FROM EMP_DATA
	EXCEPT
	SELECT NAME FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee. 
	SELECT NAME FROM CUSTOMER
	EXCEPT
	SELECT NAME FROM EMP_DATA

--Part – C:  
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only. 
	SELECT EID,NAME FROM EMP_DATA
	UNION
	SELECT CID,NAME FROM CUSTOMER

	SELECT EID,NAME FROM EMP_DATA
	UNION ALL
	SELECT CID,NAME FROM CUSTOMER

	SELECT EID,NAME FROM EMP_DATA
	INTERSECT
	SELECT CID,NAME FROM CUSTOMER

	SELECT EID,NAME FROM EMP_DATA
	EXCEPT
	SELECT CID,NAME FROM CUSTOMER

	SELECT CID, NAME FROM CUSTOMER
	EXCEPT
	SELECT EID, NAME FROM EMP_DATA

