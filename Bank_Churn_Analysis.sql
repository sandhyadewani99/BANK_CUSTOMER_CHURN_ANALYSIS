 -- ======================================================================================================================================================
 -- [1]: PROJECT NAME
 
-- PROJECT NAME: BANK_CHURN_ANALYSIS
-- CREATER NAME: SANDHYA DEWANI
  
  -- ==============================================================================================================================================
 
  -- [2]: DATABASE CREATION
  
create database Bank_Churn_Analysis;
use Bank_Churn_Analysis;


 -- ### TABLES CREATIONS######
create table Customer_Churn(
Year int,
Customer_Id bigint primary key,
Surname varchar(50),
CreditScore int,
Geography varchar(50),
Gender varchar(20),
Age int,
Tenure int,
Balance decimal(15,2),
Num_Of_Products int,
Has_CrCard tinyint,
Is_Active_Member tinyint,
Estimated_Salary decimal(15,2),
Exited tinyint);

 -- [3]: DATA IMPORT
select* from Customer_Churn;

 
 -- [4]:DATA VALIDATION
 
 -- (A): Total Records
SELECT COUNT(*) AS Total_Records FROM Customer_Churn;

 -- (B): View First 10 Records
select* from Customer_Churn limit 10;

 -- (C): Check NULL Values
select
sum(case when year is null then 1 else 0 end) as year_null,
sum(case when customer_id is null then 1 else 0 end) as customer_id_null,
sum(case when surname is null then 1 else 0 end) as surname_null,
sum(case when creditscore is null then 1 else 0 end) as creditscore_null,
sum(case when geography is null then 1 else 0 end) as geography_null,
sum(case when gender is null then 1 else 0 end) as gender_null,
sum(case when age is null then 1 else 0 end) as age_null,
sum(case when tenure is null then 1 else 0 end) as tenure_null,
sum(case when balance is null then 1 else 0 end) as balance_null,
sum(case when num_of_products is null then 1 else 0 end) as num_of_products_null,
sum(case when has_crcard is null then 1 else 0 end) as has_crcard_null,
sum(case when is_active_member is null then 1 else 0 end) as is_active_member_null,
sum(case when estimated_salary is null then 1 else 0 end) as estimated_salary_null,
sum(case when exited is null then 1 else 0 end) as exited_null
from customer_churn;

 -- (D): Check Duplicate Customer IDs
select Customer_Id, count(*) as duplicate_count from customer_churn
group by Customer_Id 
having count(*) >1;

 -- (E): Check Distinct Geography, Gender, Exited Values
 -- Geography
select distinct Geography from customer_churn;
 -- Gender,
select distinct Gender  from customer_churn;
 -- Exited
select distinct Exited from customer_churn;

 -- (F): Check Credit Score Range and Age Range
 
 -- Check Credit Score
select min(CreditScore) as minimum_CreditScore,
max(CreditScore) as maximum_CreditScore
from customer_churn;

 -- Age Range
select min(Age) as minimum_Age,
max(Age) as maximum_Age
from customer_churn;

 -- (G):Check Negative Balance
select* from customer_churn where Balance < 0;

 -- (H): Check Unique Customer IDs
select count(Customer_Id) as Total_Ids,
count(distinct(Customer_Id)) as Unique_Ids 
from customer_churn;

 -- [5]:DATA CLEANING 
 
 -- (A): Check for Leading & Trailing Spaces
select distinct Geography from customer_churn;

 -- (B): Check Gender Consistency
select distinct Gender from customer_churn;

 -- (C): Check Duplicate Rows
select Customer_Id, count(*) as duplicate_count from customer_churn
group by Customer_Id 
having count(*) >1;

 -- (D): Check Invalid Numeric Values
select* from customer_churn
where Age < 0
or Tenure < 0
or CreditScore < 0
or Estimated_Salary < 0;

 -- -- Data Cleaning Summary
