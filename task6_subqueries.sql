-- PART 1: SETUP - CREATE TABLES AND INSERT DATA
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE
);


INSERT INTO Customers (CustomerID, FirstName, LastName) VALUES
(1, 'Arav', 'Mehta'),
(2, 'Vishu', 'Joshi'),
(3, 'Arnav', 'Gupta'),
(4, 'Ashu', 'Sharma'); 


INSERT INTO Books (BookID, Title, Author, Price) VALUES
(101, 'The Alchemist', 'Paulo Coelho', 12.99),
(102, 'A Suitable Boy', 'Vikram Seth', 19.99),
(103, '1984', 'George Orwell', 9.50),
(104, 'Malgudi Days', 'R. K. Narayan', 11.00);


INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001, 1, '2024-06-20'),
(1002, 3, '2024-06-22'),
(1003, 1, '2024-06-25');



-- PART 2: SUBQUERY EXAMPLES (This is the main part of Task 6)
-- Each query uses a subquery to answer a more complex question.


-- Query 1:  Subquery in a WHERE clause with a comparison operator (>)
-- Find all books that are more expensive than the average book price.
SELECT Title, Price
FROM Books
WHERE Price > (SELECT AVG(Price) FROM Books);


-- Query 2: Subquery in a WHERE clause with 'IN'
-- Find all customers who have placed an order.
SELECT FirstName, LastName
FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);


-- Query 3: Subquery in a WHERE clause with 'EXISTS'
-- EXISTS is often more efficient as it stops searching as soon as it finds a match.
SELECT FirstName, LastName
FROM Customers
WHERE EXISTS (SELECT 1 FROM Orders WHERE Orders.CustomerID = Customers.CustomerID);

-- Query 4: Subquery in the FROM clause (also known as a Derived Table)

SELECT FullName
FROM (SELECT FirstName || ' ' || LastName AS FullName FROM Customers
      WHERE CustomerID IN (SELECT CustomerID FROM Orders)) AS OrderedCustomers;

-- Query 5: Scalar Subquery in the SELECT clause
-- Show each customer's name and the total number of orders they have placed.
-- The subquery runs for each customer row to calculate their specific order count.
SELECT
    FirstName,
    LastName,
    (SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS NumberOfOrders
FROM Customers;