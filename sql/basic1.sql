-- basic

SELECT CropID, Name, PlantingDate, Yield
FROM Crop;

SELECT LivestockID, Name, Type, HealthStatus
FROM livestock;

SELECT ResourceID, ResourceName, Quantity
FROM Resource;

-- view
SELECT LivestockID, Name, Breed, HealthStatus
FROM livestock
WHERE HealthStatus = 'Om' OR HealthStatus = 'Khoe manh';

-- count
SELECT HealthStatus, COUNT(*) AS TotalLivestock
FROM livestock
GROUP BY HealthStatus
ORDER BY TotalLivestock DESC;

-- feed schedule
SELECT l.LivestockID, l.Name, f.FeedType, f.Quantity, f.FeedingDate
FROM Livestock l
JOIN Feeding f ON l.LivestockID = f.LivestockID
ORDER BY f.FeedingDate DESC;

-- recent health checking
SELECT l.LivestockID, l.Name, h.CheckupDate, h.HealthCondition, h.Treatment
FROM Livestock l
JOIN HealthRecord h ON l.LivestockID = h.LivestockID
WHERE h.CheckupDate = (
    SELECT MAX(CheckupDate)
    FROM HealthRecord
    WHERE LivestockID = l.LivestockID
)
ORDER BY h.CheckupDate DESC;

-- count each livestock cost
-- SELECT l.LivestockID, l.Name, SUM(f.Quantity * r.UnitPrice) AS TotalFeedCost
-- FROM Livestock l
-- JOIN Feeding f ON l.LivestockID = f.LivestockID
-- JOIN resource r ON f.FeedType = r.ResourceName
-- WHERE f.FeedingDate BETWEEN '2022-01-01' AND '2023-12-12'
-- GROUP BY l.LivestockID, l.Name
-- ORDER BY TotalFeedCost DESC;

-- auto update health status
-- CREATE TRIGGER Update_Livestock_HealthStatus
-- AFTER INSERT ON HealthRecord
-- FOR EACH ROW
-- BEGIN
--    IF NEW.HealthCondition IN ('Suy dinh dưỡng', 'Khỏe mạnh') THEN
--        UPDATE Livestock
--        SET HealthStatus = NEW.HealthCondition
--        WHERE LivestockID = NEW.LivestockID;
--    END IF;
-- END;