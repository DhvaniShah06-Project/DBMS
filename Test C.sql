-- Table 1: MovieDetails
CREATE TABLE MovieDetails (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(100),
    Director VARCHAR(100),
    ReleaseYear INT
);

-- Table 2: MovieFinancials
CREATE TABLE MovieFinancials (
    FinancialID INT PRIMARY KEY,
    BudgetUSD DECIMAL(15,2),
    BoxOfficeUSD DECIMAL(15,2),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES MovieDetails(MovieID)
);

-- Table 3: MovieRatingsDuration
CREATE TABLE MovieRatingsDuration (
    RatingID INT PRIMARY KEY,
    DurationMin INT,
    Rating DECIMAL(3,1),
    Language VARCHAR(100),
    Country VARCHAR(100),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES MovieDetails(MovieID)
);

-- Insert into MovieDetails
INSERT INTO MovieDetails (MovieID, Title, Genre, Director, ReleaseYear) VALUES
(1, 'The Shawshank Redemption', 'Drama', 'Frank Darabont', 1994),
(2, 'The Godfather', 'Crime', 'Francis Ford Coppola', 1972),
(3, 'Inception', 'Sci-Fi', 'Christopher Nolan', 2010),
(4, 'Avengers: Endgame', 'Superhero', 'Anthony Russo', 2019),
(5, 'Parasite', 'Thriller', 'Bong Joon-ho', 2019),
(6, 'The Dark Knight', 'Action', 'Christopher Nolan', 2008),
(7, 'The Prestige', 'Drama', 'Christopher Nolan', 2006),
(8, 'Gladiator', 'Action', 'Ridley Scott', 2000),
(9, 'Interstellar', 'Sci-Fi', 'Christopher Nolan', 2014),
(10, 'Thor', 'Fantasy', 'Kenneth Branagh', 2011);

-- Insert into MovieFinancials
INSERT INTO MovieFinancials (FinancialID, BudgetUSD, BoxOfficeUSD, MovieID) VALUES
(1, 25000000.00, 28000000.00, 1),
(2, 6000000.00, 245000000.00, 2),
(3, 160000000.00, 829000000.00, 3),
(4, 356000000.00, 2798000000.00, 4),
(5, 11400000.00, 258000000.00, 5),
(6, 185000000.00, 1005000000.00, 6),
(7, 40000000.00, 109000000.00, 7),
(8, 103000000.00, 460000000.00, 8),
(9, 165000000.00, 677000000.00, 9),
(10, 150000000.00, 449000000.00, 10);

-- Insert into MovieRatingsDuration
INSERT INTO MovieRatingsDuration (RatingID, DurationMin, Rating, Language, Country, MovieID) VALUES
(1, 142, 9.3, 'English', 'USA', 1),
(2, 175, 9.2, 'English', 'USA', 2),
(3, 148, 8.8, 'English', 'USA', 3),
(4, 181, 8.4, 'English', 'USA', 4),
(5, 132, 8.6, 'Korean', 'South Korea', 5),
(6, 152, 9.0, 'English', 'USA', 6),
(7, 130, 8.5, 'English', 'USA', 7),
(8, 155, 8.5, 'English', 'UK', 8),
(9, 169, 8.6, 'English', 'USA', 9),
(10, 115, 7.0, 'English', 'USA', 10);
SELECT * FROM MovieRatingsDuration 
-- 1. Retrive first five distinct movies along with their title from MovieDetails table.
    SELECT DISTINCT TOP 5 *
    FROM MovieDetails

-- 2. Display the total of the BudgetUSD and BoxOfficeUSD assign the name TotalUSD from MovieFinancials.
    SELECT (BudgetUSD + BoxOfficeUSD) AS Total_USD
    FROM MovieFinancials;
    SELECT * FROM MovieDetails
-- 3. Insert the new row with this data (11,The Incredible Hulk, Action, Louis Leterrier,2008) in MovieDetails table.
    INSERT INTO MovieDetails VALUES
    (11,'THE INCREDIBLE HULK','ACTION','LOUIS LETERRIER',2008)
   
 
-- 4. Set the value of the genre to 'Action' of 'Avengers:Endgame' movie from MovieDetails table.
    UPDATE MovieDetails
    SET GENRE = 'ACTION'
    WHERE TITLE='Avengers: Endgame'

