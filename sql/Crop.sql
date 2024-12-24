CREATE TABLE CropType (
    TypeID INT PRIMARY KEY,
    TypeName VARCHAR(255) NOT NULL
);

CREATE TABLE Crop (
    CropID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    TypeID INT,
    PlantingDate DATE,
    HarvestDate DATE,
    Yield DECIMAL(10, 2),
    Status VARCHAR(50),
    GrowthStage VARCHAR(50),
    WaterRequirement DECIMAL(10, 2),
    FertilizerRequirement VARCHAR(255),
    PestResistance VARCHAR(255),
    FOREIGN KEY (TypeID) REFERENCES CropType(TypeID)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    CropID INT,
    ActivityType VARCHAR(50),
    ScheduledDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);

CREATE TABLE EnvironmentalData (
    DataID INT PRIMARY KEY,
    CropID INT,
    Timestamp TIMESTAMP,
    SoilMoisture DECIMAL(5, 2),
    Temperature DECIMAL(5, 2),
    Humidity DECIMAL(5, 2),
    LightIntensity DECIMAL(5, 2),
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);

CREATE TABLE Irrigation (
    IrrigationID INT PRIMARY KEY,
    CropID INT,
    IrrigationDate DATE,
    WaterAmount DECIMAL(10, 2),
    Method VARCHAR(50),
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);

CREATE TABLE Fertilization (
    FertilizationID INT PRIMARY KEY,
    CropID INT,
    FertilizationDate DATE,
    FertilizerType VARCHAR(255),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);

CREATE TABLE PestDisease (
    PestDiseaseID INT PRIMARY KEY,
    CropID INT,
    PestType VARCHAR(50),
    DetectionDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);

CREATE TABLE Forecast (
    ForecastID INT PRIMARY KEY,
    CropID INT,
    ExpectedYield DECIMAL(10, 2),
    ForecastDate DATE,
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);
