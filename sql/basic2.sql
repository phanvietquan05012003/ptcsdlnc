-- kiem tra lich tuoi tieu, phan bon
SELECT c.CropID, c.Name, i.IrrigationDate, i.WaterAmount, f.FertilizationDate, f.Amount
FROM Crop c
LEFT JOIN Irrigation i ON c.CropID = i.CropID
LEFT JOIN Fertilization f ON c.CropID = f.CropID
WHERE i.IrrigationDate IS NULL OR f.FertilizationDate IS NULL;

-- nang suat cay trong
SELECT crop.CropID, Name, Yield, ExpectedYield, (Yield - ExpectedYield) AS YieldDifference
FROM Crop
JOIN Forecast ON Crop.CropID = Forecast.CropID;

-- suc khoe vat nuoi
SELECT l.LivestockID, l.Name, hr.CheckupDate, hr.HealthCondition, hr.Treatment
FROM Livestock l
JOIN HealthRecord hr ON l.LivestockID = hr.LivestockID
WHERE hr.HealthCondition IS NOT NULL;

-- lich su sinh san
SELECT b.LivestockID, b.MateID, b.BreedingDate, b.ExpectedBirthDate, b.Status
FROM Breeding b
JOIN Livestock l ON b.LivestockID = l.LivestockID;

-- tai nguyen ton kho, ngay het han
SELECT ResourceName, Quantity, ExpirationDate
FROM Resource
WHERE ExpirationDate <= DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- tai nguyen su dung theo task
SELECT r.ResourceName, t.TaskName, t.StartDate, t.EndDate
FROM Resource r
JOIN Task t ON r.ResourceID = t.TaskID;