-- 5. Delete the records with duration of 181 minutes from MovieRatingsDuration table.
    DELETE
    FROM MovieRatingsDuration
    WHERE DurationMin = 181

-- 6. Add a new column 'Producer' into the MovieDetails table.
    ALTER TABLE MOVIEDETAILS
    ADD PRODUCER VARCHAR(40)

-- 7. Delete records of MovieFinancials table without removing its table structure.
    TRUNCATE TABLE MOVIEFINANCIALS
    
-- 8. Retrive all the movies from MovieDetails table with title starting with 'The'.
    SELECT TITLE
    FROM MovieDetails
    WHERE TITLE LIKE 'THE%'

-- 9. Retrive name of directors includes 'son' from MovieDetails table.
    SELECT DIRECTOR
    FROM MovieDetails
    WHERE Director LIKE '%SON%'

-- 10. Convert and display title of all movies in uppercase.
    SELECT UPPER(TITLE) ASMOVIE_TITLE
    FROM MovieDetails

-- 11. Display the highest rating from the MovieRatingsDuration table.
    SELECT MAX(RATING) AS MAX_RATING
    FROM MovieRatingsDuration
    SEL

-- 12. Calculate the years between current year and movies release year.
    SELECT (YEAR(GETDATE()) - RELEASEYEAR) AS DIFF_YEAR
    FROM MovieDetails

-- 13. Find the languages in which movies have an average rating of greater than 8.0. Display the language and the average rating.
    SELECT LANGUAGE,RATING
    FROM MovieRatingsDuration
    WHERE RATING > 8

-- 14. Retrieve the minimum, maximum, and average movie duration for each language in the MovieRatingsDuration table, but display only those languages where the average rating is greater than 7.5.
    SELECT ROUND(AVG(RATING),0) AS AVG_RATING,LANGUAGE , MIN(DURATIONMIN) AS MIN_DURATION , MAX(DURATIONMIN) AS MAX_DURATION, AVG(DURATIONMIN) AS AVG_DURATION
    FROM MovieRatingsDuration
    GROUP BY Language
    HAVING AVG(RATING) > 7.5

-- 15. Find the titles of movies whose budget is higher than the average budget of all movies.(Do not use JOINS)
    SELECT TITLE
    FROM MovieDetails
    WHERE MOVIEID IN (SELECT MOVIEID FROM MovieFinancials WHERE BUDGETUSD  >(SELECT AVG(BUDGETUSD) FROM MovieFinancials))
    
-- 16. Find the titles of movies that have a box office revenue greater than the average box office revenue of all movies.
    SELECT TITLE
    FROM MovieDetails
    WHERE MOVIEID IN (SELECT MOVIEID FROM MovieFinancials WHERE BOXOFFICEUSD  >(SELECT AVG(BOXOFFICEUSD) FROM MovieFinancials))
    
-- 17. Create a view with Rating, Language and Country columns with no data and named it MovieReview.
    CREATE VIEW VW_MOVIE_REVIEW
    AS
    SELECT RATING,LANGUAGE,COUNTRY
    FROM MovieRatingsDuration
    WHERE 1 =2
   
-- 18. List all movies that have the same director but different genres, displaying the director’s name, both movie titles, and their respective genres.
    SELECT DISTINCT
    md1.TITLE AS Movie,
    md1.genre AS Genre
FROM MovieDetails md1
JOIN MovieDetails md2 
    ON md1.director = md2.director
    AND md1.genre <> md2.genre
    AND md1.movieID <> md2.movieID;

-- 19. Retrieve the title, director, and box office earnings for all movies that were released after 2010, along with their ratings.
    SELECT TITLE,DIRECTOR,BOXOFFICEUSD,RATING
    FROM MovieDetails
    JOIN MovieFinancials
    ON MovieDetails.MOVIEID = MovieFinancials.MovieID
    JOIN MovieRatingsDuration
    ON MovieFinancials.MOVIEID = MovieRatingsDuration.MOVIEID

-- 20. List all directors and the number of movies they have directed, but only include directors who have directed more than 1 movie.
    SELECT DIRECTOR,COUNT(MOVIEID) AS TOTAL_MOVIE
    FROM MovieDetails
    GROUP BY Director
    HAVING COUNT(MOVIEID) > 1