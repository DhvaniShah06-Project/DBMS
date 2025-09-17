-- Table-1: Restaurants
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    Cuisine VARCHAR(50),
    Rating DECIMAL(2,1)
);

-- Table-2: Customers
CREATE TABLE Customers_new (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Membership VARCHAR(20)
);

-- Table-3: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers_new(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Table-4: MenuItems
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100),
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Insert Restaurants
INSERT INTO Restaurants VALUES
(1, 'Le Gourmet', 'French', 4.8),
(2, 'Sakura House', 'Japanese', 4.6),
(3, 'Pasta Palace', 'Italian', 4.2),
(4, 'Taco Fiesta', 'Mexican', 3.9),
(6, 'Spice Hub', 'Indian', 4.7),
(7, 'Dragon Wok', 'Chinese', 4.3),
(8, 'Green Garden', 'Vegan', 4.0),
(9, 'BBQ Nation', 'Korean', 4.5),
(10, 'The Deli Spot', 'Sandwiches', 3.8);

-- Insert Customers
INSERT INTO Customers_new VALUES
(1, 'Alice Johnson', 'New York', 'Gold'),
(2, 'Bob Smith', 'Bombay', 'Silver'),
(3, 'Charlie Brown', 'Los Angeles', 'Bronze'),
(4, 'Diana Prince', 'New York', 'Gold'),
(5, 'Ethan Hunt', 'Miami', 'Silver'),
(6, 'Fiona Carter', 'Boston', 'Bronze'),
(7, 'George Miller', 'San Francisco', 'Gold'),
(8, 'Hannah Lee', 'New York', 'Silver'),
(9, 'Ian Thomas', 'Chicago', 'Gold'),
(10, 'Julia Kim', 'Los Angeles', 'Bronze');

-- Insert Orders
INSERT INTO Orders VALUES
(101, 1, 1, '2024-05-01 18:30:00', 120.50),
(102, 2, 2, '2024-05-03 20:00:00', 60.00),   -- amount = 60 (for update query)
(103, 3, 3, '2024-06-10 12:15:00', 85.00),
(104, 1, 2, '2024-07-01 19:45:00', 150.00),
(106, 6, 6, '2024-08-05 13:20:00', 95.00),
(107, 7, 7, '2024-08-10 19:00:00', 70.00),
(108, 8, 6, '2024-09-01 18:00:00', 110.00),
(110, 10, 9, '2024-09-15 20:30:00', 130.00),
(111, 1, 10, '2024-09-20 11:30:00', 55.00),
(112, 5, 7, '2024-10-02 18:40:00', 200.00),
(113, 4, 6, '2024-10-05 21:15:00', 175.00),
(114, 2, 9, '2024-10-07 12:10:00', 90.00),
(115, 3, 8, '2024-10-08 16:30:00', 60.00);

-- Insert MenuItems
INSERT INTO MenuItems VALUES
(201, 1, 'Escargot', 25.00, 'Appetizer'),
(202, 2, 'Sushi Roll', 15.00, 'Sushi'),
(203, 3, 'Spaghetti Carbonara', 18.50, 'Main Course'),
(204, 4, 'Tacos', 12.00, 'Main Course'),
(206, 6, 'Chicken Curry', 20.00, 'Main Course'),
(207, 6, 'Naan Bread', 5.00, 'Appetizer'),
(208, 7, 'Kung Pao Chicken', 16.00, 'Main Course'),
(209, 7, 'Spring Rolls', 8.00, 'Appetizer'),
(210, 8, 'Vegan Burger', 14.00, 'Main Course'),
(211, 8, 'Avocado Salad', 12.00, 'Appetizer'),
(212, 9, 'Korean BBQ Platter', 35.00, 'Main Course'),
(213, 9, 'Kimchi Soup', 10.00, 'Soup'),
(214, 10, 'Turkey Sandwich', 9.50, 'Main Course'),
(215, 10, 'Club Sandwich', 11.00, 'Main Course');


  
--1.   Display unique city of customers who have 'gold' membership.  
    SELECT DISTINCT CITY
    FROM CUSTOMERS_NEW
    WHERE MEMBERSHIP = 'GOLD'

--2.   Display top 2 rating with restaurant names.
    SELECT TOP 2 RESTAURANTNAME
    FROM Restaurants
    ORDER BY RATING DESC

