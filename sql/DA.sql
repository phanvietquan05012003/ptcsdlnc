CREATE TABLE PerformanceMetric (
    MetricID INT PRIMARY KEY AUTO_INCREMENT,
    MetricName VARCHAR(100) NOT NULL,
    MetricType VARCHAR(50),
    Description TEXT
);

CREATE TABLE MetricRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    MetricID INT NOT NULL,
    Value DECIMAL(10, 2) NOT NULL,
    RecordDate DATE NOT NULL,
    Source VARCHAR(100),
    FOREIGN KEY (MetricID) REFERENCES PerformanceMetric(MetricID)
);

CREATE TABLE Prediction (
    PredictionID INT PRIMARY KEY AUTO_INCREMENT,
    MetricID INT NOT NULL,
    PredictedValue DECIMAL(10, 2) NOT NULL,
    PredictionDate DATE NOT NULL,
    ConfidenceLevel DECIMAL(5, 2), -- Độ tin cậy của dự đoán (phần trăm)
    FOREIGN KEY (MetricID) REFERENCES PerformanceMetric(MetricID)
);
