use dataspark;
select*from customers;
select count(CustomerKey) from customers;

-- 10 queries to get insights from 5 tables
-- customer data
-- 1// overall gender counts;

SELECT 
    COUNT(CASE WHEN Gender = 'Female' THEN 1 END) AS Female_count,
    COUNT(CASE WHEN Gender = 'Male' THEN 1 END) AS Male_count
FROM customers;

-- 2// overall counts form continent , country , and state 
SELECT 
    Customer_Continent, 
    Customer_Country, 
    Customer_State, 
    COUNT(*) AS customer_count
FROM customers
GROUP BY Customer_Continent, Customer_Country, Customer_State;
  
-- 3// overall age counts like minor,adult,old 
SELECT 
    CASE 
		WHEN TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) BETWEEN 20 AND 29 THEN '20-29'
		WHEN TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) BETWEEN 30 AND 39 THEN '30-39'
        WHEN TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) BETWEEN 40 AND 49 THEN '40-99'
        WHEN TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) BETWEEN 50 AND 59 THEN '50-50'
        WHEN TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) BETWEEN 60 AND 100 THEN '60 and above'
        
    END AS Age_Group,
    COUNT(*) AS Count_Age_Customers
FROM customers
GROUP BY Age_Group;

-- Exchange_data;
-- 4// currencycode contribution 
SELECT 
    Currency, 
    SUM(Exchange) AS Total_Contribution
FROM exchangerates
GROUP BY Currency
ORDER BY Total_Contribution DESC;

-- 5// yearwise Contribution
SELECT 
    YEAR(Date) AS Year,              
    AVG(Exchange) AS Average_Rate 
FROM 
    exchangerates                    
GROUP BY 
    Year                               
ORDER BY 
    Year;                              

-- Product_data;
-- 6// Counts of Category, Subcategory, Product Name, and Product						
SELECT 
    Category,
    COUNT(DISTINCT Subcategory) AS Subcategory_Count,  
    COUNT(DISTINCT ProductName) AS Product_Name_Count,  
    COUNT(*) AS Product_Count                             
FROM 
    products                                     
GROUP BY 
    Category                                             
ORDER BY 
    Category;                                           

-- 7// Brands sales analyze

SELECT 
    Brand,                                      
    SUM(UnitPriceUSD) AS total_sales,          
    COUNT(*) AS product_count                  
FROM 
    products                               
GROUP BY 
    Brand                                     
ORDER BY 
    total_sales DESC;       
    
-- 8// color contribution
SELECT 
    Color,                                        
    COUNT(*) AS product_count                     
FROM 
    products                                 
GROUP BY 
    color                                        
ORDER BY 
    product_count DESC;                          
    
-- 9// Profit analyze by Subcategory
SELECT 
    Subcategory,                              
    SUM(UnitCostUSD) AS total_manufacturing_cost,   
    SUM(UnitPriceUSD) AS total_selling_cost,   
    SUM(UnitPriceUSD) - SUM(UnitCostUSD) AS total_profit 
FROM 
    products                               
GROUP BY 
    Subcategory                              
ORDER BY 
    total_profit DESC;                          
    
-- sales_data
-- 10// Overall sales in year
SELECT 
    YEAR(OrderDate) AS year,                 
    SUM(Quantity) AS total_quantity           
FROM 
    sales                                 
GROUP BY 
    year                                       
ORDER BY 
    year;                                     

-- 11// currecy contribution
SELECT 
    CurrencyCode,                             
    SUM(Quantity) AS total_quantity,          
    ROUND(SUM(Quantity) / (SELECT SUM(Quantity) FROM sales) * 100, 2) AS contribution_percentage  
FROM 
    sales                         
GROUP BY 
    CurrencyCode                         
ORDER BY 
    total_quantity DESC;                     

-- Stores_data
-- 12//	Total Counts of Stores by Square Meter
SELECT 
    Store_Country,                                  
    COUNT(*) AS total_stores,                 
    SUM(SquareMeters) AS total_square_meter    
FROM 
    stores                            
GROUP BY 
    Store_Country                                  
ORDER BY 
    total_square_meter DESC;   
    
# 
SELECT 
    Customer_City,
    COUNT(*) AS Customer_Count,
    (SELECT COUNT(*) FROM customers) AS All_Customers,
    (SELECT COUNT(DISTINCT Customer_City) FROM customers) AS All_Cities,
    (COUNT(*) / (SELECT COUNT(*) FROM customers)) * 100 AS Percentage
FROM 
    customers
GROUP BY 
    Customer_City
ORDER BY 
    Customer_Count DESC
LIMIT 10;

SELECT 
    OrderDate, 
    SUM(Quantity) AS Total_Quantity
FROM 
    merged_data
GROUP BY 
    OrderDate;

SELECT 
    p.ProductKey,
    p.ProductName,
    p.Subcategory,
    p.Category,
    p.Brand,
    p.UnitPriceUSD,
    p.UnitCostUSD
FROM 
    products p
LEFT JOIN 
    sales s
ON 
    p.ProductKey = s.ProductKey
WHERE 
    s.Quantity IS NULL OR s.Quantity = 0
ORDER BY 
    p.ProductKey;

SELECT Color, ProductKey, COUNT(*) AS PurchaseCount
FROM merged_data
GROUP BY Color, ProductKey
ORDER BY PurchaseCount DESC;

SELECT CustomerKey, COUNT(OrderNumber) AS OrderCount
FROM merged_data
GROUP BY CustomerKey;
						
SELECT 
    ProfitUSD / RevenueUSD AS Gross_Margin
FROM 
    merged_data
WHERE 
    RevenueUSD != 0;  -- To avoid division by zero errors


select * from customers;