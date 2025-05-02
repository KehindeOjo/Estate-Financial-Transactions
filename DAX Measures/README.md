# DAX Measures - Estate Financial Transactions Dashboard

This folder contains all DAX measures used in the Estate Financial Transactions Dashboard built in Power BI. Each `.dax` file represents a reusable measure, calculated column, or KPI used to drive insights in the report.

---

## Folder Structure

- Each file in this folder is a DAX measure saved with the `.dax` extension.
- Measures are grouped logically to support revenue tracking, monthly analysis, and resident-based insights.

---

## Measures Overview

### 📅 Date Intelligence

- **Month**  
  Extracts full month name from the `Date` column.  
  `Month = FORMAT('Estate_bills'[Date], "mmmm")`

- **No of Month**  
  Returns the numeric month (1–12).  
  `No of Month = MONTH('Estate_bills'[Date])`

---

### 💰 Revenue Metrics

- **Service Charge Revenue**  
  Calculates revenue from service charge bills.

- **Electricity Recharge Revenue**  
  Calculates revenue from electricity recharge payments.

- **Total Revenue**  
  Returns the total revenue across all bills.

---

### 📊 Aggregations & Comparisons

- **Monthly Collection**  
  Calculates total revenue for each month, maintaining context using `ALLEXCEPT`.

- **Total Paid by Resident**  
  Returns the total revenue contributed by each apartment.

- **Top Paying Resident**  
  Identifies the highest-paying apartment unit based on cumulative transactions.

---

## How to Use

1. Open each `.dax` file to view the DAX expression.
2. Copy the measure into Power BI's formula bar under the appropriate table.
3. Use the measures in visuals like KPI cards, bar charts, and tables for meaningful insights.

---

## Author

**Kehinde Ojo**  
Financial & Data Analyst  
LinkedIn Profile https://www.linkedin.com/in/kehinde-ojo-86b61b124
