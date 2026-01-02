📚 Bookstore Sales Analysis (PostgreSQL)
📌 Project Overview

This project demonstrates SQL fundamentals to intermediate-level analysis using a fictional Bookstore database.
The goal is to design a relational schema, load data, and perform business-driven queries to extract insights such as sales, revenue, customer behavior, and inventory tracking.

This project is ideal for:

SQL practice

Portfolio demonstration

Interview preparation (joins, aggregates, grouping, filtering)

🛠️ Tech Stack

Database: PostgreSQL

Language: SQL

Concepts Covered:

Table creation & relationships

Data loading using COPY

Filtering & sorting

Aggregations (SUM, AVG, COUNT)

JOIN, LEFT JOIN

GROUP BY, HAVING

Business-oriented analytical queries

🗂️ Database Schema
1️⃣ Book Table

Stores book-level details including price and stock.

CREATE TABLE Book (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

2️⃣ Customer Table

Stores customer demographic information.

CREATE TABLE Customer (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

3️⃣ Orders Table

Stores transaction-level data linking customers and books.

CREATE TABLE Orderss (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

📥 Data Loading

Data is imported using PostgreSQL’s COPY command from CSV files.

COPY Book(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'C:\Program Files\PostgreSQL\17\book.csv' 
DELIMITER ',' CSV HEADER;

COPY Customer(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'C:\Program Files\PostgreSQL\17\Customers.csv' 
CSV HEADER;

COPY Orderss(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Program Files\PostgreSQL\17\Orders.csv' 
CSV HEADER;

🔍 SQL Analysis & Business Questions
🔹 Basic Queries

Retrieve books by genre

Filter books by publication year

List customers by country

Orders placed in a specific month

Total stock available

Most expensive book

High-quantity customers

Orders above a revenue threshold

Distinct genres

🔹 Intermediate Analysis

Total revenue generated

Customers with multiple orders

Most frequently ordered book

Top expensive books by genre

Revenue & quantity analysis using joins

🔹 Advanced Analysis

Total books sold per genre

Average price by genre

Customer spending analysis

Author-wise sales quantity

Stock remaining after sales

Inventory validation using LEFT JOIN

Example:

SELECT B.title, 
       B.stock - COALESCE(SUM(O.quantity), 0) AS Remaining_stock
FROM Book AS B
LEFT JOIN Orderss AS O
ON B.Book_id = O.Book_id
GROUP BY B.book_id, B.title, B.stock;

📊 Key Insights Generated

Revenue contribution by genre

High-value customers

Inventory depletion tracking

Sales distribution by author

Seasonal order analysis

Stock vs demand comparison

🚀 Why This Project Matters

This project showcases:

Realistic SQL use cases

Clean schema design

Business-focused thinking

Interview-ready query patterns

It reflects how SQL is actually used in data analyst roles, not just textbook exercises.

👤 Author

Sabir Naik
Data Analyst | SQL | PostgreSQL | Power BI | Excel

⭐ Suggestions

If you like this project:

⭐ Star the repository

🍴 Fork it and extend with views or indexes

📈 Add Power BI / Tableau dashboards




