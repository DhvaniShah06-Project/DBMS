CREATE TABLE Astronauts (
    astronaut_id INT IDENTITY(1,1) PRIMARY KEY,
    astronaut_name VARCHAR(100) NOT NULL,
    age INT,
    nationality VARCHAR(50),
    total_space_missions INT
);
CREATE TABLE Missions (
    mission_id INT IDENTITY(1,1) PRIMARY KEY,
    mission_name VARCHAR(100) NOT NULL,
    launch_date DATE NOT NULL,
    duration_days INT ,
    mission_type VARCHAR(50)
);


CREATE TABLE Spacecrafts (
    spacecraft_id INT IDENTITY(1,1) PRIMARY KEY,
    spacecraft_name VARCHAR(100) NOT NULL,
    capacity INT,
    manufacturer VARCHAR(100)
);

CREATE TABLE Participation (
    participation_id INT IDENTITY(1,1) PRIMARY KEY,
    astronaut_id INT NOT NULL,
    mission_id INT NOT NULL,
    spacecraft_id INT NOT NULL,
    role VARCHAR(50),
    FOREIGN KEY (astronaut_id) REFERENCES Astronauts(astronaut_id),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    FOREIGN KEY (spacecraft_id) REFERENCES Spacecrafts(spacecraft_id)
);

INSERT INTO Astronauts (astronaut_name, age, nationality, total_space_missions) VALUES
('Neil Armstrong', 39, 'USA', 2),
('Buzz Aldrin', 41, 'USA', 2),
('Yuri Gagarin', 34, 'Russia', 1),
('Valentina Tereshkova', 36, 'Russia', 1),
('Chris Hadfield', 55, 'Canada', 3),
('Samantha Cristoforetti', 44, 'Italy', 2),
('Koichi Wakata', 50, 'Japan', 4),
('Sunita Williams', 49, 'India-USA', 3),
('Elon Vega', 38, 'USA', 6),
('Rajesh Kumar', 42, 'India', 4);

INSERT INTO Missions (mission_name, launch_date, duration_days, mission_type) VALUES
('Apollo 11', '1969-07-16', 8, 'Exploration'),
('Vostok 1', '1961-04-12', 1, 'Exploration'),
('Mars Research Alpha', '2023-03-15', 120, 'Research'),
('Expedition 35', '2013-03-13', 146, 'Research'),
('Expedition 46', '2015-12-15', 172, 'Research'),
('STS-118', '2007-08-08', 13, 'Repair'),
('Kibo Test Flight', '2008-03-11', 14, 'Research'),
('Jupiter Exploration', '2024-11-01', 365, 'Exploration'),
('Mars Exploration Beta', '2022-06-20', 200, 'Exploration'),
('Lunar Exploration Zeta', '2021-09-05', 45, 'Exploration');

INSERT INTO Spacecrafts (spacecraft_name, capacity, manufacturer) VALUES
('Columbia', 7, 'NASA'),
('Soyuz TMA-08M', 3, 'Roscosmos'),
('Vostok 3KA', 1, 'Soviet Union'),
('Endeavour', 7, 'NASA'),
('Dragon', 7, 'SpaceX'),
('Kibo', 2, 'JAXA'),
('Falcon Heavy', 8, 'SpaceX');

INSERT INTO Participation (astronaut_id, mission_id, spacecraft_id, role) VALUES
(1, 1, 1, 'Commander'),
(2, 1, 1, 'Lunar Module Pilot'),
(3, 2, 3, 'Pilot'),
(5, 3, 5, 'Commander'),
(8, 3, 5, 'Engineer'),
(9, 3, 5, 'Mission Specialist'),
(5, 4, 2, 'Commander'),
(6, 4, 2, 'Flight Engineer'),
(6, 5, 2, 'Flight Engineer'),
(8, 5, 5, 'Commander'),
(8, 6, 4, 'Engineer'),
(7, 7, 6, 'Mission Specialist'),
(9, 8, 7, 'Commander'),
(10, 8, 7, 'Engineer'),
(5, 9, 5, 'Commander'),
(9, 9, 5, 'Engineer'),
(1, 10, 4, 'Commander'),
(2, 10, 4, 'Engineer'),
(9, 10, 7, 'Commander');
SELECT * FROM Astronauts
SELECT * FROM MISSIONS
SELECT * FROM Spacecrafts
SELECT * FROM PARTICIPATION

--1.  Retrieve the distinct mission names where the mission lasted more than 30 days. 
    SELECT DISTINCT MISSION_NAME
    FROM MISSIONS
    WHERE DURATION_DAYS > 30

--2.  Retrieve the top 3 astronauts who participated in the most missions, ensuring no duplicates. 
    SELECT TOP 3 ASTRONAUT_NAME,MAX(TOTAL_SPACE_MISSIONS)
    FROM Astronauts
    GROUP BY astronaut_name
     
--3.  Insert a new space mission called "Jupiter Exploration" that is scheduled to launch on '2024-1101', lasting 365 days, and classified as an exploration mission. 
    INSERT INTO Missions VALUES
    ('JUPITER EXPLORATIONS','2024-11-01',365,'EXPLORATION')
    SELECT * FROM MISSIONS

--4.  Update the total space missions count for astronaut with ID = 5, increasing it by 1. 
    UPDATE Astronauts
    SET total_space_missions = total_space_missions + 1
    WHERE ASTRONAUT_ID =5

--5.  Delete participation record for astronaut ID 3 in mission ID 2. 
    DELETE
    FROM Participation
    WHERE astronaut_id = 3 AND mission_id = 2