--3.   Insert new restaurant in restaurant table. (5, 'Burger Junction', 'American', 4.1) 
    INSERT INTO Restaurants VALUES
    (5,'BURGER JUNCTION','AMERICAN',4.1)

--4.   Update customer id to 4 in orders table where amount is 60.   
    UPDATE Orders
    SET CUSTOMERID = 4
    WHERE TotalAmount = 60

--5.   Remove the costumer who belongs to Chicago city.  
    DELETE FROM CUSTOMERS_NEW
    WHERE CITY = 'CHICAGO'

--6.   Change column name Total Amount to Amount in Orders table.     
    EXEC SP_RENAME 'ORDERS.TOTALAMOUNT','AMOUNT'
    SELECT * FROM ORDERS
--7.   Display 3rd to 7th character of restaurant name from restaurants table. 
    SELECT SUBSTRING(RestaurantName,3,7)
    FROM Restaurants

--8.   Delete Menu Items table. 
    DELETE FROM MenuItems
    SELECT * FROM Customers_new
--9.   Display name and city of those customers whose membership contains 4 letters. 
    SELECT CUSTOMERNAME,CITY
    FROM Customers_new
    WHERE Membership LIKE '____'

--10.  Write a query to subtract 1 year from current date. 
    SELECT YEAR(DATEADD(YYYY,-1,GETDATE())) AS YAER_DESIRED

--11.  Find max amount of all orders.
    SELECT MAX(AMOUNT) AS MAX_AMOUNT
    FROM ORDERS

--12.  Display city with the total number of customers. 
    SELECT COUNT(DISTINCT CUSTOMERID) AS TOTAL_CUSTOMERS , CITY
    FROM Customers_new
    GROUP BY CITY
    SELECT * FROM Customers_new

--13.  display restaurant names with average rating greater than 4.5.
    SELECT RestaurantName , Rating
    FROM Restaurants
    WHERE RATING > 4.5

--14.  Find the highest-rated restaurant and its details. 
    SELECT TOP 1 *
    FROM Restaurants
    ORDER BY Rating DESC
--15.  Subquery to get restaurants that are visited by customers from 'New York'. 
    SELECT RESTAURANTNAME , RestaurantID
    FROM Restaurants
    WHERE RestaurantID IN (SELECT RestaurantID FROM ORDERS WHERE CUSTOMERID IN (SELECT CustomerID FROM Customers_new WHERE CITY = 'NEW YORK'))
   
--16.  Create a View to list customers and their cities. 
    CREATE VIEW VW_CUSTOMER_CITY
    AS
    SELECT CUSTOMERNAME , CITY
    FROM Customers_new
    SELECT * FROM VW_CUSTOMER_CITY
--17.  Get all customers and their orders (including customers without order) 
    SELECT DISTINCT CUSTOMERNAME,ITEMNAME
    FROM Customers_new
    JOIN ORDERS
    ON CUSTOMERS_NEW.CUSTOMERID = ORDERS.CustomerID
    JOIN MenuItems
    ON ORDERS.RestaurantID = MenuItems.RestaurantID

--18.  Generate a combination of every customer with every restaurant. 
    
--19.  List all restaurants and the corresponding orders. 
    SELECT RESTAURANTNAME , ITEMNAME
    FROM RESTAURANTS
    JOIN MenuItems
    ON Restaurants.RestaurantID = MenuItems.RestaurantID
    
--20.  Get the total amount spent by each customer at each restaurant, along with the customer and 
--restaurant names. Include customers who have not ordered from certain restaurants, showing NULL for those cases
    --GROUP BY CUSTOMERID SELECT TOTALAMOUNT , RESTAURANTNAME,CUSTOMERNAME
    SELECT RESTAURANTNAME,CUSTOMERNAME,CUSTOMERS_NEW.CUSTOMERID,SUM(AMOUNT)
    FROM CUSTOMERS_NEW
    JOIN ORDERS
    ON Customers_new.CustomerID = ORDERS.CUSTOMERID
    JOIN RESTAURANTS
    ON ORDERS.RestaurantID = Restaurants.RestaurantID
 
    SELECT CUSTOMERID FROM CUSTOMERS_NEW

    SELECT * FROM Restaurants
    SELECT * FROM Customers_new
    SELECT * FROM Orders
    SELECT * FROM MenuItems