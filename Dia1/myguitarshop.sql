CREATE DATABASE MyGuitarShop;

USE MyGuitarShop;

CREATE TABLE Categories(
  CategoryID        INT            PRIMARY KEY,
  CategoryName      VARCHAR(255)   NOT NULL      UNIQUE
);

CREATE TABLE Products (
  ProductID         INT            PRIMARY KEY,
  CategoryID        INT,
  foreign key(CategoryID) references Categories(CategoryID), 
  ProductCode       VARCHAR(10)    NOT NULL      UNIQUE,
  ProductName       VARCHAR(255)   NOT NULL,
  Description       TEXT           NOT NULL,
  ListPrice         DOUBLE         NOT NULL,
  DiscountPercent   DOUBLE          NOT NULL,
  DateAdded         DATETIME                     DEFAULT NULL
);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,
  ShippingAddressID    INT                          DEFAULT NULL,
  BillingAddressID     INT                          DEFAULT NULL
);

CREATE TABLE Addresses (
  AddressID          INT            PRIMARY KEY,
  CustomerID         INT,
  foreign key(CustomerID) REFERENCES Customers(CustomerID),
  Line1              VARCHAR(60)    NOT NULL,
  Line2              VARCHAR(60)                  DEFAULT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,
  Disabled           INT            NOT NULL      DEFAULT 0
);

CREATE TABLE Orders (
  OrderID           INT            PRIMARY KEY,
  CustomerID        INT,
  foreign key(CustomerID) REFERENCES Customers(CustomerID),
  OrderDate         DATETIME       NOT NULL,
  ShipAmount        DOUBLE          NOT NULL,
  TaxAmount         DOUBLE   NOT NULL,
  ShipDate          DATETIME                    DEFAULT NULL,
  ShipAddressID     INT            NOT NULL,
  CardType          VARCHAR(50)    NOT NULL,
  CardNumber        CHAR(16)       NOT NULL,
  CardExpires       CHAR(7)        NOT NULL,
  BillingAddressID  INT            NOT NULL    
);

CREATE TABLE OrderItems (
  ItemID             INT            ,
  OrderID            INT,
  FOREIGN KEY(OrderID) REFERENCES Orders (OrderID),
  ProductID          INT,
  FOREIGN KEY(ProductID) REFERENCES Products (ProductID),
  ItemPrice          DOUBLE  NOT NULL,
  DiscountAmount     DOUBLE  NOT NULL,
  Quantity           INT            NOT NULL,
  constraint OrderItems_pk Primary key (OrderId, ProductID)    
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY,
  EmailAddress      VARCHAR(255)   NOT NULL,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);

insert into Categories(CategoryID, CategoryName)
values(1, "Guitarras eléctricas"), (2, "Guitarras acústicas"), (3, "Amplificadores"), (4, "Pedales de efectos"), (5, "Accesorios para guitarras"), (6, "Equipos de grabación y producción musical"), (7, "Partituras y métodos de aprendizaje para guitarra"), (8, "Bajos, ukeleles"), (9, "Estuches y fundas"), (10, "Merchandising de bandas y marcas de música"), (11, "Micrófonos y equipo de sonido");

select * from Categories

