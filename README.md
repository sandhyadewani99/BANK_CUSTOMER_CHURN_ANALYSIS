BANK_CHURN_ANALYSIS

 Project Title
Bank  Churn Analysis | SQL, Excel & Power BI & Python

 Github Repository Name
BANK-CHURN-ANALYSIS**

---

 Project Overview

This Project Analyzes Customer Churn In A Banking Dataset To Identify Customer Segments With Higher Churn Risk And Generate Actionable Business Insights.

The Analysis Uses **SQL, Excel, Python, And Power BI** To Validate The Data, Perform Exploratory Analysis, Calculate Key Kpis, Identify Churn Patterns, And Support Customer Retention Strategies.

---

Business Objective

The Main Objective Of This Project Is To:

- Measure The Overall Customer Churn Rate.
- Identify Customer Segments With Higher Churn Risk.
- Analyze Churn Across Geography, Age, Tenure, Product Usage, And Customer Activity.
- Evaluate The Impact Of Credit Card Ownership And Credit Score On Churn.
- Identify High-Value Disengaged Customers.
- Detect Customers Whose Account Balance Is Higher Than Their Estimated Salary.
- Provide Business Recommendations To Improve Customer Retention.

---

Tools & Technologies

Mysql** – Data Validation, Cleaning, EDA, KPI Calculation, And Business Analysis
Microsoft Excel** – Data Analysis, KPI Summary, Formatted Analysis, And Insights
Power BI** – Dashboard And Data Visualization
Python / Jupyter Notebook** – Supporting Analysis
Github** – Project Documentation And Version Control

---

Dataset

The Project Uses A Banking Customer Churn Dataset Containing **10,000 Customer Records**.

Key Columns

| Column | Description |
|---|---|
| Customer_Id | Unique Customer Identifier |
| Surname | Customer Surname |
| Creditscore | Customer Credit Score |
| Geography | Customer Location |
| Gender | Customer Gender |
| Age | Customer Age |
| Tenure | Years With The Bank |
| Balance | Customer Account Balance |
| Num_Of_Products | Number Of Bank Products Used |
| Has_Crcard | Credit Card Ownership Indicator |
| Is_Active_Member | Customer Activity Indicator |
| Estimated_Salary | Estimated Customer Salary |
| Exited | Churn Indicator |

---

Project Workflow

 1. Database & Table Creation
Created The `Bank_Churn_Analysis` Database And `Customer_Churn` Table In Mysql.

 2. Data Import
Imported The Banking Customer Churn Dataset Into Mysql.

3. Data Validation
Performed Checks For:

- Total Records
- Sample Records
- NULL Values
- Duplicate Customer Ids
- Distinct Categorical Values
- Credit Score And Age Ranges
- Negative Balances
- Unique Customer Ids

 4. Data Cleaning
Validated:

- Leading/Trailing Spaces
- Gender Consistency
- Duplicate Records
- Invalid Numeric Values

The Dataset Was Found To Be Clean And Ready For Analysis.

5. Exploratory Data Analysis
Analyzed:

- Total Customers
- Churned Vs Retained Customers
- Overall Churn Rate
- Gender Distribution
- Geography Distribution
- Average Credit Score
- Average Age
- Average Balance
- Average Estimated Salary
- Product Distribution
- Active Vs Inactive Members
- Credit Card Ownership

### 6. Business Analysis
Performed 10 Key Churn Analyses:

1. Overall Churn Rate
2. Geography-Wise Churn Rate
3. Churn Rate By Number Of Products
4. Active Vs Inactive Member Churn
5. High-Value Disengaged Customers
6. Tenure-Wise Churn Rate
7. Customers With Credit Card Vs Without
8. Age Group Analysis
9. Credit Score Impact On Churn
10. Balance & Salary Mismatch Detection

---

 Key Performance Indicators (Kpis)

| KPI | Result |
|---|---:|
| Total Customers | 10,000 |
| Churned Customers | 2,037 |
| Retained Customers | 7,963 |
| Overall Churn Rate | 20.37% |
| Average Balance | 76,485.89 |
| Average Estimated Salary | 100,090.24 |

