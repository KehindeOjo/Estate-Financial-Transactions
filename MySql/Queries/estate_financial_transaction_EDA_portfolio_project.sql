-- Advanced Query

-- Summary Statistics (Get total Transactions, No of Apartment, No of Bills, First & Last Transaction Date)
SELECT 
	COUNT(*) AS Total_transactions,
    COUNT(DISTINCT Apartment_ID) AS Unique_apartments,
    COUNT(DISTINCT Bill) AS Unique_bills,
    MIN(Date) AS First_transaction,
    MAX(Date) AS Last_transaction
FROM estate_billing_records ;

-- Check for Missing Values
SELECT 
	SUM(CASE WHEN Apartment_ID IS NULL
THEN 1 ELSE 0 END) AS Missing_Apartment,
	SUM(CASE WHEN Bill IS NULL
THEN 1 ELSE 0 END) AS Missing_Bills,
	SUM(CASE WHEN Unit_Price IS NULL
THEN 1 ELSE 0 END) AS Missing_Unit_Price
FROM estate_billing_records;

-- Top 5 Most Frequent Bills
SELECT 
	Bill,
    COUNT(*) AS Frequency
FROM estate_billing_records
GROUP BY Bill
ORDER BY Frequency DESC
LIMIT 5;

-- Total Amount per Bill Type
SELECT 
	Bill,
    SUM(Total_Price) AS Total_amount
FROM estate_billing_records
GROUP BY Bill
ORDER BY Total_amount DESC;

-- Monthly Trend of Bills Paid
SELECT 
	DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(Total_Price) AS Total_billed
FROM estate_billing_records
GROUP BY Month
ORDER BY Month DESC;

-- Top 5 Paying Resident
SELECT
	Apartment_ID,
    SUM(Total_Price) AS Total_paid
FROM estate_billing_records
GROUP BY Apartment_ID
ORDER BY Total_paid DESC
LIMIT 5;

-- Total Payment Per Resident
SELECT 
	CONCAT(First_Name, ' ', Last_Name) AS Resident_name,
    Apartment_ID,
    COUNT(*) AS Payment_frequency,
    SUM(Total_Price) AS Total_paid
FROM estate_billing_records
GROUP BY Resident_name, Apartment_ID
ORDER BY Total_paid DESC;

-- Payment Frequency (How Often Residents Pay)
SELECT 
	Apartment_ID,
    COUNT(*) AS Payment_count
FROM estate_billing_records
GROUP BY Apartment_ID
ORDER BY Payment_count DESC;


