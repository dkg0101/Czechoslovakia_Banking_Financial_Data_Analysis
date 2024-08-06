## Project Demo 

https://github.com/user-attachments/assets/8e8d5403-3c0e-4f5e-8b87-ab5b1b5f16e0
# **Czechoslovakia Banking Financial Data Analysis**

## Introduction:
The Czechoslovakia Bank has provided a dataset containing information about its 
financial activities for the past 5 years. The dataset consists of the following tables:

1. Account: This table contains information about the accounts held by the 
bank's clients. It includes the account ID, the date the account was opened, 
the associated client ID, and the account type.

2. Client: This table contains information about the bank's clients. It includes 
the client ID, the client's birthdate, gender, and the district where the client 
lives.

3. District: This table contains information about the various districts in 
Czechoslovakia. It includes the district ID, the name of the district, and 
various demographic and economic indicators for the district.

5. Loan: This table contains information about the loans issued by the bank. It 
includes the loan ID, the date the loan was issued, the account ID associated 
with the loan, the amount of the loan.

6. Transaction: This table contains information about the transactions made by 
the bank's clients. It includes the transaction ID, the account ID associated.


The Czechoslovakia Bank wants to analyse its financial data to gain insights and make informed 
decisions. The bank needs to identify trends , patterns, and potential risks in its financial 
operations. Based on their analysis, they also want to explore the possibility of introducing new financial services.


### The bank has identified the following questions as important for their analysis:
1. What is the demographic profile of the bank's clients and how does it vary across 
districts?
2. How the banks have performed over the years. What are the most common types of accounts and how do they differ
    regarding usage and profitability?
4. Which types of cards are most frequently used by the bank's clients and what is the 
overall profitability of the credit card business?
5. What is the bank’s loan portfolio and how does it vary across different purposes and 
client segments?
6. Can the bank introduce new financial products or services to attract more customers and 
increase profitability?

### Workflow followed in this project is,

### Step 1:
Download the data from data source and perform basic data cleaning and preparation like dropping unnecessary columns,
extracting dates and converting it into a standard format using MS Excel.

### Step 2:
Create respective tables and load data in MySQL database, establish and manage relationships among tables using foreign key 
constraints and data integrity. Apply advanced data transformation techniques to get the data ready for analysis. This includes
tasks like transforming data values using given info, adding new columns to store newly derived values and fill missing values, Creating KPIs table using joins and case statements.

### Step 3:
Once data is transformed and ready for analysis, load it into the Power BI Desktop application by establishing a connection with the MySQL database. 
After importing data perform exploratory data analysis to find trends and patterns within data. Create interactive dashboards focusing on different aspects
like demographic profiles, accounts overview and loan portfolios. Used visuals like bar chart, doughnut chart, and ribbon chart to visualise the data and slicers to 
apply filters and make the dashboard interactive. At the end proposed suggestions to improve profitability of banks

This analysis aims to provide the Czechoslovakia Bank with actionable insights that 
can help them make informed decisions about their financial operations. The analysis will 
involve data cleaning, data transformation and  exploratory data analysis.