---

 Key Business Findings

 1. Overall Churn
The Overall Customer Churn Rate Is **20.37%**, With **2,037 Customers** Having Exited Out Of 10,000.

 2. Geography-Wise Churn
Germany Has The Highest Churn Rate At 32.44%** Among The Analyzed Geographies.

Business Implication:** The Bank Should Prioritize Customer Retention Initiatives In Germany.

 3. Churn By Number Of Products
Customers With **2 Products Have The Lowest Churn Rate At 7.58%**.

Customers With **3 And 4 Products Show Very High Churn Rates Of 82.71% And 100%**, Respectively. The 4-Product Segment Contains Only 60 Customers, So This Rate Should Be Interpreted With Caution.

 4. Active Vs Inactive Members
- Inactive Customers: **26.85% Churn**
- Active Customers: **14.27% Churn**

Inactive Customers Show A Substantially Higher Churn Rate.

Business Implication:** Re-Engagement Campaigns And Personalized Offers Can Help Improve Customer Activity And Retention.

 5. High-Value Disengaged Customers
The Analysis Identifies Customers With **Above-Average Balances Who Are Inactive**.

Business Implication:** These Customers Represent A Valuable Segment That Should Receive Targeted Engagement And Retention Attention.

 6. Tenure-Wise Churn
Churn Is Highest Among Customers With **0 Years Of Tenure At 23.00%**, While The Lowest Observed Rate Is **17.22% At 7 Years**.

Business Implication:** Early-Stage Customer Engagement Should Be Strengthened.

7. Credit Card Ownership
- With Credit Card: **20.18% Churn**
- Without Credit Card: **20.81% Churn**

The Difference Is Small, Suggesting That Credit Card Ownership Has A Limited Impact On Churn In This Dataset.

 8. Age Group Analysis
The **46–60 Age Group Has The Highest Churn Rate At 51.12%**, While The 18–30 Group Has The Lowest At 7.52%.

Business Implication:** The 46–60 Segment Should Be Prioritized For Targeted Retention Strategies.

 9. Credit Score Impact
Churn Rates Are Relatively Similar Across The Credit-Score Groups, Suggesting That **Credit Score Has A Limited Impact On Churn** In This Dataset.

 10. Balance & Salary Mismatch
- Balance > Salary: **23.83% Churn**
- Balance <= Salary: **18.26% Churn**

Customers Whose Balance Exceeds Their Estimated Salary Have A Higher Churn Rate.

Business Implication:** This Segment Should Be Monitored And Targeted With Appropriate Retention Strategies.

---

 Overall Business Recommendations

Based On The Analysis, The Bank Should:

- Prioritize Retention Efforts In **Germany**.
- Focus On **Inactive Customers** Through Re-Engagement Campaigns.
- Give Special Attention To The **46–60 Age Group**.
- Investigate The Reasons Behind Extremely High Churn Among Customers With **3–4 Products**.
- Strengthen Onboarding And Engagement For **New Customers**.
- Identify And Monitor **High-Value Inactive Customers**.
- Use Personalized Offers, Relationship Management, And Loyalty Programs To Improve Retention.
- Focus On Customer Factors With Stronger Observed Relationships To Churn Rather Than Relying Heavily On Credit Card Ownership Or Credit Score.

---

 Project Files

```Text
BANK-CHURN-ANALYSIS/
│
├── Bank_Churn_Analysis.Sql
├── Bank_Churn_Analysis.Xlsx
├── Bank_Churn_Analysis.Pbix
├── Bank_Churn_Analysis-Checkpoint.Ipynb
└── README.Md
```

---

 Project Outcome

This Project Demonstrates The Use Of **SQL For Data Validation, Cleaning, EDA, KPI Analysis, And Business Problem Solving**, Supported By **Excel Analysis And Power BI Visualization**.

The Final Analysis Converts Customer Churn Data Into Actionable Business Insights That Can Help A Bank Identify High-Risk Customer Segments And Improve Retention Strategies.

---

 Author

Sandhya Dewani**

Project:** Bank Customer Churn Analysis

