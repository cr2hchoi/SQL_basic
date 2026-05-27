
-- bookstore 데이터베이스 생성 
CREATE DATABASE bookstore;
USE bookstore;

-- bookadmin 계정 생성 
CREATE USER bookadmin@'localhost' IDENTIFIED BY 'book'; 
GRANT ALL PRIVILEGES ON bookstore.* to bookadmin
@'localhost' WITH GRANT OPTION; 

-- Book Table 생성 
CREATE TABLE Book(
bookid INT AUTO_INCREMENT PRIMARY KEY, 
bookname VARCHAR(50) NOT NULL,
publisher VARCHAR(20),
price INT NOT NULL 
);

ALTER TABLE book
MODIFY publisher VARCHAR(20) NOT NULL;

-- Orders Table 생성 
CREATE TABLE Orders(
orderid INT AUTO_INCREMENT PRIMARY KEY,
custid INTEGER,
bookid INTEGER,
saleprice INTEGER,
orderdate DATE
); 

-- Customer Table 생성 
CREATE TABLE Customer(
custid INTEGER AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(40) NOT NULL,
address VARCHAR(50), 
phone VARCHAR(11)
);

SHOW TABLES;

ALTER TABLE customer
MODIFY phone VARCHAR(20) ;