--6.  Add a new column experience_level (VARCHAR(50)) to the Astronauts table to store the astronaut's experience level. 
    ALTER TABLE ASTRONAUTS
    ADD EXPERIENCE_LEVEL VARCHAR(50)
    SELECT * FROM Astronauts

--7.  Clear all the data from the Participation table.(Truncate) 
    TRUNCATE TABLE PARTICIPATION

--8.  Retrieve all mission names where the mission type contains 'exploration'. 
    SELECT mission_name
    FROM Missions
    WHERE MISSION_TYPE = 'EXPLORATION'

--9.  Retrieve all missions that contain the word "Mars" and lasted more than 100 days. 
    SELECT MISSION_NAME
    FROM MISSIONS
    WHERE MISSION_NAME LIKE '%MARS%' AND duration_days > 100
    
--10.  Retrieve the square root of the total number of missions for astronaut ID 102 
    SELECT  SQRT(TOTAL_SPACE_MISSIONS)
    FROM Astronauts
    WHERE astronaut_id=2
    
--11.  Retrieve the first 3 characters of each astronaut's name.
       SELECT SUBSTRING(ASTRONAUT_NAME,1,3) AS NAME_DESIRED
       FROM Astronauts
       SELECT * FROM Astronauts
--12.  Retrieve the astronauts who participated in missions launched in the current year. 
    SELECT DISTINCT a.astronaut_name, a.nationality, a.age, m.mission_name, m.launch_date
    FROM Astronauts a
    JOIN Participation p ON a.astronaut_id = p.astronaut_id
    JOIN Missions m ON p.mission_id = m.mission_id
    WHERE YEAR(m.launch_date) = YEAR('2024-01-01');

--13.  Count the number of astronauts from each nationality who have participated in more than 2 space missions. 
   SELECT nationality, COUNT(astronaut_id) AS number_of_astronauts
   FROM AstronautS
   WHERE total_space_missions > 2
   GROUP BY nationality;
    
--14.  Retrieve the total number of missions and the average mission duration for each mission type, but only include mission types that have been involved in more than 3 missions. 
  SELECT m.mission_type, COUNT(m.mission_id) AS total_missions, AVG(m.duration_days) AS avg_duration
  FROM Missions m
  GROUP BY m.mission_type
  HAVING COUNT(m.mission_id) > 3;  

--15.  Find the number of missions commanded by astronauts for each nationality where more than 5 missions were commanded 
  SELECT a.nationality, COUNT(p.mission_id) AS commanded_missions
  FROM Participation p
  JOIN Astronauts a ON p.astronaut_id = a.astronaut_id
  WHERE p.role = 'commander'
  GROUP BY a.nationality
  HAVING COUNT(p.mission_id) > 2;

--16.  Retrieve the name of the spacecraft used in the mission "Apollo 11" (Use sub Query) 
    SELECT SPACECRAFT_NAME
    FROM SPACECRAFTS 
    WHERE spacecraft_id IN (SELECT spacecraft_id FROM Participation WHERE mission_id IN (SELECT MISSION_ID FROM MISSIONS WHERE mission_name = 'APOLLO 11'))
        
--17.  Create a view that shows all active missions (those that launched after 2020). 
    CREATE VIEW VW_ACTIVE_MISSIONS
    AS
    SELECT MISSION_NAME
    FROM MISSIONS
    WHERE YEAR(launch_date) = YEAR('2020-01-01');
--18.  List all astronauts and their respective spacecraft for each mission they participated in. 
    SELECT ASTRONAUT_NAME , SPACECRAFT_NAME,MISSION_NAME
    FROM Astronauts
    JOIN Participation
    ON Astronauts.astronaut_id = Participation.participation_id
    JOIN Spacecrafts
    ON Participation.spacecraft_id = Spacecrafts.spacecraft_id
    JOIN MISSIONS
    ON Participation.mission_id = MISSIONS.mission_id

--19.  Retrieve the names of astronauts who participated in missions using spacecrafts manufactured by "SpaceX", along with the names of those missions and the duration of each mission. Include only astronauts who have participated in more than 2 missions. 
    SELECT ASTRONAUT_NAME , MISSION_NAME,DURATION_DAYS
    FROM ASTRONAUTS
    JOIN Participation
    ON Astronauts.astronaut_id = Participation.participation_id
    JOIN Spacecrafts
    ON Participation.spacecraft_id = Spacecrafts.spacecraft_id
    JOIN MISSIONS
    ON Participation.mission_id = MISSIONS.mission_id
    WHERE manufacturer = 'SPACEX' AND total_space_missions > 2
    
--20.  Retrieve the names of astronauts, the names of missions they participated in, the names of spacecraft used in those missions, and the manufacturers of those spacecraft, for missions where the mission duration is greater than the average duration of all missions conducted by astronauts from the "USA". 
    SELECT ASTRONAUT_NAME , MISSION_NAME , SPACECRAFT_NAME,MANUFACTURER,DURATION_DAYS
    FROM ASTRONAUTS
    JOIN Participation
    ON Astronauts.astronaut_id = Participation.participation_id
    JOIN Spacecrafts
    ON Participation.spacecraft_id = Spacecrafts.spacecraft_id
    JOIN MISSIONS
    ON Participation.mission_id = MISSIONS.mission_id
    WHERE NATIONALITY = 'USA' AND  DURATION_DAYS >(SELECT AVG(DURATION_DAYS ) FROM MISSIONS)