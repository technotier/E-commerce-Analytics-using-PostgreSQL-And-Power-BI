-- dim_customers created
create table analytics_schema.dim_customers as 
with customers_cte as (
select
id as customer_id,
initcap(
	concat(
		trim(first_name), ' ', trim(last_name)
	)
) as customer_name,
lower(trim(email)) as email,
case
	when lower(trim(gender)) = 'male' then 'M'
	when lower(trim(gender)) = 'female' then 'F'
end as gender,
dob as birth_date,
date_part('year', age(current_date, dob)) as age,
upper(trim(city)) as city,
upper(trim(country)) as country,
signup_date,
(current_date - signup_date) as days_as_customer
from 
raw_schema.customers
)
select 
customer_id,
customer_name,
email,
gender,
birth_date,
age,
/* age group */
case
    when age >= 65 then 'Senior Citizen'
    when age >= 50 then 'Mid Age'
    when age >= 40 then 'Adult'
    when age >= 30 then 'Young Adult'
    when age >= 20 then 'Young'
    when age >= 13 then 'Teenage'
    when age >= 0  then 'Children'
    else 'Unknown'
end as age_group,
city,
country,
signup_date,
days_as_customer,
/* customer type */
case
    when days_as_customer >= 730 then 'Super Loyal'
    when days_as_customer >= 365 then 'Loyal'
    when days_as_customer >= 180 then 'Champion'
    when days_as_customer >= 90  then 'Regular'
    when days_as_customer >= 45  then 'New'
    when days_as_customer >= 0   then 'Very New'
    else 'Unknown'
end as customer_type,
/* tenure bucket */
case 
    when days_as_customer >= 730 then '2+ years'
    when days_as_customer >= 365 then '1-2 years'
    when days_as_customer >= 180 then '6-12 months'
    when days_as_customer >= 90 then '3-6 months'
    else 'Less than 3 months'
end as customer_tenure_bucket,
current_timestamp as loaded_at
from 
customers_cte;

select * from analytics_schema.dim_custome
