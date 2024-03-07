CREATE database test;
USE test;
use learnhiber;

Create table Admin (
AdminId int primary key,
Password varchar(10)
);

Insert into Admin values
(10, "Admin@123"),
(112, "Admin@1555"),
(12, "Admin@1555"),
(115, "Admin@88"),
(1885, "Admin@998");

Select * from Admin;


Create table Admin (
AdminId varchar(20) primary key,
Password varchar(10)
);

Insert into Admin values
("10", "Admin@123"),
("112", "Admin@1555"),
("12", "Admin@1555"),
("115", "Admin@88"),
("1885", "Admin@998");

Select * from Admin;

CREATE TABLE Book
(BookId INT auto_increment PRIMARY KEY ,
BookName varchar(50),
BookAuthor varchar(50),
BookPublication varchar(50),
BookQuantity INT default 0
);

INSERT INTO Book (BookName, BookAuthor, BookPublication, BookQuantity)
VALUES 
("Fire of Wings", "A.P.J. Kalam",	"KD Publication", 10),
("My Experiment with Truth", "M.K. Gandhi",	"RK Books", 15),
("XYZ",	"Ram Rahim", "Kiran Publication", 5),
("Programming with C", "Reema Thareja", "OxFord Publication", 8),
("Programming with C", "Reema Thareja", "OxFord Publication", 0),
("Programming with C", "Reema Thareja", "OxFord Publication", 0);



SELECT * FROM Book;
