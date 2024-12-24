CREATE TABLE IoTDevice (
    DeviceID INT PRIMARY KEY AUTO_INCREMENT,
    DeviceName VARCHAR(100) NOT NULL,
    DeviceType VARCHAR(50),
    Location VARCHAR(100),
    Status VARCHAR(50) DEFAULT 'Active'
);

CREATE TABLE Alert (
    AlertID INT PRIMARY KEY AUTO_INCREMENT,
    DeviceID INT NOT NULL,
    AlertType VARCHAR(50) NOT NULL,
    AlertDate DATE NOT NULL,
    Description TEXT,
    ResolvedStatus VARCHAR(50) DEFAULT 'Unresolved',
    FOREIGN KEY (DeviceID) REFERENCES IoTDevice(DeviceID)
);

CREATE TABLE DeviceData (
    DataID INT PRIMARY KEY AUTO_INCREMENT,
    DeviceID INT NOT NULL,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DataType VARCHAR(50),
    Value DECIMAL(10, 2),
    FOREIGN KEY (DeviceID) REFERENCES IoTDevice(DeviceID)
);
