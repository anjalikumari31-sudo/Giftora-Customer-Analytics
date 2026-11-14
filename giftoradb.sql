CREATE DATABASE giftora;

USE giftora;

#creating year_2009_2010 table loading .csv file into it
CREATE TABLE year_2009_2010 (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100)
);



LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 26.10/Uploads/year_2009_2010.csv'

INTO TABLE year_2009_2010

CHARACTER SET utf8mb4

FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'

LINES TERMINATED BY '\r\n'

IGNORE 1 ROWS

(
    Invoice,
    StockCode,
    @Description,
    Quantity,
    @InvoiceDate,
    Price,
    @CustomerID,
    Country
)

SET
    Description = NULLIF(@Description, ''),
    InvoiceDate = STR_TO_DATE(
        @InvoiceDate, '%c/%e/%Y %H:%i'
    ),
    CustomerID = NULLIF(@CustomerID, '');

 SELECT * FROM year_2009_2010;


 #creating year_2010_2011 table loading .csv file into it
CREATE TABLE year_2010_2011 (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100)
);



LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 26.10/Uploads/year_2010_2011.csv'

INTO TABLE year_2010_2011

CHARACTER SET utf8mb4

FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'

LINES TERMINATED BY '\r\n'

IGNORE 1 ROWS

(
    Invoice,
    StockCode,
    @Description,
    Quantity,
    @InvoiceDate,
    Price,
    @CustomerID,
    Country
)

SET
    Description = NULLIF(@Description, ''),
    InvoiceDate = STR_TO_DATE(
        @InvoiceDate, '%c/%e/%Y %H:%i'
    ),
    CustomerID = NULLIF(@CustomerID, '');

 SELECT * FROM year_2010_2011;

#combine both tables 
CREATE TABLE online_retail AS
SELECT *
FROM year_2009_2010 #only column struture copied
WHERE 1 = 0; #ensure no record copy

INSERT INTO online_retail
SELECT * FROM year_2009_2010;

INSERT INTO online_retail
SELECT * FROM year_2010_2011;


 #sql data exploration...
 SELECT COUNT(*) FROM year_2009_2010;
 SELECT COUNT(*) FROM year_2010_2011;

 SELECT COUNT(*) FROM online_retail; #1609281 records

 SELECT * FROM online_retail;
#Check records year-wise
 SELECT
    YEAR(InvoiceDate) AS year,
    COUNT(*) AS total_records
FROM online_retail
GROUP BY YEAR(InvoiceDate)
ORDER BY year;

#date range of dataset
SELECT
    MIN(InvoiceDate) AS first_date,
    MAX(InvoiceDate) AS last_date
FROM online_retail;

#table structure
DESCRIBE online_retail;

#check missing VALUES
SELECT
    COUNT(*) AS total_records,

    SUM(Invoice IS NULL) AS missing_invoice,

    SUM(StockCode IS NULL) AS missing_stockcode,

    SUM(Description IS NULL) AS missing_description,

    SUM(Quantity IS NULL) AS missing_quantity,

    SUM(InvoiceDate IS NULL) AS missing_date,

    SUM(Price IS NULL) AS missing_price,

    SUM(CustomerID IS NULL) AS missing_customer,

    SUM(Country IS NULL) AS missing_country

FROM online_retail;

SELECT COUNT(*) FROM online_retail
WHERE Quantity<=0;

#check duplicate rows
SELECT
    SUM(record_count - 1) AS duplicate_records
FROM
(
    SELECT COUNT(*) AS record_count
    FROM online_retail
    GROUP BY
        Invoice,
        StockCode,
        Description,
        Quantity,
        InvoiceDate,
        Price,
        CustomerID,
        Country
    HAVING COUNT(*) > 1
) AS duplicates;

#create a clean table (duplicates free)
CREATE TABLE online_retail_clean AS
SELECT DISTINCT
    Invoice,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    Price,
    CustomerID,
    Country
FROM online_retail;

SELECT * FROM online_retail_clean;

