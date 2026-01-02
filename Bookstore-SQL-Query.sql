
CREATE TABLE Book (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);


CREATE TABLE Customer (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orderss (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);


COPY Book(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'C:\Program Files\PostgreSQL\17\book.csv' 
DELIMITER ',' CSV HEADER;

COPY Customer(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'C:\Program Files\PostgreSQL\17\Customers.csv' 
CSV HEADER;

COPY Orderss(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Program Files\PostgreSQL\17\Orders.csv' 
CSV HEADER;

SELECT * FROM Book;
SELECT * FROM Customer;
SELECT * FROM Orderss;


-- 1) Retrieve all books in the "Fiction" genre:
SELECT Title, Genre
FROM Book
WHERE Genre = 'Fiction';

-- 2) Find books published after the year 1950:
SELECT Title, Published_year
FROM Book
WHERE Published_year > 1950;


-- 3) List all customers from the Canada:
SELECT Name, Country
FROM Customer
WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023:
SELECT order_id, quantity, total_amount, order_date
FROM Orderss
WHERE EXTRACT(YEAR FROM order_date) = 2023
AND EXTRACT(MONTH FROM order_date) = 11
ORDER BY order_date ASC;



-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) AS Total_Stock_Available
FROM Book;

-- 6) Find the details of the most expensive book:
SELECT * 
FROM Book
ORDER BY price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT C.customer_id, SUM(O.quantity) AS Total_Qty
FROM Customer AS C
INNER JOIN Orderss AS O
ON C.Customer_id = O.Customer_id
GROUP BY C.Customer_id
HAVING SUM(O.quantity) > 1;


-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT *   
FROM Orderss
WHERE total_amount > 20;


-- 9) List all genres available in the Books table:
SELECT DISTINCT genre
FROM Book;

-- 10) Find the book with the lowest stock:
SELECT title, stock
FROM Book
ORDER BY stock ASC
LIMIT 20;


-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS Total_revenue
FROM Orderss;

SELECT * FROM Book
SELECT * FROM Orderss

--Advance Questions
-- 1) Retrieve the total number of books sold for each genre:
SELECT B.genre ,SUM(O.quantity) AS Total_Qty
FROM Book AS B
JOIN Orderss AS O
ON B.book_id = O.book_id
GROUP BY B.genre;

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT ROUND(AVG(price),2) AS Avg_Price, genre
FROM Book
WHERE genre = 'Fantasy'
GROUP BY genre;


-- 3) List customers who have placed at least 2 orders:
SELECT C.customer_id, C.name, COUNT(O.order_id) AS Total_Orders
FROM Customer AS C
INNER JOIN Orderss AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id
HAVING COUNT(O.order_id) >= 2;


---- 4) Find the most frequently ordered book:
SELECT Book_id, COUNT(order_id) AS Order_Count
FROM Orderss
GROUP BY Book_id
ORDER BY Order_Count DESC
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT title, genre, price
FROM Book
WHERE Genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;




-- 6) Retrieve the total quantity of books sold by each author:
SELECT B.author, SUM(O.quantity) AS Qty_sold
FROM Book AS B
INNER JOIN Orderss AS O
ON B.book_id = O.book_id
GROUP BY B.author;



-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT C.city, C.customer_id, O.total_amount
FROM Customer AS C
INNER JOIN Orderss AS O
ON C.customer_id = O.customer_id
WHERE O.total_amount > 30;



-- 8) Find the customer who spent the most on orders:
SELECT C.customer_id, SUM(total_amount) AS Total_amt
FROM Customer AS C
INNER JOIN Orderss AS O
  ON C.customer_id = O.customer_id
GROUP BY C.customer_id
ORDER BY Total_amt DESC
LIMIT 1;



--9) Calculate the stock remaining after fulfilling all orders:
SELECT B.title, B.stock - SUM(O.quantity) AS Remaining_stock
FROM Book AS B
INNER JOIN Orderss AS O
ON B.Book_id = O.Book_id
GROUP BY B.title, B.stock;


--Left Join
SELECT B.Book_id, B.title, B.stock, COALESCE(SUM(O.quantity), 0) AS Orders, B.stock - COALESCE(SUM(O.quantity), 0) AS Remaining_stock
FROM Book AS B
LEFT JOIN Orderss AS O
  ON B.Book_id = O.Book_id
GROUP BY B.book_id, B.title, B.stock;








