-- Create the Library database
CREATE DATABASE librarydb;

-- Switch to the LibraryDB database
USE librarydb;

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT,
    genre VARCHAR(100),
    isbn VARCHAR(20) UNIQUE NOT NULL,
    status ENUM('available', 'checked_out') DEFAULT 'available'
);

-- Create table for Users who borrow the books (Optional)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create table to track book checkouts
CREATE TABLE BookCheckouts (
    checkout_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    checkout_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Insert a new book into the Books table
INSERT INTO Books (title, author, published_year, genre, isbn, status)
VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', '9780743273565', 'available');
-- Retrieve all books in the library
SELECT * FROM Books;

-- Retrieve a single book by ISBN
SELECT * FROM Books WHERE isbn = '9780743273565';

-- Retrieve all books by a particular author
SELECT * FROM Books WHERE author = 'F. Scott Fitzgerald';

-- Retrieve books with status 'available'
SELECT * FROM Books WHERE status = 'available';
-- Update book details (example: change book status)
UPDATE Books
SET status = 'checked_out'
WHERE book_id = 1;

-- Update book information (example: change the title of the book)
UPDATE Books
SET title = 'The Great Gatsby (Revised Edition)'
WHERE isbn = '9780743273565';
-- Delete a book by ISBN
DELETE FROM Books WHERE isbn = '9780743273565';
-- When a user checks out a book, insert a new entry into BookCheckouts
INSERT INTO BookCheckouts (book_id, user_id, checkout_date)
VALUES (1, 1, '2025-01-09');
-- Mark a book as returned and update status in the Books table
UPDATE Books
SET status = 'available'
WHERE book_id = 1;

-- Set the return date for a book in the BookCheckouts table
UPDATE BookCheckouts
SET return_date = '2025-01-16'
WHERE checkout_id = 1;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
