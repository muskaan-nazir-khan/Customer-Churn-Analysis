CREATE DATABASE Customer_churn_data;
use [Customer_churn_data];

SELECT * from Data_Customers;

select Gender,Count(Gender) as Total_count,
Count(Gender)*100.0/(select count(*) from Customer_Data) as Percentage
From Data_Customers
Group by Gender;

select Contract,Count(Contract) as Total_count,
Count(Contract)*100.0/(select count(*) from Data_Customers) as Percentage
From Data_Customers
Group by Contract;


select Customer_Status,Count(Customer_Status) as Total_count,sum(Total_Revenue) as Total_revenue,
Sum(Total_Revenue)/(select SUM(Total_Revenue) from Data_Customers)*100 as Percentage
From Data_Customers
Group by Customer_Status
ORDER BY Percentage DESC;

select distinct Internet_Type
From Data_Customers


--- checking null values 
SELECT 
	SUM(CASE WHEN Customer_ID is NULL THEN 1 Else 0 END ) as Customer_id_null_count,
	SUM(CASE WHEN Gender is NULL THEN 1  Else 0 END ) as gender_null_count,
	SUM(CASE WHEN Age is NULL THEN 1 Else 0 END ) as age_null_count,
	SUM(CASE WHEN Married is NULL THEN 1 Else 0 END ) as Married_null_count,
	SUM(CASE WHEN State is NULL THEN 1 Else 0 END ) as state_null_count,

	SUM(CASE WHEN Number_of_Referrals is NULL THEN 1 Else 0 END ) as number_of_Referrals_null_count,
	SUM(CASE WHEN Tenure_in_Months is NULL THEN 1 Else 0 END ) as Tenure_in_Months_null_count,
	SUM(CASE WHEN Value_Deal is NULL THEN 1 Else 0 END ) as Value_Deal_null_count,
	SUM(CASE WHEN Phone_Service is NULL THEN 1 Else 0 END ) as Phone_Service_null_count,
	SUM(CASE WHEN Multiple_lines is NULL THEN 1 Else 0 END ) as Multiple_lines_null_count,
	SUM(CASE WHEN Internet_Service is NULL THEN 1 Else 0 END ) as Internet_Service_null_count,
	SUM(CASE WHEN Internet_Type is NULL THEN 1 Else 0 END ) as Internet_Type_null_count,
	SUM(CASE WHEN Online_Security is NULL THEN 1 Else 0 END ) as  Online_Security_null_count,
	SUM(CASE WHEN Online_Backup is NULL THEN 1 Else 0 END ) as Customer_id_null_count,
	SUM(CASE WHEN Device_Protection_Plan is NULL THEN 1 Else 0 END ) as Device_Protection_Plan_null_count,
	SUM(CASE WHEN Premium_Support is NULL THEN 1 Else 0 END ) as Premium_Support_null_count,
	SUM(CASE WHEN Streaming_TV is NULL THEN 1 Else 0 END ) as streaming_TV_null_count,
	SUM(CASE WHEN Streaming_Movies is NULL THEN 1 Else 0 END ) as Streaming_Moviesd_null_count,
	SUM(CASE WHEN Streaming_Music is NULL THEN 1 Else 0 END ) as Streaming_Music_null_count,
	SUM(CASE WHEN Unlimited_Data is NULL THEN 1 Else 0 END ) as Unlimited_Data_null_count,
	SUM(CASE WHEN Contract is NULL THEN 1 Else 0 END ) as Contract_null_count,
	SUM(CASE WHEN Paperless_Billing is NULL THEN 1 Else 0 END ) as Paperless_Billing_null_count,
	SUM(CASE WHEN Payment_Method is NULL THEN 1 Else 0 END ) as Payment_Method_null_count,
	SUM(CASE WHEN Monthly_Charge is NULL THEN 1 Else 0 END ) as  Monthly_Charge_null_count,
	SUM(CASE WHEN Total_Charges is NULL THEN 1 Else 0 END ) as Total_Charges_null_count,
	SUM(CASE WHEN Total_Refunds is NULL THEN 1 Else 0 END ) as Total_Refunds_null_count,
	SUM(CASE WHEN Total_Extra_Data_Charges is NULL THEN 1 Else 0 END ) as Total_Extra_Data_Charges_null_count,
	SUM(CASE WHEN Total_Long_Distance_Charges is NULL THEN 1 Else 0 END ) as Total_Long_Distance_Charges_null_count,
	SUM(CASE WHEN Total_Revenue is NULL THEN 1 Else 0 END ) as Total_Revenue_null_count,
	SUM(CASE WHEN Customer_Status is NULL THEN 1 Else 0 END ) as Customer_Status_null_count,
	SUM(CASE WHEN Churn_Category is NULL THEN 1 Else 0 END ) as Churn_Category_null_count,
	SUM(CASE WHEN Churn_Reason is NULL THEN 1 Else 0 END ) as Churn_Reason_null_count
FROM Data_Customers;

SELECT 
	Customer_ID,
	Gender,
	Age,
	Married,
	State,
	Number_of_Referrals,
	Tenure_in_Months,
	ISNULL(Value_Deal, 'None') as Value_deals,
	Phone_Service,
	ISNULL(Multiple_Lines,'No') as Multiple_Lines,
	Internet_Service,
	ISNULL(Internet_Type,'None') as Internet_Type,
	ISNULL(Online_Security,'No') as Online_Security,
	ISNULL(Online_Backup,'No') as Online_Backup,
	ISNULL(Device_Protection_Plan,'No') as Device_Protection_Plan,
	ISNULL(Premium_Support,'No') as Premium_Support,
	ISNULL(Streaming_TV,'No') as Streaming_TV,
	ISNULL(Streaming_Movies,'No') as Streaming_Movies,
	ISNULL(Streaming_Music,'No') as Streaming_Music,
	ISNULL(Unlimited_Data,'No') as Unlimited_Data,
	Contract,
	Paperless_Billing,
	Payment_Method,
	Monthly_Charge,
	Total_Charges,
	Total_Refunds,
	Total_Extra_Data_Charges,
	Total_Long_Distance_Charges,
	Total_Revenue,
	Customer_status,
	ISNULL(Churn_Category,'Others') as Churn_Category,
	ISNULL(Churn_Reason,'Others') as Churn_Reason
INTO [Customer_churn_data].[dbo].[churn_data_cleaned]
FROM [Customer_churn_data].[dbo].[Data_Customers];

Drop Table [dbo].[Customer_Data];

SELECT * FROM churn_data_cleaned;


CREATE VIEW Churn_Data AS
	SELECT * from churn_data_cleaned where Customer_Status IN ('Churned','Stayed');


CREATE VIEW join_data AS
SELECT *
from churn_data_cleaned 
where Customer_Status IN ('Joined');
