CREATE TABLE TEAM
(
TEAM_ID INT PRIMARY KEY,
TEAM_NAME VARCHAR(30),
TEAM_COACH VARCHAR(100),
TEAM_WINS INT,
TEAM_TOTAL_MATCHES INT,
HOME_STADIUM_ID INT FOREIGN KEY REFERENCES STADIUM(STADIUM_ID)
)



CREATE TABLE STADIUM(

STADIUM_ID INT PRIMARY KEY,
STADIUM_NAME VARCHAR(30),
STADIUM_CITY VARCHAR(30),
STADIUM_CAPACITY INT
)
--INDENTITY(START,INCREMENT)
CREATE TABLE PLAYERS
(
PLAYER_ID INT PRIMARY KEY,
PLAYER_FIRST_NAME VARCHAR(30),
PLAYER_LAST_NAME VARCHAR(30),
TEAM_ID  INT FOREIGN KEY REFERENCES TEAM(TEAM_ID),
PLAYER_ROLE VARCHAR(30),
PLAYER_JERSEY_NUMBER INT,
PLAYER_MATCHES_PLAYED INT
)
SELECT * FROM STADIUM
SELECT * FROM TEAM
SELECT * FROM PLAYERS

INSERT INTO Stadium VALUES
(1, 'Eden Gardens', 'Kolkata', 66000),
(3, 'M. A. Chidambaram Stadium', 'Chennai', 50000),
(4, 'M. Chinnaswamy Stadium', 'Bengaluru', 40000),
(5, 'Arun Jaitley Stadium', 'Delhi', 41000);

INSERT INTO Team VALUES
(2, 'CSK', 'Stephen Fleming', 130, 210, 3),
(3, 'Royal Challengers Bangalore', 'Sanjay Bangar', 90, 200, 4),
(4, 'Kolkata Knight Riders', 'Chandrakant Pandit', 100, 190, 1),
(5, 'Delhi Capitals', 'Ricky Ponting', 85, 180, 5);

INSERT INTO Players VALUES
(1, 'Virat', 'Kohli', 3, 'Batsman', 18, 220),
(3, 'MS', 'Dhoni', 2, 'Wicketkeeper', 7, 250),
(4, 'Andre', 'Russell', 4, 'All-rounder', 12, 150),
(5, 'David', 'Warner', 5, 'Batsman', 31, 210),
(6, 'Shikhar', 'Dhawan', 5, 'Batsman', 25, 220),
(7, 'Vijay', 'Shankar', 3, 'All-rounder', 28, 75),
(8, 'Aaron', 'Finch', 3, 'Batsman', 5, 80),
(10, 'Ravindra', 'Jadeja', 2, 'All-rounder', 8, 200);





--1.  Retrieve Unique Roles of Players. 
	SELECT DISTINCT *
	FROM PLAYERS
--2.  Calculate the winning percentage of each team. 
	SELECT  TEAM_NAME , SUM(TEAM_WINS)*100/SUM(TEAM_TOTAL_MATCHES) AS WINNING_PERCENT
	FROM TEAM
	GROUP BY TEAM_NAME

	SELECT (TEAM_WINS)*100/(TEAM_TOTAL_MATCHES)
	FROM TEAM

--3.  Insert a new record to Stadium Table. (2, Wankhede Stadium, Mumbai,33000) 
	INSERT INTO STADIUM VALUES
	(2,'Wankhede Stadium','Mumbai',33000)

--4.  Update Team Coach Name of Team RCB to Ashish Nehra. 
	UPDATE  TEAM
	SET TEAM_COACH = 'Ashish Nehra'
	WHERE TEAM_NAME = 'Royal Challengers Bangalore'

	select * from PLAYERS
	
--5.  Delete All the Records of Player Shikhar Dhawan. 
	DELETE 
	FROM PLAYERS
	WHERE PLAYER_FIRST_NAME + PLAYER_LAST_NAME = 'Shikhar Dhawan'
--6.  Change the size of stadium_name column from VARCHAR (100) to VARCHAR (15). 
	ALTER TABLE STADIUM
	ALTER COLUMN STADIUM_NAME VARCHAR(40)
