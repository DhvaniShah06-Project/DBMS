--1. Create a view Personal with all columns. 
	CREATE VIEW VW_PERSONAL
	AS
	SELECT *
	FROM STUDENT_INFO

--2. Create a view Student_Details having columns Name, Branch & SPI.  
	CREATE VIEW VW_NAME_BRANCH
	AS
	SELECT NAME,BRANCH,SPI
	FROM STUDENT_INFO
	
--3. Create a view AcademicData having columns RNo, Name, Branch. 
	CREATE VIEW ACADEMIC_DATA
	AS
	SELECT RNO,NAME,BRANCH
	FROM STUDENT_INFO

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 
	CREATE VIEW VW_STUDENT_BKLOG
	AS
	SELECT RNO,NAME,BRANCH
	FROM STUDENT_INFO
	WHERE BKLOG>2
	SELECT  * FROM VW_STUDENT_BKLOG

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters. 
	CREATE VIEW VW_STUDENT_PATTERN
	AS
	SELECT RNO,NAME,BRANCH
	FROM STUDENT_INFO
	WHERE NAME LIKE '____'
	SELECT * FROM VW_STUDENT_PATTERN

--6. Insert a new record to AcademicData view. (107, Meet, ME) 
	INSERT INTO STUDENT_INFO (RNO, NAME, BRANCH,SPI)
	VALUES (107, 'Meet', 'ME',7.5);
	
--7. Update the branch of Amit from CE to ME in Student_Details view.
	UPDATE ACADEMIC_DATA
	SET BRANCH='ME'
	WHERE NAME='AMIT'

--8. Delete a student whose roll number is 104 from AcademicData view. 
	DELETE FROM ACADEMIC_DATA
	WHERE RNO = 104;
	SELECT * FROM ACADEMIC_DATA

--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and  backlog less than 2. 
	CREATE VIEW  VW_NAME_DETAILS
	AS
	SELECT NAME,SPI,BKLOG
	FROM STUDENT_INFO
	WHERE (NAME LIKE 'M%A') AND (SPI > 6) AND(BKLOG < 2)

	SELECT * FROM VW_NAME_DETAILS

--10. Create the view for the students whose name contains vowel. 
	CREATE VIEW HAVE_VOWEL
	AS
	SELECT NAME
	FROM STUDENT_INFO
	WHERE NAME LIKE '%[A,E,I,O,U]%'
	SELECT * FROM HAVE_VOWEL

--Part – B: 
--1. Create a view that displays information of all students whose SPI is above 8.5 
	CREATE VIEW DISPLAY_INFO
	AS
	SELECT *
	FROM STUDENT_INFO
	WHERE SPI > 8.5
	SELECT * FROM DISPLAY_INFO

--2. Create a view that displays 0 backlog students. 
	CREATE VIEW DISPLAY_BACKLOG
	AS
	SELECT *
	FROM STUDENT_INFO
	WHERE BKLOG = 0
	SELECT * FROM DISPLAY_BACKLOG
	
--3. Create a view Computerview that displays CE branch data only. 
	CREATE VIEW VW_COMPUTERVIEW
	AS 
	SELECT *
	FROM STUDENT_INFO
	WHERE BRANCH = 'CE'
	SELECT * FROM VW_COMPUTERVIEW

--Part – C: 
--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC. 
	CREATE VIEW RESULT_EC
	AS
	SELECT NAME,SPI
	FROM STUDENT_INFO
	WHERE (SPI < 5) AND (BRANCH = 'EC')
	SELECT * FROM RESULT_EC

--2. Update the result of student MAHESH to 4.90 in Result_EC view. 
	UPDATE RESULT_EC
	SET SPI = 4.90
	WHERE NAME = 'MAHESH'

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5. 
	CREATE VIEW STU_BKLOG
	AS
	SELECT RNO,NAME,BKLOG
	FROM STUDENT_INFO
	WHERE (NAME LIKE 'M%') AND (BKLOG > 5)
	SELECT * FROM STU_BKLOG

--4. Drop Computerview form the database.
	DROP VIEW VW_COMPUTERVIEW