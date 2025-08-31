select *from sales.trends.complex;

select min(age) as mini_age
from sales.trends.complex;

select max(age) as mini_age
from sales.trends.complex;

Select count (distinct TRANSACTION_ID) AS number_of_sales,
count (distinct customer_id) as number_of_customers,

date as purchase_date,
DAYNAME (date)AS day_name,
MONTHNAME(date) AS month_name,
DAYOFMONTH(date) AS day_of_month,

CASE
      WHEN age BETWEEN 0 AND 12 THEN 'child'
      WHEN age BETWEEN 13 AND 18 THEN 'youth'
      WHEN age BETWEEN 19 AND 30 THEN 'young Adult'
      WHEN age BETWEEN 31 AND 40 THEN 'Adult'
ELSE 'Senior'
END AS age_bucket,

case 
WHEN total_amount BETWEEN 0 AND 100 THEN 'low spend'
when total_amount >100 AND total_amount <=200 THEN 'MED SPEND'
when total_amount >200 then 'high spend'
END AS spend_buckets,

SUM (quantity) AS units_sold,
sum (total_amount) AS total_revenue,

product_category,
gender,

from sales.trends.complex
GROUP BY ALL;