-- No NULL values found.
-- No Duplicate Customer IDs found.
-- No Leading or Trailing Spaces found.
-- Gender values are standardized.
-- No Invalid Numeric Values found.
-- Dataset is clean and ready for analysis.

 -- [6]:EDA (EXPLORATORY DATA ANALYSIS) 
 
 -- (A): Total Customers
select count(*)  as total_customers from Customer_Churn;

 -- (B): Total Churned vs Retained Customers
select Exited, count(*) as total_customers 
from Customer_Churn 
group by Exited;

 -- (C): Churn Rate (%)
select round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn;

 -- (D): Customer Distribution by Gender
select Gender, count(*) as Total_customers
from Customer_Churn 
group by Gender;

 -- (E): Customer Distribution by Geography
select Geography, count(*) as Total_customers
from Customer_Churn 
group by Geography;

 -- (F): Average Credit Score
select round(avg(CreditScore),2) as avg_CreditScore
from Customer_Churn;

 -- (G): Average Age
select round(avg(Age),2) as avg_Age
from Customer_Churn;

 -- (H): Average Account Balance
select round(avg(Balance),2) as avg_Balance
from Customer_Churn;

 -- (I): Average Estimated Salary
select round(avg(Estimated_Salary),2) as avg_Estimated_Salary
from Customer_Churn;

 -- (J): Product Distribution
select Num_Of_Products, count(*) as Total_customers
from Customer_Churn 
group by Num_Of_Products
order by Num_Of_Products;

 -- (K): Active vs Inactive Members
select Is_Active_Member, count(*) as Total_customers
from Customer_Churn 
group by Is_Active_Member;

 -- (L): Credit Card Holders
select Has_CrCard, count(*) as Total_customers
from Customer_Churn 
group by Has_CrCard;


 -- [7]:THESE ARE BUSINESS KEY PROBLEMS 


 -- 1. Overall Churn Rate
select count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn;

 --  -- BUSINESS INSIGHT:
 -- "The Bank Has An Overall Churn Rate Of 20.37%, With 2,037 Customers Leaving Out Of 10,000 Total Customers. 
  -- Approximately 79.63% of customers were retained. This Churn Rate Serves As A Baseline KPI For Evaluating Customer Retention Strategies."
  
  
 -- 2. Geography-wise Churn Rate
select Geography, count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Geography
order by Churn_Rate_Percentage desc;

 -- BUSINESS INSIGHT:
 -- Germany Shows The Highest Churn Rate (32.44%) Among All Regions.
 -- The Bank Should Focus On Customer Retention Initiatives In Germany.
 
 
 -- 3. Churn Rate by Number of Products
select Num_Of_Products, count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Num_Of_Products
order by Num_Of_Products;

 -- BUSINESS INSIGHT:
 -- Customers With 2 Products Have The Lowest Churn Rate (7.58%), Indicating Strong Customer Retention.
 -- Customers With 3 And 4 Products Show The Highest Churn Rates (82.71% And 100.00%).
 -- The Bank Should Focus On Targeted Retention Strategies For These High-Risk Customer Segments.
 
 -- 4. Active vs Inactive Member Churn
select case
 when Is_Active_Member = 1 then 'Active' 
 else 'Inactive'
 end as Member_Statuts,
count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Is_Active_Member
order by Is_Active_Member;

 -- BUSINESS INSIGHT:
 -- Inactive Customers Show A Churn Rate Of 26.85%, Which Is Nearly Twice The Churn Rate Of Active Customers (14.27%). 
 -- This Suggests That Improving Customer Engagement And Encouraging Account Activity Can Significantly Reduce Customer Churn.
 
 
 -- 5. High-Value Disengaged Customers (High Balance + Inactive)
select Customer_Id, Surname, Geography, Balance, Is_Active_Member, Exited from Customer_Churn
where Balance >(select avg(Balance) from Customer_Churn)
and  Is_Active_Member = 0
order by Balance desc;


 -- BUSINESS INSIGHT:
 -- High-Balance Inactive Customers Are Valuable To The Bank But Are At A Higher Risk Of Churn.
 -- The Bank Should Target These Customers With Personalised Offers, Relationship Management, And Engagement Programs To Improve Retention.
 
 
 -- 6. Tenure-wise Churn Rate...
