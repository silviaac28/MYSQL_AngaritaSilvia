CREATE DATABASE DownloadsDB;
USE DownloadsDB;

CREATE TABLE User(
UserID INT PRIMARY KEY,
EmailAddress VARCHAR(50) NOT NULL UNIQUE,
FirstName VARCHAR(25) not null,
LastName VARCHAR(25) not null);

CREATE TABLE Downloads(
DownloadID INT PRIMARY KEY,
UserID        INT,
foreign key(UserID) references User(UserID), 
FileName VARCHAR(25) NOT NULL,
DateDownload DATETIME NOT null);

CREATE TABLE Product(
ProductID INT PRIMARY KEY,
Name VARCHAR(25) NOT null,
DownloadID        INT,
foreign key(DownloadID) references Downloads(DownloadID));

INSERT INTO User(UserID, EmailAddress, FirstName, LastName) 
VALUES(1, "alice.smith@example.com", "Alice", "Smith"),
(2, "bob.johnson@example.com", "Bob", "Johnson"),
(3, "carol.williams@example.com", "Carol", "Williams"),
(4, "david.jones@example.com", "David", "Jones"),
(5, "emma.brown@example.com", "Emma", "Brown"),
(6, "frank.miller@example.com", "Frank", "Miller"),
(7, "grace.davis@example.com", "Grace", "Davis"),
(8, "henry.wilson@example.com", "Henry", "Wilson"),
(9, "isabella.moore@example.com", "Isabella", "Moore"),
(10, "jack.taylor@example.com", "Jack", "Taylor"),
(11, "katherine.anderson@example.com", "Katherine", "Anderson");

select * from User

INSERT INTO Downloads (DownloadID, UserID, FileName, DateDownload) 
VALUES(1, 1, "file1.pdf", '2024-05-01 08:30:00'),
(2, 2, "file2.doc", '2024-05-02 09:45:00'),
(3, 3, "file3.txt", '2024-05-03 10:15:00'),
(4, 4, "file4.xlsx", '2024-05-04 11:20:00'),
(5, 5, "file5.jpg", '2024-05-05 12:10:00'),
(6, 6, "file6.png", '2024-05-06 13:55:00'),
(7, 7, "file7.zip", '2024-05-07 14:20:00'),
(8, 8, "file8.mp3", '2024-05-08 15:30:00'),
(9, 9, "file9.mov", '2024-05-09 16:40:00'),
(10, 10, "file10.avi", '2024-05-10 17:50:00'),
(11, 11, "file11.mp4", '2024-05-11 18:00:00');

select * from Downloads

INSERT INTO Product(ProductID, Name, DownloadID)
values(1, "productA", 1);

INSERT INTO Product(ProductID, Name, DownloadID)
values(2, "Product B", 2),
(3, "Product C", 3),
(4, "Product D", 4),
(5, "Product E", 5),
(6, "Product F", 6),
(7, "Product G", 7),
(8, "Product H", 8),
(9, "Product I", 9),
(10, "Product J", 10),
(11, "Product K", 11);

select * from product