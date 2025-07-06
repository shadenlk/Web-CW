USE accom;

-- Query 1 Shows how many rooms need scheduled maintenance.

SELECT R_Maintenance AS 'Maintenance needed', COUNT(*) AS 'Number of rooms'
FROM Room
GROUP BY R_Maintenance;


-- Query 2 Shows students with pending payments from a specified building

SELECT URN, RoomID, 
	CONCAT(APP_FirstName, ' ', APP_Surname) AS 'Name', 
	APP_PaymentStatus AS 'Pending Payment'
FROM ACCOUNT
WHERE APP_PaymentStatus = 'Pending'
    AND RoomID IN (SELECT RoomID FROM Room WHERE BuildingID = 7);


-- Query 3 Shows how many Studios/Single/Shared accoms each building has

-- Code Refernced https://t.ly/2jApr
SELECT
    B.BuildingID,
    COUNT(S.StudioNumber) AS 'Studio Count',
    COUNT(SI.SingleNumber) AS 'Single Count',
    COUNT(SH.SharedNumber) AS 'Shared Count',
    B.B_Address
FROM
    Building B

LEFT JOIN Studio S 
	 ON B.BuildingID = S.BuildingID
LEFT JOIN Single SI
 	 ON B.BuildingID = SI.BuildingID
LEFT JOIN Shared SH
 	 ON B.BuildingID = SH.BuildingID

GROUP BY
    B.BuildingID, B.B_Address;

-- If you want to do some more queries as the extra challenge task you can include them here