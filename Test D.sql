-- 1. Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);


-- 2. Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    publish_year INT,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    membership_date DATE
);

-- 4. Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Authors (author_id, name, birth_year, nationality) VALUES
(1, 'Agatha Christie', 1890, 'British'),
(2, 'Arthur Conan Doyle', 1859, 'British'),
(3, 'Haruki Murakam', 1949, 'Japanese'), -- ends with consonant for Q9
(4, 'Paulo Coelho', 1947, 'Brazilian'),
(5, 'Stephen King', 1947, 'American'),
(6, 'J.K. Rowling', 1965, 'British'),
(7, 'George Orwell', 1903, 'British'),
(8, 'Isabel Allende', 1942, 'Chilean');

INSERT INTO Books (book_id, title, author_id, genre, publish_year, available_copies) VALUES
(1, 'Himalayan Trail', 3, 'Adventure', 1990, 3),
(2, 'Harry and the Crystal', 1, 'Fiction', 2005, 2),
(3, 'The Adventures of Sherlock Holmes', 2, 'Mystery', 1892, 5),
(4, 'The Alchemist', 4, 'Fiction', 1988, 10),
(5, 'Hotel Imperial', 3, 'Drama', 2001, 1),
(6, '1984', 7, 'Dystopian', 1949, 7),
(7, 'It', 5, 'Horror', 1986, 4),
(8, 'Harry Potter and the Philosopher Stone', 6, 'Fantasy', 1997, 6),
(9, 'The House of the Spirits', 8, 'Magical Realism', 1982, 2),
(10, 'The Shining', 5, 'Horror', 1977, 3),
(11, 'Hail to the Rebel', 7, 'Fiction', 1955, 8),
(12, 'Howl', 5, 'Poetry', 1956, 2);

INSERT INTO Members (member_id, name, email, phone_number, membership_date) VALUES
(1, 'Raj', 'raj@example.com', '1234567890', '2019-05-10'),
(2, 'Manish Pandey', 'manish@example.com', '9876543210', '2018-03-15'),
(3, 'Alice', 'alice@example.com', '5556667777', '2021-01-10'),
(4, 'John Doe', 'john@example.com', '4445556666', '2022-06-20'),
(5, 'Sarah Connor', 'sarah@example.com', '5551112222', NULL), -- NULL for Q15
(6, 'Michael Clarke', 'michael@example.com', '3332221111', '2017-11-25');

INSERT INTO Loans (loan_id, book_id, member_id, loan_date, return_date) VALUES
(1, 1, 1, '2024-01-15', '2024-02-15'),
(2, 3, 2, '2024-03-10', '2024-04-10'),
(3, 4, 1, '2024-05-01', '2024-06-01'),
(4, 2, 2, '2023-08-20', '2023-09-20'),
(5, 3, 3, '2024-07-10', '2024-08-10'),
(6, 7, 6, '2023-01-12', '2023-02-12'),
(7, 7, 1, '2023-05-15', '2023-06-15'),
(8, 8, 5, '2024-04-04', '2024-05-04'),
(9, 9, 6, '2022-12-01', '2023-01-01'),
(10, 10, 2, '2024-02-02', '2024-03-02'),
(11, 1, 2, '2023-03-15', '2023-04-15'),
(12, 4, 6, '2024-06-15', '2024-07-15');


-- 1. Display the top 3 percentages books order by title in descending.
    SELECT TOP 3 PERCENT TITLE
    FROM Books
    ORDER BY TITLE DESC

-- 2. Display a distinct list of genres.
    SELECT DISTINCT GENRE
    FROM BOOKS
    SELECT * FROM BOOKS

-- 3. Insert a new book into the books table. ('The Adventures of Sherlock Holmes', 2, 'Mystery', 1892,5)
    INSERT INTO BOOKS VALUES
    (13,'THE ADVENTURE OF SHERLOCK HOMES',2,'MYSTERY',1982,5)

-- 4. Update the number of available copies is 10 for a book whose book_id is available.
    UPDATE BOOKS
    SET available_copies = 10
    WHERE BOOK_ID IS NOT NULL
    
