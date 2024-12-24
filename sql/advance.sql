-- nang cao
-- view cay trong co nang suat duoi muc du bao
CREATE VIEW UnderperformingCrops AS
SELECT c.CropID, c.Name, c.Yield, f.ExpectedYield
FROM Crop c
JOIN Forecast f ON c.CropID = f.CropID
WHERE c.Yield < f.ExpectedYield;

-- thong ke luong phan bon 
SELECT CropID, SUM(Amount) AS TotalFertilizer
FROM Fertilization
GROUP BY CropID;

 -- sap xep vat nuoi theo tinh trang suc khoe
 SELECT LivestockID, Name, HealthStatus
FROM Livestock
ORDER BY HealthStatus;

-- tu dong canh bao neu nhiet do cao vuot nguong
DELIMITER $$
CREATE TRIGGER TemperatureAlert
AFTER INSERT ON DeviceData
FOR EACH ROW
BEGIN
    IF NEW.DataType = 'Nhiet do' AND NEW.Value > 27 THEN
        INSERT INTO Alert (DeviceID, AlertType, AlertDate, Description, ResolvedStatus)
        VALUES (NEW.DeviceID, 'Nhiet do cao', NEW.Timestamp, 'Nhiet do cao tren 27°C', 'Chua giai quyet');
    END IF;
END$$
DELIMITER ;

-- du bao nang suat cay trong
SELECT CropID, AVG(Yield) AS PredictedYield
FROM Crop
WHERE GrowthStage = 'Truong thanh'
GROUP BY CropID;

-- hieu suat dong vat
SELECT l.LivestockID, l.Name, COUNT(hr.HealthRecordID) AS HealthChecks, AVG(f.Quantity) AS AvgFeedConsumption
FROM Livestock l
JOIN HealthRecord hr ON l.LivestockID = hr.LivestockID
JOIN Feeding f ON l.LivestockID = f.LivestockID
GROUP BY l.LivestockID;


