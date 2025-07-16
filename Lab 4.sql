	--Select into Operation 
	--Part – A:  
	--Create table as per following. 
	--CRICKET 
	--Name City  Age 
	--Sachin Tendulkar Mumbai 30 
	--Rahul Dravid Bombay 35 
	--M. S. Dhoni Jharkhand 31 
	--Suresh Raina Gujarat 30 
		CREATE TABLE CRICKET(
		NAME VARCHAR(50), 
		CITY VARCHAR(50),
		AGE INT
		)
	
		INSERT INTO CRICKET VALUES
		('SACHIN TENDULKAR','MUMBAI',30),
		('RAHUL DRAVID','BOMBAY',35),
		('M.S DHONI','JHARKHAND',31),
		('SURESH RAINA','GUJARAT',30)

		SELECT * FROM CRICKET

	--1. Create table Worldcup from cricket with all the columns and data. 
	
		SELECT *
		INTO WORLDCUP
		FROM CRICKET
			

	--2. Create table T20 from cricket with first two columns with no data. 
		SELECT NAME,CITY
		INTO T20
		FROM CRICKET
		WHERE 4=5
		
	--3. Create table IPL From Cricket with No Data. 
		SELECT *
		INTO IPL
		FROM CRICKET
		WHERE 5=10;
		
	--4. Select players who are either older than 30 and from 'Mumbai' or exactly 31 years old and not from 'Bombay', and insert them into a new table PLAYER. 

		SELECT NAME
		FROM CRICKET
		WHERE AGE > 30 AND CITY = 'MUMBAI' AND CITY !='BOMBAY'
		SELECT AGE,CITY
		INTO PLAYER 
		FROM CRICKET
		WHERE CITY = 'JHARKHAND'

	--5. Select players whose age is a prime number or their city belongs to India Country, and insert them into a new table PLAYER_INFO. (Consider Cricketer age between 18 to 55) 
	
		SELECT*
		INTO PLAYER_INFO
		FROM CRICKET
		WHERE AGE IN (19,23,29,31,37,41,43,47,53) OR 
		CITY IN('MUMBAI','BOMBAY','JHARKHAND','GUJARAT')

	--6. Select players whose age is a multiple of 5 and insert them into a new table PLAYER_DATA. 
		SELECT NAME
		INTO PLAYER_DATA
		FROM CRICKET 
		WHERE AGE % 5 = 0;
		
		SELECT NAME
		FROM PLAYER_DATA

	--7. Insert the cricketer into IPL table whose city is ‘Jharkhand’ 
	
		SELECT NAME,CITY
		INTO IPL
		FROM CRICKET
		WHERE CITY = 'JHARKHAND'
		

	--Part – B:  
	--Create table as per following. 
	--EMPLOYEE 
	--Name City  Age 
	--Jay Patel Rajkot 30 
	--Rahul Dave Baroda 35 
	--Jeet Patel Surat 31 
	--Vijay Raval Rajkot 30 
		CREATE TABLE EMPLOYEE(
		NAME VARCHAR(30),
		CITY VARCHAR (30),
		AGE INT
		)

		INSERT INTO EMPLOYEE VALUES
		('JAY PATEL','RAJKOT',30),
		('RAHUL DAVE','BARODA',35),
		('JEET PATEL','SURAT',31),
		('VIJAY RAVAL','RAJKOT',30)
	
		SELECT * FROM EMPLOYEE


	--1. Create table Employee_detail from Employee with all the columns and data. 
		SELECT *
		INTO EMPLOYEE_DETAIL
		FROM EMPLOYEE

		SELECT * 
		FROM EMPLOYEE_DETAIL

	--2. Create table Employee_data from Employee with first two columns with no data. 
		SELECT *
		INTO EMPLOYEE_DATA
		FROM EMPLOYEE
		WHERE 5 = 10;

	--3. Create table Employee_info from Employee with no Data 
		SELECT *
		INTO EMPLOYEE_INFO
		FROM EMPLOYEE
		WHERE 8+2 = 5;

	--Part – C:  
	--Perform following queries on Employee table. 
	--1. Insert the Data into Employee_info from Employee whose CITY is Rajkot 
		SELECT *
		INTO EMPLOYEE_INFO
		FROM EMPLOYEE
		WHERE CITY ='RAJKOT'

	--2. Insert the Data into Employee_info from Employee whose age is more than 32.
		SELECT *
		INTO EMPLOYEE_INFO
		FROM EMPLOYEE
		WHERE AGE > 32

		--Update Operation 
	--Part – A:  
	--From the above given tables perform the following queries (UPDATE Operation):  
	--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET AMOUNT = 5000.00
		WHERE AMOUNT = 3001.00

	--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 
		UPDATE BORROW
		SET BNAME = 'C.G.ROAD'
		WHERE CNAME = 'ANIL'

	--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET ACTNO = 111,AMOUNT = 5000.00
		WHERE CNAME = 'SANDIP';

	--4. Update amount of KRANTI to 7000. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET AMOUNT = 7000
		WHERE CNAME = 'KRANTI'

	--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table) 
		UPDATE BRANCH
		SET BNAME = 'ANDHERI WEST'
		WHERE BNAME = 'ANDHERI'

	--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET BNAME = 'NEHRU PLACE'
		WHERE BNAME = 'MEHUL'

	--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table)
		UPDATE DEPOSIT
		SET AMOUNT = 5000.0
		WHERE ACTNO >= 103 AND ACTNO <= 107
		SELECT * FROM DEPOSIT

	--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET ADATE = '1995-04-01'
		WHERE CNAME = 'ANIL'

	--9. Update the amount of MINU to 10000. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET AMOUNT = 10000.0
		WHERE CNAME = 'MINU';

	--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)
		UPDATE DEPOSIT
		SET AMOUNT = 5000.0 , ADATE = '1996-04-01'
		WHERE CNAME = 'PRAMOD'

	--Part – B:  
	--1. Give 10% Increment in Loan Amount. (Use Borrow Table) 
		UPDATE BORROW
		SET LONANO = LONANO + (LONANO * (0.1))
		SELECT *
		FROM BORROW


	--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table) 
		UPDATE DEPOSIT
		SET AMOUNT = AMOUNT + (AMOUNT * (0.2))
 
	--3. Increase Amount by 1000 in all the account.  (Use Deposit Table)
		UPDATE DEPOSIT
		SET AMOUNT = AMOUNT + 1000;

	--4. Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the customer name is ‘MEHUL’ and the loan number is even. 
		UPDATE BORROW
		SET AMOUNT = 7000, BNAME = 'CENTRAL'
		WHERE CNAME = 'MEHUL' AND (LONANO % 2 =0)

	--5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in ‘VRCE’ and with an account number less than 105. 
		UPDATE DEPOSIT
		SET ADATE = '2022-05-15' , AMOUNT = 2500
		WHERE BNAME = 'VRCE' AND ACTNO<105
		SELECT * FROM DEPOSIT
		SELECT * FROM BORROW
	
	--Part – C:  
	--1. Update amount of loan no 321 to NULL. (Use Borrow Table) 
		UPDATE BORROW
		SET AMOUNT = NULL
		WHERE LONANO = 321;

	--2. Update branch name of KRANTI to NULL (Use Borrow Table)
		UPDATE BORROW
		SET BNAME = NULL
		WHERE BNAME = 'KRANTI'

	--3. Display the name of borrowers whose Loan number is NULL. (Use Borrow Table) 
		SELECT CNAME
		FROM BORROW
		WHERE LONANO IS NULL

	--4. Display the Borrowers whose having branch. (Use Borrow Table) 
		SELECT *
		FROM BORROW
		--WHERE NOT BNAME IS NULL
		WHERE BNAME IS NOT NULL

	--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. (Use Borrow Table) 
		UPDATE BORROW
		SET LONANO = 5000, BNAME = 'VRCE',CNAME = 'DARSHAN'
		WHERE LONANO = 481;

	--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less than 2000. 
		UPDATE DEPOSIT
		SET ADATE = '2021-01-01'
		WHERE AMOUNT < 2000

	--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 110.
		UPDATE DEPOSIT
		SET ADATE = NULL, BNAME = 'ANDHERI'
		WHERE ACTNO = 110;