-- Total Revenue Collected Per Month
SELECT 
	DATE_FORMAT(Date, '%Y-%m') AS Month,
	SUM(Total) AS Total_Revenue
FROM payments
GROUP BY month
ORDER BY month DESC;

-- Top 5 Highest Paying Residents
SELECT 
	Full_Name,
    ApartmentID AS Apartment,
    SUM(Total) AS Total_Payment
FROM resident_details rd
JOIN payments
	USING(ApartmentID)
GROUP BY rd.Full_Name, rd.ApartmentID
ORDER BY Total_Payment DESC
LIMIT 5;

-- Count of Each Type of Bill Paid
SELECT
	Bill,
    COUNT(*) AS Total_transactions
FROM payments
GROUP BY Bill
ORDER BY Total_transactions DESC;

-- Electricity Recharge for 6 Months Between January And June
SELECT 
	ApartmentID,
    Bill,
    Date,
    Total
FROM payments
WHERE Bill = 'Electricity recharge' AND month(Date) BETWEEN 01 AND 06;

-- Payments in the Last 120 days
SELECT *
FROM payments
WHERE date >= CURDATE()-INTERVAL 120 DAY
ORDER BY date DESC;

-- Electricity Recharge From 50k above for the period of 3 Months (Jan - Mar)
SELECT 
	p.ApartmentID,
    rd.Full_Name,
    Bill,
    Date,
    Total
FROM payments p
JOIN resident_details rd
	USING(ApartmentID)
WHERE Bill = 'Electricity recharge' AND  Total >= 50000.00 AND month(Date) BETWEEN 01 AND 03
ORDER BY ApartmentID;

-- Get Information of Residents in Block A & B only
SELECT 
	Full_Name,
    ApartmentID,
    Unit_Type,
    Block,
    Contacts
FROM resident_details
WHERE Block IN ('Block A', 'Block B');

-- Get Resident whose name has letter B
SELECT 
	Full_Name,
    rd.ApartmentID,
    Bill,
    Date,
    Total 
FROM resident_details rd
JOIN payments p
	USING(ApartmentID)
WHERE Full_Name LIKE '%B%';

-- Get Payment by status (Low recharge, Average recharge, Top recharge & Premium recharge)
SELECT 
	ApartmentID,
    Full_Name,
    Bill,
    Date,
    Total,
    CASE    WHEN Total < 30000 THEN 'Low Recharge'
			WHEN Total < 50000 THEN 'Average Recharge'
            WHEN Total < 100000 THEN 'High Recharge'
		ELSE 'Premium Recharge'
	END AS 'Payment Status'
FROM payments p
JOIN resident_details rd
	USING(ApartmentID)
WHERE Bill = 'Electricity Recharge'
ORDER BY Date;

-- Transactions made on Friday of the week
SELECT 
	ApartmentID,
    Date,
    Bill,
    Total,
	WEEKDAY(Date) AS 'Day of the Week'
FROM payments
WHERE WEEKDAY(Date) = 4