
CREATE DATABASE CarRentalDB;
USE CarRentalDB;

USE CarRentalDB;

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    RentPerDay DECIMAL(10,2) NOT NULL,
    Availability VARCHAR(20) NOT NULL
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    LicenseNo VARCHAR(30) UNIQUE
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    CarID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

USE CarRentalDB;

INSERT INTO Cars VALUES
(1, 'Maruti Suzuki', 'Swift', 1800.00, 'Available'),
(2, 'Hyundai', 'Creta', 3000.00, 'Available'),
(3, 'Tata', 'Nexon', 2500.00, 'Rented'),
(4, 'Honda', 'City', 2800.00, 'Available'),
(5, 'Toyota', 'Innova', 4000.00, 'Available');

INSERT INTO Customers VALUES
(1, 'Aman Sharma', '9876543210', 'LIC101'),
(2, 'Rahul Verma', '9876543211', 'LIC102'),
(3, 'Simran Kaur', '9876543212', 'LIC103'),
(4, 'Karan Singh', '9876543213', 'LIC104'),
(5, 'Neha Gupta', '9876543214', 'LIC105');

INSERT INTO Bookings VALUES
(101, 1, 3, '2026-10-20', '2026-10-22', 5000.00),
(102, 2, 1, '2026-10-23', '2026-10-24', 1800.00),
(103, 3, 2, '2026-10-24', '2026-10-26', 6000.00);

INSERT INTO Payments VALUES
(201, 101, '2026-10-20', 5000.00, 'Paid'),
(202, 102, '2026-10-23', 1800.00, 'Paid'),
(203, 103, '2026-10-24', 3000.00, 'Partial');

SELECT * FROM Cars;
