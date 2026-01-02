📚 Bookstore Management System – SQL Project (PostgreSQL)
📌 Project Overview

This project demonstrates SQL fundamentals to intermediate-level analysis using a fictional Bookstore Management System.
The goal is to design a relational database, load real-world–like data, and extract meaningful business insights using SQL queries.

The project covers:

Database design

Data loading using CSV files

Basic to advanced SQL queries

Business-focused analytical questions

🛠️ Technologies Used

Database: PostgreSQL

Language: SQL

Tools: pgAdmin / psql

Data Source: CSV files (Books, Customers, Orders)

🗂️ Database Schema
1️⃣ Book Table

Stores book-related information.

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

Stores customer details.

CREATE TABLE Customer (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

3️⃣ Orders Table

Stores order transactions.

CREATE TABLE Orderss (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

📥 Data Loading (CSV Import)

Data is imported using the COPY command:

COPY Book(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'C:\Program Files\PostgreSQL\17\book.csv'
DELIMITER ',' CSV HEADER;

COPY Customer(Customer_ID, Name, Email, Phone, City, Country)
FROM 'C:\Program Files\PostgreSQL\17\Customers.csv'
CSV HEADER;

COPY Orderss(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'C:\Program Files\PostgreSQL\17\Orders.csv'
CSV HEADER;

🔍 SQL Queries & Analysis
🟢 Basic Queries

Retrieve all Fiction books

Find books published after 1950

List customers from Canada

Orders placed in November 2023

Total stock available

Most expensive book

Customers ordering more than 1 item

Orders with total amount > $20

Distinct book genres

Book with lowest stock

Total revenue generated

🔵 Advanced Analytical Queries

Total books sold per genre

Average price of Fantasy books

Customers with at least 2 orders

Most frequently ordered book

Top 3 most expensive Fantasy books

Quantity sold by each author

Cities of customers who spent over $30

Highest-spending customer

Remaining stock after fulfilling all orders

Remaining stock using LEFT JOIN (handling zero orders)

🧠 Key Concepts Demonstrated

JOIN, LEFT JOIN

GROUP BY, HAVING

Aggregate functions (SUM, AVG, COUNT)

Filtering with WHERE

Date filtering using EXTRACT

Handling NULL values using COALESCE

Business-oriented SQL thinking

📈 Business Insights Enabled

Identify high-revenue customers

Track inventory depletion

Understand genre-level sales performance

Monitor author popularity

Detect stock shortages early

🚀 How to Run This Project

Install PostgreSQL

Create a new database

Run the table creation scripts

Import CSV files using COPY

Execute analysis queries

📌 Future Improvements

Add foreign key constraints

Create views for reusable analysis

Automate reports using scheduled jobs

Build dashboards using Power BI / Tableau

👤 Author

Sabir Naik
Data Analyst | SQL | Power BI | Excel
