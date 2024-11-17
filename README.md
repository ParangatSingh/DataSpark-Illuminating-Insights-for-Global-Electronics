# DataSpark: Unlocking Insights in Global Electronics
-------

**Project Summary**
-----------

DataSpark: Unlocking Insights in Global Electronics is an analytics project focused on the electronics retail sector. Its purpose is to uncover meaningful insights into the sales data of a global electronics retailer. This analysis impacts several business areas, such as product performance, customer segmentation, store effectiveness, and the influence of currency fluctuations on sales.

**Project Goals**
----------

The main objective of this project is to leverage data analytics to extract insights that support informed business decisions. The specific goals include:

- Identifying top-performing products and categories.
  
- Gaining a deeper understanding of customer demographics and behavior.
  
- Evaluating store performance across different regions.
  
- Analyzing the effects of currency rate fluctuations on sales.
  
- Building interactive dashboards to present these insights effectively.

**Data Overview**
-------------

This project uses several datasets that cover products, sales transactions, customer profiles, store details, and exchange rates. Key datasets include:

**Customer Dataset:**
- Fields: birthday, city, continent, country, customer key, gender, name, state, state code, zip code.

**Sales Dataset:**
- Fields: currency code, customer key, delivery date, line item, order date, order number, product key, quantity, store key.

**Store Dataset:**
- Fields: country, open date, area (sq. meters), state, store key.

**Product Dataset:**
- Fields: brand, category, category key, color, product key, subcategory, subcategory key, unit cost (USD), unit price (USD).

**Exchange Rate Dataset:**
- Fields: currency, date, exchange rate.

**Technologies and Tools**
--------------

The following tools and technologies were employed:

- **Data Cleaning and Preparation:** Python
  
- **Data Management:** MySQL
  
- **Data Visualization:** Power BI

**Data Processing**
-----------

**Data Cleaning:**
- Addressing missing values, particularly in the delivery date column, by dropping incomplete rows.
- Removing duplicate entries and irrelevant fields.

**Data Transformation:**
- Merging datasets based on common keys (e.g., product key, customer key, store key).
- Standardizing formats, such as date formats, across all datasets.

**Data Loading:**
- Importing processed and merged data into MySQL.
- Loading data into Power BI for visualization and analysis.

**Visualizations and Dashboard Design**
----------

An interactive dashboard in Power BI was developed to showcase the data-driven insights. Key sections of the dashboard include:

**Sales Summary:** An overview of total sales, leading products, and regional sales distribution.

**Customer Analysis:** Visualizations representing customer demographics and purchasing trends.

**Store Analysis:** A comparative view of store performance across various regions.

**Currency Impact Analysis:** A display of the effects of exchange rate changes on sales metrics.

**Conclusion**
------

The DataSpark project effectively provided valuable insights into the sales data of a global electronics retailer. The analysis highlighted key trends, customer segments, and top-performing products, ultimately supporting data-driven business decisions.