insert into Products(ProductID, CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
values(1, 2, "G001", "Guitarra eléctrica Fender Stratocaster", "Guitarra eléctrica Fender Stratocaster en color negro, cuerpo de aliso, diapasón de arce, con pastillas de bobina simple y doble para un sonido versátil", 1200, 10, "2024-05-17-08:40"),
(2, 3, "G002", "Guitarra acústica Yamaha FG800", "Guitarra acústica Yamaha FG800 en color natural, con tapa de abeto macizo, fondo y aros de nato, diapasón de palisandro, sonido brillante y equilibrado", 600, 15, "2024-05-17-08:41"),
(3, 5, "A001", "Amplificador Marshall MG30GFX", "Amplificador Marshall MG30GFX de 30W con efectos digitales integrados, canal limpio y canal de distorsión, ideal para práctica y presentaciones en vivo", 350, 10, "2024-05-17-08:42"),
(4, 10, "P001", "Pedal de efectos Boss DS-1 Distortion", "Pedal de efectos Boss DS-1 Distortion con distorsión clásica, control de tono y nivel, durable y versátil, usado por guitarristas de todos los géneros", 80, 5, "2024-05-17-08:43"),
(5, 8, "A002", "Accesorios para guitarras - Juego de cuerdas Ernie Ball Regular Slinky", "Juego de cuerdas para guitarra eléctrica Ernie Ball Regular Slinky calibre 10-46, fabricadas en niquel, sonido brillante y durabilidad garantizada", 10, 0, "2024-05-17-08:44"),
(6, 6, "E001", "Interfaz de audio Focusrite Scarlett 2i2", "Interfaz de audio Focusrite Scarlett 2i2 con dos preamplificadores de micrófono Scarlett, alta resolución de 24 bits/192 kHz, conexión USB-C, ideal para grabación en estudio doméstico", 200, 5, "2024-05-17-08:45"),
(7, 7, "P002", "Partituras y métodos de aprendizaje para guitarra - 'Guitarra para Dummies'", "Libro 'Guitarra para Dummies' con información básica y avanzada sobre técnicas de guitarra, acordes, escalas y más, ideal para principiantes y músicos intermedios", 25, 0, "2024-05-17-08:46"),
(8, 4, "B001", "Bajo eléctrico Ibanez SR300E", "Bajo eléctrico Ibanez SR300E en color negro, cuerpo de caoba, diapasón de jatoba, pastillas PowerSpan, sonido potente y versátil, perfecto para estilos musicales diversos", 500, 10, "2024-05-17-08:47"),
(9, 9, "E002", "Estuche rígido para guitarra eléctrica", "Estuche rígido para guitarra eléctrica con exterior de plástico moldeado resistente, interior de espuma acolchada, compartimento para accesorios y cerraduras de seguridad, protege tu instrumento durante los viajes y almacenamiento", 100, 0, "2024-05-17-08:48"),
(10, 11, "M001", "Merchandising de bandas y marcas de música - Camiseta de Led Zeppelin", "Camiseta oficial de Led Zeppelin con diseño clásico de 'Zoso', fabricada en algodón de alta calidad, disponible en varias tallas, perfecta para fanáticos de la banda", 30, 0, "2024-05-17-08:49"),
(11, 2, "G003", "Guitarra acústica Martin D-28", "Guitarra acústica Martin D-28 con tapa de abeto sitka sólido, fondo y costados de palo de rosa, mástil de caoba, diapasón de ébano y clavijeros Grover, fabricada a mano en Estados Unidos con la artesanía de calidad de Martin", 3000, 12, "2024-05-17-08:50");

INSERT INTO Customers(CustomerID, EmailAddress, Password, FirstName, LastName, ShippingAddressID, BillingAddressID) VALUES 
(1, "juangomez@example.com", "ju@ng0m3z", "Juan", "Gómez", 123, 456),
(2, "maria.lopez@example.com", "m4r14l0p3z", "María", "López", 456, 789),
(3, "pedro.martinez@example.com", "p3dr0.m@rt1n3z", "Pedro", "Martínez", 789, 1010),
(4, "ana.rodriguez@example.com", "4n@.r0dr1gu3z", "Ana", "Rodríguez", 1010, 1111),
(5, "luisfernandez@example.com", "lu1sf3rn@nd3z", "Luis", "Fernández", 1111, 1212),
(6, "laura.garcia@example.com", "l@ur@g@rc14", "Laura", "García", 1212, 1313),
(7, "carlos.perez@example.com", "c@rl0s.p3r3z", "Carlos", "Pérez", 1313, 1414),
(8, "sofiadiaz@example.com", "s0f14d14z", "Sofía", "Díaz", 1414, 1515),
(9, "daniel.hernandez@example.com", "dh3rn@nd3z", "Daniel", "Hernández", 1515, 1616),
(10, "elena.sanchez@example.com", "3l3n@.s@nch3z", "Elena", "Sánchez", 1616, 1717),
(11, "miguel.gutierrez@example.com", "m1gu3lgut1err3z", "Miguel", "Gutiérrez", 1717, 1818);

select * from Customers

INSERT INTO Addresses(AddressID, CustomerID, Line1, Line2, City, State, ZipCode, Phone, Disabled) 
VALUES(1, 1, '123 Main St', NULL, 'San Francisco', 'CA', '66801', '555-1234', 0),
(2, 2, '456 Oak St', NULL, 'Los Angeles', 'CA', '90001', '555-2345', 0),
(3, 3, '789 Pine St', NULL, 'San Diego', 'CA', '92101', '555-3456', 0),
(4, 4, '1010 Elm St', NULL, 'San Jose', 'CA', '95101', '555-4567', 0),
(5, 5, '1111 Maple St', NULL, 'Sacramento', 'CA', '95801', '555-5678', 0),
(6, 6, '1212 Cherry St', NULL, 'Oakland', 'CA', '94601', '555-6789', 0),
(7, 7, '1313 Walnut St', NULL, 'Fresno', 'CA', '93701', '555-7890', 0),
(8, 8, '1414 Cedar St', NULL, 'Long Beach', 'CA', '90801', '555-8901', 0),
(9, 9, '1515 Pine St', NULL, 'Bakersfield', 'CA', '93301', '555-9012', 0),
(10, 10, '1616 Oak St', NULL, 'Santa Ana', 'CA', '92701', '555-0123', 0),
(11, 11, '1717 Elm St', NULL, 'Riverside', 'CA', '92501', '555-1234', 0);

select * from Addresses

INSERT INTO Orders(OrderID, CustomerID, OrderDate, ShipAmount, TaxAmount, ShipDate, ShipAddressID, CardType, CardNumber, CardExpires, BillingAddressID) VALUES 
(1, 1, '2024-05-01 10:30:00', 10.50, 1.20, '2024-05-02 08:00:00', 123, 'Visa', '1234567812345678', '05/26', 456),
(2, 2, '2024-05-02 11:45:00', 15.75, 1.80, NULL, 456, 'Mastercard', '8765432187654321', '09/27', 789),
(3, 3, '2024-05-03 12:15:00', 20.00, 2.40, '2024-05-04 09:30:00', 789, 'American Express', '1111222233334444', '11/25', 1010),
(4, 4, '2024-05-04 14:20:00', 12.25, 1.50, NULL, 1010, 'Visa', '5555666677778888', '03/28', 1111),
(5, 5, '2024-05-05 15:10:00', 18.30, 2.10, '2024-05-06 10:45:00', 1111, 'Mastercard', '9999888877776666', '08/26', 1212),
(6, 6, '2024-05-06 09:55:00', 9.75, 1.00, NULL, 1212, 'Visa', '4444333322221111', '02/27', 1313),
(7, 7, '2024-05-07 10:20:00', 14.60, 1.70, '2024-05-08 11:00:00', 1313, 'Mastercard', '7777666655554444', '10/27', 1414),
(8, 8, '2024-05-08 11:30:00', 22.40, 2.80, NULL, 1414, 'American Express', '8888999977775555', '06/25', 1515),
(9, 9, '2024-05-09 13:40:00', 17.20, 2.20, '2024-05-10 13:30:00', 1515, 'Visa', '6666555577778888', '12/26', 1616),
(10, 10, '2024-05-10 14:50:00', 11.90, 1.40, NULL, 1616, 'Mastercard', '3333444455556666', '04/27', 1717),
(11, 11, '2024-05-11 16:00:00', 25.00, 3.00, '2024-05-12 14:20:00', 1717, 'Visa', '2222111133334444', '07/28', 1818);

select * from Orders

INSERT INTO OrderItems(ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity) 
VALUES(1, 1, 1, 1200.00, 120.00, 1),
(2, 2, 2, 950.00, 95.00, 1),
(3, 3, 5, 800.00, 80.00, 3),
(4, 4, 4, 1500.00, 150.00, 1),
(5, 5, 3, 500.00, 50.00, 2),
(6, 6, 6, 700.00, 70.00, 4),
(7, 7, 9, 300.00, 30.00, 2),
(8, 8, 8, 250.00, 25.00, 1),
(9, 9, 7, 1000.00, 100.00, 1),
(10, 10, 10, 400.00, 40.00, 1),
(11, 11, 11, 600.00, 60.00, 3);

select * from OrderItems

INSERT INTO Administrators(AdminID, EmailAddress, Password, FirstName, LastName) 
VALUES(1, "john.doe@example.com", "adminpass1", "John", "Doe"),
(2, "jane.smith@example.com", "adminpass2", "Jane", "Smith"),
(3, "michael.johnson@example.com", "adminpass3", "Michael", "Johnson"),
(4, "emily.brown@example.com", "adminpass4", "Emily", "Brown"),
(5, "daniel.wilson@example.com", "adminpass5", "Daniel", "Wilson"),
(6, "emma.martinez@example.com", "adminpass6", "Emma", "Martinez"),
(7, "christopher.taylor@example.com", "adminpass7", "Christopher", "Taylor"),
(8, "olivia.anderson@example.com", "adminpass8", "Olivia", "Anderson"),
(9, "matthew.thomas@example.com", "adminpass9", "Matthew", "Thomas"),
(10, "ava.jackson@example.com", "adminpass10", "Ava", "Jackson"),
(11, "william.white@example.com", "adminpass11", "William", "White");