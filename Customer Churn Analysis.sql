Use hen;

SELECT * FROM hen.`telco-customer-churn`;

-- checking total imported rows
SELECT count(*) FROM hen.`telco-customer-churn`;

-- checking the datatypes
Describe hen.`telco-customer-churn`;


-- checking nulls
SELECT * FROM hen.`telco-customer-churn`
where customerID is null
or 
gender is null
or 
SeniorCitizen is null
or 
Partner is null
or 
Dependents is null
or 
tenure is null 
or 
PhoneService is null
or 
MultipleLines is null
or 
InternetService is null
or 
OnlineSecurity is null
or 
OnlineBackup is null
or 
DeviceProtection is null
or 
TechSupport is null
or 
StreamingTV is null
or 
StreamingMovies is null
or 
Contract is null
or 
PaperlessBilling is null
or 
PaymentMethod is null
or 
MonthlyCharges is null
or 
TotalCharges is null
or 
Churn is null; -- no blank value is find

-- checking Duplicate
Select customerID, gender, SeniorCitizen, Partner, Dependents, tenure, PhoneService,	MultipleLines,
	InternetService, OnlineSecurity, OnlineBackup,	DeviceProtection,	TechSupport,	
    StreamingTV, StreamingMovies,	Contract,	PaperlessBilling,	PaymentMethod,
	MonthlyCharges,	TotalCharges,	Churn , count(*) as Total_count
FROM hen.`telco-customer-churn`
group by customerID, gender, SeniorCitizen, Partner, Dependents, tenure, PhoneService,	MultipleLines,
	InternetService, OnlineSecurity, OnlineBackup,	DeviceProtection,	TechSupport,	
    StreamingTV, StreamingMovies,	Contract,	PaperlessBilling,	PaymentMethod,
	MonthlyCharges,	TotalCharges,	Churn
having Total_count > 1; -- no duplicates are there


-- Churn Analysis by Contract Type

-- Churn Counts by Contract Type
Select Contract, Churn, count(*) as Total_Count
from hen.`telco-customer-churn`
group by Contract, Churn
order by Contract;

-- Total Sales by Contract Type and Churn

Select Contract, Churn, round(sum(TotalCharges),2) as Total_Sales
from hen.`telco-customer-churn`
group by Contract, Churn
order by Contract;

-- Average Sales by Contract Type and Churn
Select Contract, Churn, round(avg(TotalCharges),2) as Avg_Sales
from hen.`telco-customer-churn`
group by Contract, Churn
order by Contract;


-- Churn Analysis by gender

Select gender, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by gender, Churn; -- No significant difference in churn between Male and Female customers.


-- Churn Analysis by SeniorCitizen
Select SeniorCitizen, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by SeniorCitizen, Churn; -- NOn-Senior Citizens are more likely to churn than Senior


-- Churn Analysis by PhoneService
Select PhoneService, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by PhoneService, Churn; -- who opted phone service are more into churn


-- Churn Analysis by MultipleLines
Select MultipleLines, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by MultipleLines, Churn;-- this MultipleLines faciltiy is  not matter for churn


-- Churn Analysis by InternetService
Select InternetService, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by InternetService, Churn; -- fiber optic opted service are more likey to churn

-- Churn Analysis by OnlineSecurity
Select OnlineSecurity, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by OnlineSecurity, Churn; -- who do not have online security more likey to churn

-- Churn Analysis by OnlineBackup
Select OnlineBackup, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by OnlineBackup, Churn; -- who do not have OnlineBackup more likey to churn


-- Churn Analysis by DeviceProtection
Select DeviceProtection, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by DeviceProtection, Churn; -- who do not have DeviceProtection more likey to churn


-- Churn Analysis by TechSupport
Select TechSupport, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by TechSupport, Churn; -- who do not have TechSupport more likey to churn

-- Churn Analysis by StreamingTV
Select StreamingTV, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by StreamingTV, Churn; -- this StreamingTV faciltiy is  not matter for churn

-- Churn Analysis by StreamingMovies
Select StreamingMovies, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by StreamingMovies, Churn; -- this StreamingMovies faciltiy is  not matter for churn

-- Churn Analysis by PaperlessBilling
Select PaperlessBilling, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by PaperlessBilling, Churn; -- who are opting for PaperlessBilling are more likely to churn

-- -- Churn Analysis by PaymentMethod
Select PaymentMethod, Churn, count(*) as total_count
from hen.`telco-customer-churn`
group by PaymentMethod, Churn
order by PaymentMethod; -- who are opting for 'Electronic check' payment method are more likely to churn


-- who is giving more revenue to the company on the basis of churn
-- a. Total_sales
Select churn, round(sum(TotalCharges),2) as Total_Revenue
from hen.`telco-customer-churn`
group by churn
order by Total_Revenue desc; -- who is not churned they are giving more revenue

-- b. Avg_sales
Select churn, round(avg(TotalCharges),2) as Avg_sales
from hen.`telco-customer-churn`
group by churn
order by Avg_sales desc; -- who is not churned they are giving Avg_sales


-- who is giving more revenue to the company on the basis of gender
-- a. Total_sales
Select gender, round(sum(TotalCharges),2) as Total_Revenue
from hen.`telco-customer-churn`
group by gender
order by Total_Revenue desc; -- there is no significant diffrence but slightly getting higher sale from Male

-- Avg sale on the basis of gender
-- b. Avg_sales
Select gender, round(avg(TotalCharges),2) as Avg_Sales
from hen.`telco-customer-churn`
group by gender
order by Avg_Sales desc; -- Not much diffrence

-- From which payment method is giving higher revenue
-- a. Total_Sales
Select PaymentMethod, round(sum(TotalCharges),2) as Total_sales
from hen.`telco-customer-churn`
group by PaymentMethod
order by Total_sales desc; --  getting slightly higher from electronic check

-- a. AVg_Sales
Select PaymentMethod, round(avg(TotalCharges),2) as AVg_sales
from hen.`telco-customer-churn`
group by PaymentMethod
order by AVg_sales desc; -- bank transfer has high avg

-- Sales on contract Basis
-- a.Total_Sales
Select Contract, round(sum(TotalCharges),2) as Total_sales
from hen.`telco-customer-churn`
group by Contract
order by Total_sales desc; -- Two year contracts are contributing more in revenue

-- a. AVg_Sales
Select Contract, round(avg(TotalCharges),2) as AVg_sales
from hen.`telco-customer-churn`
group by Contract
order by AVg_sales desc; -- Two year contracts are giving high avg sales

-- Overall Total_Sales

Select round(sum(TotalCharges),2) as 'Overall Total_Sales' from hen.`telco-customer-churn`;

-- Overall Avg_Sales

Select round(avg(TotalCharges),2) as 'Avg_Sales' from hen.`telco-customer-churn`;

-- Total_count
Select count(*) Total_count from hen.`telco-customer-churn`;


-- Churn Rate
Select 
round(sum(case when churn = 'Yes' then 1 else 0 end)
     / (Select count(*) Total_count from hen.`telco-customer-churn`) *100,2) as percentage
 from hen.`telco-customer-churn`;
 