select Tenure, count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Tenure
order by Tenure;

 -- BUSINESS INSIGHT:
 -- Churn Is Highest Among Customers With 0 Years Of Tenure (23.00%).
 -- Churn Remains Relatively Consistent Across Most Tenure Levels, With The Lowest Rate At 7 Years (17.22%).
 -- The Bank Should Focus On Early-Stage Customer Engagement And Retention.
 
 -- 7. Customers with Credit Card vs Without
select case when Has_CrCard = 1 then 'With Credit Card'
else 'Without Credit Card' 
end as Credit_Card_Status,
count(*) as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Has_CrCard
order by Has_CrCard;

 -- BUSINESS INSIGHT:
 -- Churn Rates Are Nearly Identical For Customers With And Without Credit Cards (20.18% Vs 20.81%).
 -- This Suggests That Credit Card Ownership Has A Limited Impact On Churn, So Retention Efforts Should Focus On Other Customer Factors.
 
 
 -- 8. Age Group Analysis (e.g., 18-30, 31-45, 46-60, 60+)
select case 
when age between  18 and 30 then '18-30' 
when age between  31 and 45 then '31-45' 
when age between  46 and 60 then '46-60' 
when age >=60 then '60+' 
end as Age_Group,
count(*) as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Age_Group
order by case Age_Group
when '18-30' then 1
when '31-45' then 2
when '46-60' then 3
when '60+' then 4
end;

 -- BUSINESS INSIGHT:
 -- Customers Aged 46-60 Have The Highest Churn Rate (51.12%), While The 18-30 Group Has The Lowest (7.52%).
 -- The Bank Should Prioritize Retention Strategies For Customers Aged 46-60.

 -- 9. Credit Score Impact on Churn
select case 
when CreditScore between  300 and 579 then '300-579 (Poor)'
when CreditScore between  580 and 669 then '580-669 (Fair)'
when CreditScore between  670 and 739 then '670-739 (Good)'
when CreditScore between  740 and 850 then '740-850 (Very Good)'
end as Credit_Score_Group,
count(*) as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Credit_Score_Group
order by MIN(CreditScore);

 -- BUSINESS INSIGHT:
 -- Churn Rates Are Relatively Similar Across All Credit Score Groups,
 -- Indicating That Credit Score Has A Limited Impact On Customer Churn.
 
 -- 10. Balance & Salary Mismatch Detection (Balance > Salary)
select case
when Balance > Estimated_Salary then 'Balance > Salary'
else 'Balance <= Salary'
end as Balance_Salary_Status,
count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage 
from Customer_Churn
group by Balance_Salary_Status;

 -- BUSINESS INSIGHT:
 -- Customers With A Balance Higher Than Their Estimated Salary Have A Higher Churn Rate (23.83%).
 -- Compared To Customers With A Balance At Or Below Their Salary (18.26%).
 -- This Segment Should Be Monitored And Targeted With Appropriate Retention Strategies.
 
 
 -- KPI SUMMARY--
select  count(*)  as total_customers,
sum(Exited) as Churned_Customers,
count(*)- sum(Exited) as Retained_Customers,
round(sum(Exited)*100/count(*),2) as Churn_Rate_Percentage ,
round(avg(Balance),2) as Average_Balance,
round(avg(Estimated_Salary),2) as Average_Estimated_Salary
from Customer_Churn;

 -- ### KPI SUMMARY  ####

 -- Total Customers: 10,000
 -- Churned Customers: 2,037
 -- Retained Customers: 7,963
 -- Overall Churn Rate: 20.37%
 -- Average Balance: 76,485.89
 -- Average Estimated Salary: 100,090.24
 
 -- **********************************************************************************************************************************