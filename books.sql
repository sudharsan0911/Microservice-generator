-- Create the Library database
CREATE DATABASE IF NOT EXISTS librarydb;

-- Switch to the LibraryDB database
USE librarydb;

DROP TABLE IF EXISTS `books`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `bookCheckouts`;

-- Create Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT,
    genre VARCHAR(100),
    isbn VARCHAR(20) UNIQUE NOT NULL,
    status ENUM('available', 'checked_out') DEFAULT 'available'
);

-- Create table for Users who borrow the books (Optional)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create table to track book checkouts
CREATE TABLE bookCheckouts (
    checkout_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    checkout_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