-- 5. Delete a member from the members table whose member_id is 4.
    DELETE FROM
    MEMBERS
    WHERE member_id = 4

-- 6. Add a new column language varchar(20) to the books table.
    ALTER TABLE BOOKS
    ADD LANGUAGE VARCHAR(20)

-- 7. Truncate all data from the loans table. (Using Truncate)
    TRUNCATE TABLE LOANS
-- 8. Find books whose title starts with ‘H’ and end with ‘L’.
    SELECT TITLE
    FROM BOOKS
    WHERE TITLE LIKE 'H%L'

-- 9. Find authors whose name does not ends with vowel.
    SELECT NAME
    FROM AUTHORS
    WHERE NAME NOT LIKE '%[A,E,I,O,U]'

-- 10. Find Lenth of ‘Manish Pandey’
    SELECT LEN('MANISH PANDEY') AS LENGTH

-- 11. Calculate your age in year.
    SELECT YEAR(GETDATE()) - YEAR('2006-03-24') AS AGE

-- 12. Display the total number of books by genre.
    SELECT COUNT(BOOK_ID) AS TOTAL_BOOKS,GENRE
    FROM BOOKS
    GROUP BY GENRE

-- 13. Display the minimum, maximum, and average number of available copies for each genre whose book_id is available.
    SELECT MIN(AVAILABlE_COPIES) AS MIN_COPIES , MAX(AVAILABLE_COPIES) AS MAX_COPIES , AVG(AVAILABLE_COPIES) AS AVG_COPIES , GENRE
    FROM BOOKS
    WHERE BOOK_ID IS NOT NULL
    GROUP BY GENRE

-- 14. Display the title of books where the author was born before 1970.(Using Sub query)
    SELECT TITLE
    FROM BOOKS
    WHERE AUTHOR_ID IN (SELECT AUTHOR_ID FROM Authors WHERE birth_year < 1970)

-- 15. Create a view View_Member whose membership date is not available from members table
    CREATE VIEW VW_VIEW_MEMBER
    AS
    SELECT *
    FROM Members
    WHERE membership_date IS NULL
    SELECT * FROM VW_VIEW_MEMBER
    SELECT * FROM Loans
-- 16. Find the title of books that have been borrowed the most (the top 1 book) and the correspondingauthor name (Using sub Query)
    SELECT TOP 1 TITLE , NAME
    FROM BOOKS
    JOIN AUTHORS
    ON BOOKS.author_id = Authors.author_id
    WHERE BOOK_ID IN (SELECT COUNT(BOOK_ID) AS MAX_LOANS FROM LOANS GROUP BY book_id)
    
-- 17. Display the loan_id ,member name ,title ,loan date whose member name is 'Raj'.
    SELECT LOAN_ID , NAME,BOOKS.TITLE,LOAN_DATE
    FROM LOANS 
    JOIN Members
    ON LOANS.MEMBER_ID = MEMBERS.MEMBER_ID
    JOIN BOOKS
    ON LOANS.BOOK_ID = BOOKS.BOOK_ID
    WHERE MEMBERS.NAME = 'RAJ'

-- 18. List the titles of books that have been borrowed by members who registered before 2020.(usingSub query)
    SELECT TITLE
    FROM BOOKS
    SELECT * FROM MEMBERS
    SELECT * FROM LOANS
-- 19. Display the total number of books borrowed by each member.
    SELECT SUM(BOOK_ID) AS TOTAL_BOOKS_BORROWED
    FROM MEMBERS
    JOIN LOANS
    ON MEMBERS.MEMBER_ID = LOANS.MEMBER_ID
    GROUP BY MEMBERS.MEMBER_ID

-- 20. Display the title of books that have not been borrowed by any members.
    SELECT TITLE
    FROM BOOKS
    JOIN LOANS
    ON BOOKS.BOOK_ID = LOANS.BOOK_ID
    JOIN MEMBERS
    ON LOANS.MEMBER_ID = MEMBERS.MEMBER_ID
    WHERE MEMBERS.MEMBERSHIP_DATE IS NULL
    