CREATE TABLE Resource (
    ResourceID INT PRIMARY KEY AUTO_INCREMENT,
    ResourceType VARCHAR(50) NOT NULL,
    ResourceName VARCHAR(100) NOT NULL,
    Quantity DECIMAL(10, 2),
    Supplier VARCHAR(100),
    DateReceived DATE,
    ExpirationDate DATE
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    ContactInfo VARCHAR(100),
    AssignedFarmID INT -- Nếu có nhiều trang trại, AssignedFarmID liên kết trang trại cụ thể
);

CREATE TABLE Task (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT, -- Liên kết với Employee
    TaskName VARCHAR(100) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) -- Ràng buộc khóa ngoại
);