--7.  Remove Player Table. 
	
--8.  Display Top 30 Players Whose First Name Starts with Vowel.
	SELECT 
	* FROM PLAYERS
	WHERE PLAYER_FIRST_NAME LIKE '[A,E,I,O,U]%'

--9.  Display City Whose Stadium Name does not Ends with ‘M’. 
	SELECT STADIUM_CITY
	FROM STADIUM
	WHERE STADIUM_NAME NOT LIKE '%M'
	SELECT * FROM PLAYERS
--10.  Generate Random Number between 0 to 100. 
	SELECT RAND()*100
--11.  Display 4th to 9th Character of ‘Virat Kohli’. 
	SELECT SUBSTRING(PLAYER_FIRST_NAME + PLAYER_LAST_NAME,4,9)
	FROM PLAYERS
	WHERE  PLAYER_FIRST_NAME = 'Virat'
--12.  Display The Day of week on 01-01-2005.
	SELECT DAY('2005-01-01')
	
--13.  Display City Wise Maximum Stadium Capacity.
	SELECT STADIUM_CITY , MAX(STADIUM_CAPACITY) AS MAX_CAPACITY
	FROM STADIUM
	GROUP BY STADIUM_CITY

--14.  Display City Whose Average Stadium Capacity is Above 20000. 
	SELECT STADIUM_CITY , AVG(STADIUM_CAPACITY)
	FROM STADIUM
	GROUP BY STADIUM_CITY
	HAVING AVG(STADIUM_CAPACITY) > 20000
	SELECT * FROM TEAM
--15.  Display All Players Full Name, Jersey No and Role Who is Playing for Mumbai Indians. (Using Sub query). 
		SELECT PLAYER_FIRST_NAME + ' ' + PLAYER_LAST_NAME , PLAYER_JERSEY_NUMBER,PLAYER_ROLE
		FROM PLAYERS
		WHERE TEAM_ID = (
		SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = 'CSK')
--16.  Display Team Name Having Home Stadium Capacity Over 50000. (Using Sub query ). 
	SELECT TEAM_NAME
	FROM TEAM
	WHERE HOME_STADIUM_ID IN ( SELECT STADIUM_ID FROM STADIUM
	WHERE (STADIUM_CAPACITY)  > 50000)
	
--17.  Create a View Players_Above_100_Matches of Players Who have Played More than 100 Matches. 
	CREATE VIEW VW_Players_Above_100_Matches
	AS
	SELECT PLAYER_FIRST_NAME,PLAYER_MATCHES_PLAYED
	FROM PLAYERS
	WHERE PLAYER_MATCHES_PLAYED > 100
	SELECT * FROM VW_Players_Above_100_Matches
--18.  Get the Player name, Team name, and their Jersey number who have played Between than 50 to 100 matches. 
	SELECT PLAYER_FIRST_NAME ,PLAYER_JERSEY_NUMBER,TEAM_NAME
	FROM PLAYERS
	JOIN TEAM
	ON PLAYERS.TEAM_ID = TEAM.TEAM_ID
	JOIN STADIUM
	ON TEAM.HOME_STADIUM_ID = STADIUM.STADIUM_ID
	WHERE PLAYERS.PLAYER_MATCHES_PLAYED  BETWEEN 50 AND 100

--19.  Produce Output Like: <PlayerFirstName> Plays For <TeamName> and Has Played <PlayerMatches> matches. (In single column) 
	SELECT PLAYER_FIRST_NAME + ' '+ 'PLAYS FOR ' +TEAM_NAME+ ' AND HAS PLAYED ' + CAST((PLAYER_MATCHES_PLAYED) AS VARCHAR(10))+ ' MATCHES.'
	FROM PLAYERS
	JOIN TEAM
	ON PLAYERS.TEAM_ID = TEAM.TEAM_ID

--20.  Display Stadium Capacity of Team CSK. 
	SELECT STADIUM_CAPACITY
	FROM STADIUM
	WHERE STADIUM_ID IN (SELECT HOME_STADIUM_ID FROM TEAM WHERE TEAM_NAME = 'CSK')


