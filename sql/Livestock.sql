CREATE TABLE Livestock (
    LivestockID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(50) NOT NULL,
    Name VARCHAR(100),
    BirthDate DATE,
    HealthStatus VARCHAR(50),
    Breed VARCHAR(50),
    Location VARCHAR(100)
);

CREATE TABLE Feeding (
    FeedingID INT PRIMARY KEY AUTO_INCREMENT,
    LivestockID INT,
    FeedType VARCHAR(50),
    Quantity DECIMAL(10, 2),
    FeedingDate DATE,
    FOREIGN KEY (LivestockID) REFERENCES Livestock(LivestockID)
);

CREATE TABLE HealthRecord (
    HealthRecordID INT PRIMARY KEY AUTO_INCREMENT,
    LivestockID INT,
    CheckupDate DATE,
    HealthCondition VARCHAR(100),
    Treatment VARCHAR(100),
    VetName VARCHAR(100),
    FOREIGN KEY (LivestockID) REFERENCES Livestock(LivestockID)
);

CREATE TABLE Breeding (
    BreedingID INT PRIMARY KEY AUTO_INCREMENT,
    LivestockID INT,
    MateID INT,
    BreedingDate DATE,
    ExpectedBirthDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (LivestockID) REFERENCES Livestock(LivestockID),
    FOREIGN KEY (MateID) REFERENCES Livestock(LivestockID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ItemType VARCHAR(50),
    ItemName VARCHAR(100),
    Quantity DECIMAL(10, 2),
    Supplier VARCHAR(100),
    DateReceived DATE,
    ExpirationDate DATE
);
